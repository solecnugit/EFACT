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
//What is written here is the specific function of pass
namespace {

  typedef struct node
{
  llvm::Instruction *ext_inst;
  std::string format=" ";
  std::string prased_decl=" ";
  std::list<std::string> param_list;
  int double_paramcount=0;
}extDLDetail;

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


  std::set<std::string> LibSet = {"libc.so.6", "libm.so.6", "libstdc++.so.6","libgfortran.so.3","libpthread.so.0"};

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
  //Currently only the double type needs to use the xmm register
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








  struct PrintfFormatReinterpret : public ModulePass {
    static char ID;
    PrintfFormatReinterpret() : ModulePass(ID) {} 
    using BasicBlockListType = SymbolTableList<BasicBlock>;
    std::set<std::string> funcsToInst;
    //Since there may be multiple instructions to be matched in a basic block, the stack method is used to select the most recent one in time sequence.
    std::stack<llvm::Instruction*> backUpInstructionStack;
    //Store the finally recognized
    std::list<extDLDetail> extPrintfList;
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

                //Traverse the function list in the Module and find the function you want to process
                for (Module::iterator mi = M.begin(); mi != M.end(); ++mi) {
                    Function &f = *mi;
                    std::string fname=f.getName().str();
                    //Regular matching rules for different functions
                    std::regex extDlopen_pattern("ext_[0-9]*_dlopen");
                    std::regex extDlsym_pattern("ext_[0-9]*_dlsym");
                    std::regex rdi_pattern("RDI_[0-9a-z]*_[0-9a-z]*");
                    std::regex register_pattern("[A-Z0-9]*_[0-9a-z]*_[0-9a-z]*");
                    std::regex data_pattern("data_[0-9a-z]*");
                    std::regex printf_pattern("printf");


                    //Find the matching function
                    if (std::regex_match(fname,extDlopen_pattern)) {
                      int stop_pre_find_flag ;
                        //Traverse users of this function
                        for (User *U : f.users()) {
                          stop_pre_find_flag=0;
                            if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                            {
                                Instruction *Selection_Inst =Inst;
                                //Found ext_dlopen, traversed forward in basic units (traversed from front to back within the block), and found the nearest RDI.
                                //先找当前块
                                for(Instruction &subInst : *Inst->getParent())
                                {
                                  if(&subInst==Selection_Inst)
                                  {
                                    break;
                                  }
                                  //First find the store instruction
                                  if (subInst.getOpcode() == Instruction::Store)
                                  {
                                        //Because here we clearly know that the store instruction format we are looking for is: store *** to @RDI, so here
                                        //To determine the condition, we directly take operand(1), which is the second parameter。
                                        if(subInst.getOperand(1)!= NULL 
                                        && std::regex_match(subInst.getOperand(1)->getName().str(),register_pattern)
                                        && std::regex_match(subInst.getOperand(0)->getName().str(),data_pattern))
                                        {
                                            //Find the first parameter we really want
                                            backUpInstructionStack.push(&subInst);
                                            stop_pre_find_flag =1;
                                            //break;
                                        }
                                  } 
                                
                                }
                                //This is to determine whether it is found in the current basic block. If found,
                                //Do not enter subsequent basic block iterations
                                if(stop_pre_find_flag==1)
                                  {
                                    extDLDetail temNode;
                                    temNode.ext_inst=backUpInstructionStack.top();
                                    temNode.format=findGelementPointerInstTypeFormatString(M,temNode.ext_inst->getOperand(0)->getName().str());
                                    if(LibSet.find(temNode.format)!=LibSet.end())
                                    {
                                      errs() << temNode.format << "\n";
                                      errs() << "the target lib of dlopen is under support\n";
                                    }
                                    else
                                    {
                                      errs() << "the target lib of dlopen is not under support\n";
                                      backUpInstructionStack.empty();
                                      break;
                                    }
                                    backUpInstructionStack.empty();
                                    continue;
                                  }
                                //The current block may not exist, and it needs to be traversed forward.
                                //I originally wanted to use the following interface, that is, the predecessors provided by LLVM to traverse forward, but in the actual test, I found that
                                //There is a bug in this interface. There will be a situation where it is only traversed once, and it cannot be solved for the time being. Therefore, manual traversal is used for the time being.
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
                                            //找到我们真正想要的第一个参数
                                            if(std::regex_match(subInst.getOperand(0)->getName().str(),data_pattern))
                                            {
                                              backUpInstructionStack.push(&subInst);
                                              stop_pre_find_flag =1;
                                            }

                  
                                        }

                                    } 
                                
                                  }
                                //这边是判断在当前基本块里有没有找到，如果找到的话就
                                //不进入后续的基本块迭代中
                                  if(stop_pre_find_flag==1)
                                  {
                                  extDLDetail temNode;
                                  temNode.ext_inst=backUpInstructionStack.top();
                                  temNode.format=findGelementPointerInstTypeFormatString(M,temNode.ext_inst->getOperand(0)->getName().str());
                                  //temNode.prased_decl=analysisPrintfFormatAndGetDecl(&temNode);
                                  
                                  if(LibSet.find(temNode.format)!=LibSet.end())
                                    {
                                      errs() << temNode.format << "\n";
                                      errs() << "the target lib of dlopen is under support\n";
                                    }
                                    else
                                    {
                                      errs() << "the target lib of dlopen is not under support\n";
                                      backUpInstructionStack.empty();
                                      break;
                                    }

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


  


  };
}


char PrintfFormatReinterpret::ID = 0;

//这边是对pass的注册
// Register for opt
static RegisterPass<PrintfFormatReinterpret> X("dl", "dlopen/sym Reinterpret Pass");

// Register for clang
/*static RegisterStandardPasses Y(PassManagerBuilder::EP_EarlyAsPossible,
  [](const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
    PM.add(new Hello());
  });*/