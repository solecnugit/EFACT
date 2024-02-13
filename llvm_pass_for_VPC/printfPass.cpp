#include <set>
#include <string>
#include <regex>
#include <stack>
#include <list>
#include <map>
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/ADT/DepthFirstIterator.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/OperandTraits.h"
#include "llvm/IR/Operator.h"
#include "llvm/IR/Module.h"
#include "llvm/ADT/StringMapEntry.h"
#include "llvm/IR/SymbolTableListTraits.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/User.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/IR/GlobalAlias.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/IRBuilder.h"


using namespace llvm;
//这边写的是pass的具体功能
namespace {

  typedef struct node
{
  llvm::Instruction *ext_inst;
  std::string format=" ";
  std::string prased_decl=" ";
  std::list<std::string> param_list;
  int double_paramcount=0;
}extPrintfDetail;

  typedef struct state
{
    bool flag=false;
    GlobalAlias *RDI;
    bool rdi_flag=false;
    GlobalAlias *RSI;
    bool rsi_flag=false;
    GlobalAlias *RDX;
    bool rdx_flag=false;
    GlobalAlias *RCX;
    bool rcx_flag=false;
    GlobalAlias *R8;
    bool r8_flag=false;
    GlobalAlias *R9;
    bool r9_flag=false;
    GlobalAlias *XMM0;
    bool xmm0_flag=false;
    GlobalAlias *XMM1;
    bool xmm1_flag=false;
    GlobalAlias *XMM2;
    bool xmm2_flag=false;
    GlobalAlias *XMM3;
    bool xmm3_flag=false;
    GlobalAlias *XMM4;
    bool xmm4_flag=false;
    GlobalAlias *XMM5;
    bool xmm5_flag=false;
    GlobalAlias *XMM6;
    bool xmm6_flag=false;
    GlobalAlias *XMM7;
    bool xmm7_flag=false;

    GlobalAlias *RSP;
    bool rsp_flag=false;
    
    
}CurrentState;

  std::map<std::string,int> RegisterToNum_map ={
  {"RDI",0},
  {"RSI",1},
  {"RDX",2},
  {"RCX",3},
  {"R8",4},
  {"R9",5},
  {"XMM0",6},
  {"XMM1",7},
  {"XMM2",8},
  {"XMM3",9},
  {"XMM4",10},
  {"XMM5",11},
  {"XMM6",12},
  {"XMM7",13},
  {"RSP",30},
  };
    /*std::map<int,std::string> NumToRegister_map ={
  {0,"RDI"},
  {1,"RSI"},
  {2,"RDX"},
  {3,"RCX"},
  {4,"R8"},
  {5,"R9"},
  {6,"XMM0"},
  {7,"XMM1"},
  {8,"XMM2"},
  {9,"XMM3"},
  {10,"XMM4"},
  {11,"XMM5"},
  };*/


  std::map<std::string,std::string> printf_format_map ={
    {"d","int"},{"hhd","signed char"},{"hd","	short int"},{"ld","long int"},{"lld","long long int"},{"jd","intmax_t"},{"zd","size_t"},{"td","ptrdiff_t"},
    {"o","unsigned int"},{"hho","unsigned char"},{"ho","unsigned short int"},{"lo","unsigned long int"},{"llo","unsigned long long int"},{"jo","uintmax_t"},{"zo","size_t"},{"to","ptrdiff_t"},
    {"u","unsigned int"},{"hhu","unsigned char"},{"hu","unsigned short int"},{"lu","unsigned long int"},{"llu","unsigned long long int"},{"ju","uintmax_t"},{"zu","size_t"},{"tu","ptrdiff_t"},
    {"x","unsigned int"},{"hhx","unsigned char"},{"hx","unsigned short int"},{"lx","unsigned long int"},{"llx","unsigned long long int"},{"jx","uintmax_t"},{"zx","size_t"},{"tx","ptrdiff_t"},
    {"X","unsigned int"},{"hhX","unsigned char"},{"hX","unsigned short int"},{"lX","unsigned long int"},{"llX","unsigned long long int"},{"jX","uintmax_t"},{"zX","size_t"},{"tX","ptrdiff_t"},
    {"c","int"},{"lc","wint_t"},
    {"s","char*"},{"ls","wchar_t*"},
    {"f","double"},{"lf","double"},{"Lf","long double"},
    {"F","double"},{"LF","long double"},
    {"e","double"},{"Le","long double"},
    {"E","double"},{"LE","long double"},
    {"g","double"},{"Lg","long double"},
    {"G","double"},{"LG","long double"},
    {"a","double"},{"La","long double"},
    {"A","double"},{"LA","long double"},
    {"p","void*"},
    {"n","int*"},{"hhn","signed char*"},{"hn","short int*"},{"ln","long int*"},{"lln","long long int*"},{"jn","intmax_t*"},{"zn","size_t*"},{"tn","ptrdiff_t*"}
  };

