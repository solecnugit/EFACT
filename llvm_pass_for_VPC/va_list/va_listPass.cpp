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
}extVprintfDetail;

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
    GlobalAlias *RAX;
    bool rax_flag=false;
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


  typedef struct GlobalValuesState
{
    bool flag=false;
    GlobalVariable *RDI;
    bool rdi_flag=false;
    GlobalVariable *RSI;
    bool rsi_flag=false;
    GlobalVariable *RDX;
    bool rdx_flag=false;
    GlobalVariable *RCX;
    bool rcx_flag=false;
    GlobalVariable *R8;
    bool r8_flag=false;
    GlobalVariable *R9;
    bool r9_flag=false;
    GlobalVariable *XMM0;
    bool xmm0_flag=false;
    GlobalVariable *XMM1;
    bool xmm1_flag=false;
    GlobalVariable *XMM2;
    bool xmm2_flag=false;
    GlobalVariable *XMM3;
    bool xmm3_flag=false;
    GlobalVariable *XMM4;
    bool xmm4_flag=false;
    GlobalVariable *XMM5;
    bool xmm5_flag=false;
    GlobalVariable *XMM6;
    bool xmm6_flag=false;
    GlobalVariable *XMM7;
    bool xmm7_flag=false;

    GlobalVariable *RSP;
    bool rsp_flag=false;
    
    
}CurrentGlobalValueState;


