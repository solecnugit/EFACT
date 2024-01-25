#include <set>
#include <string>
#include <regex>
#include <stack>
#include <list>
#include <map>
#include <iostream>
#include <fstream>
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
// 这边写的是pass的具体功能
namespace
{

  typedef struct node
  {
    llvm::Instruction *ext_inst;
    std::string format = " ";
    std::string prased_decl = " ";
    std::list<std::string> param_list;
    int double_paramcount = 0;
  } extPrintfDetail;

  typedef struct state
  {
    bool flag = false;
    GlobalAlias *RDI;
    bool rdi_flag = false;
    GlobalAlias *RSI;
    bool rsi_flag = false;
    GlobalAlias *RDX;
    bool rdx_flag = false;
    GlobalAlias *RCX;
    bool rcx_flag = false;
    GlobalAlias *R8;
    bool r8_flag = false;
    GlobalAlias *R9;
    bool r9_flag = false;
    GlobalAlias *RAX;
    bool rax_flag = false;
    GlobalAlias *XMM0;
    bool xmm0_flag = false;
    GlobalAlias *XMM1;
    bool xmm1_flag = false;
    GlobalAlias *XMM2;
    bool xmm2_flag = false;
    GlobalAlias *XMM3;
    bool xmm3_flag = false;
    GlobalAlias *XMM4;
    bool xmm4_flag = false;
    GlobalAlias *XMM5;
    bool xmm5_flag = false;
    GlobalAlias *XMM6;
    bool xmm6_flag = false;
    GlobalAlias *XMM7;
    bool xmm7_flag = false;

    GlobalAlias *RSP;
    bool rsp_flag = false;

  } CurrentState;

  std::map<std::string, int> RegisterToNum_map = {
      {"RDI", 0},
      {"RSI", 1},
      {"RDX", 2},
      {"RCX", 3},
      {"R8", 4},
      {"R9", 5},
      {"XMM0", 6},
      {"XMM1", 7},
      {"XMM2", 8},
      {"XMM3", 9},
      {"XMM4", 10},
      {"XMM5", 11},
      {"XMM6", 12},
      {"XMM7", 13},
      {"RSP", 30},
      {"RAX", 31},
  };

