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
      std::string filename = "MustBeExternalWeakSymbols.txt";
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
        numbersMap[line] = 1;
        errs() << "输出列表"
               << "\n";
        errs() << line << "\n";
      }

      file.close();

      // 遍历所有的函数，找到所有链接属性为external_weak的函数
      for (Module::iterator mi = M.begin(); mi != M.end(); ++mi)
      {
        Function &f = *mi;
        if (f.getLinkage() == llvm::GlobalValue::ExternalWeakLinkage)
        {
          if (numbersMap.count(f.getName().str()) == 0)
          {
            f.setLinkage(llvm::GlobalValue::ExternalLinkage);
            errs() << "输出修改函数"
                 << "\n";
                 errs() << f.getName() << "\n";
          }
          // Change the linkage type to external
          //f.setLinkage(llvm::GlobalValue::ExternalLinkage);

        }
      }


      return true;
    }


  };
}

char RdtscTransplanter::ID = 0;

// 这边是对pass的注册
//  Register for opt
static RegisterPass<RdtscTransplanter> X("CheckLinker", "Function Linker type check Pass");