  std::map<std::string,int> type_map ={
  {"int",0},
  {"short int",1},
  {"long int",2},
  {"long long int",3},
  {"unsigned int",4},
  {"unsigned short int",5},
  {"unsigned long int",6},
  {"unsigned long long int",7},
  {"wint_t",8},  
  {"intmax_t",9},
  {"uintmax_t",10},
  {"int*",11},
  {"short int*",12},
  {"long int*",13},
  {"long long int*",14},
  {"intmax_t*",15},
  {"char",16},
  {"signed char",17},
  {"unsigned char",18},
  {"char*",19},
  {"signed char*",20},
  {"wchar_t*",21},
  //目前只有double类型需要用到xmm寄存器
  {"float",22},
  {"double",23},
  {"long double",24},
  //
  {"void*",25},
  {"size_t",26},
  {"size_t*",27},
  {"ptrdiff_t",28},
  {"ptrdiff_t*",29},
  };


  /*std::map<std::string,llvm::Type> typeToLLLVMtype_map ={
  {"int",0},
  {"short int",1},
  {"long int",2},
  {"long long int",3},
  {"unsigned int",4},
  {"unsigned short int",5},
  {"unsigned long int",6},
  {"unsigned long long int",7},
  {"wint_t",8},  
  {"intmax_t",9},
  {"uintmax_t",10},
  {"int*",11},
  {"short int*",12},
  {"long int*",13},
  {"long long int*",14},
  {"intmax_t*",15},
  {"char",16},
  {"signed char",17},
  {"unsigned char",18},
  {"char*",19},
  {"signed char*",20},
  {"wchar_t*",21},
  //目前只有double类型需要用到xmm寄存器
  {"double",22},
  {"long double",23},
  //
  {"void*",24},
  {"size_t",25},
  {"size_t*",26},
  {"ptrdiff_t",27},
  {"ptrdiff_t*",28},
  };*/