  struct RdtscTransplanter : public ModulePass
  {
    static char ID;
    RdtscTransplanter() : ModulePass(ID) {}
    using BasicBlockListType = SymbolTableList<BasicBlock>;
    std::set<std::string> funcsToInst;
    // 将需要删除的指令都先存到一个栈里，最后再处理
    std::stack<llvm::Instruction *> backUpDeleteInstructionStack;
    // 将需要修改的指令都先存到一个栈里，等遍历完找到所有的之后再处理
    std::stack<llvm::Instruction *> backUpToBeChangedInstructionStack;
    // 保存待处理指令中，需要处理的operand的index
    std::stack<int> backUpToBeChangedOperandStack;
    // 保存待处理指令中，需要处理的offset字符串
    std::stack<std::string> backUpToBeChangedDexOffsetStringStack;
    // 保存待处理指令中，需要处理的offset的10进制数
    std::stack<int> backUpToBeChangedDexOffsetStack;
    llvm::CallInst *RdstcCallInst;
    llvm::GlobalVariable *gVar;
    // 存放最终识别到的
    std::list<extPrintfDetail> extPrintfList;
    CurrentState State;
    bool runOnModule(Module &M)
    {
      LLVMContext &Context = M.getContext();
      llvm::ArrayType *arrType = llvm::ArrayType::get(llvm::Type::getInt64Ty(Context), 2);
      llvm::Constant *zeroInit = llvm::ConstantAggregateZero::get(arrType);
      gVar = new llvm::GlobalVariable(M, arrType, false,
                                      llvm::GlobalValue::PrivateLinkage, zeroInit, "gVarName");
      // 读取有问题的offset的名字
      std::string filename = "extracted_bug_digits.txt";
      std::ifstream file(filename);

      if (!file.is_open())
      {
        std::cerr << "Error opening file: " << filename << std::endl;
        return 1;
      }
      // 将有问题的offset的名字存入map中
      std::map<std::string, int> numbersMap;
      std::string line;
      while (std::getline(file, line))
      {
        line = "data_" + line;
        numbersMap[line] = 1;
        errs() << "输出列表"
               << "\n";
        errs() << line << "\n";
      }

      file.close();

      // 遍历所有的全局变量，找到data_"errOffset"
      for (GlobalAlias &GA : M.aliases())
      {
        GlobalAlias *GLa = dyn_cast<GlobalAlias>(&GA);
        llvm::StringRef GLaName = GLa->getName();
        std::string glaName = GLaName.str();
        std::regex dataOffsetPattern("data_[0-9a-f]+");
        // 先匹配是不是我们要的data_offset的格式
        if (std::regex_match(glaName, dataOffsetPattern))
        {
          // 再匹配是不是出错的确切offset
          if (numbersMap.count(glaName) == 0)
          {
            continue;
          }
          // 进入这边就说明匹配到了，开始遍历该全局变量的users

          for (User *U : GLa->users())
          {
            // 逐个对offset的使用进行修改
            Instruction *Inst = dyn_cast<Instruction>(U);
            if (!Inst)
            {
              // 如果不是Instruction，则再遍历users，到instruction为止。如果遍历到顶层仍然不是指令，则不处理。
              for (User *U2 : U->users())
              {
                Instruction *Inst = dyn_cast<Instruction>(U2);
                if (!Inst)
                {
                  // 如果不是Instruction，则再遍历users，到instruction为止。如果遍历到顶层仍然不是指令，则不处理。
                  for (User *U3 : U->users())
                  {
                    Instruction *Inst = dyn_cast<Instruction>(U3);
                    if (!Inst)
                    {
                      continue;
                    }
                    else
                    {
                      int operandNumberL3 = -1;
                      for (Use &u : Inst->operands())
                      {
                        if (u.get() == U2)
                        {
                          operandNumberL3 = u.getOperandNo();
                          // operandNumber is the index of operand in user
                          break;
                        }
                      }
                      std::size_t x = glaName.find_first_of("_");
                      std::string offset = glaName.substr(x + 1, sizeof(glaName));
                      long long offset_int = std::stoll(offset, nullptr, 16);
                      backUpToBeChangedDexOffsetStringStack.push(offset);
                      backUpToBeChangedInstructionStack.push(Inst);
                      backUpToBeChangedOperandStack.push(operandNumberL3);
                      backUpToBeChangedDexOffsetStack.push(offset_int);
                      // ChangeOffsetToNumbers(Inst, offset_int, operandNumberL3);
                    }
                  }
                  // continue;
                }
                else
                {
                  int operandNumberL2 = -1;
                  for (Use &u : Inst->operands())
                  {
                    if (u.get() == U)
                    {
                      operandNumberL2 = u.getOperandNo();
                      // operandNumber is the index of operand in user
                      break;
                    }
                  }
                  // 开始对offset进行修改
                  std::size_t x = glaName.find_first_of("_");
                  std::string offset = glaName.substr(x + 1, sizeof(glaName));
                  long long offset_int = std::stoll(offset, nullptr, 16);
                  backUpToBeChangedDexOffsetStringStack.push(offset);
                  backUpToBeChangedInstructionStack.push(Inst);
                  backUpToBeChangedOperandStack.push(operandNumberL2);
                  backUpToBeChangedDexOffsetStack.push(offset_int);
                  // ChangeOffsetToNumbers(Inst, offset_int, operandNumberL2);
                }
                // continue;
              }
            }
            else
            {
              int operandNumberL1 = -1;
              for (Use &u : Inst->operands())
              {
                if (u.get() == GLa)
                {
                  operandNumberL1 = u.getOperandNo();
                  // operandNumber is the index of operand in user
                  break;
                }
              }
              //  开始对offset进行修改
              std::size_t x = glaName.find_first_of("_");
              std::string offset = glaName.substr(x + 1, sizeof(glaName));
              long long offset_int = std::stoll(offset, nullptr, 16);
              backUpToBeChangedDexOffsetStringStack.push(offset);
              backUpToBeChangedInstructionStack.push(Inst);
              backUpToBeChangedOperandStack.push(operandNumberL1);
              backUpToBeChangedDexOffsetStack.push(offset_int);
              // ChangeOffsetToNumbers(Inst, offset_int, operandNumberL1);
            }
          }
        }
      }
      std::string name;
      while (!backUpToBeChangedInstructionStack.empty())
      {
        llvm::Instruction *Inst = backUpToBeChangedInstructionStack.top();
        int operandNumber = backUpToBeChangedOperandStack.top();
        int offset_int = backUpToBeChangedDexOffsetStack.top();
        ChangeOffsetToNumbers(Inst, offset_int, operandNumber);
        backUpToBeChangedDexOffsetStack.pop();
        backUpToBeChangedOperandStack.pop();
        backUpToBeChangedInstructionStack.pop();
        
        name = "data_" +backUpToBeChangedDexOffsetStringStack.top();
        numbersMap[name] = 0;
        backUpToBeChangedDexOffsetStringStack.pop();
      }
      for (auto it = numbersMap.begin(); it != numbersMap.end(); it++)
      {
        if (it->second == 1)
        {
          errs() << "未处理的"
                 << "\n";
          errs() << it->first << "\n";
        }
      }

      while (!backUpDeleteInstructionStack.empty())
      {
        llvm::Instruction *Inst = backUpDeleteInstructionStack.top();
        Inst->eraseFromParent();
        backUpDeleteInstructionStack.pop();
      }

      return true;
    }

