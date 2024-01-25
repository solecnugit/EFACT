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

    

  struct RdtscTransplanter : public ModulePass {
    static char ID;
    RdtscTransplanter() : ModulePass(ID) {} 
    using BasicBlockListType = SymbolTableList<BasicBlock>;
    std::set<std::string> funcsToInst;
    //由于一个基本块里面可能有多个待匹配的指令，故采用栈的方式，取时间顺序上最近的一次。
    std::stack<llvm::Instruction*> backUpInstructionStack;
    llvm::CallInst *RdstcCallInst;
    llvm::GlobalVariable* gVar;
    //存放最终识别到的
    std::list<extPrintfDetail> extPrintfList;
    CurrentState State;
    llvm::Function *printfFunc;
    bool runOnModule(Module &M) {
                LLVMContext &Context = M.getContext();
                llvm::ArrayType* arrType = llvm::ArrayType::get(llvm::Type::getInt64Ty(Context), 2);
                llvm::Constant* zeroInit = llvm::ConstantAggregateZero::get(arrType);
                gVar = new llvm::GlobalVariable(M, arrType, false, 
                                  llvm::GlobalValue::PrivateLinkage,zeroInit, "gVarName");
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
                    std::regex rdtsc_pattern("^__remill_rdtsc$");
                    std::regex rdtscp_pattern("^__remill_rdtscp$");
                    std::regex rdi_pattern("RDI_[0-9a-z]*_[0-9a-z]*");
                    std::regex register_pattern("[A-Z0-9]*_[0-9a-z]*_[0-9a-z]*");
                    std::regex data_pattern("data_[0-9a-z]*");
                    std::regex printf_pattern("printf");

                    //查找待匹配函数
                    if (std::regex_match(fname,rdtsc_pattern)) {
                        //遍历该函数的users
                        for (User *U : f.users()) {
                            if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                            {
                                Instruction *Selection_Inst =Inst;
                                //先把State初始化一下
                                InailzeState(Selection_Inst);
                                //找到了rdtsc,开始对rdtsc进行修改
                                InsertCalltoShareBeforeFundRdtsc(Inst,1,nullptr);

                                
                            }
                        }
                    }

                }
                //遍历Module中的函数列表，找到想要处理的函数
                for (Module::iterator mi = M.begin(); mi != M.end(); ++mi) {
                    Function &f = *mi;
                    std::string fname=f.getName().str();
                    //不同函数的正则匹配规则
                    std::regex rdtsc_pattern("^__remill_rdtsc$");
                    std::regex rdtscp_pattern("^__remill_rdtscp$");
                    std::regex rdi_pattern("RDI_[0-9a-z]*_[0-9a-z]*");
                    std::regex register_pattern("[A-Z0-9]*_[0-9a-z]*_[0-9a-z]*");
                    std::regex data_pattern("data_[0-9a-z]*");
                    std::regex printf_pattern("printf");

                    //查找待匹配函数
                    if(std::regex_match(fname,rdtscp_pattern))
                    {
                        //遍历该函数的users
                        for (User *U : f.users()) {
                            if (Instruction *Inst = dyn_cast<Instruction>(U)) 
                            {
                                Instruction *Selection_Inst =Inst;
                                //找到了rdtscp,开始对rdtscp进行修改
                                llvm::Function *RdtscFunc;
                                for (Module::iterator mi = M.begin(); mi != M.end(); ++mi) {
                                  Function &f = *mi;
                                  std::regex rdtscMcsemaPattern("rdtsc_mcsema");
                                  std::string fname=f.getName().str();
                                  if (std::regex_match(fname,rdtscMcsemaPattern)) {
                                      RdtscFunc=&f;
                                      break;
                                    }
                                }
                                errs() << *RdtscFunc<< "\n";
                                InsertCalltoShareBeforeFundRdtsc(Inst,2,RdtscFunc);

                                
                            }
                        }

                    }

                }
                return true;
    }



 

 

  


  void InailzeState(llvm::Instruction *callInst) {
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
                errs() << *GLa->getType()<< "\n";
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

    
  }


  ///接受一个call __remill_rdtsc/p
  ///在该指令前添加call sharelibary中对应函数的操作。
  //其中，rdtsc_falg=1表示rdtsc，rdtsc_flag=2表示rdtscp
  void InsertCalltoShareBeforeFundRdtsc(llvm::Instruction *callInst,int rdtsc_flag,llvm::Function *RdtscFunc){
    LLVMContext &Context = callInst->getContext();
    //errs() <<&callInst << "\n";
    BasicBlock *fb = callInst->getParent();
    llvm::Function* func = fb->getParent();
    llvm::Module* module = func->getParent();
    IRBuilder<> Builder(callInst);
    Builder.SetInsertPoint(callInst);
    
    //rdtsc原始定义
    //declare i64 @llvm.x86.rdtsc() #1
    std::vector<llvm::Value *> asm_args;
    std::string paramIrName = "param";



    std::vector<llvm::Type*> asm_arg_types;
    for(auto& val : asm_args) {
    asm_arg_types.push_back(val->getType());
    }
    llvm::FunctionType *funcType;

    std::string funcName;
    llvm::Type *ListReturnType;
    llvm::ArrayType* ArrayReturnType;
    llvm::Value *RdtscItemPtr;
    llvm::Value *RdtscSecondItem;
    llvm::Value* zero = llvm::ConstantInt::get(llvm::Type::getInt64Ty(Context), 0);
    llvm::Value* one = llvm::ConstantInt::get(llvm::Type::getInt64Ty(Context), 1);
    std::vector<llvm::Value*> indices = {zero, one}; // indices to access the second element
    switch (rdtsc_flag)
    {
    case 1:
      funcName = "rdtsc_mcsema";
      ArrayReturnType = llvm::ArrayType::get(llvm::Type::getInt64Ty(Context), 2);
      
      RdtscItemPtr = Builder.CreateGEP(gVar, indices);  // get pointer to the second item
      errs() << *RdtscItemPtr<< "\n";
      RdtscSecondItem = Builder.CreateLoad(RdtscItemPtr);  // load the second item
      errs() << *RdtscSecondItem<< "\n";
      asm_args.push_back(RdtscSecondItem);
      asm_arg_types.push_back(llvm::Type::getInt64Ty(Context));


      funcType = llvm::FunctionType::get(ArrayReturnType, asm_arg_types, false); // Assuming your function returns i64
      
      
      break;
    case 2:
      funcName = "rdtscp_mcsema";
      ListReturnType = llvm::PointerType::get(llvm::Type::getInt64Ty(Context), 0);
      //secondItem = Builder.CreateExtractValue(RdstcCallInst, 1);
      //errs() << *secondItem<< "\n";
      
      RdtscItemPtr = Builder.CreateGEP(gVar, indices);  // get pointer to the second item
      errs() << *RdtscItemPtr<< "\n";
      RdtscSecondItem = Builder.CreateLoad(RdtscItemPtr);  // load the second item
      errs() << *RdtscSecondItem<< "\n";
      asm_args.push_back(RdtscSecondItem);
      asm_arg_types.push_back(llvm::Type::getInt64Ty(Context));
      funcType = llvm::FunctionType::get(ListReturnType, asm_arg_types, false);
      break;
    default:
      break;
    }
    llvm::Function::Create(funcType, llvm::Function::ExternalLinkage, funcName, module); // Replace "functionName" with the actual function name
    llvm::Function* rdtsc_share_func = module->getFunction(funcName);

    auto call = Builder.CreateCall(rdtsc_share_func, asm_args);
    if (rdtsc_flag==1)
    {
       errs() << *Builder.CreateStore(call, gVar)<< "\n";
      
    }
    errs() << *call<< "\n";

    //接下来生成返回值分别插入寄存器的操作，因为rdtsc只需要处理一个64位的数据，而rdtscp即需要处理一个64位数据，又需要处理一个32位的数据，故rdtscp的返回值是一个list，
    //这两种需要分开单独处理。
    llvm::Value *lower32bits;
    llvm::Value *higher32bits;
    llvm::Value *higher64bits;
    llvm::Value *lower64bits;
    llvm::Value *RdtscFirstItem;
    llvm::Value *RdtscSecondItemPtr;
    llvm::Value *RdtscpFirstItem;
    llvm::Value *RdtscpSecondItemPtr;
    llvm::Value *RdtscpSecondItem;
    llvm::Value *extendedSecondItem;
    llvm::Value* firstItemPtr;
    switch (rdtsc_flag)
    {
    case 1:
      //先处理rdtsc，需要将64位的返回值的高32位存入EDX，低32位存入EAX。
      //这边的测试机老X86和ampere都是小端模式，故不用考虑转置的问题
      zero = llvm::ConstantInt::get(llvm::Type::getInt32Ty(Context), 0); // Use i32 for GEP indices
      indices = {zero, zero};
      errs() << "22222222222233333333333"<< "\n";
      firstItemPtr = Builder.CreateGEP(gVar, indices);
      errs() << "22222222222233333333333"<< "\n";
      errs() << *firstItemPtr<< "\n";
      // Now load the first item
      RdtscFirstItem = Builder.CreateLoad(firstItemPtr);
      
      //RdtscFirstItem = Builder.CreateLoad(llvm::Type::getInt64Ty(Context), call);
      errs() << *RdtscFirstItem<< "\n";
      lower32bits = Builder.CreateTrunc(RdtscFirstItem, Type::getInt32Ty(Context), "lower32");
      errs() << *lower32bits<< "\n";
      higher32bits = Builder.CreateLShr(RdtscFirstItem, 32, "shifthigh");
      errs() << *higher32bits<< "\n";
      higher32bits = Builder.CreateTrunc(higher32bits, Type::getInt32Ty(Context), "higher32");
      errs() << *higher32bits<< "\n";
      higher64bits = Builder.CreateZExt(higher32bits, llvm::Type::getInt64Ty(Context), "higher64");
      errs() << *higher64bits<< "\n";
      lower64bits = Builder.CreateZExt(lower32bits, llvm::Type::getInt64Ty(Context), "lower64");
      errs() << *lower64bits<< "\n";
      errs() << *Builder.CreateStore(lower64bits, State.RAX)<< "\n";
      //Builder.CreateStore(lower64bits, State.RAX);
      errs() << *Builder.CreateStore(higher64bits, State.RDX)<< "\n";
      //Builder.CreateStore(higher64bits, State.RDX);
      break;
    case 2:
      //再处理rdtscp，需要将64位的返回值的高32位存入EDX，低32位存入EAX,并将IA32_TSC_AUX MSR读到ECX中。
      //和rdtsc不同，rdtscp的helper function返回的是一个list，0位置上放的是64bit的time cycle,1为上放的是 MPIDR_EL1得到的值（In a multiprocessor system, provides an additional PE identification mechanism for scheduling purposes.）
      //这边的测试机老X86和ampere都是小端模式，故不用考虑转置的问题
      RdtscpFirstItem = Builder.CreateLoad(llvm::Type::getInt64Ty(Context), call);
      errs() << *RdtscpFirstItem<< "\n";
      lower32bits = Builder.CreateTrunc(RdtscpFirstItem, Type::getInt32Ty(Context), "lower32");
      errs() << *lower32bits<< "\n";
      higher32bits = Builder.CreateLShr(RdtscpFirstItem, 32, "shifthigh");
      errs() << *higher32bits<< "\n";
      higher32bits = Builder.CreateTrunc(higher32bits, Type::getInt32Ty(Context), "higher32");
      errs() << *higher32bits<< "\n";
      higher64bits = Builder.CreateZExt(higher32bits, llvm::Type::getInt64Ty(Context), "higher64");
      errs() << *higher64bits<< "\n";
      lower64bits = Builder.CreateZExt(lower32bits, llvm::Type::getInt64Ty(Context), "lower64");
      errs() << *lower64bits<< "\n";
      errs() << *Builder.CreateStore(lower64bits, State.RAX)<< "\n";
      errs() << *Builder.CreateStore(higher64bits, State.RDX)<< "\n";
      //Builder.CreateStore(lower64bits, State.RAX);
      //Builder.CreateStore(higher64bits, State.RDX);
      RdtscpSecondItemPtr = Builder.CreateGEP(call, llvm::ConstantInt::get(llvm::Type::getInt64Ty(Context), 2));  // GEP with i64 offset.
      errs() << *RdtscpSecondItemPtr<< "\n";
      RdtscpSecondItem = Builder.CreateLoad(llvm::Type::getInt64Ty(Context), RdtscpSecondItemPtr);
      errs() << *RdtscpSecondItem<< "\n";
      extendedSecondItem = Builder.CreateZExt(RdtscpSecondItem, llvm::Type::getInt64Ty(Context), "extendedSecondItem");
      errs() << *extendedSecondItem<< "\n";
      errs() << *Builder.CreateStore(extendedSecondItem, State.RCX)<< "\n";
      //Builder.CreateStore(extendedSecondItem, State.RCX);
      break;

    default:
      break;
    }




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
    //rdtsc和rdtscp的对应调用语句如下，他的user仅为一条store语句，且该store语句也并没有被其他指令所调用，故这边直接将该user删除即可
    //%call.i = call %struct.Memory* @__remill_rdtscp(%struct.State* nonnull align 16 dereferenceable(3376) @__mcsema_reg_state, %struct.Memory* %40, i32 260) #15
    //store volatile %struct.Memory* %call.i, %struct.Memory** %MEMORY, align 8   
    Inst->eraseFromParent();
    }
  callInst->eraseFromParent();
  }

  };
}


char RdtscTransplanter::ID = 0;

//这边是对pass的注册
// Register for opt
static RegisterPass<RdtscTransplanter> X("rdtsc", "rdtsc transplant Pass");

// Register for clang
/*static RegisterStandardPasses Y(PassManagerBuilder::EP_EarlyAsPossible,
  [](const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
    PM.add(new Hello());
  });*/