  struct PrintfFormatReinterpret : public ModulePass {
    static char ID;
    PrintfFormatReinterpret() : ModulePass(ID) {} 
    using BasicBlockListType = SymbolTableList<BasicBlock>;
    std::set<std::string> funcsToInst;
    //由于一个基本块里面可能有多个待匹配的指令，故采用栈的方式，取时间顺序上最近的一次。
    std::stack<llvm::Instruction*> backUpInstructionStack;
    //存放最终识别到的
    std::list<extPrintfDetail> extPrintfList;
    CurrentState State;
    llvm::Function *printfFunc;
    bool runOnModule(Module &M) {
                LLVMContext &Context = M.getContext();
                for (Module::iterator mi = M.begin(); mi != M.end(); ++mi) {
                  Function &f = *mi;
                  std::regex printf_pattern("printf");
                  std::string fname=f.getName().str();
                  if (std::regex_match(fname,printf_pattern)) {
                      printfFunc=&f;
                      break;
                    }
                }

                //遍历Module中的函数列表，找到想要处理的函数
                for (Module::iterator mi = M.begin(); mi != M.end(); ++mi) {
                    Function &f = *mi;
                    std::string fname=f.getName().str();
                    //不同函数的正则匹配规则
                    std::regex extPrintf_pattern("ext_[0-9a-z]*_printf");
                    std::regex rdi_pattern("RDI_[0-9a-z]*_[0-9a-z]*");
                    std::regex register_pattern("[A-Z0-9]*_[0-9a-z]*_[0-9a-z]*");
                    std::regex data_pattern("data_[0-9a-z]*");
                    std::regex printf_pattern("printf");
                    /*if (std::regex_match(fname,printf_pattern)) {
                      printfFunc=&f;
                    }*/

                    //查找待匹配函数
                    if (std::regex_match(fname,extPrintf_pattern)) {
                      int stop_pre_find_flag ;
                        //遍历该函数的users
                        for (User *U : f.users()) {
                          stop_pre_find_flag=0;
                            if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                            {
                                Instruction *Selection_Inst =Inst;
                                //找到了ext_printf,以基本款为单位向前遍历（块内则是从前向后遍历），找到最近的RDI
                                //先找当前块
                                for(Instruction &subInst : *Inst->getParent())
                                {
                                  if(&subInst==Selection_Inst)
                                  {
                                    break;
                                  }
                                  //首先找到store指令
                                  if (subInst.getOpcode() == Instruction::Store)
                                  {
                                        //因为这边我们明确知道我们要找的 的store 指令格式为： store *** to @RDI  所以这边的
                                        //判断条件，我们直接取operand(1)，即第二个参数。
                                        if(subInst.getOperand(1)!= NULL 
                                        && std::regex_match(subInst.getOperand(1)->getName().str(),register_pattern)
                                        && std::regex_match(subInst.getOperand(0)->getName().str(),data_pattern))
                                        {
                                            errs() << subInst<< "\n";
                                            errs() << subInst.getOperand(0)->getName().str()<< "\n";
                                            //找到我们真正想要的第一个参数
                                            backUpInstructionStack.push(&subInst);
                                            stop_pre_find_flag =1;
                                            //break;
                                        }
                                  } 
                                
                                }
                                //这边是判断在当前基本块里有没有找到，如果找到的话就
                                //不进入后续的基本块迭代中
                                if(stop_pre_find_flag==1)
                                  {
                                    extPrintfDetail temNode;
                                    temNode.ext_inst=backUpInstructionStack.top();
                                    temNode.format=findGelementPointerInstTypeFormatString(M,temNode.ext_inst->getOperand(0)->getName().str());
                                    temNode.prased_decl=analysisPrintfFormatAndGetDecl(&temNode);
                                    
                                    errs() << temNode.format<< "\n";
                                    errs() << temNode.prased_decl<< "\n";
                                    extPrintfList.push_front(temNode);
                                    


                                    backUpInstructionStack.empty();
                                    continue;
                                  }
                                //当前块可能没有，要往前遍历
                                //本来想用如下接口，即LLVM提供的predecessors向前遍历，但实际测试中发现
                                //该接口有bug，会出现只遍历一次的情况，且暂时无法解决，故暂时使用手动遍历的方式
                                //for (BasicBlock *Pred : predecessors(Inst->getParent())) {
                                BasicBlock *BB= Inst->getParent();
                                while (BB->getPrevNode()!=NULL) {
                                  BB = BB->getPrevNode();
                                  
                                  for(Instruction &subInst : *BB)
                                  {
                                  //首先找到store指令
                                    if (subInst.getOpcode() == Instruction::Store)
                                    {
                                        //因为这边我们明确知道我们要找的 的store 指令格式为： store *** to @RDI  所以这边的
                                        //判断条件，我们直接取operand(1)，即第二个参数。
                                        //errs() << subInst<< "\n";
                                        if(subInst.getOperand(1)!= NULL 
                                        && std::regex_match(subInst.getOperand(1)->getName().str(),register_pattern))
                                        {
                                            errs() << subInst<< "\n";
                                            errs() << subInst.getOperand(0)->getName().str()<< "\n";
                                            //找到我们真正想要的第一个参数
                                            if(std::regex_match(subInst.getOperand(0)->getName().str(),data_pattern))
                                            {
                                              backUpInstructionStack.push(&subInst);
                                              stop_pre_find_flag =1;
                                            }
                                            //backUpInstructionStack.push(&subInst);
                                            //stop_pre_find_flag =1;
                                            //break;

                  
                                        }

                                    } 
                                
                                  }
                                //这边是判断在当前基本块里有没有找到，如果找到的话就
                                //不进入后续的基本块迭代中
                                  if(stop_pre_find_flag==1)
                                  {
                                  extPrintfDetail temNode;
                                  temNode.ext_inst=backUpInstructionStack.top();
                                  temNode.format=findGelementPointerInstTypeFormatString(M,temNode.ext_inst->getOperand(0)->getName().str());
                                  temNode.prased_decl=analysisPrintfFormatAndGetDecl(&temNode);
                                  
                                  errs() << temNode.format<< "\n";
                                  errs() << temNode.prased_decl<< "\n";
                                  extPrintfList.push_front(temNode);
                                  changeExtPrintfToFormalPrintf(Selection_Inst,&temNode);

                                  backUpInstructionStack.empty();
                                    break;
                                  }
                                
                                }
                                
                            }
                        }
                    }

                }
                return true;
    }