typedef struct vprintf_configure_state
{
    bool xmm0_flag=false;
    bool xmm1_flag=false;
    bool xmm2_flag=false;
    bool xmm3_flag=false;
    bool xmm4_flag=false;
    bool xmm5_flag=false;
    bool xmm6_flag=false;
    bool xmm7_flag=false;

    bool true_flag=false;
    
}VprintfConfigureState;

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
  {"RAX",31},
  };



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








  struct VprintfFormatReinterpret : public ModulePass {
    static char ID;
    VprintfFormatReinterpret() : ModulePass(ID) {} 
    using BasicBlockListType = SymbolTableList<BasicBlock>;
    std::set<std::string> funcsToInst;
    //由于一个基本块里面可能有多个待匹配的指令，故采用栈的方式，取时间顺序上最近的一次。
    std::stack<llvm::Instruction*> backUpInstructionStack;
    //存放最终识别到的
    std::list<extVprintfDetail> extVprintfList;
    CurrentState State;
    CurrentGlobalValueState MemoryCopyState;
    VprintfConfigureState VprintfState;
    llvm::Function *VprintfFunc;
    bool runOnModule(Module &M) {
                LLVMContext &Context = M.getContext();
                for (Module::iterator mi = M.begin(); mi != M.end(); ++mi) {
                  Function &f = *mi;
                  //errs() << f.getName()<< "\n";
                  std::regex vprintf_pattern("vprintf");
                  std::string fname=f.getName().str();
                  if (std::regex_match(fname,vprintf_pattern)) {
                      VprintfFunc=&f;
                      break;
                    }
                }
                 errs() << "886"<< "\n";
                //遍历Module中的函数列表，找到想要处理的函数
                for (Module::iterator mi = M.begin(); mi != M.end(); ++mi) {
                    Function &f = *mi;
                    std::string fname=f.getName().str();
                    //不同函数的正则匹配规则
                    std::regex extv_printf_pattern("ext_[0-9a-z]*_v[fsn]*?printf");
                    std::regex extv_scanf_pattern("ext_[0-9a-z]*[_0-9a-z]*_v[fs]*?scanf");
                    std::regex f_mcsema_pattern("printf_mcsema");
                    std::regex rdi_pattern("RDI_[0-9a-z]*_[0-9a-z]*");
                    std::regex xmm_pattern("XMM[0-9]*_[0-9a-z]*_[0-9a-z]*");
                    std::regex stdout_pattern("stdout");
                    std::regex register_pattern("[A-Z0-9]*_[0-9a-z]*_[0-9a-z]*");
                    std::regex data_pattern("data_[0-9a-z]*");
                    std::regex extvprintf_pattern("ext_[0-9a-z]*_vprintf");
                    std::regex extvsprintf_pattern("ext_[0-9a-z]*_vsprintf");
                    std::regex extvfprintf_pattern("ext_[0-9a-z]*_vfprintf");
                    std::regex extvsnprintf_pattern("ext_[0-9a-z]*_vsnprintf");
                    std::regex extvsscanf_pattern("ext_[0-9a-z]*[_0-9a-z]*_vsscanf");
                    std::regex extvfscanf_pattern("ext_[0-9a-z]*[_0-9a-z]*_vfscanf");
                    //查找待匹配函数
                    // errs() << fname<< "\n";

                    if (std::regex_match(fname,extv_printf_pattern) || std::regex_match(fname,extv_scanf_pattern))
                    {

                      errs() << fname<< "\n";
                      errs() << "aaaaaaaaaaaaaaaaaaaa"<< "\n";
                      int stop_pre_find_flag_local ;
                      int stop_pre_find_flag_global ;
                      int v_printf_delete_flag;
                        stop_pre_find_flag_global=0;
                        //遍历该函数的users
                        for (User *U : f.users()) {
                          stop_pre_find_flag_local=0;
                          
                          v_printf_delete_flag=0;
                            if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                            {
                                Instruction *Selection_vprintfInst =Inst;
                                //找到了ext_vprintf,以基本块为单位向前遍历（块内则是从前向后遍历），找到最近的va_list的pattern
                                //先找当前块
                                for(Instruction &subInst : *Inst->getParent())
                                {
                                  if(&subInst==Selection_vprintfInst)
                                  {
                                    break;
                                  }
                                  //首先找到Load指令
                                  if (subInst.getOpcode() == Instruction::Load)
                                  {
                                        //因为这边我们明确知道我们要找的 的load 指令格式为： %214 = load i64, i64* @R9_2360_20ac9d0, align 8  所以这边的
                                        //判断条件，我们直接取operand(0)，即第一个参数，在上面的例子中对应@R9_2360_20ac9d0
                                        if(subInst.getOperand(0)!= NULL 
                                        && std::regex_match(subInst.getOperand(0)->getName().str(),xmm_pattern))
                                        {
                                            //errs() << subInst<< "\n";
                                            //errs() << subInst.getOperand(0)->getName().str()<< "\n";
                                            if ( changeVprintfState( &VprintfState, subInst.getOperand(0)->getName().str()) )
                                            {
                                              errs() << "1111111111"<< "\n";
                                              stop_pre_find_flag_local=1;
                                              stop_pre_find_flag_global=1;
                                              break;
                                            }
                                            
                                        }
                                  } 
                                
                                }
                                //当前块可能没有，要往前遍历
                                //本来想用如下接口，即LLVM提供的predecessors向前遍历，但实际测试中发现
                                //该接口有bug，会出现只遍历一次的情况，且暂时无法解决，故暂时使用手动遍历的方式
                                BasicBlock *BB= Inst->getParent();
                                while (BB->getPrevNode()!=NULL) 
                                {
                                  BB = BB->getPrevNode();
                                  
                                  for(Instruction &subInst : *BB)
                                  {
                                  //首先找到load指令
                                      if (subInst.getOpcode() == Instruction::Load)
                                    {
                                          //因为这边我们明确知道我们要找的 的load 指令格式为： %214 = load i64, i64* @R9_2360_20ac9d0, align 8  所以这边的
                                          //判断条件，我们直接取operand(0)，即第一个参数，在上面的例子中对应@R9_2360_20ac9d0
                                          if(subInst.getOperand(0)!= NULL 
                                          && std::regex_match(subInst.getOperand(0)->getName().str(),xmm_pattern))
                                          {
                                              //errs() << subInst<< "\n";
                                              //errs() << subInst.getOperand(0)->getName().str()<< "\n";
                                              if( changeVprintfState(&VprintfState, subInst.getOperand(0)->getName().str()) )
                                            {
                                              errs() << "22222222222222"<< "\n";
                                              stop_pre_find_flag_local=1;
                                              stop_pre_find_flag_global=1;
                                              break;
                                            }
                                             
                                          }
                                    }
                                  } 
                                
                                }

                                //这边是翻译spec才需要解决的情况，暂时处理EEMBC不需要
                                if (stop_pre_find_flag_local==1)
                                    {
                                      //找到了之后开始生成IR，将GPR都插入一个地址中
                                      llvm::Function *Fatherfunc = BB->getParent();
                                      for (User *U : Fatherfunc->users()) 
                                      {
                                        if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                                        {
                                        InsertGPRBeforeFundvprintf(Inst);
                                        }
                                      }

                                    continue;
                                    }
                                //这边是判断在当前函数里有没有找到，没找到就往前找调用过该函数的Prefunction,在
                                //Prefunction中查找是否存在pattern，prefunction可能有多个，都要处理
                                llvm::Function *Curentfunc = BB->getParent();
                                for (User *U : Curentfunc->users()) {
                                  errs() <<"eeeeeeeeeeeeeeeeeeee" << "\n";
                                  errs() <<*U << "\n";
                                  stop_pre_find_flag_local=0;
                                  refreshVprintfState(&VprintfState);
                                  if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                                    {
                                      Instruction *Selection_vprintf_preInst =Inst;
                                      //errs() <<"2222222222222222" << "\n";
                                      //errs() <<*Selection_vprintfInst << "\n";
                                      //errs() <<*Selection_vprintfInst << "\n";
                                      for(Instruction &subInst : *Inst->getParent())
                                        {
                                          //errs() <<Inst->getParent()->getName() << "\n";
                                          if(&subInst==Selection_vprintf_preInst)
                                          {
                                            break;
                                          }
                                            //首先找到load指令
                                            if (subInst.getOpcode() == Instruction::Load)
                                            {
                                                //因为这边我们明确知道我们要找的 的load 指令格式为： %214 = load i64, i64* @R9_2360_20ac9d0, align 8  所以这边的
                                                //判断条件，我们直接取operand(0)，即第一个参数，在上面的例子中对应@R9_2360_20ac9d0
                                                if(subInst.getOperand(0)!= NULL 
                                                && std::regex_match(subInst.getOperand(0)->getName().str(),xmm_pattern))
                                                {
                                                    //errs() << subInst<< "\n";
                                                    //errs() << subInst.getOperand(0)->getName().str()<< "\n";
                                                    if( changeVprintfState(&VprintfState, subInst.getOperand(0)->getName().str()) )
                                                    {
                                                      errs() << "3333333"<< "\n";
                                                      stop_pre_find_flag_local=1;
                                                      stop_pre_find_flag_global=1;
                                                      break;
                                                    }
                                                  
                                                }
                                            } 
                                        
                                        }
                                     BasicBlock *BB= Inst->getParent();
                                     while (BB->getPrevNode()!=NULL && stop_pre_find_flag_local==0) {
                                      BB = BB->getPrevNode();
                                      //errs() <<BB->getName() << "\n";
                                      for(Instruction &subInst : *BB)
                                      {
                                      //首先找到store指令
                                          if (subInst.getOpcode() == Instruction::Load)
                                        {
                                              //因为这边我们明确知道我们要找的 的load 指令格式为： %214 = load i64, i64* @R9_2360_20ac9d0, align 8  所以这边的
                                              //判断条件，我们直接取operand(0)，即第一个参数，在上面的例子中对应@R9_2360_20ac9d0
                                              if(subInst.getOperand(0)!= NULL 
                                              && std::regex_match(subInst.getOperand(0)->getName().str(),xmm_pattern))
                                              {
                                                  //errs() << subInst<< "\n";
                                                  //errs() << subInst.getOperand(0)->getName().str()<< "\n";
                                                  if(changeVprintfState(&VprintfState, subInst.getOperand(0)->getName().str()))
                                                    {
                                                      errs() << "444444444"<< "\n";
                                                      stop_pre_find_flag_local=1;
                                                      stop_pre_find_flag_global=1;

                                                      break;
                                                    }
                                                
                                              }
                                        }
                                      } 
                                    
                                     }
                                    
                                        if (stop_pre_find_flag_local==1)
                                        {
                                          errs() <<*Inst << "\n";
                                          //找到了之后开始生成IR，将GPR都插入一个地址中
                                          llvm::Function *Fatherfunc = BB->getParent();
                                          //errs() <<*Fatherfunc  << "\n";
                                          for (User *U : Fatherfunc->users()) 
                                          {
                                            if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                                            {
                                              //errs() <<"GPR" << "\n";
                                            //errs() <<*Inst << "\n";  
                                            InsertGPRBeforeFundvprintf(Inst);
                                            }
                                          }

                                        }

                                  }
                                }

                        //应该是在这边
        
                        }
                                
                                
                                
                            
                      }
                      //errs() << fname<< "\n";
                      //errs() << "77777777777777"<< "\n";
                      //errs() << stop_pre_find_flag_global<< "\n";
                      if (stop_pre_find_flag_global==1)
                    {
                     for (User *U : f.users()) {
                            if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                            {
                              if (std::regex_match(fname,extvprintf_pattern)) {
                                          //errs() << *Inst<< "\n";
                                          //errs() << "vprintf"<< "\n";
                                            InsertCalltoShareBeforeFundvprintf(Inst,1);
                                          }else if(std::regex_match(fname,extvsprintf_pattern))
                                          {
                                            //errs() << *Inst<< "\n";
                                           // errs() << "vsprintf"<< "\n";
                                            InsertCalltoShareBeforeFundvprintf(Inst,4);
                                          }else if(std::regex_match(fname,extvfscanf_pattern))
                                          {
                                            errs() << *Inst<< "\n";
                                            errs() << "456456777"<< "\n";
                                            InsertCalltoShareBeforeFundvprintf(Inst,6);
                                          }else if(std::regex_match(fname,extvsscanf_pattern))
                                          {
                                            errs() << *Inst<< "\n";
                                            errs() << "456456111"<< "\n";
                                            InsertCalltoShareBeforeFundvprintf(Inst,7);
                                          }else if(std::regex_match(fname,extvsnprintf_pattern))
                                          {
                                            //errs() << *Inst<< "\n";
                                            //errs() << "vsnprintf"<< "\n";
                                            InsertCalltoShareBeforeFundvprintf(Inst,5);
                                          }else{
                                            //因为对于vprintf，当指定宏定义的时候，会将vprintf inline为vfprintf，所以这边我们需要判断一下
                                            //#ifdef __USE_EXTERN_INLINES
                                            /* For -D_FORTIFY_SOURCE{,=2,=3} bits/stdio2.h will define a different
                                              inline.  */
                                            //# if !(__USE_FORTIFY_LEVEL > 0 && defined __fortify_function)
                                            /* Write formatted output to stdout from argument list ARG.  */
                                            //__STDIO_INLINE int
                                            //vprintf (const char *__restrict __fmt, __gnuc_va_list __arg)
                                            //{
                                            //  return vfprintf (stdout, __fmt, __arg);
                                            //}
                                            int inline_stdout_flag=0;
                                            BasicBlock *BB= Inst->getParent();
                                            int round =0;
                                     while (BB->getPrevNode()!=NULL && round<2 ) {
                                      BB = BB->getPrevNode();
                                      round++;
                                     }
                                      for(Instruction &subInst : *BB)
                                      {
                                      //首先找到store指令
                                          if (subInst.getOpcode() == Instruction::Load)
                                        {
                                          if(subInst.getOperand(0)!= NULL 
                                              && std::regex_match(subInst.getOperand(0)->getName().str(),stdout_pattern))
                                              {
                                                  errs() << subInst<< "\n";
                                                  //errs() << subInst.getOperand(0)->getName().str()<< "\n";
                                                  
                                                      inline_stdout_flag=1;
                                                  
                                                break;
                                              }
                                        }
                                      }
                                      if(inline_stdout_flag==1)
                                      {
                                        errs() << *Inst<< "\n";
                                            errs() << "vfprintf_inline"<< "\n";
                                          InsertCalltoShareBeforeFundvprintf(Inst,3);
                                      }else{
                                        errs() << *Inst<< "\n";
                                            errs() << "vfprintf"<< "\n";
                                        InsertCalltoShareBeforeFundvprintf(Inst,2);
                                      }
                                            
                                          }
                            }
                      }
                    } 
                    }
                }
                  return true;
                }
                
    



 //接受一个VprintfState的结构体，重置识别器的状态
 void refreshVprintfState(VprintfConfigureState *VprintfState)
  {
          VprintfState->xmm0_flag=false;
          VprintfState->xmm1_flag=false;
          VprintfState->xmm2_flag=false;
          VprintfState->xmm3_flag=false;
          VprintfState->xmm4_flag=false;
          VprintfState->xmm5_flag=false;
          VprintfState->xmm6_flag=false;
          VprintfState->xmm7_flag=false;
          VprintfState->true_flag=false;
  }


  //接受一个VprintfState的结构体，和XMM寄存器的名字，并将该结构体内的对应的XMM寄存器的值设置为true，最后判断是否完成识别，完成返回true
  bool changeVprintfState(VprintfConfigureState *VprintfState,std::string  XMMName)
  {
    std::size_t x=XMMName.find_first_of("_");
        XMMName=XMMName.substr(0,x);
        int num=RegisterToNum_map[XMMName];
        switch (num)
        {
          case 6:
            VprintfState->xmm0_flag=true;
            break;
          case 7:
            VprintfState->xmm1_flag=true;
            break;
          case 8:
            VprintfState->xmm2_flag=true;
            break;
          case 9:
            VprintfState->xmm3_flag=true;
            break;
          case 10:
            VprintfState->xmm4_flag=true;
            break;
          case 11:
            VprintfState->xmm5_flag=true;
            break;
          case 12:
            VprintfState->xmm6_flag=true;
            break;
          case 13:
            VprintfState->xmm7_flag=true;
            break;
        }
        if(VprintfState->xmm0_flag==true && VprintfState->xmm1_flag==true && VprintfState->xmm2_flag==true && VprintfState->xmm3_flag==true && VprintfState->xmm4_flag==true && VprintfState->xmm5_flag==true && VprintfState->xmm6_flag==true && VprintfState->xmm7_flag==true)
        {
          VprintfState->true_flag=true;
          errs() <<"Find!!!!!!!!!!!!"<<"\n";
          return true;
        }
        else{
          return false;
        }


  }



  /// 接受一个 call ext_printf。。。 指令,一个表示该printf调用的extVprintfDetail结构体
  /// 根据解析到的extVprintfDetail结构体，将该call ext_printf。。。 指令替换成对printf函数的直接调用，并生成对应传参。
  /// param callInst call ext_printf。。。 指令
  /// param printfNode 自定义extVprintfDetail结构体
  void InsertGPRBeforeFundvprintf(llvm::Instruction *callInst) {
    //维护了一个表示当前全局寄存器状态的结构体State。
    //先判断是否已经初始化，只需初始化一次。
    if(State.flag==false)
    {
      //遍历所有的GlobalAlias，找到我们想要的。
      for (GlobalAlias &GA : callInst->getModule()->aliases()) { 
        GlobalAlias *GLa = dyn_cast<GlobalAlias>(&GA);
        llvm::StringRef GLaName=GLa->getName();
        std::string glaName=GLaName.str();
        //errs() << glaName<< "\n";
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
        //RAX也特殊处理，我们需要的是一个指向i64的IntegerType的@RAX
        if(num==31)
        {
          if(GLa->getType()->getPointerElementType()->isIntegerTy())
          {
            llvm::Type *tt=GLa->getType()->getPointerElementType();
            llvm::IntegerType *intTT = dyn_cast<llvm::IntegerType>(tt);
            if(intTT->getBitWidth()==64)
            {
                State.RAX=GLa;
                State.rax_flag=true;
            }
          }

        }

        if(num>=0 && num <=13)
        {
          //RSI~R8在此处理
          if(GLa->getType()->getPointerElementType()->isIntegerTy())
          {
            //errs() << GLa->getName()<< "\n";
            llvm::Type *tt=GLa->getType()->getPointerElementType();
            llvm::IntegerType *intTT = dyn_cast<llvm::IntegerType>(tt);
            if(intTT->getBitWidth()==64)
            {
              switch (num)
              {
              case 0:
                State.RDI=GLa;
                State.rdi_flag=true;
                break;
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
    BasicBlock *fb = callInst->getParent();
    llvm::Function* func = fb->getParent();
    llvm::Module* module = func->getParent();
    IRBuilder<> Builder(callInst);
    int normalRegisterCount=0;
    int XMMRegisterCount=6;
    Builder.SetInsertPoint(callInst);
    
    llvm::Type* i64_type = llvm::Type::getInt64Ty(Context);
    std::string paramIrName = "param";
    for (normalRegisterCount=0; normalRegisterCount<6; normalRegisterCount++)
    {
      llvm::LoadInst *Normalparam;
      switch (normalRegisterCount)
      {
        case 0:
        {
          paramIrName = "rdi"+paramIrName + std::to_string(normalRegisterCount);
          llvm::Constant* global_RDI_Const = module->getOrInsertGlobal("rdi_global_var", i64_type);
          llvm::GlobalVariable* global_RDI_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_RDI_Const);
          global_RDI_Var->setInitializer(llvm::Constant::getNullValue(i64_type)); 
          global_RDI_Var->setThreadLocal(true); 
          global_RDI_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
          global_RDI_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
          Normalparam=Builder.CreateLoad(State.RDI,paramIrName);
          MemoryCopyState.RDI=global_RDI_Var;
          MemoryCopyState.rdi_flag=true;
          Builder.CreateStore(Normalparam,global_RDI_Var);
          break;
        }
        case 1:
        {
          paramIrName = "rsi"+paramIrName + std::to_string(normalRegisterCount);
          llvm::Constant* global_RSI_Const = module->getOrInsertGlobal("rsi_global_var", i64_type);
          llvm::GlobalVariable* global_RSI_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_RSI_Const);
          global_RSI_Var->setInitializer(llvm::Constant::getNullValue(i64_type));
          global_RSI_Var->setThreadLocal(true);
          global_RSI_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
          global_RSI_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);  
          Normalparam=Builder.CreateLoad(State.RSI,paramIrName);
          MemoryCopyState.RSI=global_RSI_Var;
          MemoryCopyState.rsi_flag=true;
          Builder.CreateStore(Normalparam,global_RSI_Var);
          break;
        }
        case 2:
        {
          paramIrName = "rdx"+paramIrName + std::to_string(normalRegisterCount);
          llvm::Constant* global_RDX_Const = module->getOrInsertGlobal("rdx_global_var", i64_type);
          llvm::GlobalVariable* global_RDX_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_RDX_Const);
          global_RDX_Var->setInitializer(llvm::Constant::getNullValue(i64_type)); 
          global_RDX_Var->setThreadLocal(true); 
          global_RDX_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
          global_RDX_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
          Normalparam=Builder.CreateLoad(State.RDX,paramIrName);
          MemoryCopyState.RDX=global_RDX_Var;
          MemoryCopyState.rdx_flag=true;
          Builder.CreateStore(Normalparam,global_RDX_Var);
          break;
        }
        case 3:
        {
          paramIrName = "rcx"+paramIrName + std::to_string(normalRegisterCount);
          llvm::Constant* global_RCX_Const = module->getOrInsertGlobal("rcx_global_var", i64_type);
          llvm::GlobalVariable* global_RCX_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_RCX_Const);
          global_RCX_Var->setInitializer(llvm::Constant::getNullValue(i64_type)); 
          global_RCX_Var->setThreadLocal(true); 
          global_RCX_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
          global_RCX_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
          Normalparam=Builder.CreateLoad(State.RCX,paramIrName);
          MemoryCopyState.RCX=global_RCX_Var;
          MemoryCopyState.rcx_flag=true;
          Builder.CreateStore(Normalparam,global_RCX_Var);
          break;
        }
        case 4:
        {
          paramIrName = "r8"+paramIrName + std::to_string(normalRegisterCount);
          llvm::Constant* global_R8_Const = module->getOrInsertGlobal("r8_global_var", i64_type);
          llvm::GlobalVariable* global_R8_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_R8_Const);
          global_R8_Var->setInitializer(llvm::Constant::getNullValue(i64_type));  
          global_R8_Var->setThreadLocal(true);
          global_R8_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
          global_R8_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
          Normalparam=Builder.CreateLoad(State.R8,paramIrName);
          MemoryCopyState.R8=global_R8_Var;
          MemoryCopyState.r8_flag=true;
          Builder.CreateStore(Normalparam,global_R8_Var);
          break;
        }
        case 5:
        {
          paramIrName = "r9"+paramIrName + std::to_string(normalRegisterCount);
          llvm::Constant* global_R9_Const = module->getOrInsertGlobal("r9_global_var", i64_type);
          llvm::GlobalVariable* global_R9_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_R9_Const);
          global_R9_Var->setInitializer(llvm::Constant::getNullValue(i64_type));  
          global_R9_Var->setThreadLocal(true);
          global_R9_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
          global_R9_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
          Normalparam=Builder.CreateLoad(State.R9,paramIrName);
          MemoryCopyState.R9=global_R9_Var;
          MemoryCopyState.r9_flag=true;
          Builder.CreateStore(Normalparam,global_R9_Var);
          break;
        } 

      }
    }
      
      llvm::Type* double_type = llvm::Type::getDoubleTy(Context);
    for(XMMRegisterCount=6; XMMRegisterCount<14; XMMRegisterCount++)
    {
      llvm::LoadInst *XMMparam;
      switch(XMMRegisterCount)
      {
        case 6:
        {
          if(State.xmm0_flag==true)
          {
            paramIrName = "xmm0"+paramIrName + std::to_string(XMMRegisterCount);
            llvm::Constant* global_XMM0_Const = module->getOrInsertGlobal("xmm0_global_var", double_type);
            llvm::GlobalVariable* global_XMM0_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_XMM0_Const);
            global_XMM0_Var->setInitializer(llvm::Constant::getNullValue(double_type));  
            global_XMM0_Var->setThreadLocal(true);
            global_XMM0_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
            global_XMM0_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
            XMMparam =Builder.CreateLoad(State.XMM0,paramIrName);
            MemoryCopyState.XMM0=global_XMM0_Var;
            MemoryCopyState.xmm0_flag=true;
            Builder.CreateStore(XMMparam,global_XMM0_Var);
          }
          break;
        }
        case 7:
        {
          if(State.xmm1_flag==true)
          {
            paramIrName = "xmm1"+paramIrName + std::to_string(XMMRegisterCount);
            llvm::Constant* global_XMM1_Const = module->getOrInsertGlobal("xmm1_global_var", double_type);
            llvm::GlobalVariable* global_XMM1_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_XMM1_Const);
            global_XMM1_Var->setInitializer(llvm::Constant::getNullValue(double_type));  
            global_XMM1_Var->setThreadLocal(true);
            global_XMM1_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
            global_XMM1_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
            XMMparam =Builder.CreateLoad(State.XMM1,paramIrName);
            MemoryCopyState.XMM1=global_XMM1_Var;
            MemoryCopyState.xmm1_flag=true;
            Builder.CreateStore(XMMparam,global_XMM1_Var);
          }
          break;
        }
        case 8:
        {
          if(State.xmm2_flag==true)
          {
            paramIrName = "xmm2"+paramIrName + std::to_string(XMMRegisterCount);
            llvm::Constant* global_XMM2_Const = module->getOrInsertGlobal("xmm2_global_var", double_type);
            llvm::GlobalVariable* global_XMM2_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_XMM2_Const);
            global_XMM2_Var->setInitializer(llvm::Constant::getNullValue(double_type)); 
            global_XMM2_Var->setThreadLocal(true); 
            global_XMM2_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
            global_XMM2_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
            XMMparam =Builder.CreateLoad(State.XMM2,paramIrName);
            MemoryCopyState.XMM2=global_XMM2_Var;
            MemoryCopyState.xmm2_flag=true;
            Builder.CreateStore(XMMparam,global_XMM2_Var);
          }
          break;
        }
        case 9:
        {
          if(State.xmm3_flag==true)
          {
            paramIrName = "xmm3"+paramIrName + std::to_string(XMMRegisterCount);
            llvm::Constant* global_XMM3_Const = module->getOrInsertGlobal("xmm3_global_var", double_type);
            llvm::GlobalVariable* global_XMM3_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_XMM3_Const);
            global_XMM3_Var->setInitializer(llvm::Constant::getNullValue(double_type));  
            global_XMM3_Var->setThreadLocal(true);
            global_XMM3_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
            global_XMM3_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
            XMMparam =Builder.CreateLoad(State.XMM3,paramIrName);
            MemoryCopyState.XMM3=global_XMM3_Var;
            MemoryCopyState.xmm3_flag=true;
            Builder.CreateStore(XMMparam,global_XMM3_Var);
          }
          break;
        }
        case 10:
        {
          if(State.xmm4_flag==true)
          {
            paramIrName = "xmm4"+paramIrName + std::to_string(XMMRegisterCount);
            llvm::Constant* global_XMM4_Const = module->getOrInsertGlobal("xmm4_global_var", double_type);
            llvm::GlobalVariable* global_XMM4_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_XMM4_Const);
            global_XMM4_Var->setInitializer(llvm::Constant::getNullValue(double_type));  
            global_XMM4_Var->setThreadLocal(true);
            global_XMM4_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
            global_XMM4_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
            XMMparam =Builder.CreateLoad(State.XMM4,paramIrName);
            MemoryCopyState.XMM4=global_XMM4_Var;
            MemoryCopyState.xmm4_flag=true;
            Builder.CreateStore(XMMparam,global_XMM4_Var);
          }
          break;
        }
        case 11:
        {
          if(State.xmm5_flag==true)
          {
            paramIrName = "xmm5"+paramIrName + std::to_string(XMMRegisterCount);
            llvm::Constant* global_XMM5_Const = module->getOrInsertGlobal("xmm5_global_var", double_type);
            llvm::GlobalVariable* global_XMM5_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_XMM5_Const);
            global_XMM5_Var->setInitializer(llvm::Constant::getNullValue(double_type));  
            global_XMM5_Var->setThreadLocal(true);
            global_XMM5_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
            global_XMM5_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
            XMMparam =Builder.CreateLoad(State.XMM5,paramIrName);
            MemoryCopyState.XMM5=global_XMM5_Var;
            MemoryCopyState.xmm5_flag=true;
            Builder.CreateStore(XMMparam,global_XMM5_Var);
          }
          break;
        }
        case 12:
        {
          if(State.xmm6_flag==true)
          {
            paramIrName = "xmm6"+paramIrName + std::to_string(XMMRegisterCount);
            llvm::Constant* global_XMM6_Const = module->getOrInsertGlobal("xmm6_global_var", double_type);
            llvm::GlobalVariable* global_XMM6_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_XMM6_Const);
            global_XMM6_Var->setInitializer(llvm::Constant::getNullValue(double_type));  
            global_XMM6_Var->setThreadLocal(true);
            global_XMM6_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
            global_XMM6_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
            XMMparam =Builder.CreateLoad(State.XMM6,paramIrName);
            MemoryCopyState.XMM6=global_XMM6_Var;
            MemoryCopyState.xmm6_flag=true;
            Builder.CreateStore(XMMparam,global_XMM6_Var);
          }
          break;
        }
        case 13:
        {
          if(State.xmm7_flag==true)
          {
            paramIrName = "xmm7"+paramIrName + std::to_string(XMMRegisterCount);
            llvm::Constant* global_XMM7_Const = module->getOrInsertGlobal("xmm7_global_var", double_type);
            llvm::GlobalVariable* global_XMM7_Var = llvm::dyn_cast<llvm::GlobalVariable>(global_XMM7_Const);
            global_XMM7_Var->setInitializer(llvm::Constant::getNullValue(double_type));  
            global_XMM7_Var->setThreadLocal(true);
            global_XMM7_Var->setThreadLocalMode(llvm::GlobalVariable::InitialExecTLSModel);
            global_XMM7_Var->setLinkage(llvm::GlobalVariable::LinkageTypes::PrivateLinkage);
            XMMparam =Builder.CreateLoad(State.XMM7,paramIrName);
            MemoryCopyState.XMM7=global_XMM7_Var;
            MemoryCopyState.xmm7_flag=true;
            Builder.CreateStore(XMMparam,global_XMM7_Var);
          }
          break;
        }
      
      }
    }
  }
  
  ///接受一个call ext_vfprintf
  ///在该指令前添加call sharelibary中对应函数的操作。
  void InsertCalltoShareBeforeFundvprintf(llvm::Instruction *callInst,int vprintf_flag){
    LLVMContext &Context = callInst->getContext();
    //errs() <<&callInst << "\n";
    BasicBlock *fb = callInst->getParent();
    llvm::Function* func = fb->getParent();
    llvm::Module* module = func->getParent();
    IRBuilder<> Builder(callInst);
    int normalRegisterCount=0;
    int XMMRegisterCount=6;
    Builder.SetInsertPoint(callInst);
    
    //vprintf原始定义
    //declare dso_local i32 @vprintf(i8*, %struct.__va_list_tag*) #1
    std::vector<llvm::Value *> asm_args;
    std::string paramIrName = "param";
    llvm::LoadInst *Normalparam;
    llvm::LoadInst *XMMparam;
    if(vprintf_flag==3)
    {
      paramIrName = "stdout"+paramIrName;
      Normalparam =Builder.CreateLoad(State.RDI,paramIrName);
      asm_args.push_back(Normalparam);
    }
    for (int i=0; i<14;i++)
    {
      switch(i)
      {
      case 0:
        if(State.rdi_flag==true)
        {
          paramIrName = "rdi"+paramIrName + std::to_string(i);
          Normalparam =Builder.CreateLoad(MemoryCopyState.RDI,paramIrName);
          asm_args.push_back(Normalparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getInt64Ty(Context)));
        }
        break;
      case 1:
        if(State.rsi_flag==true)
        {
          paramIrName = "rsi"+paramIrName + std::to_string(i);
          Normalparam =Builder.CreateLoad(MemoryCopyState.RSI,paramIrName);
          asm_args.push_back(Normalparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getInt64Ty(Context)));
        }
        break;
      case 2:
        if(State.rdx_flag==true)
        {
          paramIrName = "rdx"+paramIrName + std::to_string(i);          
          Normalparam =Builder.CreateLoad(MemoryCopyState.RDX,paramIrName);
          asm_args.push_back(Normalparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getInt64Ty(Context)));
        }
        break;
      case 3:
        if(State.rcx_flag==true)
        {
          paramIrName = "rcx"+paramIrName + std::to_string(i);
          Normalparam =Builder.CreateLoad(MemoryCopyState.RCX,paramIrName);
          asm_args.push_back(Normalparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getInt64Ty(Context)));
        }
        break;
      case 4:
        if(State.r8_flag==true)
        {
          paramIrName = "r8"+paramIrName + std::to_string(i);
          Normalparam =Builder.CreateLoad(MemoryCopyState.R8,paramIrName);
          asm_args.push_back(Normalparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getInt64Ty(Context)));
        }
        break;
      case 5:
        if(State.r9_flag==true)
        {
          paramIrName = "r9"+paramIrName + std::to_string(i);
          Normalparam =Builder.CreateLoad(MemoryCopyState.R9,paramIrName);
          asm_args.push_back(Normalparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getInt64Ty(Context)));
        }
        break;
      case 6:
        if(State.xmm0_flag==true)
        {
          paramIrName = "xmm0"+paramIrName + std::to_string(i);
          XMMparam =Builder.CreateLoad(MemoryCopyState.XMM0,paramIrName);
          asm_args.push_back(XMMparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getDoubleTy(Context)));
        }
        break;
      case 7:
        if(State.xmm1_flag==true)
        {
          paramIrName = "xmm1"+paramIrName + std::to_string(i);
          XMMparam =Builder.CreateLoad(MemoryCopyState.XMM1,paramIrName);
          asm_args.push_back(XMMparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getDoubleTy(Context)));
        }
        break;
      case 8:
        if(State.xmm2_flag==true)
        {
          paramIrName = "xmm2"+paramIrName + std::to_string(i);
          XMMparam =Builder.CreateLoad(MemoryCopyState.XMM2,paramIrName);
          asm_args.push_back(XMMparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getDoubleTy(Context)));
        }
        break;
      case 9:
        if(State.xmm3_flag==true)
        {
          paramIrName = "xmm3"+paramIrName + std::to_string(i);
          XMMparam =Builder.CreateLoad(MemoryCopyState.XMM3,paramIrName);
          asm_args.push_back(XMMparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getDoubleTy(Context)));
        }
        break;
      case 10:
        if(State.xmm4_flag==true)
        {
          paramIrName = "xmm4"+paramIrName + std::to_string(i);
          XMMparam =Builder.CreateLoad(MemoryCopyState.XMM4,paramIrName);
          asm_args.push_back(XMMparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getDoubleTy(Context)));
        }
        break;
      case 11:
        if(State.xmm5_flag==true)
        {
          paramIrName = "xmm5"+paramIrName + std::to_string(i);
          XMMparam =Builder.CreateLoad(MemoryCopyState.XMM5,paramIrName);
          asm_args.push_back(XMMparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getDoubleTy(Context)));
        }
        break;
      case 12:
        if(State.xmm6_flag==true)
        {
          paramIrName = "xmm6"+paramIrName + std::to_string(i);
          XMMparam =Builder.CreateLoad(MemoryCopyState.XMM6,paramIrName);
          asm_args.push_back(XMMparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getDoubleTy(Context)));
        }
        break;
      case 13:
        if(State.xmm7_flag==true)
        {
          paramIrName = "xmm7"+paramIrName + std::to_string(i);
          XMMparam =Builder.CreateLoad(MemoryCopyState.XMM7,paramIrName);
          asm_args.push_back(XMMparam);
        }else{
          asm_args.push_back(llvm::Constant::getNullValue(llvm::Type::getDoubleTy(Context)));
        }
        break;
      }          
    }


    std::vector<llvm::Type*> asm_arg_types;
    for(auto& val : asm_args) {
    asm_arg_types.push_back(val->getType());
    }
    llvm::FunctionType *funcType = llvm::FunctionType::get(llvm::Type::getInt32Ty(Context), asm_arg_types, false); // Assuming your function returns void
    std::string funcName;

    switch (vprintf_flag)
    {
    case 1:
      funcName = "vprintf_mcsema";
      break;
    case 2:
      funcName = "vfprintf_mcsema";
      break;
    case 3:
      funcName = "vfprintf_inline_mcsema";
      break;
    case 4:
      funcName = "vsprintf_mcsema";
      break;
    case 5:
      funcName = "vsnprintf_mcsema";
      break;
    case 6:
      funcName = "vfscanf_mcsema";
      break;
    case 7:
      funcName = "vsscanf_mcsema";
      break;
    default:
      break;
    }
    llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, funcName, module); // Replace "functionName" with the actual function name
    llvm::Function* vprintf_share_func = module->getFunction(funcName);
    if(vprintf_flag==6)
    {
      errs() << *callInst<< "\n";
      errs() << "456456456"<< "\n";
    }
    auto call = Builder.CreateCall(vprintf_share_func, asm_args);

    //插入rsp的修改
    auto RSP_Stack_offset =Builder.CreateAdd(Builder.CreateLoad(State.RSP),llvm::ConstantInt::get(llvm::Type::getInt64Ty(Context),8));
    auto StoreRSP = Builder.CreateStore(RSP_Stack_offset,State.RSP);
    //将函数返回值写入RAX
    auto zext = Builder.CreateZExt(call, llvm::Type::getInt64Ty(Builder.getContext()), "zext");
    auto StoreRAX = Builder.CreateStore(zext,State.RAX);
    llvm::Instruction *call_next= callInst->getNextNonDebugInstruction();
    std::stack<llvm::Instruction*> instructionStack;
    for (User *U : callInst->users()) {
                            if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                            {
                              instructionStack.push(Inst);
                               /* for (unsigned round = 0; round < Inst->getNumOperands(); ++round) {
                                    auto operand = Inst->getOperand(round);
                                    auto operand_insert =callInst->getOperand(2);
                                    if(operand==callInst && num==2)
                                    {
                                      errs() << *operand<< "\n";
                                      Inst->setOperand(round,operand_insert);
                                    }
                                }*/
                            }
                      }
    //因为直接采用上面的循环方式遍历callInst的users会导致callInst的users发生变化，所以采用stack的方式，先把instruction的指针全取出来，再改
    while (!instructionStack.empty()) {
    llvm::Instruction* Inst = instructionStack.top();
    instructionStack.pop();

    for (unsigned round = 0; round < Inst->getNumOperands(); ++round) {
        auto operand = Inst->getOperand(round);
        auto operand_insert =callInst->getOperand(2);
        if(operand==callInst)
        {
          Inst->setOperand(round,operand_insert);
          break;
        }
    }   

    
  }
  callInst->eraseFromParent();

  }
};
}

char VprintfFormatReinterpret::ID = 0;

//这边是对pass的注册
// Register for opt
static RegisterPass<VprintfFormatReinterpret> X("vpfr", "VFPrintf Format Reinterpret Pass");

// Register for clang
/*static RegisterStandardPasses Y(PassManagerBuilder::EP_EarlyAsPossible,
  [](const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
    PM.add(new Hello());
  });*/