    void
    InailzeState(llvm::Instruction *callInst)
    {
      // 维护了一个表示当前全局寄存器状态的结构体State。
      // 先判断是否已经初始化，只需初始化一次。
      if (State.flag == false)
      {
        // 遍历所有的GlobalAlias，找到我们想要的。
        for (GlobalAlias &GA : callInst->getModule()->aliases())
        {
          GlobalAlias *GLa = dyn_cast<GlobalAlias>(&GA);
          llvm::StringRef GLaName = GLa->getName();
          std::string glaName = GLaName.str();
          // errs() << glaName<< "\n";
          // mcsema翻译后的ir中的寄存器变量格式为：@RDI_2296_1c91e98
          // 这边通过正则来确定该变量指代的是哪个寄存器
          std::size_t x = glaName.find_first_of("_");
          glaName = glaName.substr(0, x);
          // map可能出现匹配不到的情况，这边先count一下
          if (!RegisterToNum_map.count(glaName))
          {
            continue;
          }
          int num = RegisterToNum_map[glaName];

          // RSP做特殊处理，我们需要的是一个指向i64的IntegerType的@RSP
          if (num == 30)
          {
            if (GLa->getType()->getPointerElementType()->isIntegerTy())
            {
              llvm::Type *tt = GLa->getType()->getPointerElementType();
              llvm::IntegerType *intTT = dyn_cast<llvm::IntegerType>(tt);
              if (intTT->getBitWidth() == 64)
              {
                State.RSP = GLa;
                errs() << *GLa->getType() << "\n";
                State.rsp_flag = true;
              }
            }
          }
          // RAX也特殊处理，我们需要的是一个指向i64的IntegerType的@RAX
          if (num == 31)
          {
            if (GLa->getType()->getPointerElementType()->isIntegerTy())
            {
              llvm::Type *tt = GLa->getType()->getPointerElementType();
              llvm::IntegerType *intTT = dyn_cast<llvm::IntegerType>(tt);
              if (intTT->getBitWidth() == 64)
              {
                State.RAX = GLa;
                State.rax_flag = true;
              }
            }
          }

          if (num >= 0 && num <= 13)
          {
            // RSI~R8在此处理
            if (GLa->getType()->getPointerElementType()->isIntegerTy())
            {
              // errs() << GLa->getName()<< "\n";
              llvm::Type *tt = GLa->getType()->getPointerElementType();
              llvm::IntegerType *intTT = dyn_cast<llvm::IntegerType>(tt);
              if (intTT->getBitWidth() == 64)
              {
                switch (num)
                {
                case 0:
                  State.RDI = GLa;
                  State.rdi_flag = true;
                  break;
                case 1:
                  State.RSI = GLa;
                  State.rsi_flag = true;
                  break;
                case 2:
                  State.RDX = GLa;
                  State.rdx_flag = true;
                  break;
                case 3:
                  State.RCX = GLa;
                  State.rcx_flag = true;
                  break;
                case 4:
                  State.R8 = GLa;
                  State.r8_flag = true;
                  break;
                case 5:
                  State.R9 = GLa;
                  State.r9_flag = true;
                  break;

                default:
                  break;
                }
              }
            }
            // XMM0~XMM7在此处理
            else if (GLa->getType()->getPointerElementType()->isDoubleTy())
            {
              llvm::Type *tt = GLa->getType()->getPointerElementType();
              std::string Name = GLaName.str();
              // 因为XMM0基础存器在mcsema的表示中可能存在如下情况：
              //@XMM0_16_1c91da8 = private thread_local(initialexec) alias double,
              //@XMM0_24_1c91da8 = private thread_local(initialexec) alias double,
              // 上述两个GLA都是double类型，无法直接通过llvm type判断，
              // 区别在函数名中的“16”和“24”所表示的寄存器位数中，我们需要的是16位的，故这边再做一层正则匹配。
              Name = Name.substr(x + 1, sizeof(Name));
              std::size_t x2 = Name.find_first_of("_");
              std::string width = GLaName.str().substr(x + 1, x2);
              int width_int = std::stoi(width);

              // Check the condition
              // 这边是新的解决上面的16，24的方法。深入调研发现，如果中间的数字-16能够被64整除，则取的是XMM*寄存器的前64位，而double类型这前64位就够用了。
              bool continue_flag = false;
              if ((width_int - 16) % 64 == 0)
              {
                continue_flag = true;
              }
              else
              {
                continue;
              }

              if (continue_flag == true)
              {
                switch (num)
                {
                case 6:
                  State.XMM0 = GLa;
                  State.xmm0_flag = true;
                  break;
                case 7:
                  State.XMM1 = GLa;
                  State.xmm1_flag = true;
                  break;
                case 8:
                  State.XMM2 = GLa;
                  State.xmm2_flag = true;
                  break;
                case 9:
                  State.XMM3 = GLa;
                  State.xmm3_flag = true;
                  break;
                case 10:
                  State.XMM4 = GLa;
                  State.xmm4_flag = true;
                  break;
                case 11:
                  State.XMM5 = GLa;
                  State.xmm5_flag = true;
                  break;
                case 12:
                  State.XMM6 = GLa;
                  State.xmm6_flag = true;
                  break;
                case 13:
                  State.XMM7 = GLa;
                  State.xmm7_flag = true;
                  break;

                default:
                  break;
                }
              }
            }
            else
            {
              continue;
            }
          }
        }
        State.flag = true;
      }
    }