  /// 接受一个GEP格式的GlobalAlias的名字作为输入，解析该名字，找到该GlobalAlias并解析，返回最终指向
  /// 的格式化字符串
  /// param M Module
  /// param GLa The GlobalAlias
  std::string findGelementPointerInstTypeFormatString(Module &M,std::string  GlaName) {

              for (GlobalAlias &GA : M.aliases()) { 
              GlobalAlias *GLa = dyn_cast<GlobalAlias>(&GA);
              //找到对应名字的GLA
              if(GLa->getName().equals(GlaName))
              {
                ConstantExpr *gase=dyn_cast<ConstantExpr>(GLa->getAliasee());
                //GEP的格式为getelementptr args0（指向all_segment结构体的指针），arg1(指向结构体)
                //arg2(结构体中的第二轮遍历参数)，arg3(结构体中的第三轮遍历参数)，arg4(结构体中的第三轮遍历参数)
                //arg1和2帮助我们定位到all_segment这个struct，我们需要拿到后面3个参数来进一步往里遍历该结构体
                Constant *v2=gase->getOperand(2);
                Constant *v3=gase->getOperand(3);
                Constant *v4=gase->getOperand(4);
                ConstantInt *arg2=dyn_cast<ConstantInt>(v2);
                ConstantInt *arg3=dyn_cast<ConstantInt>(v3);
                ConstantInt *arg4=dyn_cast<ConstantInt>(v4);
                APInt round1=arg2->getValue();
                APInt round2=arg3->getValue();
                APInt round3=arg4->getValue();

                //第一层，取第一个operand并遍历
                Constant *cc=gase->getOperand(0);
                //这边因为知道mcsema_all_segments是一个constStruct类型的Value，故这边写死
                llvm::ConstantStruct *cs =dyn_cast<llvm::ConstantStruct>(cc->getOperand(0));
                int round_1=0;
                //遍历该struct，找到我们存格式化字符串的rodata段
                for(llvm::User::value_op_iterator i=cs->value_op_begin();i !=cs->value_op_end();++i)
                {
                    if(round_1==round1)
                    {
                      //我们知道存放rodata段的也是一个struct结构体，故这边也是强制类型转换
                      llvm::ConstantStruct *sub_cs =dyn_cast<llvm::ConstantStruct>(*i);
                      int round_2=0;
                      for(llvm::User::value_op_iterator sub_i=sub_cs->value_op_begin();sub_i !=sub_cs->value_op_end();++sub_i)
                      {
                        if(round_2==round2)
                        {
                          //我们知道最后我们需要拿到的格式化字符串存在一个constantdataArray里
                          llvm::ConstantDataArray *sub_arrray =dyn_cast<llvm::ConstantDataArray>(*sub_i);

                          //因为round3是字符array里面的索引，故这边不再遍历，直接截取字符串
                          int size=round3.roundToDouble();
                          llvm::StringRef str=sub_arrray->getAsString();
                          llvm::StringRef line_break="\n";
                          str=str.substr(size);
                          //因为substr截取后的字符串并不会在换行符处停下，故这边人工处理一下
                          //先转换成string类型
                          std::string sst=str.str();
                          //再用strlen函数来进行截取，得到字符串结束符前的字符串
                          int x=strlen(sst.c_str());
                          sst=sst.substr(0,x);
                          //因为可能包含结束符前存在换行符的情况，这边进行人工删除
                          if(sst.find_first_of(line_break.str()))
                          { 
                            sst=sst.substr(0,sst.find_first_of(line_break.str()));
                          }
                          return sst;
                        }
                          ++round_2;
                      }
                    }
                    
                    round_1++;
                }


              }
              

            }
            return NULL;  
  }

  /// 接受一个表示该printf调用的extPrintfDetail结构体，进行解析，并返回相应的补充函数定义
  /// param printfNode 自定义extPrintfDetail结构体
  std::string analysisPrintfFormatAndGetDecl(extPrintfDetail *printfNode) {
    //这部分定义是固定的
    std::string funcname="int printf";
    std::string argspec="";
    std::string decl="(const char *restrict __format";
    printfNode->param_list.push_back("char");
    
    //类似“%d”这样的格式化字符串的正则匹配表达式
    //组成如下：
    //%[flags][width][.prec][length]type
    //详细定义说明见链接：https://cplusplus.com/reference/cstdio/printf/?kw=printf
    std::regex printf_format_pattern("%[-,+,#,0, ]{0,1}([1-9]|[*]){0,1}(.1-9|.[*]){0,1}(d|hhd|hd|ld|lld|jd|zd|td|o|hho|ho|lo|llo|joo|zo|to|u|hhu|hu|lu|llu|ju|zu|tu|x|hhx|hx|lx|llx|jx|zx|tx|X|hhX|hX|lX|llX|jX|zX|tX|c|lc|f|lf|Lf|F|LF|e|Le|E|LE|g|Lg|G|LG|a|La|A|LA|s|ls|p|n|hhn|hn|ln|lln|jn|zn|tn)");
    std::regex lengthType_pattern("(d|hhd|hd|ld|lld|jd|zd|td|o|hho|ho|lo|llo|joo|zo|to|u|hhu|hu|lu|llu|ju|zu|tu|x|hhx|hx|lx|llx|jx|zx|tx|X|hhX|hX|lX|llX|jX|zX|tX|c|lc|f|lf|Lf|F|LF|e|Le|E|LE|g|Lg|G|LG|a|La|A|LA|s|ls|p|n|hhn|hn|ln|lln|jn|zn|tn)");
    std::string test_format="hellowyes";
    std::regex prec_pattern("[*]");
    std::smatch temp_type;
    int arg_iter=1;
    std::string  printf_format=printfNode->format;
    
    //因为format中可能不止出现一次“%d”这种情况，故这边采用iterator的方式遍历所有可能出现的情况
    auto words_begin = std::sregex_iterator(printf_format.begin(), printf_format.end(), printf_format_pattern);
    auto words_end = std::sregex_iterator();
    
    //对format的处理逻辑如下：
    //第一步：先判断是否存在“%d”这样的字符串，如果不存在则说明是简单的字符串输出，对应的补充函数定义为：
    //这边特别声明：“%%”和“%m”的情况因为不需要传参，故这两种情况也会进入下面这个定义
    //int printf( const char *restrict __format); 只有一个参数，且为格式化字符串。
    if(distance(words_begin, words_end)==0)
    {
      decl=decl+");";
    }
    //第二步，存在“%d”这样的字符串，则逐个分析，最后汇总生成一个补充函数。
    else
    {
      for (std::sregex_iterator i = words_begin; i != words_end; ++i) {

        //很重要！一定要先初始化，不然在c++ 14下与regex一起用会出错
        //详细见https://stackoverflow.com/questions/33154890/simple-stdregex-search-code-wont-compile-with-apple-clang-std-c14/33155000#33155000
        auto target_format=i->str();


        //因为format的格式原因，即:%[flags][width][.prec][length]type
        //我们可能匹配到了很多缺省字符，但真正对传参造成影响的只有type、length和.prec。
        //且只有prec为“*”时才会影响。printf("%.*f", x, a); x是输出的位数控制。
        //基于从左到右的规则，这边先判断是否有“*”
        if(std::regex_match(target_format,prec_pattern))
        {
          //有则需要添加一个int类型的返回值
          decl=decl+", int arg" +std::to_string(arg_iter);
          printfNode->param_list.push_back("int");
          arg_iter++;
        }
        //接下来我们匹配type和length。为了方便起见，我们将length和type的所有可能出现情况进行了枚举放在一个map中，再匹配。
        std::regex_search(target_format,temp_type,lengthType_pattern);
        decl=decl+", "+printf_format_map[temp_type[0]]+" arg"+std::to_string(arg_iter);
        argspec=argspec+temp_type[0].str();
        printfNode->param_list.push_back(printf_format_map[temp_type[0]]);
        arg_iter++;

      }
      decl=argspec+decl+");";
    }
    if(arg_iter==1)
    {
      decl=funcname+decl;
    }
    else{
      decl=funcname+std::to_string(arg_iter)+decl;
    }

    std::list<std::string>::iterator iter;
    errs() << printfNode->param_list.size()<< "  innersize\n";
    for(iter=printfNode->param_list.begin(); iter != printfNode->param_list.end(); iter++)
    {
      if(*iter=="double")
      {
        printfNode->double_paramcount++;
      }
      errs() << *iter<< "  inner\n";
    }
    errs() <<  printfNode->double_paramcount<< "  count\n";
    return decl;


  
  }

  