    /// 接受一个对data_ErrorOffset的操作指令
    /// 将对data_ErrorOffset的使用修改成相对于offset的立即数
    void ChangeOffsetToNumbers(llvm::Instruction *callInst, long long DecNumber, int OperandNumber)
    {
      LLVMContext &Context = callInst->getContext();
      IRBuilder<> Builder(callInst);

      if (llvm::GetElementPtrInst *GEP = llvm::dyn_cast<llvm::GetElementPtrInst>(callInst))
      {
        // 如果是GEP类型，则做特殊处理。
        llvm::Instruction *PreInst = GEP->getPrevNonDebugInstruction();
        while (PreInst->getOpcode() != llvm::Instruction::Add)
        {
          PreInst = PreInst->getPrevNonDebugInstruction();
        }
        // 找到最前面的一个add指令的引用，该指令是我们需要的。
        llvm::Instruction *PreAddInst = PreInst;
        // errs() << *PreAddInst << "\n";
        backUpDeleteInstructionStack.push(callInst->getPrevNonDebugInstruction());
        backUpDeleteInstructionStack.push(callInst);

        llvm::Instruction *NextInst = callInst->getNextNonDebugInstruction();
        while (NextInst->getOpcode() != llvm::Instruction::Store)
        {
          backUpDeleteInstructionStack.push(NextInst);
          NextInst = NextInst->getNextNonDebugInstruction();
        }
        // 找到后面的第一个store指令的引用，该指令是我们需要的。
        llvm::Instruction *NextStoreInst = NextInst;
        Builder.SetInsertPoint(callInst);
        // Create the inttoptr instruction
        llvm::Value *IntToPtrInst = Builder.CreateIntToPtr(PreAddInst, llvm::PointerType::getUnqual(Builder.getDoubleTy()));
        //  重置store指令的第二个操作数为inttoptr指令
        NextStoreInst->setOperand(1, IntToPtrInst);
      }
      else
      {
        llvm::Type *operandType = callInst->getOperand(OperandNumber)->getType();
        llvm::Value *DecValue;
        DecValue = llvm::ConstantInt::get(operandType, DecNumber, true);
        callInst->setOperand(OperandNumber, DecValue);

      }
    }
  };
}

char RdtscTransplanter::ID = 0;

// 这边是对pass的注册
//  Register for opt
static RegisterPass<RdtscTransplanter> X("ChangeErrorOffset", "data_errorOffset change Pass");

// Register for clang
/*static RegisterStandardPasses Y(PassManagerBuilder::EP_EarlyAsPossible,
  [](const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
    PM.add(new Hello());
  });*/