  /// 接受一个 call ext_printf。。。 指令,一个表示该printf调用的extPrintfDetail结构体
  /// 根据解析到的extPrintfDetail结构体，将该call ext_printf。。。 指令替换成对printf函数的直接调用，并生成对应传参。
  /// param callInst call ext_printf。。。 指令
  /// param printfNode 自定义extPrintfDetail结构体
  void changeExtPrintfToFormalPrintf(llvm::Instruction *callInst,extPrintfDetail *printfNode) {
    //维护了一个表示当前全局寄存器状态的结构体State。
    //先判断是否已经初始化，只需初始化一次。
    if(State.flag==false)
    {
      //遍历所有的GlobalAlias，找到我们想要的。
      for (GlobalAlias &GA : callInst->getModule()->aliases()) { 
        GlobalAlias *GLa = dyn_cast<GlobalAlias>(&GA);
        llvm::StringRef GLaName=GLa->getName();
        std::string glaName=GLaName.str();
        //mcsema翻译后的ir中的寄存器变量格式为：@RDI_2296_1c91e98
        //这边通过正则来确定该变量指代的是哪个寄存器
        std::size_t x=glaName.find_first_of("_");
        glaName=glaName.substr(0,x);
        //map可能出现匹配不到的情况，这边先count一下
        if(!RegisterToNum_map.count(glaName))
        {
          continue;  
        }
        int num=RegisterToNum_map[glaName];
        //RDI做特殊处理，因为printf传参的第一个参数是一个i8* 的指针类型。而RSI~R8都是i64的IntegerType
        if(num==0)
        {
          if(GLa->getType()->getPointerElementType()->isPointerTy())
          {
            llvm::Type *tt=GLa->getType()->getPointerElementType();
            llvm::PointerType *pointTT = dyn_cast<llvm::PointerType>(tt);
            //因为可能存在i32*,或其他类型的指针，故这边再往里取一次，确定找到我们想要的i8*类型
            if(pointTT->getPointerElementType()->isIntegerTy())
            {
              llvm::Type *inttt=pointTT->getPointerElementType();
              llvm::IntegerType *subIntTT = dyn_cast<llvm::IntegerType>(inttt);
              if(subIntTT->getBitWidth()==8)
              {
                State.RDI=GLa;
                State.rdi_flag=true;
              }

            }

          }

        }
        //RSP做特殊处理，我们需要的是一个指向i64的IntegerType的@RSP
        if(num==30)
        {
          if(GLa->getType()->getPointerElementType()->isIntegerTy())
          {
            llvm::Type *tt=GLa->getType()->getPointerElementType();
            llvm::IntegerType *intTT = dyn_cast<llvm::IntegerType>(tt);
            if(intTT->getBitWidth()==64)
            {
                State.RSP=GLa;
                State.rsp_flag=true;
            }
          }

        }
        if(num>0 && num <=13)
        {
          //RSI~R8在此处理
          if(GLa->getType()->getPointerElementType()->isIntegerTy())
          {
            llvm::Type *tt=GLa->getType()->getPointerElementType();
            llvm::IntegerType *intTT = dyn_cast<llvm::IntegerType>(tt);
            if(intTT->getBitWidth()==64)
            {
              switch (num)
              {
              /*case 0:
                State.RDI=GLa;
                State.rdi_flag=true;
                break;*/
              case 1:
                State.RSI=GLa;
                State.rsi_flag=true;
                break;
              case 2:
                State.RDX=GLa;
                State.rdx_flag=true;
                break;
              case 3:
                State.RCX=GLa;
                State.rcx_flag=true;
                break;
              case 4:
                State.R8=GLa;
                State.r8_flag=true;
                break;
              case 5:
                State.R9=GLa;
                State.r9_flag=true;
                break;  
              
              default:
                break;
              }
            }
          }
          //XMM0~XMM7在此处理
          else if (GLa->getType()->getPointerElementType()->isDoubleTy())
          {
            llvm::Type *tt=GLa->getType()->getPointerElementType();
            std::string Name=GLaName.str();
            //因为XMM0基础存器在mcsema的表示中可能存在如下情况：
            //@XMM0_16_1c91da8 = private thread_local(initialexec) alias double,
            //@XMM0_24_1c91da8 = private thread_local(initialexec) alias double,
            //上述两个GLA都是double类型，无法直接通过llvm type判断，
            //区别在函数名中的“16”和“24”所表示的寄存器位数中，我们需要的是16位的，故这边再做一层正则匹配。
            Name=Name.substr(x+1,sizeof(Name));
            std::size_t x2=Name.find_first_of("_");
            std::string width= GLaName.str().substr(x+1,x2);
            int width_int = std::stoi(width);

            // Check the condition
            //这边是新的解决上面的16，24的方法。深入调研发现，如果中间的数字-16能够被64整除，则取的是XMM*寄存器的前64位，而double类型这前64位就够用了。
            bool continue_flag=false;
            if ((width_int - 16) % 64 == 0) {
              continue_flag=true;
            } 
            else {
              continue;

            }

            if(continue_flag==true)
            {
              switch (num)
              {
              case 6:
                State.XMM0=GLa;
                State.xmm0_flag=true;
                break;
              case 7:
                State.XMM1=GLa;
                State.xmm1_flag=true;
                break;
              case 8:
                State.XMM2=GLa;
                State.xmm2_flag=true;
                break;
              case 9:
                State.XMM3=GLa;
                State.xmm3_flag=true;
                break;
              case 10:
                State.XMM4=GLa;
                State.xmm4_flag=true;
                break;
              case 11:
                State.XMM5=GLa;
                State.xmm5_flag=true;
                break;
              case 12:
                State.XMM6=GLa;
                State.xmm6_flag=true;
                break;
              case 13:
                State.XMM7=GLa;
                State.xmm7_flag=true;
                break;    
              
              default:
                break;
              }
            }

          }else{
            continue;
          }
          
            
        
        }

        
      }
      State.flag=true;
    }

    //接下来开始生成ir;
    LLVMContext &Context = callInst->getContext();
    IRBuilder<> Builder(callInst);
    //因为后面有pop操作，这边另初始化一个list
    std::list<std::string> paramList;
    paramList=printfNode->param_list;
    int normalRegisterCount=0;
    int XMMRegisterCount=6;
    //最后构建的printf函数的传参列表
    std::vector<llvm::Value *> asm_args;

    //为了处理从栈中取值的情况，这边设计了rsp指针
    bool need_rsp=false;
    int rsp_count=0;
    int sub_offset=0;
    int not_double_param_length = paramList.size()-printfNode->double_paramcount;
    if(not_double_param_length>6 || printfNode->double_paramcount >8)
    {
      need_rsp=true;
      if(not_double_param_length>6)
      {
        rsp_count=rsp_count+not_double_param_length-6;
      }
      if(printfNode->double_paramcount >8)
      {
        rsp_count=rsp_count+printfNode->double_paramcount-8;
      }
      sub_offset=rsp_count-1;
    }
    errs() << rsp_count<< " rsp_count\n";


    int i;
    for(i=0; i<printfNode->param_list.size();i++)
    {
      if(i==0)
      {
        //RDI对应格式化字符串的传参，因为是必须有的，故这里写死。
        auto param0 = Builder.CreateLoad(State.RDI,"param0");
        paramList.pop_front();
        asm_args.push_back(param0);
        normalRegisterCount++;
        continue;
      }
      int paramTypeId=type_map[paramList.front()];
      paramList.pop_front();
      std::string paramIrName = "param"+std::to_string(i);
      //如果是float,double类型，则传的是XMM寄存器
      if(paramTypeId==22 || paramTypeId==23 )
      {
        llvm::LoadInst *XMMparam;
        switch (XMMRegisterCount)
              {
              case 6:
                if(State.xmm0_flag==true)
                {
                XMMparam =Builder.CreateLoad(State.XMM0,paramIrName);
                asm_args.push_back(XMMparam);
                XMMRegisterCount++;
                }
                break;
              case 7:
                if(State.xmm1_flag==true)
                {
                XMMparam =Builder.CreateLoad(State.XMM1,paramIrName);
                asm_args.push_back(XMMparam);
                XMMRegisterCount++;
                }
                break;
              case 8:
                if(State.xmm2_flag==true)
                {
                XMMparam =Builder.CreateLoad(State.XMM2,paramIrName);
                asm_args.push_back(XMMparam);
                XMMRegisterCount++;
                }
                break;
              case 9:
                if(State.xmm3_flag==true)
                {
                XMMparam =Builder.CreateLoad(State.XMM3,paramIrName);
                asm_args.push_back(XMMparam);
                XMMRegisterCount++;
                }
                break;
              case 10:
                if(State.xmm4_flag==true)
                {
                XMMparam =Builder.CreateLoad(State.XMM4,paramIrName);
                asm_args.push_back(XMMparam);
                XMMRegisterCount++;
                }
                break;
              case 11:
                if(State.xmm5_flag==true)
                {
                XMMparam =Builder.CreateLoad(State.XMM5,paramIrName);
                asm_args.push_back(XMMparam);
                XMMRegisterCount++;
                }
                break;
              case 12:
                if(State.xmm6_flag==true)
                {
                XMMparam =Builder.CreateLoad(State.XMM6,paramIrName);
                asm_args.push_back(XMMparam);
                XMMRegisterCount++;
                }
                break;
              case 13:
                if(State.xmm7_flag==true)
                {
                XMMparam =Builder.CreateLoad(State.XMM7,paramIrName);
                asm_args.push_back(XMMparam);
                XMMRegisterCount++;
                }
                break;  
              
              default:
                //auto RSP_Stack_offset =Builder.CreateAdd(Builder.CreateLoad(State.RSP),
                //llvm::ConstantInt::get(llvm::Type::getInt64Ty(Context), (rsp_count-sub_offset)*8));
                //XMMparam =Builder.CreateLoad(Builder.CreateIntToPtr(RSP_Stack_offset,llvm::PointerType::getInt64Ty(Context)),paramIrName);
                //asm_args.push_back(XMMparam);
                //XMMRegisterCount++;
                //sub_offset--;
                break;
              }
      }
      else{
        llvm::LoadInst *Normalparam;
        switch (normalRegisterCount)
              {
                //rdi已经在前面默认使用过了
              /*case 0:
                auto Normalparam =Builder.CreateLoad(State.RDI,paramIrName);
                XMMRegisterCount++;
                break;*/
              case 1:
                Normalparam =Builder.CreateLoad(State.RSI,paramIrName);
                asm_args.push_back(Normalparam);
                normalRegisterCount++;
                break;
              case 2:
                Normalparam =Builder.CreateLoad(State.RDX,paramIrName);
                asm_args.push_back(Normalparam);
                normalRegisterCount++;
                break;
              case 3:
                Normalparam =Builder.CreateLoad(State.RCX,paramIrName);
                asm_args.push_back(Normalparam);
                normalRegisterCount++;
                break;
              case 4:
                Normalparam =Builder.CreateLoad(State.R8,paramIrName);
                asm_args.push_back(Normalparam);
                normalRegisterCount++;
                break;
              case 5:
                Normalparam =Builder.CreateLoad(State.R9,paramIrName);
                asm_args.push_back(Normalparam);
                normalRegisterCount++;
                break;  
              
              default:
                auto RSP_Stack_offset =Builder.CreateAdd(Builder.CreateLoad(State.RSP),
                llvm::ConstantInt::get(llvm::Type::getInt64Ty(Context), (rsp_count-sub_offset)*8));
                Normalparam =Builder.CreateLoad(Builder.CreateIntToPtr(RSP_Stack_offset,llvm::PointerType::get(llvm::Type::getInt64Ty(Context),0)),paramIrName);
                asm_args.push_back(Normalparam);
                sub_offset--;
                break;
              }


      }

    }
    //生成@prinf(...)
    auto call = Builder.CreateCall(printfFunc, asm_args);
    //获取原来的call @ext_printf,并删除
    llvm::Instruction *call_next= callInst->getNextNonDebugInstruction();
    call_next->eraseFromParent();
    callInst->eraseFromParent();





  
  }
  };
}


char PrintfFormatReinterpret::ID = 0;

//这边是对pass的注册
// Register for opt
static RegisterPass<PrintfFormatReinterpret> X("pfr", "Printf Format Reinterpret Pass");

// Register for clang
/*static RegisterStandardPasses Y(PassManagerBuilder::EP_EarlyAsPossible,
  [](const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
    PM.add(new Hello());
  });*/
