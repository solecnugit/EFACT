; ModuleID = 't.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu-elf"

%struct.State = type { %struct.ArchState, [32 x %union.VectorReg], %struct.ArithFlags, %union.anon, %struct.Segments, %struct.AddressSpace, %struct.GPR, %struct.X87Stack, %struct.MMX, %struct.FPUStatusFlags, %union.anon, %union.FPU, %struct.SegmentCaches }
%struct.ArchState = type { i32, i32, %union.anon }
%union.VectorReg = type { %union.vec512_t }
%union.vec512_t = type { %struct.uint64v8_t }
%struct.uint64v8_t = type { [8 x i64] }
%struct.ArithFlags = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.Segments = type { i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector }
%union.SegmentSelector = type { i16 }
%struct.AddressSpace = type { i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg }
%struct.Reg = type { %union.anon }
%struct.GPR = type { i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg }
%struct.X87Stack = type { [8 x %struct.anon.3] }
%struct.anon.3 = type { [6 x i8], %struct.float80_t }
%struct.float80_t = type { [10 x i8] }
%struct.MMX = type { [8 x %struct.anon.4] }
%struct.anon.4 = type { i64, %union.vec64_t }
%union.vec64_t = type { %struct.uint64v1_t }
%struct.uint64v1_t = type { [1 x i64] }
%struct.FPUStatusFlags = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [4 x i8] }
%union.anon = type { i64 }
%union.FPU = type { %struct.anon.13 }
%struct.anon.13 = type { %struct.FpuFXSAVE, [96 x i8] }
%struct.FpuFXSAVE = type { %union.SegmentSelector, %union.SegmentSelector, %union.FPUAbridgedTagWord, i8, i16, i32, %union.SegmentSelector, i16, i32, %union.SegmentSelector, i16, %union.FPUControlStatus, %union.FPUControlStatus, [8 x %struct.FPUStackElem], [16 x %union.vec128_t] }
%union.FPUAbridgedTagWord = type { i8 }
%union.FPUControlStatus = type { i32 }
%struct.FPUStackElem = type { %union.anon.11, [6 x i8] }
%union.anon.11 = type { %struct.float80_t }
%union.vec128_t = type { %struct.uint128v1_t }
%struct.uint128v1_t = type { [1 x i128] }
%struct.SegmentCaches = type { %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow }
%struct.SegmentShadow = type { %union.anon, i32, i32 }
%seg_400000_LOAD_bc0_type = type <{ [8 x i8], [8 x i8], [8 x i8], i8*, [4 x i8], [4 x i8], [4 x i8], [8 x i8], [24 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], i8*, [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], i8*, [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], i8*, [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], i8*, [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [8 x i8], [40 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], i8*, [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [28 x i8], [4 x i8], [28 x i8], [4 x i8], [52 x i8], [4 x i8], [8 x i8], [8 x i8], [24 x i8], [4 x i8], [28 x i8], [24 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [8 x i8], [16 x i8], [12 x i8], [12 x i8], [12 x i8], [12 x i8], [12 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [12 x i8], [12 x i8], [12 x i8], [844 x i8], [4 x i8], [28 x i8], [4 x i8], [60 x i8], [4 x i8], [12 x i8], [4 x i8], [28 x i8], [4 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8], [4 x i8], [4 x i8], [8 x i8], [8 x i8] }>
%seg_401000__init_1b_type = type <{ [27 x i8], [5 x i8], [304 x i8], [24 x i8], [4 x i8], [20 x i8], [4 x i8], [72 x i8], [4 x i8], [56 x i8], [4 x i8], [36 x i8], [4 x i8], [20 x i8], [4 x i8], [44 x i8], [4 x i8], [16 x i8], [4 x i8], [140 x i8], [4 x i8], [60 x i8], [4 x i8], [152 x i8], [4 x i8], [48 x i8], [4 x i8], [176 x i8], [4 x i8], [164 x i8], [4 x i8], [12 x i8], [4 x i8], [28 x i8], [4 x i8], [63 x i8], [1 x i8], [13 x i8] }>
%seg_402000__rodata_1a_type = type <{ [8 x i8], [1 x i8], [16 x i8], [1 x i8], [2 x i8], [100 x i8], [4 x i8], [4 x i8], [52 x i8], [4 x i8], [36 x i8], [4 x i8], [196 x i8], [4 x i8], [104 x i8], [4 x i8], [44 x i8], [4 x i8] }>
%seg_403dd8__init_array_18_type = type <{ i8*, i8*, i8*, [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [12 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [4 x i8], [100 x i8], i8*, i8*, [4 x i8], [20 x i8], i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, [16 x i8], [8 x i8], [280 x i8], [1 x i8] }>
%struct.Memory = type opaque

@__mcsema_reg_state = thread_local(initialexec) global %struct.State zeroinitializer
@__mcsema_stack = internal thread_local(initialexec) global [1048576 x i8] zeroinitializer
@0 = internal global i1 false
@_ZSt4cout = external global i8, align 64
@__mcsema_all_segments = internal global <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }> <{ %seg_400000_LOAD_bc0_type <{ [8 x i8] c"\7FELF\02\01\01\00", [8 x i8] zeroinitializer, [8 x i8] c"\02\00>\00\01\00\00\00", i8* bitcast (void ()* @_start to i8*), [4 x i8] c"@\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\D8A\00\00", [8 x i8] zeroinitializer, [24 x i8] c"@\008\00\0D\00@\00\1F\00\1E\00\06\00\00\00\04\00\00\00@\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"@\00@\00", [4 x i8] zeroinitializer, [4 x i8] c"@\00@\00", [4 x i8] zeroinitializer, [4 x i8] c"\D8\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\D8\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\08\00\00\00", [4 x i8] zeroinitializer, [12 x i8] c"\03\00\00\00\04\00\00\00\18\03\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\18\03@\00", [4 x i8] zeroinitializer, [4 x i8] c"\18\03@\00", [4 x i8] zeroinitializer, [4 x i8] c"\1C\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\1C\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\01\00\00\00", [4 x i8] zeroinitializer, [8 x i8] c"\01\00\00\00\04\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"\00\00@\00", [4 x i8] zeroinitializer, [4 x i8] c"\00\00@\00", [4 x i8] zeroinitializer, [4 x i8] c"\C0\0B\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\C0\0B\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\00\10\00\00", [4 x i8] zeroinitializer, [12 x i8] c"\01\00\00\00\05\00\00\00\00\10\00\00", [4 x i8] zeroinitializer, i8* bitcast (void ()* @.init_proc to i8*), [4 x i8] c"\00\10@\00", [4 x i8] zeroinitializer, [4 x i8] c"\09\06\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\09\06\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\00\10\00\00", [4 x i8] zeroinitializer, [12 x i8] c"\01\00\00\00\04\00\00\00\00 \00\00", [4 x i8] zeroinitializer, i8* @data_402000, [4 x i8] c"\00 @\00", [4 x i8] zeroinitializer, [4 x i8] c"L\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"L\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\00\10\00\00", [4 x i8] zeroinitializer, [12 x i8] c"\01\00\00\00\06\00\00\00\D8-\00\00", [4 x i8] zeroinitializer, i8* bitcast (i8** @data_403dd8 to i8*), [4 x i8] c"\D8=@\00", [4 x i8] zeroinitializer, [4 x i8] c"\E0\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\00\04\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\00\10\00\00", [4 x i8] zeroinitializer, [12 x i8] c"\02\00\00\00\06\00\00\00\F0-\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\F0=@\00", [4 x i8] zeroinitializer, [4 x i8] c"\F0=@\00", [4 x i8] zeroinitializer, [4 x i8] c"\00\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\00\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\08\00\00\00", [4 x i8] zeroinitializer, [12 x i8] c"\04\00\00\00\04\00\00\008\03\00\00", [4 x i8] zeroinitializer, [4 x i8] c"8\03@\00", [4 x i8] zeroinitializer, [4 x i8] c"8\03@\00", [4 x i8] zeroinitializer, [4 x i8] c" \00\00\00", [4 x i8] zeroinitializer, [4 x i8] c" \00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\08\00\00\00", [4 x i8] zeroinitializer, [12 x i8] c"\04\00\00\00\04\00\00\00X\03\00\00", [4 x i8] zeroinitializer, [4 x i8] c"X\03@\00", [4 x i8] zeroinitializer, [4 x i8] c"X\03@\00", [4 x i8] zeroinitializer, [4 x i8] c"D\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"D\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\04\00\00\00", [4 x i8] zeroinitializer, [12 x i8] c"S\E5td\04\00\00\008\03\00\00", [4 x i8] zeroinitializer, [4 x i8] c"8\03@\00", [4 x i8] zeroinitializer, [4 x i8] c"8\03@\00", [4 x i8] zeroinitializer, [4 x i8] c" \00\00\00", [4 x i8] zeroinitializer, [4 x i8] c" \00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\08\00\00\00", [4 x i8] zeroinitializer, [12 x i8] c"P\E5td\04\00\00\00\1C \00\00", [4 x i8] zeroinitializer, i8* @data_40201c, [4 x i8] c"\1C @\00", [4 x i8] zeroinitializer, [4 x i8] c"d\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"d\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\04\00\00\00", [4 x i8] zeroinitializer, [8 x i8] c"Q\E5td\06\00\00\00", [40 x i8] zeroinitializer, [4 x i8] c"\10\00\00\00", [4 x i8] zeroinitializer, [12 x i8] c"R\E5td\04\00\00\00\D8-\00\00", [4 x i8] zeroinitializer, i8* bitcast (i8** @data_403dd8 to i8*), [4 x i8] c"\D8=@\00", [4 x i8] zeroinitializer, [4 x i8] c"(\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"(\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\01\00\00\00", [4 x i8] zeroinitializer, [28 x i8] c"/lib64/ld-linux-x86-64.so.2\00", [4 x i8] zeroinitializer, [28 x i8] c"\04\00\00\00\10\00\00\00\05\00\00\00GNU\00\02\80\00\C0\04\00\00\00\01\00\00\00", [4 x i8] zeroinitializer, [52 x i8] c"\04\00\00\00\14\00\00\00\03\00\00\00GNU\00:\CCU\00\04ss|\9F\E1\12O\9B\01\D1\E7\98\9B\9F\93\04\00\00\00\10\00\00\00\01\00\00\00GNU\00", [4 x i8] zeroinitializer, [8 x i8] c"\03\00\00\00\02\00\00\00", [8 x i8] zeroinitializer, [24 x i8] c"\03\00\00\00\11\00\00\00\01\00\00\00\06\00\00\00\00\00\10\00!\01\10\09", [4 x i8] zeroinitializer, [28 x i8] c"\11\00\00\00\12\00\00\00!\FD\F4\09\E4\DE\93\1C\14\98\0CCxIk\B6)E\D5L", [24 x i8] zeroinitializer, [8 x i8] c"\CA\02\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\BA\01\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\0C\01\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\11\02\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\A4\02\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\B6\02\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"`\00\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\87\01\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\C4\00\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c".\01\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"U\02\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\F9\01\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\8B\02\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\AD\01\00\00\12\00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\10\00\00\00 \00\00\00", [16 x i8] zeroinitializer, [8 x i8] c"\1F\00\00\00\12\00\00\00", [16 x i8] zeroinitializer, [12 x i8] c"\D1\00\00\00\12\00\00\00P\10@\00", [12 x i8] zeroinitializer, [12 x i8] c"\C3\02\00\00\12\00\00\00\80\10@\00", [12 x i8] zeroinitializer, [12 x i8] c"K\02\00\00\11\00\1A\00\C0@@\00", [4 x i8] zeroinitializer, [4 x i8] c"\10\01\00\00", [4 x i8] zeroinitializer, [12 x i8] c"\98\01\00\00\12\00\00\00\00\11@\00", [12 x i8] zeroinitializer, [12 x i8] c"o\01\00\00\12\00\00\00@\11@\00", [12 x i8] zeroinitializer, [844 x i8] c"\00libstdc++.so.6\00__gmon_start__\00_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc\00_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE\00_ZNSaIcED1Ev\00_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_\00_ZSt24__throw_invalid_argumentPKc\00_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_\00_ZNSt8ios_base4InitD1Ev\00_ZNSolsEPFRSoS_E\00__gxx_personality_v0\00_ZNSaIcEC1Ev\00_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv\00_ZNSt8ios_base4InitC1Ev\00_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev\00_ZSt4cout\00_ZSt20__throw_out_of_rangePKc\00libm.so.6\00libgcc_s.so.1\00_Unwind_Resume\00libc.so.6\00__libc_start_main\00__cxa_atexit\00strtod\00__errno_location\00GCC_3.0\00CXXABI_1.3\00GLIBCXX_3.4\00GLIBCXX_3.4.21\00GLIBC_2.34\00GLIBC_2.2.5\00\00\00\02\00\03\00\04\00\03\00\05\00\02\00\03\00\04\00\04\00\03\00\04\00\04\00\07\00\04\00\00\00\03\00\04\00\02\00\04\00\06\00\04\00", [4 x i8] zeroinitializer, [28 x i8] c"\01\00\01\00}\02\00\00\10\00\00\00 \00\00\00P&y\0B\00\00\07\00\DB\02\00\00", [4 x i8] zeroinitializer, [60 x i8] c"\01\00\03\00\01\00\00\00\10\00\00\00@\00\00\00\D3\AFk\05\00\00\06\00\E3\02\00\00\10\00\00\00t)\92\08\00\00\04\00\EE\02\00\00\10\00\00\00q\F8\97\02\00\00\03\00\FA\02\00\00", [4 x i8] zeroinitializer, [12 x i8] c"\01\00\02\00\9A\02\00\00\10\00\00\00", [4 x i8] zeroinitializer, [28 x i8] c"\B4\91\96\06\00\00\05\00\09\03\00\00\10\00\00\00u\1Ai\09\00\00\02\00\14\03\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\F0?@\00", [4 x i8] zeroinitializer, [8 x i8] c"\06\00\00\00\05\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"\F8?@\00", [4 x i8] zeroinitializer, [8 x i8] c"\06\00\00\00\0F\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"\C0@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\05\00\00\00\13\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"\18@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\01\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c" @@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\02\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"(@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\11\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"0@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\03\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"8@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\04\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"@@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\12\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"H@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\06\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"P@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\07\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"X@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\08\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"`@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\09\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"h@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\0A\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"p@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\0B\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"x@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\0C\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"\80@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\14\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"\88@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\0D\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"\90@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\0E\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"\98@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\10\00\00\00", [8 x i8] zeroinitializer, [4 x i8] c"\A0@@\00", [4 x i8] zeroinitializer, [8 x i8] c"\07\00\00\00\15\00\00\00", [8 x i8] zeroinitializer }>, [1088 x i8] zeroinitializer, %seg_401000__init_1b_type <{ [27 x i8] c"\F3\0F\1E\FAH\83\EC\08H\8B\05\E9/\00\00H\85\C0t\02\FF\D0H\83\C4\08\C3", [5 x i8] zeroinitializer, [304 x i8] c"\FF5\E2/\00\00\FF%\E4/\00\00\0F\1F@\00\FF%\E2/\00\00h\00\00\00\00\E9\E0\FF\FF\FF\FF%\DA/\00\00h\01\00\00\00\E9\D0\FF\FF\FF\FF%\D2/\00\00h\02\00\00\00\E9\C0\FF\FF\FF\FF%\CA/\00\00h\03\00\00\00\E9\B0\FF\FF\FF\FF%\C2/\00\00h\04\00\00\00\E9\A0\FF\FF\FF\FF%\BA/\00\00h\05\00\00\00\E9\90\FF\FF\FF\FF%\B2/\00\00h\06\00\00\00\E9\80\FF\FF\FF\FF%\AA/\00\00h\07\00\00\00\E9p\FF\FF\FF\FF%\A2/\00\00h\08\00\00\00\E9`\FF\FF\FF\FF%\9A/\00\00h\09\00\00\00\E9P\FF\FF\FF\FF%\92/\00\00h\0A\00\00\00\E9@\FF\FF\FF\FF%\8A/\00\00h\0B\00\00\00\E90\FF\FF\FF\FF%\82/\00\00h\0C\00\00\00\E9 \FF\FF\FF\FF%z/\00\00h\0D\00\00\00\E9\10\FF\FF\FF\FF%r/\00\00h\0E\00\00\00\E9\00\FF\FF\FF\FF%j/\00\00h\0F\00\00\00\E9\F0\FE\FF\FF\FF%b/\00\00h\10\00\00\00\E9\E0\FE\FF\FF\FF%Z/\00\00h\11\00\00\00\E9\D0\FE\FF\FF", [24 x i8] c"UH\89\E5H\BF\D1A@\00\00\00\00\00\E8\8D\FF\FF\FFH\B8@\11@", [4 x i8] zeroinitializer, [20 x i8] c"\00H\89\C7H\BE\D1A@\00\00\00\00\00H\BA\B0@@\00", [4 x i8] zeroinitializer, [72 x i8] c"\E8\07\FF\FF\FF]\C3\0F\1FD\00\00UH\89\E5\E8\B7\FF\FF\FF]\C3\0F\1FD\00\00\F3\0F\1E\FA1\EDI\89\D1^H\89\E2H\83\E4\F0PTE1\C01\C9H\C7\C7\90\12@\00\FF\15+.\00\00\F4f.\0F\1F\84\00", [4 x i8] zeroinitializer, [56 x i8] c"\F3\0F\1E\FA\C3f.\0F\1F\84\00\00\00\00\00\90\B8\B8@@\00H=\B8@@\00t\13\B8\00\00\00\00H\85\C0t\09\BF\B8@@\00\FF\E0f\90\C3ff.\0F\1F\84\00", [4 x i8] zeroinitializer, [36 x i8] c"\0F\1F@\00\BE\B8@@\00H\81\EE\B8@@\00H\89\F0H\C1\EE?H\C1\F8\03H\01\C6H\D1\FEt\11\B8", [4 x i8] zeroinitializer, [20 x i8] c"H\85\C0t\07\BF\B8@@\00\FF\E0\C3ff.\0F\1F\84\00", [4 x i8] zeroinitializer, [44 x i8] c"\0F\1F@\00\F3\0F\1E\FA\80=u/\00\00\00u\13UH\89\E5\E8z\FF\FF\FF\C6\05c/\00\00\01]\C3\90\C3ff.\0F\1F\84\00", [4 x i8] zeroinitializer, [16 x i8] c"\0F\1F@\00\F3\0F\1E\FA\EB\8Af.\0F\1F\84\00", [4 x i8] zeroinitializer, [140 x i8] c"UH\89\E5H\81\EC\90\00\00\00\C7E\FC\00\00\00\00H\8DE\D0H\89\C7H\89E\88\E8n\FE\FF\FF\BE\04 @\00H\8D}\D8H\8BU\88\E8\0C\FE\FF\FF\E9\00\00\00\00H\8D}\D0\E8\EE\FD\FF\FF1\C0\89\C6H\8D}\D8\E8!\01\00\00\F2\0F\11E\80\E9\00\00\00\00\F2\0F\10E\80\F2\0F\11E\B8H\8DE\90H\89\C7H\89\85x\FF\FF\FF\E8\1A\FE\FF\FF\BE\09 @\00H\8D}\98H\8B\95x\FF\FF\FF\E8\B5\FD\FF\FF\E9", [4 x i8] zeroinitializer, [60 x i8] c"H\8D}\90\E8\97\FD\FF\FFH\8D}\98\BE\05\00\00\00\BA\01\00\00\00\B9,\00\00\00\E8\EF\FD\FF\FF\E9\00\00\00\00\BF\C0@@\00H\8Du\98\E8L\FD\FF\FFH\89\85p\FF\FF\FF\E9", [4 x i8] zeroinitializer, [152 x i8] c"\BEP\10@\00H\8B\BDp\FF\FF\FF\E8?\FD\FF\FF\E9\00\00\00\00\C7E\FC\00\00\00\00H\8D}\98\E8\EA\FC\FF\FFH\8D}\D8\E8\E1\FC\FF\FF\8BE\FCH\81\C4\90\00\00\00]\C3H\89E\C8\89U\C4H\8D}\D0\E8\15\FD\FF\FF\E9:\00\00\00H\89E\C8\89U\C4\E9%\00\00\00H\89E\C8\89U\C4H\8D}\90\E8\F4\FC\FF\FF\E9\10\00\00\00H\89E\C8\89U\C4H\8D}\98\E8\8F\FC\FF\FFH\8D}\D8\E8\86\FC\FF\FFH\8B}\C8\E8\1D\FD\FF\FFf.\0F\1F\84", [4 x i8] zeroinitializer, [48 x i8] c"\00\0F\1F\00UH\89\E5H\83\EC\10H\89}\F8H\89u\F0H\8B}\F8\E8'\FC\FF\FFH\8BM\F0H\BF\80\10@\00\00\00\00\00H\BE\15 @", [4 x i8] zeroinitializer, [176 x i8] c"\00H\89\C2\E8\07\00\00\00H\83\C4\10]\C3\90UH\89\E5H\83\ECpH\89}\F8H\89u\F0H\89U\E8H\89M\E0H\8D}\C8\E8\FF\00\00\00H\8BE\F8H\8B}\E8H\8Du\D0\FF\D0\F2\0F\11E\A0\E9\00\00\00\00\F2\0F\10E\A0\F2\0F\11E\C0H\8BE\D0H;E\E8\0F\85#\00\00\00H\8B}\F0\E8\C6\FB\FF\FF\E9\00\00\00\00H\89E\B8\89U\B4H\8D}\C8\E8\11\01\00\00\E9\98\00\00\00\E8w\FB\FF\FF\838\22\B1\01\88M\9F\0F\84\1D\00\00\00\F2\0F\10E\C0\E8\CF\00\00\00\88E\9E\E9\00\00\00\00\8AE\9E\88E\9F\E9", [4 x i8] zeroinitializer, [164 x i8] c"\8AE\9F\A8\01\0F\85\05\00\00\00\E9\0E\00\00\00H\8B}\F0\E8\E3\FB\FF\FF\E9\00\00\00\00\F2\0F\10E\C0\F2\0F\11E\D8\E9\00\00\00\00H\83}\E0\00\0F\84\12\00\00\00H\8BE\D0H\8BM\E8H)\C8H\8BM\E0H\89\01\F2\0F\10E\D8H\8D}\C8\F2\0F\11E\90\E8\7F\00\00\00\F2\0F\10E\90H\83\C4p]\C3H\8B}\B8\E8\BB\FB\FF\FFf.\0F\1F\84\00\00\00\00\00\90UH\89\E5H\83\EC\10H\89}\F8H\8BE\F8H\89E\F0\E8\B7\FA\FF\FF\8B\08H\8BE\F0\89\08\E8\AA\FA\FF\FF\C7\00", [4 x i8] zeroinitializer, [12 x i8] c"H\83\C4\10]\C3f.\0F\1F\84\00", [4 x i8] zeroinitializer, [28 x i8] c"\0F\1F@\00UH\89\E51\C0\F2\0F\11E\F0$\01\0F\B6\C0]\C3f.\0F\1F\84\00", [4 x i8] zeroinitializer, [63 x i8] c"\0F\1F@\00UH\89\E5H\83\EC H\89}\F8H\8BE\F8H\89E\F0\E8W\FA\FF\FF\838\00\0F\85\13\00\00\00H\8BE\F0\8B\08\89M\EC\E8@\FA\FF\FF\8BM\EC\89\08H\83\C4 ]\C3", [1 x i8] zeroinitializer, [13 x i8] c"\F3\0F\1E\FAH\83\EC\08H\83\C4\08\C3" }>, [2551 x i8] zeroinitializer, %seg_402000__rodata_1a_type <{ [8 x i8] c"\01\00\02\003.14", [1 x i8] zeroinitializer, [16 x i8] c"Hello World\00stod", [1 x i8] zeroinitializer, [2 x i8] zeroinitializer, [100 x i8] c"\01\1B\03;`\00\00\00\0B\00\00\00\04\F0\FF\FF\A4\00\00\004\F1\FF\FF\CC\00\00\00t\F1\FF\FFl\01\00\00\84\F1\FF\FF|\00\00\00\B4\F1\FF\FF\90\00\00\00t\F2\FF\FF\AC\01\00\00\E4\F3\FF\FF\EC\00\00\00$\F4\FF\FF\D4\01\00\00D\F5\FF\FF\0C\01\00\00\84\F5\FF\FF,\01\00\00\A4\F5\FF\FFL\01\00\00", [4 x i8] c"\14\00\00\00", [4 x i8] zeroinitializer, [52 x i8] c"\01zR\00\01x\10\01\1B\0C\07\08\90\01\00\00\10\00\00\00\1C\00\00\00\00\F1\FF\FF&\00\00\00\00D\07\10\10\00\00\000\00\00\00\1C\F1\FF\FF\05\00\00\00", [4 x i8] zeroinitializer, [36 x i8] c"$\00\00\00D\00\00\00X\EF\FF\FF0\01\00\00\00\0E\10F\0E\18J\0F\0Bw\08\80\00?\1A;*3$\22", [4 x i8] zeroinitializer, [196 x i8] c"\1C\00\00\00l\00\00\00`\F0\FF\FF;\00\00\00\00A\0E\10\86\02C\0D\06v\0C\07\08\00\00\00\1C\00\00\00\8C\00\00\00\F0\F2\FF\FF?\00\00\00\00A\0E\10\86\02C\0D\06z\0C\07\08\00\00\00\1C\00\00\00\AC\00\00\000\F4\FF\FF2\00\00\00\00A\0E\10\86\02C\0D\06m\0C\07\08\00\00\00\1C\00\00\00\CC\00\00\00P\F4\FF\FF\12\00\00\00\00A\0E\10\86\02C\0D\06M\0C\07\08\00\00\00\1C\00\00\00\EC\00\00\00P\F4\FF\FF;\00\00\00\00A\0E\10\86\02C\0D\06v\0C\07\08\00\00\00\1C\00\00\00\0C\01\00\00\00\F0\FF\FF\0B\00\00\00\00A\0E\10\86\02C\0D\06F\0C\07\08\00\00\00\1C\00\00\00", [4 x i8] zeroinitializer, [104 x i8] c"\01zPLR\00\01x\10\07\03\00\11@\00\03\1B\0C\07\08\90\01\00\00$\00\00\00$\00\00\00\C0\F0\FF\FFc\01\00\00\04\1C\22@\00A\0E\10\86\02C\0D\06\03\06\01\0C\07\08A\0C\06\10\00$\00\00\00L\00\00\00H\F2\FF\FF\15\01\00\00\04<\22@\00A\0E\10\86\02C\0D\06\03\07\01\0C\07\08A\0C\06\10\00", [4 x i8] zeroinitializer, [44 x i8] c"\FF\FF\01\1B\22\12\8B\02\00B\0D\A0\02\00v\15\AC\02\00\99\01H\C1\02\00\E1\01\82\01\00\00\00\FF\FF\01\0A)\94\01_\00\BD\01X", [4 x i8] zeroinitializer }>, [7052 x i8] zeroinitializer, %seg_403dd8__init_array_18_type <{ i8* bitcast (void ()* @frame_dummy to i8*), i8* bitcast (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_GLOBAL__sub_I_MotivatingExample.cpp to i8*), i8* bitcast (void ()* @__do_global_dtors_aux to i8*), [4 x i8] c"\01\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\01\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\01\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"s\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\01\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"}\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\01\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\9A\02\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\0C\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\00\10@\00", [4 x i8] zeroinitializer, [4 x i8] c"\0D\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\FC\15@\00", [4 x i8] zeroinitializer, [4 x i8] c"\19\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\D8=@\00", [4 x i8] zeroinitializer, [4 x i8] c"\1B\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\10\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\1A\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\E8=@\00", [4 x i8] zeroinitializer, [4 x i8] c"\1C\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\08\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\F5\FE\FFo", [4 x i8] zeroinitializer, [4 x i8] c"\A0\03@\00", [4 x i8] zeroinitializer, [4 x i8] c"\05\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\E8\05@\00", [4 x i8] zeroinitializer, [4 x i8] c"\06\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\D8\03@\00", [4 x i8] zeroinitializer, [4 x i8] c"\0A\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c" \03\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\0B\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\18\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\15\00\00\00", [12 x i8] zeroinitializer, [4 x i8] c"\03\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\00@@\00", [4 x i8] zeroinitializer, [4 x i8] c"\02\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\B0\01\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\14\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\07\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\17\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\10\0A@\00", [4 x i8] zeroinitializer, [4 x i8] c"\07\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\C8\09@\00", [4 x i8] zeroinitializer, [4 x i8] c"\08\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"H\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\09\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\18\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\FE\FF\FFo", [4 x i8] zeroinitializer, [4 x i8] c"8\09@\00", [4 x i8] zeroinitializer, [4 x i8] c"\FF\FF\FFo", [4 x i8] zeroinitializer, [4 x i8] c"\03\00\00\00", [4 x i8] zeroinitializer, [4 x i8] c"\F0\FF\FFo", [4 x i8] zeroinitializer, [4 x i8] c"\08\09@\00", [100 x i8] zeroinitializer, i8* bitcast (void (i32 (i32, i8**, i8**)*, i32, i8**, i8*, i32 (i32, i8**, i8**)*, void ()*, void ()*, i32*)* @__libc_start_main to i8*), i8* bitcast (void ()* @__gmon_start__ to i8*), [4 x i8] c"\F0=@\00", [20 x i8] zeroinitializer, i8* bitcast (i64 ()* @__errno_location to i8*), i8* bitcast (i64 (...)* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv to i8*), i8* bitcast (i64 (i64, i64)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_ to i8*), i8* bitcast (i64 (...)* @_ZSt24__throw_invalid_argumentPKc to i8*), i8* bitcast (i64 (...)* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev to i8*), i8* bitcast (i64 (i64, i64)* @strtod to i8*), i8* bitcast (i64 (i64, i64, i64)* @__cxa_atexit to i8*), i8* bitcast (i64 (...)* @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE to i8*), i8* bitcast (i64 (i64, i64)* @_ZNSolsEPFRSoS_E to i8*), i8* bitcast (i64 (i64)* @_ZNSaIcED1Ev to i8*), i8* bitcast (i64 (...)* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_ to i8*), i8* bitcast (i64 (...)* @_ZSt20__throw_out_of_rangePKc to i8*), i8* bitcast (i64 (i64)* @_ZNSt8ios_base4InitC1Ev to i8*), i8* bitcast (i64 ()* @__gxx_personality_v0 to i8*), i8* bitcast (i64 (i64)* @_Unwind_Resume to i8*), i8* bitcast (i64 (i64)* @_ZNSaIcEC1Ev to i8*), i8* bitcast (i64 (...)* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc to i8*), i8* bitcast (i64 (i64)* @_ZNSt8ios_base4InitD1Ev to i8*), [16 x i8] zeroinitializer, [8 x i8] zeroinitializer, [280 x i8] zeroinitializer, [1 x i8] zeroinitializer }> }>, section ".section_400000"

@data_4015f0 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 35, i32 52)
@data_4015d9 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 35, i32 29)
@data_401586 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 29, i32 162)
@data_401579 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 29, i32 149)
@data_40102c = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 2, i32 12)
@data_404010 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 6, i32 108, i32 12)
@data_404008 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 6, i32 108, i32 4)
@data_401189 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 7, i32 5)
@data_4040b0 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 6, i32 127, i32 8)
@data_401163 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 3, i32 19)
@data_4041d1 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 6, i32 129, i32 273)
@data_401199 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 7, i32 21)
@data_4011c5 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 7, i32 65)
@data_403ff0 = internal alias i8*, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 6, i32 105)
@data_401201 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 9, i32 49)
@data_401439 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 27, i32 9)
@data_402015 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 4, i32 2, i32 12)
@data_401419 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 25, i32 29)
@data_401241 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 13, i32 13)
@data_401016 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 0, i32 22)
@data_403ff8 = internal alias i8*, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 6, i32 106)
@data_401266 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 15, i32 26)
@data_4041d0 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 6, i32 129, i32 272)
@data_4013f3 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 23, i32 147)
@data_4013ea = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 23, i32 138)
@data_4013e1 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 23, i32 129)
@data_4013cc = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 23, i32 108)
@data_4013ab = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 23, i32 75)
@data_40138f = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 23, i32 47)
@data_401386 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 23, i32 38)
@data_401371 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 23, i32 17)
@data_401354 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 21, i32 52)
@data_401341 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 21, i32 33)
@data_401329 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 21, i32 9)
@data_40131b = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 19, i32 139)
@data_401306 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 19, i32 118)
@data_4012df = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 19, i32 79)
@data_4012d2 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 19, i32 66)
@data_4012c4 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 19, i32 52)
@data_4012b2 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 19, i32 34)
@data_401555 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 29, i32 113)
@data_401541 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 29, i32 93)
@data_4014fd = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 29, i32 25)
@data_4014d1 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 27, i32 161)
@data_4014b9 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 27, i32 137)
@data_4014af = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 27, i32 127)
@data_40149a = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 27, i32 106)
@data_40146f = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 27, i32 63)
@data_401461 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 2, i32 27, i32 49)
@data_402009 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 4, i32 2, i32 0)
@data_402004 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 4, i32 0, i32 4)
@data_402000 = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 4, i32 0, i32 0)
@data_403dd8 = internal alias i8*, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 6, i32 0)
@data_40201c = internal alias i8, getelementptr inbounds (<{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>, <{ %seg_400000_LOAD_bc0_type, [1088 x i8], %seg_401000__init_1b_type, [2551 x i8], %seg_402000__rodata_1a_type, [7052 x i8], %seg_403dd8__init_array_18_type }>* @__mcsema_all_segments, i32 0, i32 4, i32 5, i32 0)
@OF_2077_293d9b8 = private thread_local(initialexec) alias i8, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 2, i32 13)
@SF_2073_293d9b8 = private thread_local(initialexec) alias i8, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 2, i32 9)
@ZF_2071_293d9b8 = private thread_local(initialexec) alias i8, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 2, i32 7)
@AF_2069_293d9b8 = private thread_local(initialexec) alias i8, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 2, i32 5)
@PF_2067_293d9b8 = private thread_local(initialexec) alias i8, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 2, i32 3)
@CF_2065_293d9b8 = private thread_local(initialexec) alias i8, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 2, i32 1)
@RIP_2472_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 33, i32 0, i32 0)
@RSP_2312_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 13, i32 0, i32 0)
@RSP_2312_2948f30 = private thread_local(initialexec) alias i64*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 13, i32 0, i32 0) to i64**)
@RIP_2472_294e750 = private thread_local(initialexec) alias void ()*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 33, i32 0, i32 0) to void ()**)
@RDI_2296_293d9e8 = private thread_local(initialexec) alias i32, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 11, i32 0, i32 0) to i32*)
@RDX_2264_293d9e8 = private thread_local(initialexec) alias i32, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 7, i32 0, i32 0) to i32*)
@RAX_2216_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 1, i32 0, i32 0)
@R9_2360_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 19, i32 0, i32 0)
@R8_2344_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 17, i32 0, i32 0)
@RCX_2248_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 5, i32 0, i32 0)
@RDX_2264_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 7, i32 0, i32 0)
@RSI_2280_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 9, i32 0, i32 0)
@RDI_2296_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 11, i32 0, i32 0)
@RAX_2216_294e270 = private thread_local(initialexec) alias i32*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 1, i32 0, i32 0) to i32**)
@RCX_2248_2948f30 = private thread_local(initialexec) alias i64*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 5, i32 0, i32 0) to i64**)
@RBP_2328_293da00 = private thread_local(initialexec) alias i64, getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 15, i32 0, i32 0)
@RIP_2472_2948dd0 = private thread_local(initialexec) alias i8*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 33, i32 0, i32 0) to i8**)
@RIP_2472_37b0970 = private thread_local(initialexec) alias i64 (i64, i64, i64, i64, i64, i64, i64, i64)*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 33, i32 0, i32 0) to i64 (i64, i64, i64, i64, i64, i64, i64, i64)**)
@RAX_2216_293d9d0 = private thread_local(initialexec) alias i16, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 1, i32 0, i32 0) to i16*)
@RAX_2216_293d9b8 = private thread_local(initialexec) alias i8, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 1, i32 0, i32 0) to i8*)
@RCX_2248_293d9b8 = private thread_local(initialexec) alias i8, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 5, i32 0, i32 0) to i8*)
@XMM0_16_293d8f8 = private thread_local(initialexec) alias double, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0) to double*)
@XMM0_24_293d8f8 = private thread_local(initialexec) alias double, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 1) to double*)
@RSI_2280_2948dd0 = private thread_local(initialexec) alias i8*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 9, i32 0, i32 0) to i8**)
@RSI_2280_37b08d0 = private thread_local(initialexec) alias i64 (i64, i64)*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 9, i32 0, i32 0) to i64 (i64, i64)**)
@RDI_2296_2948dd0 = private thread_local(initialexec) alias i8*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 11, i32 0, i32 0) to i8**)
@RIP_2472_2af2220 = private thread_local(initialexec) alias i32 (i32, i8**, i8**)*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 33, i32 0, i32 0) to i32 (i32, i8**, i8**)**)
@RAX_2216_293d9e8 = private thread_local(initialexec) alias i32, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 1, i32 0, i32 0) to i32*)
@RDI_2296_37b08d0 = private thread_local(initialexec) alias i64 (i64, i64)*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 11, i32 0, i32 0) to i64 (i64, i64)**)
@RDI_2296_2af2220 = private thread_local(initialexec) alias i32 (i32, i8**, i8**)*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 11, i32 0, i32 0) to i32 (i32, i8**, i8**)**)
@RCX_2248_293d9e8 = private thread_local(initialexec) alias i32, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 5, i32 0, i32 0) to i32*)
@R8_2344_293d9e8 = private thread_local(initialexec) alias i32, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 17, i32 0, i32 0) to i32*)
@RBP_2328_293d9e8 = private thread_local(initialexec) alias i32, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 15, i32 0, i32 0) to i32*)
@RDX_2264_2948dd0 = private thread_local(initialexec) alias i8*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 7, i32 0, i32 0) to i8**)
@RAX_2216_294cc80 = private thread_local(initialexec) alias i64 (i64)*, bitcast (i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 1, i32 0, i32 0) to i64 (i64)**)

declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_sync_hyper_call(%struct.State* nonnull align 16 dereferenceable(3376), %struct.Memory*, i32) #0

; Function Attrs: nounwind readnone speculatable willreturn
declare !remill.function.type !1289 i32 @llvm.ctpop.i32(i32) #1

; Function Attrs: noduplicate noinline nounwind optnone
define dso_local %struct.Memory* @__remill_error(%struct.State* nonnull align 16 dereferenceable(3376) %0, i64 %1, %struct.Memory* %2) #2 !remill.function.type !1289 {
  call void @abort()
  unreachable
}

; Function Attrs: argmemonly nounwind willreturn
declare !remill.function.type !1289 void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare !remill.function.type !1289 void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: noduplicate noinline nounwind optnone readnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_barrier_store_load(%struct.Memory*) #4

; Function Attrs: noduplicate noinline nounwind optnone readnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_barrier_store_store(%struct.Memory*) #4

; Function Attrs: noduplicate noinline nounwind optnone readnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_barrier_load_load(%struct.Memory*) #4

; Function Attrs: nounwind readnone
declare !remill.function.type !1289 dso_local i32 @__remill_fpu_exception_test_and_clear(i32, i32) #5

; Function Attrs: noduplicate noinline nounwind optnone readnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_barrier_load_store(%struct.Memory*) #6

; Function Attrs: noduplicate noinline nounwind optnone readnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_atomic_begin(%struct.Memory*) #6

; Function Attrs: noduplicate noinline nounwind optnone readnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_atomic_end(%struct.Memory*) #6

; Function Attrs: noduplicate noinline nounwind optnone readnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_delay_slot_begin(%struct.Memory*) #6

; Function Attrs: noduplicate noinline nounwind optnone readnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_delay_slot_end(%struct.Memory*) #6

; Function Attrs: noduplicate noinline nounwind optnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_function_call(%struct.State* nonnull align 1, i64, %struct.Memory*) #7

; Function Attrs: noduplicate noinline nounwind optnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_function_return(%struct.State* nonnull align 1, i64, %struct.Memory*) #7

; Function Attrs: noduplicate noinline nounwind optnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_jump(%struct.State* nonnull align 1, i64, %struct.Memory*) #7

; Function Attrs: noduplicate noinline nounwind optnone
define dso_local %struct.Memory* @__remill_missing_block(%struct.State* nonnull align 1 %0, i64 %1, %struct.Memory* %2) #7 !remill.function.type !1289 {
  call void @abort()
  unreachable
}

; Function Attrs: noduplicate noinline nounwind optnone
declare !remill.function.type !1289 dso_local %struct.Memory* @__remill_async_hyper_call(%struct.State* nonnull align 1, i64, %struct.Memory*) #7

; Function Attrs: nobuiltin noinline
define private void @_start() #8 {
  %1 = call %struct.State* @__mcsema_init_reg_state()
  %2 = call %struct.Memory* @sub_4011a0__start(%struct.State* %1, i64 4198816, %struct.Memory* null)
  ret void
}

; Function Attrs: nobuiltin noinline
define private void @frame_dummy() #8 {
  %1 = call %struct.State* @__mcsema_init_reg_state()
  %2 = call %struct.Memory* @sub_401280_frame_dummy(%struct.State* %1, i64 4199040, %struct.Memory* null)
  ret void
}

; Function Attrs: nobuiltin noinline
define private void @__do_global_dtors_aux() #8 {
  %1 = call %struct.State* @__mcsema_init_reg_state()
  %2 = call %struct.Memory* @sub_401250___do_global_dtors_aux(%struct.State* %1, i64 4198992, %struct.Memory* null)
  ret void
}

; Function Attrs: nobuiltin noinline
define private void @.init_proc() #8 {
  %1 = call %struct.State* @__mcsema_init_reg_state()
  %2 = call %struct.Memory* @sub_401000__init_proc(%struct.State* %1, i64 4198400, %struct.Memory* null)
  ret void
}

; Function Attrs: nobuiltin noinline
define private void @.term_proc() #8 {
  %1 = call %struct.State* @__mcsema_init_reg_state()
  %2 = call %struct.Memory* @sub_4015fc__term_proc(%struct.State* %1, i64 4199932, %struct.Memory* null)
  ret void
}

; Function Attrs: noreturn
declare void @abort() #9

; Function Attrs: noinline
define internal %struct.Memory* @sub_4015fc__term_proc(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %1 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 11, i32 0, i32 0
  %2 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 7, i32 0, i32 0
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (void ()* @.term_proc to i64), i64* %NEXT_PC, align 8
  store void ()* @.term_proc, void ()** @RIP_2472_294e750, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_4015fc

inst_4015fc:                                      ; preds = %0
  %3 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %3, i64* @RIP_2472_293da00, align 8
  %4 = add i64 %3, 4
  store volatile i64 %4, i64* %NEXT_PC, align 8
  %5 = load i32, i32* @RDX_2264_293d9e8, align 4
  %6 = zext i32 %5 to i64
  %7 = load i32, i32* @RDI_2296_293d9e8, align 4
  %8 = zext i32 %7 to i64
  %9 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %9, %struct.Memory** %MEMORY, align 8
  br label %inst_401600

inst_401600:                                      ; preds = %inst_4015fc
  %10 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %10, i64* @RIP_2472_293da00, align 8
  %11 = add i64 %10, 4
  store volatile i64 %11, i64* %NEXT_PC, align 8
  %12 = load i64, i64* @RSP_2312_293da00, align 8
  %13 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i = sub i64 %12, 8
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i = icmp ult i64 %12, 8
  %conv.i.i = zext i1 %cmp.i.i.i to i8
  store i8 %conv.i.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = trunc i64 %sub.i.i to i32
  %conv.i.i.i.i.i = and i32 %conv.i.i.i.i, 255
  %14 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i) #14, !range !1308
  %15 = trunc i32 %14 to i8
  %16 = and i8 %15, 1
  %17 = xor i8 %16, 1
  store i8 %17, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i = xor i64 8, %12
  %xor1.i.i.i.i = xor i64 %xor.i25.i.i.i, %sub.i.i
  %and.i.i.i.i = lshr i64 %xor1.i.i.i.i, 4
  %18 = trunc i64 %and.i.i.i.i to i8
  %19 = and i8 %18, 1
  store i8 %19, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i64 %sub.i.i, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i64 %sub.i.i, 63
  %20 = trunc i64 %res.lobit.i.i.i to i8
  store i8 %20, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i = lshr i64 %12, 63
  %xor3.i.i.i.i = xor i64 %res.lobit.i.i.i, %shr.i.i.i.i
  %add.i.i.i.i = add nuw nsw i64 %xor3.i.i.i.i, %shr.i.i.i.i
  %cmp.i.i.i.i = icmp eq i64 %add.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %13, %struct.Memory** %MEMORY, align 8
  br label %inst_401604

inst_401604:                                      ; preds = %inst_401600
  %21 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %21, i64* @RIP_2472_293da00, align 8
  %22 = add i64 %21, 4
  store volatile i64 %22, i64* %NEXT_PC, align 8
  %23 = load i64, i64* @RSP_2312_293da00, align 8
  %24 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %add.i.i1 = add i64 8, %23
  store i64 %add.i.i1, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i2 = icmp ult i64 %add.i.i1, %23
  %cmp1.i.i.i = icmp ult i64 %add.i.i1, 8
  %25 = or i1 %cmp.i.i.i2, %cmp1.i.i.i
  %conv.i.i3 = zext i1 %25 to i8
  store i8 %conv.i.i3, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i5 = trunc i64 %add.i.i1 to i32
  %conv.i.i.i.i.i6 = and i32 %conv.i.i.i.i5, 255
  %26 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i6) #14, !range !1308
  %27 = trunc i32 %26 to i8
  %28 = and i8 %27, 1
  %29 = xor i8 %28, 1
  store i8 %29, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i8 = xor i64 8, %23
  %xor1.i.i.i.i9 = xor i64 %xor.i25.i.i.i8, %add.i.i1
  %and.i.i.i.i10 = lshr i64 %xor1.i.i.i.i9, 4
  %30 = trunc i64 %and.i.i.i.i10 to i8
  %31 = and i8 %30, 1
  store i8 %31, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i12 = icmp eq i64 %add.i.i1, 0
  %conv5.i.i.i13 = zext i1 %cmp.i24.i.i.i12 to i8
  store i8 %conv5.i.i.i13, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i15 = lshr i64 %add.i.i1, 63
  %32 = trunc i64 %res.lobit.i.i.i15 to i8
  store i8 %32, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i17 = lshr i64 %23, 63
  %xor.i.i.i.i = xor i64 %res.lobit.i.i.i15, %shr.i.i.i.i17
  %add.i.i.i.i18 = add nuw nsw i64 %xor.i.i.i.i, %res.lobit.i.i.i15
  %cmp.i.i.i.i19 = icmp eq i64 %add.i.i.i.i18, 2
  %conv11.i.i.i20 = zext i1 %cmp.i.i.i.i19 to i8
  store i8 %conv11.i.i.i20, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %24, %struct.Memory** %MEMORY, align 8
  br label %inst_401608

inst_401608:                                      ; preds = %inst_401604
  %33 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %33, i64* @RIP_2472_293da00, align 8
  %34 = add i64 %33, 1
  store volatile i64 %34, i64* %NEXT_PC, align 8
  %35 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %36 = load i64*, i64** @RSP_2312_2948f30, align 8
  %37 = load i64*, i64** @RSP_2312_2948f30, align 8
  %38 = ptrtoint i64* %37 to i64
  %39 = load i64, i64* %36, align 8
  store i64 %39, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %39, i64* %NEXT_PC, align 8, !tbaa !1290
  %40 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %40, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %35, %struct.Memory** %MEMORY, align 8
  %41 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %41
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401440__ZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %STATE.i = alloca %struct.State*, align 8
  %MEMORY.i = alloca %struct.Memory*, align 8
  %NEXT_PC.i = alloca i64, align 8
  %ESBASE.i = alloca i64, align 8
  %DSBASE.i = alloca i64, align 8
  %CSBASE.i = alloca i64, align 8
  %SSBASE.i = alloca i64, align 8
  %1 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 7, i32 0, i32 0
  %2 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0
  %XMM0 = bitcast i64* %2 to [16 x i8]*, !remill_register !1315
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_ to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401440

inst_401440:                                      ; preds = %0
  %3 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %3, i64* @RIP_2472_293da00, align 8
  %4 = add i64 %3, 1
  store volatile i64 %4, i64* %NEXT_PC, align 8
  %5 = load i64, i64* @RBP_2328_293da00, align 8
  %6 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %7 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %7, -8
  %8 = inttoptr i64 %sub.i.i.i to i64*
  %9 = inttoptr i64 %sub.i.i.i to i64*
  %10 = ptrtoint i64* %9 to i64
  store i64 %5, i64* %8, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %6, %struct.Memory** %MEMORY, align 8
  br label %inst_401441

inst_401479:                                      ; preds = %inst_401474
  %11 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %11, i64* @RIP_2472_293da00, align 8
  %12 = add i64 %11, 5
  store volatile i64 %12, i64* %NEXT_PC, align 8
  %XMM02 = bitcast [16 x i8]* %XMM0 to i8*
  %13 = load i64, i64* @RBP_2328_293da00, align 8
  %14 = sub i64 %13, 96
  %15 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %16 = inttoptr i64 %14 to double*
  %17 = inttoptr i64 %14 to double*
  %18 = ptrtoint double* %17 to i64
  %19 = load double, double* %16, align 8
  store double %19, double* @XMM0_16_293d8f8, align 1, !tbaa !1316
  store double 0.000000e+00, double* @XMM0_24_293d8f8, align 1, !tbaa !1316
  store volatile %struct.Memory* %15, %struct.Memory** %MEMORY, align 8
  br label %inst_40147e

inst_401502:                                      ; preds = %inst_4014fd, %inst_4014ef
  %20 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %20, i64* @RIP_2472_293da00, align 8
  %21 = add i64 %20, 5
  store volatile i64 %21, i64* %NEXT_PC, align 8
  %XMM05 = bitcast [16 x i8]* %XMM0 to i8*
  %22 = load i64, i64* @RBP_2328_293da00, align 8
  %23 = sub i64 %22, 64
  %24 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %25 = inttoptr i64 %23 to double*
  %26 = inttoptr i64 %23 to double*
  %27 = ptrtoint double* %26 to i64
  %28 = load double, double* %25, align 8
  store double %28, double* @XMM0_16_293d8f8, align 1, !tbaa !1316
  %arrayidx2.i.i12 = getelementptr inbounds i8, i8* %XMM05, i64 8
  store double 0.000000e+00, double* @XMM0_24_293d8f8, align 1, !tbaa !1316
  store volatile %struct.Memory* %24, %struct.Memory** %MEMORY, align 8
  br label %inst_401507

inst_4014e4:                                      ; preds = %inst_4014df, %420
  %29 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %29, i64* @RIP_2472_293da00, align 8
  %30 = add i64 %29, 3
  store volatile i64 %30, i64* %NEXT_PC, align 8
  %31 = load i64, i64* @RBP_2328_293da00, align 8
  %32 = sub i64 %31, 97
  %33 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %34 = inttoptr i64 %32 to i8*
  %35 = inttoptr i64 %32 to i8*
  %36 = ptrtoint i8* %35 to i64
  %37 = load i8, i8* %34, align 1
  store i8 %37, i8* @RAX_2216_293d9b8, align 1, !tbaa !1314
  store volatile %struct.Memory* %33, %struct.Memory** %MEMORY, align 8
  br label %inst_4014e7

inst_4014c7:                                      ; preds = %421
  %38 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %38, i64* @RIP_2472_293da00, align 8
  %39 = add i64 %38, 5
  store volatile i64 %39, i64* %NEXT_PC, align 8
  %40 = load i64, i64* @RBP_2328_293da00, align 8
  %41 = sub i64 %40, 64
  %42 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %43 = inttoptr i64 %41 to double*
  %44 = inttoptr i64 %41 to double*
  %45 = ptrtoint double* %44 to i64
  %46 = load double, double* %43, align 8
  store double %46, double* @XMM0_16_293d8f8, align 1, !tbaa !1316
  store double 0.000000e+00, double* @XMM0_24_293d8f8, align 1, !tbaa !1316
  store volatile %struct.Memory* %42, %struct.Memory** %MEMORY, align 8
  br label %inst_4014cc

inst_40154c:                                      ; preds = %inst_4014af
  %47 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %47, i64* @RIP_2472_293da00, align 8
  %48 = add i64 %47, 4
  store volatile i64 %48, i64* %NEXT_PC, align 8
  %49 = load i64, i64* @RBP_2328_293da00, align 8
  %50 = sub i64 %49, 72
  %51 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %52 = inttoptr i64 %50 to i64*
  %53 = inttoptr i64 %50 to i64*
  %54 = ptrtoint i64* %53 to i64
  %55 = load i64, i64* %52, align 8
  store i64 %55, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %51, %struct.Memory** %MEMORY, align 8
  br label %inst_401550

inst_40152e:                                      ; preds = %inst_40152b, %520
  %56 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %56, i64* @RIP_2472_293da00, align 8
  %57 = add i64 %56, 5
  store volatile i64 %57, i64* %NEXT_PC, align 8
  %58 = load i64, i64* @RBP_2328_293da00, align 8
  %59 = sub i64 %58, 40
  %60 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %61 = inttoptr i64 %59 to double*
  %62 = inttoptr i64 %59 to double*
  %63 = ptrtoint double* %62 to i64
  %64 = load double, double* %61, align 8
  store double %64, double* @XMM0_16_293d8f8, align 1, !tbaa !1316
  store double 0.000000e+00, double* @XMM0_24_293d8f8, align 1, !tbaa !1316
  store volatile %struct.Memory* %60, %struct.Memory** %MEMORY, align 8
  br label %inst_401533

inst_4014ef:                                      ; preds = %482
  %65 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %65, i64* @RIP_2472_293da00, align 8
  %66 = add i64 %65, 5
  store volatile i64 %66, i64* %NEXT_PC, align 8
  %67 = load i64, i64* %NEXT_PC, align 8
  %68 = add i64 %67, 14
  %69 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %68, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %68, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %69, %struct.Memory** %MEMORY, align 8
  br label %inst_401502

inst_401491:                                      ; preds = %334
  %70 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %70, i64* @RIP_2472_293da00, align 8
  %71 = add i64 %70, 4
  store volatile i64 %71, i64* %NEXT_PC, align 8
  %72 = load i64, i64* @RBP_2328_293da00, align 8
  %73 = sub i64 %72, 16
  %74 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %75 = inttoptr i64 %73 to i64*
  %76 = inttoptr i64 %73 to i64*
  %77 = ptrtoint i64* %76 to i64
  %78 = load i64, i64* %75, align 8
  store i64 %78, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %74, %struct.Memory** %MEMORY, align 8
  br label %inst_401495

inst_401511:                                      ; preds = %inst_40150c
  %79 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %79, i64* @RIP_2472_293da00, align 8
  %80 = add i64 %79, 5
  store volatile i64 %80, i64* %NEXT_PC, align 8
  %81 = load i64, i64* @RBP_2328_293da00, align 8
  %82 = sub i64 %81, 32
  %83 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %84 = inttoptr i64 %82 to i64*
  %85 = inttoptr i64 %82 to i64*
  %86 = ptrtoint i64* %85 to i64
  %87 = load i64, i64* %84, align 8
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = trunc i64 %87 to i32
  %conv.i.i.i.i.i = and i32 %conv.i.i.i.i, 255
  %88 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i) #14, !range !1308
  %89 = trunc i32 %88 to i8
  %90 = and i8 %89, 1
  %91 = xor i8 %90, 1
  store i8 %91, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i64 %87, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i64 %87, 63
  %92 = trunc i64 %res.lobit.i.i.i to i8
  store i8 %92, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i = lshr i64 %87, 63
  %xor3.i.i.i.i = xor i64 %res.lobit.i.i.i, %shr.i.i.i.i
  %add.i.i.i.i = add nuw nsw i64 %xor3.i.i.i.i, %shr.i.i.i.i
  %cmp.i.i.i.i = icmp eq i64 %add.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %83, %struct.Memory** %MEMORY, align 8
  br label %inst_401516

inst_4014b4:                                      ; preds = %333
  %93 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %93, i64* @RIP_2472_293da00, align 8
  %94 = add i64 %93, 5
  store volatile i64 %94, i64* %NEXT_PC, align 8
  %95 = load i64, i64* %NEXT_PC, align 8
  %96 = sub i64 %95, 1161
  %97 = load i64, i64* %NEXT_PC, align 8
  %98 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %99 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i = add i64 %99, -8
  %100 = inttoptr i64 %sub.i.i to i64*
  %101 = inttoptr i64 %sub.i.i to i64*
  %102 = ptrtoint i64* %101 to i64
  store i64 %97, i64* %100, align 8
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %96, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %96, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %97, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %98, %struct.Memory** %MEMORY, align 8
  %103 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %104 = call %struct.Memory* @ext_4041e0___errno_location(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %103)
  store %struct.Memory* %104, %struct.Memory** %MEMORY, align 8
  store i8* @data_4014b9, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4014b9 to i64), i64* %NEXT_PC, align 8
  br label %inst_4014b9

inst_4014f4:                                      ; preds = %481
  %105 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %105, i64* @RIP_2472_293da00, align 8
  %106 = add i64 %105, 4
  store volatile i64 %106, i64* %NEXT_PC, align 8
  %107 = load i64, i64* @RBP_2328_293da00, align 8
  %108 = sub i64 %107, 16
  %109 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %110 = inttoptr i64 %108 to i64*
  %111 = inttoptr i64 %108 to i64*
  %112 = ptrtoint i64* %111 to i64
  %113 = load i64, i64* %110, align 8
  store i64 %113, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %109, %struct.Memory** %MEMORY, align 8
  br label %inst_4014f8

inst_4014d9:                                      ; preds = %inst_4014d4
  %114 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %114, i64* @RIP_2472_293da00, align 8
  %115 = add i64 %114, 3
  store volatile i64 %115, i64* %NEXT_PC, align 8
  %116 = load i64, i64* @RBP_2328_293da00, align 8
  %117 = sub i64 %116, 98
  %118 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %119 = inttoptr i64 %117 to i8*
  %120 = inttoptr i64 %117 to i8*
  %121 = ptrtoint i8* %120 to i64
  %122 = load i8, i8* %119, align 1
  store i8 %122, i8* @RAX_2216_293d9b8, align 1, !tbaa !1314
  store volatile %struct.Memory* %118, %struct.Memory** %MEMORY, align 8
  br label %inst_4014dc

inst_40151c:                                      ; preds = %521
  %123 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %123, i64* @RIP_2472_293da00, align 8
  %124 = add i64 %123, 4
  store volatile i64 %124, i64* %NEXT_PC, align 8
  %125 = load i64, i64* @RBP_2328_293da00, align 8
  %126 = sub i64 %125, 48
  %127 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %128 = inttoptr i64 %126 to i64*
  %129 = inttoptr i64 %126 to i64*
  %130 = ptrtoint i64* %129 to i64
  %131 = load i64, i64* %128, align 8
  store i64 %131, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %127, %struct.Memory** %MEMORY, align 8
  br label %inst_401520

inst_40149f:                                      ; preds = %inst_40149a
  %132 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %132, i64* @RIP_2472_293da00, align 8
  %133 = add i64 %132, 4
  store volatile i64 %133, i64* %NEXT_PC, align 8
  %134 = load i64, i64* @RBP_2328_293da00, align 8
  %135 = sub i64 %134, 72
  %136 = load i64, i64* @RAX_2216_293da00, align 8
  %137 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %138 = inttoptr i64 %135 to i64*
  %139 = inttoptr i64 %135 to i64*
  %140 = ptrtoint i64* %139 to i64
  store i64 %136, i64* %138, align 8
  store volatile %struct.Memory* %137, %struct.Memory** %MEMORY, align 8
  br label %inst_4014a3

inst_401441:                                      ; preds = %inst_401440
  %141 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %141, i64* @RIP_2472_293da00, align 8
  %142 = add i64 %141, 3
  store volatile i64 %142, i64* %NEXT_PC, align 8
  %143 = load i64, i64* @RSP_2312_293da00, align 8
  %144 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %143, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %144, %struct.Memory** %MEMORY, align 8
  br label %inst_401444

inst_401444:                                      ; preds = %inst_401441
  %145 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %145, i64* @RIP_2472_293da00, align 8
  %146 = add i64 %145, 4
  store volatile i64 %146, i64* %NEXT_PC, align 8
  %147 = load i64, i64* @RSP_2312_293da00, align 8
  %148 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i33 = sub i64 %147, 112
  store i64 %sub.i.i33, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i = icmp ult i64 %147, 112
  %conv.i.i = zext i1 %cmp.i.i.i to i8
  store i8 %conv.i.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i35 = trunc i64 %sub.i.i33 to i32
  %conv.i.i.i.i.i36 = and i32 %conv.i.i.i.i35, 255
  %149 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i36) #14, !range !1308
  %150 = trunc i32 %149 to i8
  %151 = and i8 %150, 1
  %152 = xor i8 %151, 1
  store i8 %152, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i = xor i64 112, %147
  %xor1.i.i.i.i = xor i64 %xor.i25.i.i.i, %sub.i.i33
  %and.i.i.i.i = lshr i64 %xor1.i.i.i.i, 4
  %153 = trunc i64 %and.i.i.i.i to i8
  %154 = and i8 %153, 1
  store i8 %154, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i39 = icmp eq i64 %sub.i.i33, 0
  %conv5.i.i.i40 = zext i1 %cmp.i24.i.i.i39 to i8
  store i8 %conv5.i.i.i40, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i42 = lshr i64 %sub.i.i33, 63
  %155 = trunc i64 %res.lobit.i.i.i42 to i8
  store i8 %155, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i44 = lshr i64 %147, 63
  %xor3.i.i.i.i45 = xor i64 %res.lobit.i.i.i42, %shr.i.i.i.i44
  %add.i.i.i.i46 = add nuw nsw i64 %xor3.i.i.i.i45, %shr.i.i.i.i44
  %cmp.i.i.i.i47 = icmp eq i64 %add.i.i.i.i46, 2
  %conv11.i.i.i48 = zext i1 %cmp.i.i.i.i47 to i8
  store i8 %conv11.i.i.i48, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %148, %struct.Memory** %MEMORY, align 8
  br label %inst_401448

inst_401448:                                      ; preds = %inst_401444
  %156 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %156, i64* @RIP_2472_293da00, align 8
  %157 = add i64 %156, 4
  store volatile i64 %157, i64* %NEXT_PC, align 8
  %158 = load i64, i64* @RBP_2328_293da00, align 8
  %159 = sub i64 %158, 8
  %160 = load i64, i64* @RDI_2296_293da00, align 8
  %161 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %162 = inttoptr i64 %159 to i64*
  %163 = inttoptr i64 %159 to i64*
  %164 = ptrtoint i64* %163 to i64
  store i64 %160, i64* %162, align 8
  store volatile %struct.Memory* %161, %struct.Memory** %MEMORY, align 8
  br label %inst_40144c

inst_40144c:                                      ; preds = %inst_401448
  %165 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %165, i64* @RIP_2472_293da00, align 8
  %166 = add i64 %165, 4
  store volatile i64 %166, i64* %NEXT_PC, align 8
  %167 = load i64, i64* @RBP_2328_293da00, align 8
  %168 = sub i64 %167, 16
  %169 = load i64, i64* @RSI_2280_293da00, align 8
  %170 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %171 = inttoptr i64 %168 to i64*
  %172 = inttoptr i64 %168 to i64*
  %173 = ptrtoint i64* %172 to i64
  store i64 %169, i64* %171, align 8
  store volatile %struct.Memory* %170, %struct.Memory** %MEMORY, align 8
  br label %inst_401450

inst_401450:                                      ; preds = %inst_40144c
  %174 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %174, i64* @RIP_2472_293da00, align 8
  %175 = add i64 %174, 4
  store volatile i64 %175, i64* %NEXT_PC, align 8
  %176 = load i64, i64* @RBP_2328_293da00, align 8
  %177 = sub i64 %176, 24
  %178 = load i64, i64* @RDX_2264_293da00, align 8
  %179 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %180 = inttoptr i64 %177 to i64*
  %181 = inttoptr i64 %177 to i64*
  %182 = ptrtoint i64* %181 to i64
  store i64 %178, i64* %180, align 8
  store volatile %struct.Memory* %179, %struct.Memory** %MEMORY, align 8
  br label %inst_401454

inst_401454:                                      ; preds = %inst_401450
  %183 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %183, i64* @RIP_2472_293da00, align 8
  %184 = add i64 %183, 4
  store volatile i64 %184, i64* %NEXT_PC, align 8
  %185 = load i64, i64* @RBP_2328_293da00, align 8
  %186 = sub i64 %185, 32
  %187 = load i64, i64* @RCX_2248_293da00, align 8
  %188 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %189 = inttoptr i64 %186 to i64*
  %190 = inttoptr i64 %186 to i64*
  %191 = ptrtoint i64* %190 to i64
  store i64 %187, i64* %189, align 8
  store volatile %struct.Memory* %188, %struct.Memory** %MEMORY, align 8
  br label %inst_401458

inst_401458:                                      ; preds = %inst_401454
  %192 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %192, i64* @RIP_2472_293da00, align 8
  %193 = add i64 %192, 4
  store volatile i64 %193, i64* %NEXT_PC, align 8
  %194 = load i64, i64* @RBP_2328_293da00, align 8
  %195 = sub i64 %194, 56
  %196 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %195, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %196, %struct.Memory** %MEMORY, align 8
  br label %inst_40145c

inst_40145c:                                      ; preds = %inst_401458
  %197 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %197, i64* @RIP_2472_293da00, align 8
  %198 = add i64 %197, 5
  store volatile i64 %198, i64* %NEXT_PC, align 8
  %199 = load i64, i64* %NEXT_PC, align 8
  %200 = add i64 %199, 255
  %201 = load i64, i64* %NEXT_PC, align 8
  %202 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %203 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i60 = add i64 %203, -8
  %204 = inttoptr i64 %sub.i.i60 to i64*
  %205 = inttoptr i64 %sub.i.i60 to i64*
  %206 = ptrtoint i64* %205 to i64
  store i64 %201, i64* %204, align 8
  store i64 %sub.i.i60, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %200, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %200, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %201, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %202, %struct.Memory** %MEMORY, align 8
  %207 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %208 = call %struct.Memory* @sub_401560__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoC2Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %207)
  store %struct.Memory* %208, %struct.Memory** %MEMORY, align 8
  store i8* @data_401461, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401461 to i64), i64* %NEXT_PC, align 8
  br label %inst_401461

inst_401461:                                      ; preds = %inst_40145c
  %209 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %209, i64* @RIP_2472_293da00, align 8
  %210 = add i64 %209, 4
  store volatile i64 %210, i64* %NEXT_PC, align 8
  %211 = load i64, i64* @RBP_2328_293da00, align 8
  %212 = sub i64 %211, 8
  %213 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %214 = inttoptr i64 %212 to i64*
  %215 = inttoptr i64 %212 to i64*
  %216 = ptrtoint i64* %215 to i64
  %217 = load i64, i64* %214, align 8
  store i64 %217, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %213, %struct.Memory** %MEMORY, align 8
  br label %inst_401465

inst_401465:                                      ; preds = %inst_401461
  %218 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %218, i64* @RIP_2472_293da00, align 8
  %219 = add i64 %218, 4
  store volatile i64 %219, i64* %NEXT_PC, align 8
  %220 = load i64, i64* @RBP_2328_293da00, align 8
  %221 = sub i64 %220, 24
  %222 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %223 = inttoptr i64 %221 to i64*
  %224 = inttoptr i64 %221 to i64*
  %225 = ptrtoint i64* %224 to i64
  %226 = load i64, i64* %223, align 8
  store i64 %226, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %222, %struct.Memory** %MEMORY, align 8
  br label %inst_401469

inst_401469:                                      ; preds = %inst_401465
  %227 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %227, i64* @RIP_2472_293da00, align 8
  %228 = add i64 %227, 4
  store volatile i64 %228, i64* %NEXT_PC, align 8
  %229 = load i64, i64* @RBP_2328_293da00, align 8
  %230 = sub i64 %229, 48
  %231 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %230, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %231, %struct.Memory** %MEMORY, align 8
  br label %inst_40146d

inst_40146d:                                      ; preds = %inst_401469
  %232 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %232, i64* @RIP_2472_293da00, align 8
  %233 = add i64 %232, 2
  store volatile i64 %233, i64* %NEXT_PC, align 8
  %234 = load i64, i64* @RAX_2216_293da00, align 8
  %235 = load i64, i64* %NEXT_PC, align 8
  %236 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %237 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i90 = add i64 %237, -8
  %238 = inttoptr i64 %sub.i.i90 to i64*
  %239 = inttoptr i64 %sub.i.i90 to i64*
  %240 = ptrtoint i64* %239 to i64
  store i64 %235, i64* %238, align 8
  store i64 %sub.i.i90, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %234, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %234, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %235, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %236, %struct.Memory** %MEMORY, align 8
  %241 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %242 = load i64, i64* %NEXT_PC, align 8
  %243 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %243)
  %244 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %244)
  %245 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %245)
  %246 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %246)
  %247 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %247)
  %248 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %248)
  %249 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %249)
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE.i, align 8, !noalias !1318
  store %struct.Memory* %241, %struct.Memory** %MEMORY.i, align 8, !noalias !1318
  store volatile i64 %242, i64* %NEXT_PC.i, align 8, !noalias !1318
  store volatile i64 0, i64* %ESBASE.i, align 8, !noalias !1318
  store volatile i64 0, i64* %DSBASE.i, align 8, !noalias !1318
  store volatile i64 0, i64* %CSBASE.i, align 8, !noalias !1318
  store volatile i64 0, i64* %SSBASE.i, align 8, !noalias !1318
  %250 = inttoptr i64 %242 to i64 (i64, i64, i64, i64, i64, i64, i64, i64)*
  %251 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1322, !noalias !1323
  %252 = add i64 %251, 8
  %253 = load i64*, i64** @RSP_2312_2948f30, align 8
  %254 = load i64*, i64** @RSP_2312_2948f30, align 8
  %255 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1322, !noalias !1323
  %256 = ptrtoint i64* %254 to i64
  %257 = load i64, i64* %253, align 8
  %param0.i = load i64, i64* @RDI_2296_293da00, align 8, !alias.scope !1322, !noalias !1323
  %param1.i = load i64, i64* @RSI_2280_293da00, align 8, !alias.scope !1322, !noalias !1323
  %param2.i = load i64, i64* @RDX_2264_293da00, align 8, !alias.scope !1322, !noalias !1323
  %param3.i = load i64, i64* @RCX_2248_293da00, align 8, !alias.scope !1322, !noalias !1323
  %param4.i = load i64, i64* @R8_2344_293da00, align 8, !alias.scope !1322, !noalias !1323
  %param5.i = load i64, i64* @R9_2360_293da00, align 8, !alias.scope !1322, !noalias !1323
  %258 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1322, !noalias !1323
  %259 = add i64 %258, 8
  %260 = inttoptr i64 %259 to i64*
  %261 = inttoptr i64 %259 to i64*
  %262 = ptrtoint i64* %261 to i64
  %263 = load i64, i64* %260, align 8
  %264 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1322, !noalias !1323
  %265 = add i64 %264, 16
  %266 = inttoptr i64 %265 to i64*
  %267 = inttoptr i64 %265 to i64*
  %268 = ptrtoint i64* %267 to i64
  %269 = load i64, i64* %266, align 8
  %270 = call i64 %250(i64 %param0.i, i64 %param1.i, i64 %param2.i, i64 %param3.i, i64 %param4.i, i64 %param5.i, i64 %263, i64 %269) #14
  store volatile i64 %270, i64* @RAX_2216_293da00, align 8, !alias.scope !1322, !noalias !1323
  store i64 %257, i64* %NEXT_PC.i, align 8, !noalias !1318
  store volatile i64 %252, i64* @RSP_2312_293da00, align 8, !alias.scope !1322, !noalias !1323
  %271 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %271)
  %272 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %272)
  %273 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %273)
  %274 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %274)
  %275 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %275)
  %276 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %276)
  %277 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %277)
  store %struct.Memory* %241, %struct.Memory** %MEMORY, align 8
  store i8* @data_40146f, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_40146f to i64), i64* %NEXT_PC, align 8
  br label %inst_40146f

inst_40146f:                                      ; preds = %inst_40146d
  %278 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %278, i64* @RIP_2472_293da00, align 8
  %279 = add i64 %278, 5
  store volatile i64 %279, i64* %NEXT_PC, align 8
  %280 = load i64, i64* @RBP_2328_293da00, align 8
  %281 = sub i64 %280, 96
  %282 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %retval.sroa.0.0.copyload.i.i = load double, double* @XMM0_16_293d8f8, align 1, !tbaa.struct !1324
  %283 = inttoptr i64 %281 to double*
  %284 = inttoptr i64 %281 to double*
  %285 = ptrtoint double* %284 to i64
  store double %retval.sroa.0.0.copyload.i.i, double* %283, align 8
  store volatile %struct.Memory* %282, %struct.Memory** %MEMORY, align 8
  br label %inst_401474

inst_401474:                                      ; preds = %inst_40146f
  %286 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %286, i64* @RIP_2472_293da00, align 8
  %287 = add i64 %286, 5
  store volatile i64 %287, i64* %NEXT_PC, align 8
  %288 = load i64, i64* %NEXT_PC, align 8
  %289 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %288, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %288, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %289, %struct.Memory** %MEMORY, align 8
  br label %inst_401479

inst_40147e:                                      ; preds = %inst_401479
  %290 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %290, i64* @RIP_2472_293da00, align 8
  %291 = add i64 %290, 5
  store volatile i64 %291, i64* %NEXT_PC, align 8
  %292 = load i64, i64* @RBP_2328_293da00, align 8
  %293 = sub i64 %292, 64
  %294 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %retval.sroa.0.0.copyload.i.i96 = load double, double* @XMM0_16_293d8f8, align 1, !tbaa.struct !1324
  %295 = inttoptr i64 %293 to double*
  %296 = inttoptr i64 %293 to double*
  %297 = ptrtoint double* %296 to i64
  store double %retval.sroa.0.0.copyload.i.i96, double* %295, align 8
  store volatile %struct.Memory* %294, %struct.Memory** %MEMORY, align 8
  br label %inst_401483

inst_401483:                                      ; preds = %inst_40147e
  %298 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %298, i64* @RIP_2472_293da00, align 8
  %299 = add i64 %298, 4
  store volatile i64 %299, i64* %NEXT_PC, align 8
  %300 = load i64, i64* @RBP_2328_293da00, align 8
  %301 = sub i64 %300, 48
  %302 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %303 = inttoptr i64 %301 to i64*
  %304 = inttoptr i64 %301 to i64*
  %305 = ptrtoint i64* %304 to i64
  %306 = load i64, i64* %303, align 8
  store i64 %306, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %302, %struct.Memory** %MEMORY, align 8
  br label %inst_401487

inst_401487:                                      ; preds = %inst_401483
  %307 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %307, i64* @RIP_2472_293da00, align 8
  %308 = add i64 %307, 4
  store volatile i64 %308, i64* %NEXT_PC, align 8
  %309 = load i64, i64* @RAX_2216_293da00, align 8
  %310 = load i64, i64* @RBP_2328_293da00, align 8
  %311 = sub i64 %310, 24
  %312 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %313 = inttoptr i64 %311 to i64*
  %314 = inttoptr i64 %311 to i64*
  %315 = ptrtoint i64* %314 to i64
  %316 = load i64, i64* %313, align 8
  %sub.i.i100 = sub i64 %309, %316
  %cmp.i.i.i101 = icmp ugt i64 %316, %309
  %conv.i.i102 = zext i1 %cmp.i.i.i101 to i8
  store i8 %conv.i.i102, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i104 = trunc i64 %sub.i.i100 to i32
  %conv.i.i.i.i.i105 = and i32 %conv.i.i.i.i104, 255
  %317 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i105) #14, !range !1308
  %318 = trunc i32 %317 to i8
  %319 = and i8 %318, 1
  %320 = xor i8 %319, 1
  store i8 %320, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i107 = xor i64 %316, %309
  %xor1.i.i.i.i108 = xor i64 %xor.i25.i.i.i107, %sub.i.i100
  %and.i.i.i.i109 = lshr i64 %xor1.i.i.i.i108, 4
  %321 = trunc i64 %and.i.i.i.i109 to i8
  %322 = and i8 %321, 1
  store i8 %322, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i111 = icmp eq i64 %sub.i.i100, 0
  %conv5.i.i.i112 = zext i1 %cmp.i24.i.i.i111 to i8
  store i8 %conv5.i.i.i112, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i114 = lshr i64 %sub.i.i100, 63
  %323 = trunc i64 %res.lobit.i.i.i114 to i8
  store i8 %323, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i116 = lshr i64 %309, 63
  %shr1.i.i.i.i = lshr i64 %316, 63
  %xor.i.i.i.i117 = xor i64 %shr1.i.i.i.i, %shr.i.i.i.i116
  %xor3.i.i.i.i118 = xor i64 %res.lobit.i.i.i114, %shr.i.i.i.i116
  %add.i.i.i.i119 = add nuw nsw i64 %xor3.i.i.i.i118, %xor.i.i.i.i117
  %cmp.i.i.i.i120 = icmp eq i64 %add.i.i.i.i119, 2
  %conv11.i.i.i121 = zext i1 %cmp.i.i.i.i120 to i8
  store i8 %conv11.i.i.i121, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %312, %struct.Memory** %MEMORY, align 8
  br label %inst_40148b

inst_40148b:                                      ; preds = %inst_401487
  %324 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %324, i64* @RIP_2472_293da00, align 8
  %325 = add i64 %324, 6
  store volatile i64 %325, i64* %NEXT_PC, align 8
  %326 = load i64, i64* %NEXT_PC, align 8
  %327 = add i64 %326, 35
  %328 = load i64, i64* %NEXT_PC, align 8
  %329 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %330 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %tobool.not.i = icmp eq i8 %330, 0
  %frombool.i = zext i1 %tobool.not.i to i8
  store i8 %frombool.i, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %cond1.i.i = select i1 %tobool.not.i, i64 %327, i64 %328
  store i64 %cond1.i.i, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %329, %struct.Memory** %MEMORY, align 8
  %331 = load i8, i8* %BRANCH_TAKEN, align 1
  %332 = icmp eq i8 %331, 1
  br i1 %332, label %333, label %334

333:                                              ; preds = %inst_40148b
  br label %inst_4014b4

334:                                              ; preds = %inst_40148b
  br label %inst_401491

inst_401495:                                      ; preds = %inst_401491
  %335 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %335, i64* @RIP_2472_293da00, align 8
  %336 = add i64 %335, 5
  store volatile i64 %336, i64* %NEXT_PC, align 8
  %337 = load i64, i64* %NEXT_PC, align 8
  %338 = sub i64 %337, 1082
  %339 = load i64, i64* %NEXT_PC, align 8
  %340 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %341 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i124 = add i64 %341, -8
  %342 = inttoptr i64 %sub.i.i124 to i64*
  %343 = inttoptr i64 %sub.i.i124 to i64*
  %344 = ptrtoint i64* %343 to i64
  store i64 %339, i64* %342, align 8
  store i64 %sub.i.i124, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %338, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %338, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %339, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %340, %struct.Memory** %MEMORY, align 8
  %345 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %346 = call %struct.Memory* @ext_4041f0__ZSt24__throw_invalid_argumentPKc(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %345)
  store %struct.Memory* %346, %struct.Memory** %MEMORY, align 8
  store i8* @data_40149a, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_40149a to i64), i64* %NEXT_PC, align 8
  br label %inst_40149a

inst_40149a:                                      ; preds = %inst_401495
  %347 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %347, i64* @RIP_2472_293da00, align 8
  %348 = add i64 %347, 5
  store volatile i64 %348, i64* %NEXT_PC, align 8
  %349 = load i64, i64* %NEXT_PC, align 8
  %350 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %349, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %349, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %350, %struct.Memory** %MEMORY, align 8
  br label %inst_40149f

inst_4014a3:                                      ; preds = %inst_40149f
  %351 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %351, i64* @RIP_2472_293da00, align 8
  %352 = add i64 %351, 3
  store volatile i64 %352, i64* %NEXT_PC, align 8
  %353 = load i64, i64* @RBP_2328_293da00, align 8
  %354 = sub i64 %353, 76
  %355 = load i32, i32* @RDX_2264_293d9e8, align 4
  %356 = zext i32 %355 to i64
  %357 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %358 = inttoptr i64 %354 to i32*
  %359 = inttoptr i64 %354 to i32*
  %360 = ptrtoint i32* %359 to i64
  store i32 %355, i32* %358, align 4
  store volatile %struct.Memory* %357, %struct.Memory** %MEMORY, align 8
  br label %inst_4014a6

inst_4014a6:                                      ; preds = %inst_4014a3
  %361 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %361, i64* @RIP_2472_293da00, align 8
  %362 = add i64 %361, 4
  store volatile i64 %362, i64* %NEXT_PC, align 8
  %363 = load i64, i64* @RBP_2328_293da00, align 8
  %364 = sub i64 %363, 56
  %365 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %364, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %365, %struct.Memory** %MEMORY, align 8
  br label %inst_4014aa

inst_4014aa:                                      ; preds = %inst_4014a6
  %366 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %366, i64* @RIP_2472_293da00, align 8
  %367 = add i64 %366, 5
  store volatile i64 %367, i64* %NEXT_PC, align 8
  %368 = load i64, i64* %NEXT_PC, align 8
  %369 = add i64 %368, 273
  %370 = load i64, i64* %NEXT_PC, align 8
  %371 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %372 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i130 = add i64 %372, -8
  %373 = inttoptr i64 %sub.i.i130 to i64*
  %374 = inttoptr i64 %sub.i.i130 to i64*
  %375 = ptrtoint i64* %374 to i64
  store i64 %370, i64* %373, align 8
  store i64 %sub.i.i130, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %369, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %369, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %370, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %371, %struct.Memory** %MEMORY, align 8
  %376 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %377 = call %struct.Memory* @sub_4015c0__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoD2Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %376)
  store %struct.Memory* %377, %struct.Memory** %MEMORY, align 8
  store i8* @data_4014af, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4014af to i64), i64* %NEXT_PC, align 8
  br label %inst_4014af

inst_4014af:                                      ; preds = %inst_4014aa
  %378 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %378, i64* @RIP_2472_293da00, align 8
  %379 = add i64 %378, 5
  store volatile i64 %379, i64* %NEXT_PC, align 8
  %380 = load i64, i64* %NEXT_PC, align 8
  %381 = add i64 %380, 152
  %382 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %381, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %381, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %382, %struct.Memory** %MEMORY, align 8
  br label %inst_40154c

inst_4014b9:                                      ; preds = %inst_4014b4
  %383 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %383, i64* @RIP_2472_293da00, align 8
  %384 = add i64 %383, 3
  store volatile i64 %384, i64* %NEXT_PC, align 8
  %385 = load i32*, i32** @RAX_2216_294e270, align 8
  %386 = load i32*, i32** @RAX_2216_294e270, align 8
  %387 = load i64, i64* @RAX_2216_293da00, align 8
  %388 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %389 = ptrtoint i32* %386 to i64
  %390 = load i32, i32* %385, align 4
  %sub.i.i139 = sub i32 %390, 34
  %cmp.i.i.i140 = icmp ult i32 %390, 34
  %conv.i12.i = zext i1 %cmp.i.i.i140 to i8
  store i8 %conv.i12.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i.i142 = and i32 %sub.i.i139, 255
  %391 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i142) #14, !range !1308
  %392 = trunc i32 %391 to i8
  %393 = and i8 %392, 1
  %394 = xor i8 %393, 1
  store i8 %394, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i144 = xor i32 %390, 34
  %xor1.i.i.i.i145 = xor i32 %xor.i25.i.i.i144, %sub.i.i139
  %and.i.i.i.i146 = lshr i32 %xor1.i.i.i.i145, 4
  %395 = trunc i32 %and.i.i.i.i146 to i8
  %396 = and i8 %395, 1
  store i8 %396, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i148 = icmp eq i32 %sub.i.i139, 0
  %conv5.i.i.i149 = zext i1 %cmp.i24.i.i.i148 to i8
  store i8 %conv5.i.i.i149, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i151 = lshr i32 %sub.i.i139, 31
  %397 = trunc i32 %res.lobit.i.i.i151 to i8
  store i8 %397, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i153 = lshr i32 %390, 31
  %xor3.i.i.i.i154 = xor i32 %res.lobit.i.i.i151, %shr.i.i.i.i153
  %add.i.i.i.i155 = add nuw nsw i32 %xor3.i.i.i.i154, %shr.i.i.i.i153
  %cmp.i.i.i.i156 = icmp eq i32 %add.i.i.i.i155, 2
  %conv11.i.i.i157 = zext i1 %cmp.i.i.i.i156 to i8
  store i8 %conv11.i.i.i157, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %388, %struct.Memory** %MEMORY, align 8
  br label %inst_4014bc

inst_4014bc:                                      ; preds = %inst_4014b9
  %398 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %398, i64* @RIP_2472_293da00, align 8
  %399 = add i64 %398, 2
  store volatile i64 %399, i64* %NEXT_PC, align 8
  %400 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i8 1, i8* @RCX_2248_293d9b8, align 1, !tbaa !1314
  store volatile %struct.Memory* %400, %struct.Memory** %MEMORY, align 8
  br label %inst_4014be

inst_4014be:                                      ; preds = %inst_4014bc
  %401 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %401, i64* @RIP_2472_293da00, align 8
  %402 = add i64 %401, 3
  store volatile i64 %402, i64* %NEXT_PC, align 8
  %403 = load i64, i64* @RBP_2328_293da00, align 8
  %404 = sub i64 %403, 97
  %405 = load i8, i8* @RCX_2248_293d9b8, align 1
  %406 = zext i8 %405 to i64
  %407 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %408 = inttoptr i64 %404 to i8*
  %409 = inttoptr i64 %404 to i8*
  %410 = ptrtoint i8* %409 to i64
  store i8 %405, i8* %408, align 1
  store volatile %struct.Memory* %407, %struct.Memory** %MEMORY, align 8
  br label %inst_4014c1

inst_4014c1:                                      ; preds = %inst_4014be
  %411 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %411, i64* @RIP_2472_293da00, align 8
  %412 = add i64 %411, 6
  store volatile i64 %412, i64* %NEXT_PC, align 8
  %413 = load i64, i64* %NEXT_PC, align 8
  %414 = add i64 %413, 29
  %415 = load i64, i64* %NEXT_PC, align 8
  %416 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %417 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  store i8 %417, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %tobool.not.i164 = icmp eq i8 %417, 0
  %cond1.i.i165 = select i1 %tobool.not.i164, i64 %415, i64 %414
  store i64 %cond1.i.i165, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %416, %struct.Memory** %MEMORY, align 8
  %418 = load i8, i8* %BRANCH_TAKEN, align 1
  %419 = icmp eq i8 %418, 1
  br i1 %419, label %420, label %421

420:                                              ; preds = %inst_4014c1
  br label %inst_4014e4

421:                                              ; preds = %inst_4014c1
  br label %inst_4014c7

inst_4014cc:                                      ; preds = %inst_4014c7
  %422 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %422, i64* @RIP_2472_293da00, align 8
  %423 = add i64 %422, 5
  store volatile i64 %423, i64* %NEXT_PC, align 8
  %424 = load i64, i64* %NEXT_PC, align 8
  %425 = add i64 %424, 207
  %426 = load i64, i64* %NEXT_PC, align 8
  %427 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %428 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i168 = add i64 %428, -8
  %429 = inttoptr i64 %sub.i.i168 to i64*
  %430 = inttoptr i64 %sub.i.i168 to i64*
  %431 = ptrtoint i64* %430 to i64
  store i64 %426, i64* %429, align 8
  store i64 %sub.i.i168, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %425, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %425, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %426, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %427, %struct.Memory** %MEMORY, align 8
  %432 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %433 = call %struct.Memory* @sub_4015a0__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN10_Range_chk6_S_chkEdSt17integral_constantIbLb0EE(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %432)
  store %struct.Memory* %433, %struct.Memory** %MEMORY, align 8
  store i8* @data_4014d1, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4014d1 to i64), i64* %NEXT_PC, align 8
  br label %inst_4014d1

inst_4014d1:                                      ; preds = %inst_4014cc
  %434 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %434, i64* @RIP_2472_293da00, align 8
  %435 = add i64 %434, 3
  store volatile i64 %435, i64* %NEXT_PC, align 8
  %436 = load i64, i64* @RBP_2328_293da00, align 8
  %437 = sub i64 %436, 98
  %438 = load i8, i8* @RAX_2216_293d9b8, align 1
  %439 = zext i8 %438 to i64
  %440 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %441 = inttoptr i64 %437 to i8*
  %442 = inttoptr i64 %437 to i8*
  %443 = ptrtoint i8* %442 to i64
  store i8 %438, i8* %441, align 1
  store volatile %struct.Memory* %440, %struct.Memory** %MEMORY, align 8
  br label %inst_4014d4

inst_4014d4:                                      ; preds = %inst_4014d1
  %444 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %444, i64* @RIP_2472_293da00, align 8
  %445 = add i64 %444, 5
  store volatile i64 %445, i64* %NEXT_PC, align 8
  %446 = load i64, i64* %NEXT_PC, align 8
  %447 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %446, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %446, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %447, %struct.Memory** %MEMORY, align 8
  br label %inst_4014d9

inst_4014dc:                                      ; preds = %inst_4014d9
  %448 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %448, i64* @RIP_2472_293da00, align 8
  %449 = add i64 %448, 3
  store volatile i64 %449, i64* %NEXT_PC, align 8
  %450 = load i64, i64* @RBP_2328_293da00, align 8
  %451 = sub i64 %450, 97
  %452 = load i8, i8* @RAX_2216_293d9b8, align 1
  %453 = zext i8 %452 to i64
  %454 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %455 = inttoptr i64 %451 to i8*
  %456 = inttoptr i64 %451 to i8*
  %457 = ptrtoint i8* %456 to i64
  store i8 %452, i8* %455, align 1
  store volatile %struct.Memory* %454, %struct.Memory** %MEMORY, align 8
  br label %inst_4014df

inst_4014df:                                      ; preds = %inst_4014dc
  %458 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %458, i64* @RIP_2472_293da00, align 8
  %459 = add i64 %458, 5
  store volatile i64 %459, i64* %NEXT_PC, align 8
  %460 = load i64, i64* %NEXT_PC, align 8
  %461 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %460, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %460, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %461, %struct.Memory** %MEMORY, align 8
  br label %inst_4014e4

inst_4014e7:                                      ; preds = %inst_4014e4
  %462 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %462, i64* @RIP_2472_293da00, align 8
  %463 = add i64 %462, 2
  store volatile i64 %463, i64* %NEXT_PC, align 8
  %464 = load i8, i8* @RAX_2216_293d9b8, align 1
  %465 = zext i8 %464 to i64
  %466 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %and3.i12.i = and i64 1, %465
  %and3.i.i = trunc i64 %and3.i12.i to i8
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %467 = trunc i64 %and3.i12.i to i32
  %conv.i.i.i = and i32 %467, 255
  %468 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i) #14, !range !1308
  %469 = trunc i32 %468 to i8
  %470 = and i8 %469, 1
  %471 = xor i8 %470, 1
  store i8 %471, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i = icmp eq i8 %and3.i.i, 0
  %conv3.i.i = zext i1 %cmp.i1.i.i to i8
  store i8 %conv3.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i = lshr i8 %and3.i.i, 7
  store i8 %res.lobit.i.i, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %466, %struct.Memory** %MEMORY, align 8
  br label %inst_4014e9

inst_4014e9:                                      ; preds = %inst_4014e7
  %472 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %472, i64* @RIP_2472_293da00, align 8
  %473 = add i64 %472, 6
  store volatile i64 %473, i64* %NEXT_PC, align 8
  %474 = load i64, i64* %NEXT_PC, align 8
  %475 = add i64 %474, 5
  %476 = load i64, i64* %NEXT_PC, align 8
  %477 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %478 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %tobool.not.i210 = icmp eq i8 %478, 0
  %frombool.i211 = zext i1 %tobool.not.i210 to i8
  store i8 %frombool.i211, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %cond1.i.i212 = select i1 %tobool.not.i210, i64 %475, i64 %476
  store i64 %cond1.i.i212, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %477, %struct.Memory** %MEMORY, align 8
  %479 = load i8, i8* %BRANCH_TAKEN, align 1
  %480 = icmp eq i8 %479, 1
  br i1 %480, label %481, label %482

481:                                              ; preds = %inst_4014e9
  br label %inst_4014f4

482:                                              ; preds = %inst_4014e9
  br label %inst_4014ef

inst_4014f8:                                      ; preds = %inst_4014f4
  %483 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %483, i64* @RIP_2472_293da00, align 8
  %484 = add i64 %483, 5
  store volatile i64 %484, i64* %NEXT_PC, align 8
  %485 = load i64, i64* %NEXT_PC, align 8
  %486 = sub i64 %485, 1053
  %487 = load i64, i64* %NEXT_PC, align 8
  %488 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %489 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i215 = add i64 %489, -8
  %490 = inttoptr i64 %sub.i.i215 to i64*
  %491 = inttoptr i64 %sub.i.i215 to i64*
  %492 = ptrtoint i64* %491 to i64
  store i64 %487, i64* %490, align 8
  store i64 %sub.i.i215, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %486, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %486, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %487, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %488, %struct.Memory** %MEMORY, align 8
  %493 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %494 = call %struct.Memory* @ext_404230__ZSt20__throw_out_of_rangePKc(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %493)
  store %struct.Memory* %494, %struct.Memory** %MEMORY, align 8
  store i8* @data_4014fd, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4014fd to i64), i64* %NEXT_PC, align 8
  br label %inst_4014fd

inst_4014fd:                                      ; preds = %inst_4014f8
  %495 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %495, i64* @RIP_2472_293da00, align 8
  %496 = add i64 %495, 5
  store volatile i64 %496, i64* %NEXT_PC, align 8
  %497 = load i64, i64* %NEXT_PC, align 8
  %498 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %497, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %497, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %498, %struct.Memory** %MEMORY, align 8
  br label %inst_401502

inst_401507:                                      ; preds = %inst_401502
  %499 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %499, i64* @RIP_2472_293da00, align 8
  %500 = add i64 %499, 5
  store volatile i64 %500, i64* %NEXT_PC, align 8
  %501 = load i64, i64* @RBP_2328_293da00, align 8
  %502 = sub i64 %501, 40
  %XMM06 = bitcast [16 x i8]* %XMM0 to i8*
  %503 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %retval.sroa.0.0.copyload.i.i207 = load double, double* @XMM0_16_293d8f8, align 1, !tbaa.struct !1324
  %504 = inttoptr i64 %502 to double*
  %505 = inttoptr i64 %502 to double*
  %506 = ptrtoint double* %505 to i64
  store double %retval.sroa.0.0.copyload.i.i207, double* %504, align 8
  store volatile %struct.Memory* %503, %struct.Memory** %MEMORY, align 8
  br label %inst_40150c

inst_40150c:                                      ; preds = %inst_401507
  %507 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %507, i64* @RIP_2472_293da00, align 8
  %508 = add i64 %507, 5
  store volatile i64 %508, i64* %NEXT_PC, align 8
  %509 = load i64, i64* %NEXT_PC, align 8
  %510 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %509, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %509, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %510, %struct.Memory** %MEMORY, align 8
  br label %inst_401511

inst_401516:                                      ; preds = %inst_401511
  %511 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %511, i64* @RIP_2472_293da00, align 8
  %512 = add i64 %511, 6
  store volatile i64 %512, i64* %NEXT_PC, align 8
  %513 = load i64, i64* %NEXT_PC, align 8
  %514 = add i64 %513, 18
  %515 = load i64, i64* %NEXT_PC, align 8
  %516 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %517 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  store i8 %517, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %tobool.not.i203 = icmp eq i8 %517, 0
  %cond1.i.i204 = select i1 %tobool.not.i203, i64 %515, i64 %514
  store i64 %cond1.i.i204, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %516, %struct.Memory** %MEMORY, align 8
  %518 = load i8, i8* %BRANCH_TAKEN, align 1
  %519 = icmp eq i8 %518, 1
  br i1 %519, label %520, label %521

520:                                              ; preds = %inst_401516
  br label %inst_40152e

521:                                              ; preds = %inst_401516
  br label %inst_40151c

inst_401520:                                      ; preds = %inst_40151c
  %522 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %522, i64* @RIP_2472_293da00, align 8
  %523 = add i64 %522, 4
  store volatile i64 %523, i64* %NEXT_PC, align 8
  %524 = load i64, i64* @RBP_2328_293da00, align 8
  %525 = sub i64 %524, 24
  %526 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %527 = inttoptr i64 %525 to i64*
  %528 = inttoptr i64 %525 to i64*
  %529 = ptrtoint i64* %528 to i64
  %530 = load i64, i64* %527, align 8
  store i64 %530, i64* @RCX_2248_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %526, %struct.Memory** %MEMORY, align 8
  br label %inst_401524

inst_401524:                                      ; preds = %inst_401520
  %531 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %531, i64* @RIP_2472_293da00, align 8
  %532 = add i64 %531, 3
  store volatile i64 %532, i64* %NEXT_PC, align 8
  %533 = load i64, i64* @RAX_2216_293da00, align 8
  %534 = load i64, i64* @RCX_2248_293da00, align 8
  %535 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i176 = sub i64 %533, %534
  store i64 %sub.i.i176, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  %cmp.i.i.i177 = icmp ult i64 %533, %534
  %conv.i.i178 = zext i1 %cmp.i.i.i177 to i8
  store i8 %conv.i.i178, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i180 = trunc i64 %sub.i.i176 to i32
  %conv.i.i.i.i.i181 = and i32 %conv.i.i.i.i180, 255
  %536 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i181) #14, !range !1308
  %537 = trunc i32 %536 to i8
  %538 = and i8 %537, 1
  %539 = xor i8 %538, 1
  store i8 %539, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i183 = xor i64 %534, %533
  %xor1.i.i.i.i184 = xor i64 %xor.i25.i.i.i183, %sub.i.i176
  %and.i.i.i.i185 = lshr i64 %xor1.i.i.i.i184, 4
  %540 = trunc i64 %and.i.i.i.i185 to i8
  %541 = and i8 %540, 1
  store i8 %541, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i187 = icmp eq i64 %sub.i.i176, 0
  %conv5.i.i.i188 = zext i1 %cmp.i24.i.i.i187 to i8
  store i8 %conv5.i.i.i188, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i190 = lshr i64 %sub.i.i176, 63
  %542 = trunc i64 %res.lobit.i.i.i190 to i8
  store i8 %542, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i192 = lshr i64 %533, 63
  %shr1.i.i.i.i193 = lshr i64 %534, 63
  %xor.i.i.i.i194 = xor i64 %shr1.i.i.i.i193, %shr.i.i.i.i192
  %xor3.i.i.i.i195 = xor i64 %res.lobit.i.i.i190, %shr.i.i.i.i192
  %add.i.i.i.i196 = add nuw nsw i64 %xor3.i.i.i.i195, %xor.i.i.i.i194
  %cmp.i.i.i.i197 = icmp eq i64 %add.i.i.i.i196, 2
  %conv11.i.i.i198 = zext i1 %cmp.i.i.i.i197 to i8
  store i8 %conv11.i.i.i198, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %535, %struct.Memory** %MEMORY, align 8
  br label %inst_401527

inst_401527:                                      ; preds = %inst_401524
  %543 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %543, i64* @RIP_2472_293da00, align 8
  %544 = add i64 %543, 4
  store volatile i64 %544, i64* %NEXT_PC, align 8
  %545 = load i64, i64* @RBP_2328_293da00, align 8
  %546 = sub i64 %545, 32
  %547 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %548 = inttoptr i64 %546 to i64*
  %549 = inttoptr i64 %546 to i64*
  %550 = ptrtoint i64* %549 to i64
  %551 = load i64, i64* %548, align 8
  store i64 %551, i64* @RCX_2248_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %547, %struct.Memory** %MEMORY, align 8
  br label %inst_40152b

inst_40152b:                                      ; preds = %inst_401527
  %552 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %552, i64* @RIP_2472_293da00, align 8
  %553 = add i64 %552, 3
  store volatile i64 %553, i64* %NEXT_PC, align 8
  %554 = load i64*, i64** @RCX_2248_2948f30, align 8
  %555 = load i64*, i64** @RCX_2248_2948f30, align 8
  %556 = load i64, i64* @RCX_2248_293da00, align 8
  %557 = load i64, i64* @RAX_2216_293da00, align 8
  %558 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %559 = ptrtoint i64* %555 to i64
  store i64 %557, i64* %554, align 8
  store volatile %struct.Memory* %558, %struct.Memory** %MEMORY, align 8
  br label %inst_40152e

inst_401533:                                      ; preds = %inst_40152e
  %560 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %560, i64* @RIP_2472_293da00, align 8
  %561 = add i64 %560, 4
  store volatile i64 %561, i64* %NEXT_PC, align 8
  %562 = load i64, i64* @RBP_2328_293da00, align 8
  %563 = sub i64 %562, 56
  %564 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %563, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %564, %struct.Memory** %MEMORY, align 8
  br label %inst_401537

inst_401537:                                      ; preds = %inst_401533
  %565 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %565, i64* @RIP_2472_293da00, align 8
  %566 = add i64 %565, 5
  store volatile i64 %566, i64* %NEXT_PC, align 8
  %567 = load i64, i64* @RBP_2328_293da00, align 8
  %568 = sub i64 %567, 112
  %569 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %retval.sroa.0.0.copyload.i.i160 = load double, double* @XMM0_16_293d8f8, align 1, !tbaa.struct !1324
  %570 = inttoptr i64 %568 to double*
  %571 = inttoptr i64 %568 to double*
  %572 = ptrtoint double* %571 to i64
  store double %retval.sroa.0.0.copyload.i.i160, double* %570, align 8
  store volatile %struct.Memory* %569, %struct.Memory** %MEMORY, align 8
  br label %inst_40153c

inst_40153c:                                      ; preds = %inst_401537
  %573 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %573, i64* @RIP_2472_293da00, align 8
  %574 = add i64 %573, 5
  store volatile i64 %574, i64* %NEXT_PC, align 8
  %575 = load i64, i64* %NEXT_PC, align 8
  %576 = add i64 %575, 127
  %577 = load i64, i64* %NEXT_PC, align 8
  %578 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %579 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i135 = add i64 %579, -8
  %580 = inttoptr i64 %sub.i.i135 to i64*
  %581 = inttoptr i64 %sub.i.i135 to i64*
  %582 = ptrtoint i64* %581 to i64
  store i64 %577, i64* %580, align 8
  store i64 %sub.i.i135, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %576, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %576, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %577, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %578, %struct.Memory** %MEMORY, align 8
  %583 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %584 = call %struct.Memory* @sub_4015c0__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoD2Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %583)
  store %struct.Memory* %584, %struct.Memory** %MEMORY, align 8
  store i8* @data_401541, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401541 to i64), i64* %NEXT_PC, align 8
  br label %inst_401541

inst_401541:                                      ; preds = %inst_40153c
  %585 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %585, i64* @RIP_2472_293da00, align 8
  %586 = add i64 %585, 5
  store volatile i64 %586, i64* %NEXT_PC, align 8
  %587 = load i64, i64* @RBP_2328_293da00, align 8
  %588 = sub i64 %587, 112
  %589 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %590 = inttoptr i64 %588 to double*
  %591 = inttoptr i64 %588 to double*
  %592 = ptrtoint double* %591 to i64
  %593 = load double, double* %590, align 8
  store double %593, double* @XMM0_16_293d8f8, align 1, !tbaa !1316
  store double 0.000000e+00, double* @XMM0_24_293d8f8, align 1, !tbaa !1316
  store volatile %struct.Memory* %589, %struct.Memory** %MEMORY, align 8
  br label %inst_401546

inst_401546:                                      ; preds = %inst_401541
  %594 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %594, i64* @RIP_2472_293da00, align 8
  %595 = add i64 %594, 4
  store volatile i64 %595, i64* %NEXT_PC, align 8
  %596 = load i64, i64* @RSP_2312_293da00, align 8
  %597 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %add.i.i65 = add i64 112, %596
  store i64 %add.i.i65, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i66 = icmp ult i64 %add.i.i65, %596
  %cmp1.i.i.i = icmp ult i64 %add.i.i65, 112
  %598 = or i1 %cmp.i.i.i66, %cmp1.i.i.i
  %conv.i.i67 = zext i1 %598 to i8
  store i8 %conv.i.i67, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i69 = trunc i64 %add.i.i65 to i32
  %conv.i.i.i.i.i70 = and i32 %conv.i.i.i.i69, 255
  %599 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i70) #14, !range !1308
  %600 = trunc i32 %599 to i8
  %601 = and i8 %600, 1
  %602 = xor i8 %601, 1
  store i8 %602, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i72 = xor i64 112, %596
  %xor1.i.i.i.i73 = xor i64 %xor.i25.i.i.i72, %add.i.i65
  %and.i.i.i.i74 = lshr i64 %xor1.i.i.i.i73, 4
  %603 = trunc i64 %and.i.i.i.i74 to i8
  %604 = and i8 %603, 1
  store i8 %604, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i76 = icmp eq i64 %add.i.i65, 0
  %conv5.i.i.i77 = zext i1 %cmp.i24.i.i.i76 to i8
  store i8 %conv5.i.i.i77, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i79 = lshr i64 %add.i.i65, 63
  %605 = trunc i64 %res.lobit.i.i.i79 to i8
  store i8 %605, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i81 = lshr i64 %596, 63
  %xor.i.i.i.i = xor i64 %res.lobit.i.i.i79, %shr.i.i.i.i81
  %add.i.i.i.i82 = add nuw nsw i64 %xor.i.i.i.i, %res.lobit.i.i.i79
  %cmp.i.i.i.i83 = icmp eq i64 %add.i.i.i.i82, 2
  %conv11.i.i.i84 = zext i1 %cmp.i.i.i.i83 to i8
  store i8 %conv11.i.i.i84, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %597, %struct.Memory** %MEMORY, align 8
  br label %inst_40154a

inst_40154a:                                      ; preds = %inst_401546
  %606 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %606, i64* @RIP_2472_293da00, align 8
  %607 = add i64 %606, 1
  store volatile i64 %607, i64* %NEXT_PC, align 8
  %608 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %609 = load i64*, i64** @RSP_2312_2948f30, align 8
  %610 = load i64*, i64** @RSP_2312_2948f30, align 8
  %611 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i57 = add i64 %611, 8
  store i64 %add.i.i57, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %612 = ptrtoint i64* %610 to i64
  %613 = load i64, i64* %609, align 8
  store i64 %613, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %608, %struct.Memory** %MEMORY, align 8
  br label %inst_40154b

inst_40154b:                                      ; preds = %inst_40154a
  %614 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %614, i64* @RIP_2472_293da00, align 8
  %615 = add i64 %614, 1
  store volatile i64 %615, i64* %NEXT_PC, align 8
  %616 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %617 = load i64*, i64** @RSP_2312_2948f30, align 8
  %618 = load i64*, i64** @RSP_2312_2948f30, align 8
  %619 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %620 = ptrtoint i64* %618 to i64
  %621 = load i64, i64* %617, align 8
  store i64 %621, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %621, i64* %NEXT_PC, align 8, !tbaa !1290
  %622 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %622, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %616, %struct.Memory** %MEMORY, align 8
  %623 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %623

inst_401550:                                      ; preds = %inst_40154c
  %624 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %624, i64* @RIP_2472_293da00, align 8
  %625 = add i64 %624, 5
  store volatile i64 %625, i64* %NEXT_PC, align 8
  %626 = load i64, i64* %NEXT_PC, align 8
  %627 = sub i64 %626, 1093
  %628 = load i64, i64* %NEXT_PC, align 8
  %629 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %630 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i30 = add i64 %630, -8
  %631 = inttoptr i64 %sub.i.i30 to i64*
  %632 = inttoptr i64 %sub.i.i30 to i64*
  %633 = ptrtoint i64* %632 to i64
  store i64 %628, i64* %631, align 8
  store i64 %sub.i.i30, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %627, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %627, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %628, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %629, %struct.Memory** %MEMORY, align 8
  %634 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %635 = call %struct.Memory* @ext_404240__Unwind_Resume(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %634)
  store %struct.Memory* %635, %struct.Memory** %MEMORY, align 8
  store i8* @data_401555, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401555 to i64), i64* %NEXT_PC, align 8
  br label %inst_401555

inst_401555:                                      ; preds = %inst_401550
  %636 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %636, i64* @RIP_2472_293da00, align 8
  %637 = add i64 %636, 10
  store volatile i64 %637, i64* %NEXT_PC, align 8
  %638 = load i64, i64* @RAX_2216_293da00, align 8
  %639 = load i64, i64* @RAX_2216_293da00, align 8
  %640 = mul i64 %639, 1
  %641 = add i64 %638, %640
  %642 = load i16, i16* @RAX_2216_293d9d0, align 2
  %643 = zext i16 %642 to i64
  %644 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %644, %struct.Memory** %MEMORY, align 8
  br label %inst_40155f

inst_40155f:                                      ; preds = %inst_401555
  %645 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %645, i64* @RIP_2472_293da00, align 8
  %646 = add i64 %645, 1
  store volatile i64 %646, i64* %NEXT_PC, align 8
  %647 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %647, %struct.Memory** %MEMORY, align 8
  %648 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %648
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401290_main(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %1 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 7, i32 0, i32 0
  %2 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0
  %XMM0 = bitcast i64* %2 to [16 x i8]*, !remill_register !1315
  %RSI = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i32 (i32, i8**, i8**)* @main to i64), i64* %NEXT_PC, align 8
  store i32 (i32, i8**, i8**)* @main, i32 (i32, i8**, i8**)** @RIP_2472_2af2220, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401290

inst_401320:                                      ; preds = %inst_40131b
  %3 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %3, i64* @RIP_2472_293da00, align 8
  %4 = add i64 %3, 4
  store volatile i64 %4, i64* %NEXT_PC, align 8
  %5 = load i64, i64* @RBP_2328_293da00, align 8
  %6 = sub i64 %5, 112
  %7 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %6, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %7, %struct.Memory** %MEMORY, align 8
  br label %inst_401324

inst_4013e1:                                      ; preds = %inst_4013dc, %inst_4013cc, %inst_4013b7
  %8 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %8, i64* @RIP_2472_293da00, align 8
  %9 = add i64 %8, 4
  store volatile i64 %9, i64* %NEXT_PC, align 8
  %10 = load i64, i64* @RBP_2328_293da00, align 8
  %11 = sub i64 %10, 40
  %12 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %11, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %12, %struct.Memory** %MEMORY, align 8
  br label %inst_4013e5

inst_401360:                                      ; preds = %inst_40135b
  %13 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %13, i64* @RIP_2472_293da00, align 8
  %14 = add i64 %13, 5
  store volatile i64 %14, i64* %NEXT_PC, align 8
  %15 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 (i64, i64)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, i64 (i64, i64)** @RSI_2280_37b08d0, align 8
  store volatile %struct.Memory* %15, %struct.Memory** %MEMORY, align 8
  br label %inst_401365

inst_401346:                                      ; preds = %inst_401341
  %16 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %16, i64* @RIP_2472_293da00, align 8
  %17 = add i64 %16, 5
  store volatile i64 %17, i64* %NEXT_PC, align 8
  %18 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i8* @_ZSt4cout, i8** @RDI_2296_2948dd0, align 8
  store volatile %struct.Memory* %18, %struct.Memory** %MEMORY, align 8
  br label %inst_40134b

inst_4012c9:                                      ; preds = %inst_4012c4
  %19 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %19, i64* @RIP_2472_293da00, align 8
  %20 = add i64 %19, 4
  store volatile i64 %20, i64* %NEXT_PC, align 8
  %21 = load i64, i64* @RBP_2328_293da00, align 8
  %22 = sub i64 %21, 48
  %23 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %22, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %23, %struct.Memory** %MEMORY, align 8
  br label %inst_4012cd

inst_4012e9:                                      ; preds = %inst_4012e4
  %24 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %24, i64* @RIP_2472_293da00, align 8
  %25 = add i64 %24, 5
  store volatile i64 %25, i64* %NEXT_PC, align 8
  %XMM02 = bitcast [16 x i8]* %XMM0 to i8*
  %26 = load i64, i64* @RBP_2328_293da00, align 8
  %27 = sub i64 %26, 128
  %28 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %29 = inttoptr i64 %27 to double*
  %30 = inttoptr i64 %27 to double*
  %31 = ptrtoint double* %30 to i64
  %32 = load double, double* %29, align 8
  store double %32, double* @XMM0_16_293d8f8, align 1, !tbaa !1316
  %arrayidx2.i.i = getelementptr inbounds i8, i8* %XMM02, i64 8
  store double 0.000000e+00, double* @XMM0_24_293d8f8, align 1, !tbaa !1316
  store volatile %struct.Memory* %28, %struct.Memory** %MEMORY, align 8
  br label %inst_4012ee

inst_4013ea:                                      ; preds = %inst_4013e5, %inst_4013ab
  %33 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %33, i64* @RIP_2472_293da00, align 8
  %34 = add i64 %33, 4
  store volatile i64 %34, i64* %NEXT_PC, align 8
  %35 = load i64, i64* @RBP_2328_293da00, align 8
  %36 = sub i64 %35, 56
  %37 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %38 = inttoptr i64 %36 to i64*
  %39 = inttoptr i64 %36 to i64*
  %40 = ptrtoint i64* %39 to i64
  %41 = load i64, i64* %38, align 8
  store i64 %41, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %37, %struct.Memory** %MEMORY, align 8
  br label %inst_4013ee

inst_401290:                                      ; preds = %0
  %42 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %42, i64* @RIP_2472_293da00, align 8
  %43 = add i64 %42, 1
  store volatile i64 %43, i64* %NEXT_PC, align 8
  %44 = load i64, i64* @RBP_2328_293da00, align 8
  %45 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %46 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %46, -8
  %47 = inttoptr i64 %sub.i.i.i to i64*
  %48 = inttoptr i64 %sub.i.i.i to i64*
  %49 = ptrtoint i64* %48 to i64
  store i64 %44, i64* %47, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %45, %struct.Memory** %MEMORY, align 8
  br label %inst_401291

inst_4013b0:                                      ; No predecessors!
  %50 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %50, i64* @RIP_2472_293da00, align 8
  %51 = add i64 %50, 4
  store volatile i64 %51, i64* %NEXT_PC, align 8
  %52 = load i64, i64* @RBP_2328_293da00, align 8
  %53 = sub i64 %52, 56
  %54 = load i64, i64* @RAX_2216_293da00, align 8
  %55 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %56 = inttoptr i64 %53 to i64*
  %57 = inttoptr i64 %53 to i64*
  %58 = ptrtoint i64* %57 to i64
  store i64 %54, i64* %56, align 8
  store volatile %struct.Memory* %55, %struct.Memory** %MEMORY, align 8
  br label %inst_4013b4

inst_4013d1:                                      ; No predecessors!
  %59 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %59, i64* @RIP_2472_293da00, align 8
  %60 = add i64 %59, 4
  store volatile i64 %60, i64* %NEXT_PC, align 8
  %61 = load i64, i64* @RBP_2328_293da00, align 8
  %62 = sub i64 %61, 56
  %63 = load i64, i64* @RAX_2216_293da00, align 8
  %64 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %65 = inttoptr i64 %62 to i64*
  %66 = inttoptr i64 %62 to i64*
  %67 = ptrtoint i64* %66 to i64
  store i64 %63, i64* %65, align 8
  store volatile %struct.Memory* %64, %struct.Memory** %MEMORY, align 8
  br label %inst_4013d5

inst_401376:                                      ; preds = %inst_401371
  %68 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %68, i64* @RIP_2472_293da00, align 8
  %69 = add i64 %68, 7
  store volatile i64 %69, i64* %NEXT_PC, align 8
  %70 = load i64, i64* @RBP_2328_293da00, align 8
  %71 = sub i64 %70, 4
  %72 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %73 = inttoptr i64 %71 to i32*
  %74 = inttoptr i64 %71 to i32*
  %75 = ptrtoint i32* %74 to i64
  store i32 0, i32* %73, align 4
  store volatile %struct.Memory* %72, %struct.Memory** %MEMORY, align 8
  br label %inst_40137d

inst_40139b:                                      ; No predecessors!
  %76 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %76, i64* @RIP_2472_293da00, align 8
  %77 = add i64 %76, 4
  store volatile i64 %77, i64* %NEXT_PC, align 8
  %78 = load i64, i64* @RBP_2328_293da00, align 8
  %79 = sub i64 %78, 56
  %80 = load i64, i64* @RAX_2216_293da00, align 8
  %81 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %82 = inttoptr i64 %79 to i64*
  %83 = inttoptr i64 %79 to i64*
  %84 = ptrtoint i64* %83 to i64
  store i64 %80, i64* %82, align 8
  store volatile %struct.Memory* %81, %struct.Memory** %MEMORY, align 8
  br label %inst_40139f

inst_4013bc:                                      ; No predecessors!
  %85 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %85, i64* @RIP_2472_293da00, align 8
  %86 = add i64 %85, 4
  store volatile i64 %86, i64* %NEXT_PC, align 8
  %87 = load i64, i64* @RBP_2328_293da00, align 8
  %88 = sub i64 %87, 56
  %89 = load i64, i64* @RAX_2216_293da00, align 8
  %90 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %91 = inttoptr i64 %88 to i64*
  %92 = inttoptr i64 %88 to i64*
  %93 = ptrtoint i64* %92 to i64
  store i64 %89, i64* %91, align 8
  store volatile %struct.Memory* %90, %struct.Memory** %MEMORY, align 8
  br label %inst_4013c0

inst_401291:                                      ; preds = %inst_401290
  %94 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %94, i64* @RIP_2472_293da00, align 8
  %95 = add i64 %94, 3
  store volatile i64 %95, i64* %NEXT_PC, align 8
  %96 = load i64, i64* @RSP_2312_293da00, align 8
  %97 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %96, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %97, %struct.Memory** %MEMORY, align 8
  br label %inst_401294

inst_401294:                                      ; preds = %inst_401291
  %98 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %98, i64* @RIP_2472_293da00, align 8
  %99 = add i64 %98, 7
  store volatile i64 %99, i64* %NEXT_PC, align 8
  %100 = load i64, i64* @RSP_2312_293da00, align 8
  %101 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i19 = sub i64 %100, 144
  store i64 %sub.i.i19, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i = icmp ult i64 %100, 144
  %conv.i.i = zext i1 %cmp.i.i.i to i8
  store i8 %conv.i.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = trunc i64 %sub.i.i19 to i32
  %conv.i.i.i.i.i = and i32 %conv.i.i.i.i, 255
  %102 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i) #14, !range !1308
  %103 = trunc i32 %102 to i8
  %104 = and i8 %103, 1
  %105 = xor i8 %104, 1
  store i8 %105, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i = xor i64 144, %100
  %xor1.i.i.i.i = xor i64 %xor.i25.i.i.i, %sub.i.i19
  %and.i.i.i.i = lshr i64 %xor1.i.i.i.i, 4
  %106 = trunc i64 %and.i.i.i.i to i8
  %107 = and i8 %106, 1
  store i8 %107, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i64 %sub.i.i19, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i64 %sub.i.i19, 63
  %108 = trunc i64 %res.lobit.i.i.i to i8
  store i8 %108, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i = lshr i64 %100, 63
  %xor3.i.i.i.i = xor i64 %res.lobit.i.i.i, %shr.i.i.i.i
  %add.i.i.i.i = add nuw nsw i64 %xor3.i.i.i.i, %shr.i.i.i.i
  %cmp.i.i.i.i = icmp eq i64 %add.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %101, %struct.Memory** %MEMORY, align 8
  br label %inst_40129b

inst_40129b:                                      ; preds = %inst_401294
  %109 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %109, i64* @RIP_2472_293da00, align 8
  %110 = add i64 %109, 7
  store volatile i64 %110, i64* %NEXT_PC, align 8
  %111 = load i64, i64* @RBP_2328_293da00, align 8
  %112 = sub i64 %111, 4
  %113 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %114 = inttoptr i64 %112 to i32*
  %115 = inttoptr i64 %112 to i32*
  %116 = ptrtoint i32* %115 to i64
  store i32 0, i32* %114, align 4
  store volatile %struct.Memory* %113, %struct.Memory** %MEMORY, align 8
  br label %inst_4012a2

inst_4012a2:                                      ; preds = %inst_40129b
  %117 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %117, i64* @RIP_2472_293da00, align 8
  %118 = add i64 %117, 4
  store volatile i64 %118, i64* %NEXT_PC, align 8
  %119 = load i64, i64* @RBP_2328_293da00, align 8
  %120 = sub i64 %119, 48
  %121 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %120, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %121, %struct.Memory** %MEMORY, align 8
  br label %inst_4012a6

inst_4012a6:                                      ; preds = %inst_4012a2
  %122 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %122, i64* @RIP_2472_293da00, align 8
  %123 = add i64 %122, 3
  store volatile i64 %123, i64* %NEXT_PC, align 8
  %124 = load i64, i64* @RAX_2216_293da00, align 8
  %125 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %124, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %125, %struct.Memory** %MEMORY, align 8
  br label %inst_4012a9

inst_4012a9:                                      ; preds = %inst_4012a6
  %126 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %126, i64* @RIP_2472_293da00, align 8
  %127 = add i64 %126, 4
  store volatile i64 %127, i64* %NEXT_PC, align 8
  %128 = load i64, i64* @RBP_2328_293da00, align 8
  %129 = sub i64 %128, 120
  %130 = load i64, i64* @RAX_2216_293da00, align 8
  %131 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %132 = inttoptr i64 %129 to i64*
  %133 = inttoptr i64 %129 to i64*
  %134 = ptrtoint i64* %133 to i64
  store i64 %130, i64* %132, align 8
  store volatile %struct.Memory* %131, %struct.Memory** %MEMORY, align 8
  br label %inst_4012ad

inst_4012ad:                                      ; preds = %inst_4012a9
  %135 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %135, i64* @RIP_2472_293da00, align 8
  %136 = add i64 %135, 5
  store volatile i64 %136, i64* %NEXT_PC, align 8
  %137 = load i64, i64* %NEXT_PC, align 8
  %138 = sub i64 %137, 402
  %139 = load i64, i64* %NEXT_PC, align 8
  %140 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %141 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i29 = add i64 %141, -8
  %142 = inttoptr i64 %sub.i.i29 to i64*
  %143 = inttoptr i64 %sub.i.i29 to i64*
  %144 = ptrtoint i64* %143 to i64
  store i64 %139, i64* %142, align 8
  store i64 %sub.i.i29, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %138, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %138, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %139, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %140, %struct.Memory** %MEMORY, align 8
  %145 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %146 = call %struct.Memory* @ext_404248__ZNSaIcEC1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %145)
  store %struct.Memory* %146, %struct.Memory** %MEMORY, align 8
  store i8* @data_4012b2, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4012b2 to i64), i64* %NEXT_PC, align 8
  br label %inst_4012b2

inst_4012b2:                                      ; preds = %inst_4012ad
  %147 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %147, i64* @RIP_2472_293da00, align 8
  %148 = add i64 %147, 5
  store volatile i64 %148, i64* %NEXT_PC, align 8
  %149 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i8* @data_402004, i8** @RSI_2280_2948dd0, align 8
  store volatile %struct.Memory* %149, %struct.Memory** %MEMORY, align 8
  br label %inst_4012b7

inst_4012b7:                                      ; preds = %inst_4012b2
  %150 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %150, i64* @RIP_2472_293da00, align 8
  %151 = add i64 %150, 4
  store volatile i64 %151, i64* %NEXT_PC, align 8
  %152 = load i64, i64* @RBP_2328_293da00, align 8
  %153 = sub i64 %152, 40
  %154 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %153, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %154, %struct.Memory** %MEMORY, align 8
  br label %inst_4012bb

inst_4012bb:                                      ; preds = %inst_4012b7
  %155 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %155, i64* @RIP_2472_293da00, align 8
  %156 = add i64 %155, 4
  store volatile i64 %156, i64* %NEXT_PC, align 8
  %157 = load i64, i64* @RBP_2328_293da00, align 8
  %158 = sub i64 %157, 120
  %159 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %160 = inttoptr i64 %158 to i64*
  %161 = inttoptr i64 %158 to i64*
  %162 = ptrtoint i64* %161 to i64
  %163 = load i64, i64* %160, align 8
  store i64 %163, i64* @RDX_2264_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %159, %struct.Memory** %MEMORY, align 8
  br label %inst_4012bf

inst_4012bf:                                      ; preds = %inst_4012bb
  %164 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %164, i64* @RIP_2472_293da00, align 8
  %165 = add i64 %164, 5
  store volatile i64 %165, i64* %NEXT_PC, align 8
  %166 = load i64, i64* %NEXT_PC, align 8
  %167 = sub i64 %166, 500
  %168 = load i64, i64* %NEXT_PC, align 8
  %169 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %170 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i37 = add i64 %170, -8
  %171 = inttoptr i64 %sub.i.i37 to i64*
  %172 = inttoptr i64 %sub.i.i37 to i64*
  %173 = ptrtoint i64* %172 to i64
  store i64 %168, i64* %171, align 8
  store i64 %sub.i.i37, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %167, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %167, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %168, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %169, %struct.Memory** %MEMORY, align 8
  %174 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %175 = call %struct.Memory* @ext_404228__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %174)
  store %struct.Memory* %175, %struct.Memory** %MEMORY, align 8
  store i8* @data_4012c4, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4012c4 to i64), i64* %NEXT_PC, align 8
  br label %inst_4012c4

inst_4012c4:                                      ; preds = %inst_4012bf
  %176 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %176, i64* @RIP_2472_293da00, align 8
  %177 = add i64 %176, 5
  store volatile i64 %177, i64* %NEXT_PC, align 8
  %178 = load i64, i64* %NEXT_PC, align 8
  %179 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %178, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %178, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %179, %struct.Memory** %MEMORY, align 8
  br label %inst_4012c9

inst_4012cd:                                      ; preds = %inst_4012c9
  %180 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %180, i64* @RIP_2472_293da00, align 8
  %181 = add i64 %180, 5
  store volatile i64 %181, i64* %NEXT_PC, align 8
  %182 = load i64, i64* %NEXT_PC, align 8
  %183 = sub i64 %182, 530
  %184 = load i64, i64* %NEXT_PC, align 8
  %185 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %186 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i43 = add i64 %186, -8
  %187 = inttoptr i64 %sub.i.i43 to i64*
  %188 = inttoptr i64 %sub.i.i43 to i64*
  %189 = ptrtoint i64* %188 to i64
  store i64 %184, i64* %187, align 8
  store i64 %sub.i.i43, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %183, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %183, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %184, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %185, %struct.Memory** %MEMORY, align 8
  %190 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %191 = call %struct.Memory* @ext_404220__ZNSaIcED1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %190)
  store %struct.Memory* %191, %struct.Memory** %MEMORY, align 8
  store i8* @data_4012d2, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4012d2 to i64), i64* %NEXT_PC, align 8
  br label %inst_4012d2

inst_4012d2:                                      ; preds = %inst_4012cd
  %192 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %192, i64* @RIP_2472_293da00, align 8
  %193 = add i64 %192, 2
  store volatile i64 %193, i64* %NEXT_PC, align 8
  %194 = load i32, i32* @RAX_2216_293d9e8, align 4
  %195 = zext i32 %194 to i64
  %196 = load i32, i32* @RAX_2216_293d9e8, align 4
  %197 = zext i32 %196 to i64
  %198 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %xor3.i26.i = xor i64 %197, %195
  %xor3.i.i = trunc i64 %xor3.i26.i to i32
  %conv.i24.i = and i64 %xor3.i26.i, 4294967295
  store i64 %conv.i24.i, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i47 = and i32 %xor3.i.i, 255
  %199 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i47) #14, !range !1308
  %200 = trunc i32 %199 to i8
  %201 = and i8 %200, 1
  %202 = xor i8 %201, 1
  store i8 %202, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i = icmp eq i32 %xor3.i.i, 0
  %conv3.i.i = zext i1 %cmp.i1.i.i to i8
  store i8 %conv3.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i = lshr i32 %xor3.i.i, 31
  %203 = trunc i32 %res.lobit.i.i to i8
  store i8 %203, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %198, %struct.Memory** %MEMORY, align 8
  br label %inst_4012d4

inst_4012d4:                                      ; preds = %inst_4012d2
  %204 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %204, i64* @RIP_2472_293da00, align 8
  %205 = add i64 %204, 2
  store volatile i64 %205, i64* %NEXT_PC, align 8
  %206 = load i32, i32* @RAX_2216_293d9e8, align 4
  %207 = zext i32 %206 to i64
  %208 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %conv.i11.i = and i64 %207, 4294967295
  store i64 %conv.i11.i, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %208, %struct.Memory** %MEMORY, align 8
  br label %inst_4012d6

inst_4012d6:                                      ; preds = %inst_4012d4
  %209 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %209, i64* @RIP_2472_293da00, align 8
  %210 = add i64 %209, 4
  store volatile i64 %210, i64* %NEXT_PC, align 8
  %211 = load i64, i64* @RBP_2328_293da00, align 8
  %212 = sub i64 %211, 40
  %213 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %212, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %213, %struct.Memory** %MEMORY, align 8
  br label %inst_4012da

inst_4012da:                                      ; preds = %inst_4012d6
  %214 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %214, i64* @RIP_2472_293da00, align 8
  %215 = add i64 %214, 5
  store volatile i64 %215, i64* %NEXT_PC, align 8
  %216 = load i64, i64* %NEXT_PC, align 8
  %217 = add i64 %216, 289
  %218 = load i64, i64* %NEXT_PC, align 8
  %219 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %220 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i56 = add i64 %220, -8
  %221 = inttoptr i64 %sub.i.i56 to i64*
  %222 = inttoptr i64 %sub.i.i56 to i64*
  %223 = ptrtoint i64* %222 to i64
  store i64 %218, i64* %221, align 8
  store i64 %sub.i.i56, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %217, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %217, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %218, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %219, %struct.Memory** %MEMORY, align 8
  %224 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %225 = call %struct.Memory* @sub_401400__ZNSt7__cxx114stodERKNS_12basic_stringIcSt11char_traitsIcESaIcEEEPm(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %224)
  store %struct.Memory* %225, %struct.Memory** %MEMORY, align 8
  store i8* @data_4012df, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4012df to i64), i64* %NEXT_PC, align 8
  br label %inst_4012df

inst_4012df:                                      ; preds = %inst_4012da
  %226 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %226, i64* @RIP_2472_293da00, align 8
  %227 = add i64 %226, 5
  store volatile i64 %227, i64* %NEXT_PC, align 8
  %228 = load i64, i64* @RBP_2328_293da00, align 8
  %229 = sub i64 %228, 128
  %230 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %retval.sroa.0.0.copyload.i.i = load double, double* @XMM0_16_293d8f8, align 1, !tbaa.struct !1324
  %231 = inttoptr i64 %229 to double*
  %232 = inttoptr i64 %229 to double*
  %233 = ptrtoint double* %232 to i64
  store double %retval.sroa.0.0.copyload.i.i, double* %231, align 8
  store volatile %struct.Memory* %230, %struct.Memory** %MEMORY, align 8
  br label %inst_4012e4

inst_4012e4:                                      ; preds = %inst_4012df
  %234 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %234, i64* @RIP_2472_293da00, align 8
  %235 = add i64 %234, 5
  store volatile i64 %235, i64* %NEXT_PC, align 8
  %236 = load i64, i64* %NEXT_PC, align 8
  %237 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %236, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %236, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %237, %struct.Memory** %MEMORY, align 8
  br label %inst_4012e9

inst_4012ee:                                      ; preds = %inst_4012e9
  %238 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %238, i64* @RIP_2472_293da00, align 8
  %239 = add i64 %238, 5
  store volatile i64 %239, i64* %NEXT_PC, align 8
  %240 = load i64, i64* @RBP_2328_293da00, align 8
  %241 = sub i64 %240, 72
  %242 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %retval.sroa.0.0.copyload.i.i65 = load double, double* @XMM0_16_293d8f8, align 1, !tbaa.struct !1324
  %243 = inttoptr i64 %241 to double*
  %244 = inttoptr i64 %241 to double*
  %245 = ptrtoint double* %244 to i64
  store double %retval.sroa.0.0.copyload.i.i65, double* %243, align 8
  store volatile %struct.Memory* %242, %struct.Memory** %MEMORY, align 8
  br label %inst_4012f3

inst_4012f3:                                      ; preds = %inst_4012ee
  %246 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %246, i64* @RIP_2472_293da00, align 8
  %247 = add i64 %246, 4
  store volatile i64 %247, i64* %NEXT_PC, align 8
  %248 = load i64, i64* @RBP_2328_293da00, align 8
  %249 = sub i64 %248, 112
  %250 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %249, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %250, %struct.Memory** %MEMORY, align 8
  br label %inst_4012f7

inst_4012f7:                                      ; preds = %inst_4012f3
  %251 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %251, i64* @RIP_2472_293da00, align 8
  %252 = add i64 %251, 3
  store volatile i64 %252, i64* %NEXT_PC, align 8
  %253 = load i64, i64* @RAX_2216_293da00, align 8
  %254 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %253, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %254, %struct.Memory** %MEMORY, align 8
  br label %inst_4012fa

inst_4012fa:                                      ; preds = %inst_4012f7
  %255 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %255, i64* @RIP_2472_293da00, align 8
  %256 = add i64 %255, 7
  store volatile i64 %256, i64* %NEXT_PC, align 8
  %257 = load i64, i64* @RBP_2328_293da00, align 8
  %258 = sub i64 %257, 136
  %259 = load i64, i64* @RAX_2216_293da00, align 8
  %260 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %261 = inttoptr i64 %258 to i64*
  %262 = inttoptr i64 %258 to i64*
  %263 = ptrtoint i64* %262 to i64
  store i64 %259, i64* %261, align 8
  store volatile %struct.Memory* %260, %struct.Memory** %MEMORY, align 8
  br label %inst_401301

inst_401301:                                      ; preds = %inst_4012fa
  %264 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %264, i64* @RIP_2472_293da00, align 8
  %265 = add i64 %264, 5
  store volatile i64 %265, i64* %NEXT_PC, align 8
  %266 = load i64, i64* %NEXT_PC, align 8
  %267 = sub i64 %266, 486
  %268 = load i64, i64* %NEXT_PC, align 8
  %269 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %270 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i92 = add i64 %270, -8
  %271 = inttoptr i64 %sub.i.i92 to i64*
  %272 = inttoptr i64 %sub.i.i92 to i64*
  %273 = ptrtoint i64* %272 to i64
  store i64 %268, i64* %271, align 8
  store i64 %sub.i.i92, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %267, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %267, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %268, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %269, %struct.Memory** %MEMORY, align 8
  %274 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %275 = call %struct.Memory* @ext_404248__ZNSaIcEC1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %274)
  store %struct.Memory* %275, %struct.Memory** %MEMORY, align 8
  store i8* @data_401306, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401306 to i64), i64* %NEXT_PC, align 8
  br label %inst_401306

inst_401306:                                      ; preds = %inst_401301
  %276 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %276, i64* @RIP_2472_293da00, align 8
  %277 = add i64 %276, 5
  store volatile i64 %277, i64* %NEXT_PC, align 8
  %278 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i8* @data_402009, i8** @RSI_2280_2948dd0, align 8
  store volatile %struct.Memory* %278, %struct.Memory** %MEMORY, align 8
  br label %inst_40130b

inst_40130b:                                      ; preds = %inst_401306
  %279 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %279, i64* @RIP_2472_293da00, align 8
  %280 = add i64 %279, 4
  store volatile i64 %280, i64* %NEXT_PC, align 8
  %281 = load i64, i64* @RBP_2328_293da00, align 8
  %282 = sub i64 %281, 104
  %283 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %282, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %283, %struct.Memory** %MEMORY, align 8
  br label %inst_40130f

inst_40130f:                                      ; preds = %inst_40130b
  %284 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %284, i64* @RIP_2472_293da00, align 8
  %285 = add i64 %284, 7
  store volatile i64 %285, i64* %NEXT_PC, align 8
  %286 = load i64, i64* @RBP_2328_293da00, align 8
  %287 = sub i64 %286, 136
  %288 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %289 = inttoptr i64 %287 to i64*
  %290 = inttoptr i64 %287 to i64*
  %291 = ptrtoint i64* %290 to i64
  %292 = load i64, i64* %289, align 8
  store i64 %292, i64* @RDX_2264_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %288, %struct.Memory** %MEMORY, align 8
  br label %inst_401316

inst_401316:                                      ; preds = %inst_40130f
  %293 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %293, i64* @RIP_2472_293da00, align 8
  %294 = add i64 %293, 5
  store volatile i64 %294, i64* %NEXT_PC, align 8
  %295 = load i64, i64* %NEXT_PC, align 8
  %296 = sub i64 %295, 587
  %297 = load i64, i64* %NEXT_PC, align 8
  %298 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %299 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i101 = add i64 %299, -8
  %300 = inttoptr i64 %sub.i.i101 to i64*
  %301 = inttoptr i64 %sub.i.i101 to i64*
  %302 = ptrtoint i64* %301 to i64
  store i64 %297, i64* %300, align 8
  store i64 %sub.i.i101, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %296, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %296, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %297, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %298, %struct.Memory** %MEMORY, align 8
  %303 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %304 = call %struct.Memory* @ext_404228__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %303)
  store %struct.Memory* %304, %struct.Memory** %MEMORY, align 8
  store i8* @data_40131b, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_40131b to i64), i64* %NEXT_PC, align 8
  br label %inst_40131b

inst_40131b:                                      ; preds = %inst_401316
  %305 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %305, i64* @RIP_2472_293da00, align 8
  %306 = add i64 %305, 5
  store volatile i64 %306, i64* %NEXT_PC, align 8
  %307 = load i64, i64* %NEXT_PC, align 8
  %308 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %307, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %307, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %308, %struct.Memory** %MEMORY, align 8
  br label %inst_401320

inst_401324:                                      ; preds = %inst_401320
  %309 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %309, i64* @RIP_2472_293da00, align 8
  %310 = add i64 %309, 5
  store volatile i64 %310, i64* %NEXT_PC, align 8
  %311 = load i64, i64* %NEXT_PC, align 8
  %312 = sub i64 %311, 617
  %313 = load i64, i64* %NEXT_PC, align 8
  %314 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %315 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i110 = add i64 %315, -8
  %316 = inttoptr i64 %sub.i.i110 to i64*
  %317 = inttoptr i64 %sub.i.i110 to i64*
  %318 = ptrtoint i64* %317 to i64
  store i64 %313, i64* %316, align 8
  store i64 %sub.i.i110, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %312, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %312, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %313, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %314, %struct.Memory** %MEMORY, align 8
  %319 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %320 = call %struct.Memory* @ext_404220__ZNSaIcED1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %319)
  store %struct.Memory* %320, %struct.Memory** %MEMORY, align 8
  store i8* @data_401329, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401329 to i64), i64* %NEXT_PC, align 8
  br label %inst_401329

inst_401329:                                      ; preds = %inst_401324
  %321 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %321, i64* @RIP_2472_293da00, align 8
  %322 = add i64 %321, 4
  store volatile i64 %322, i64* %NEXT_PC, align 8
  %323 = load i64, i64* @RBP_2328_293da00, align 8
  %324 = sub i64 %323, 104
  %325 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %324, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %325, %struct.Memory** %MEMORY, align 8
  br label %inst_40132d

inst_40132d:                                      ; preds = %inst_401329
  %326 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %326, i64* @RIP_2472_293da00, align 8
  %327 = add i64 %326, 5
  store volatile i64 %327, i64* %NEXT_PC, align 8
  %328 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 5, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %328, %struct.Memory** %MEMORY, align 8
  br label %inst_401332

inst_401332:                                      ; preds = %inst_40132d
  %329 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %329, i64* @RIP_2472_293da00, align 8
  %330 = add i64 %329, 5
  store volatile i64 %330, i64* %NEXT_PC, align 8
  %331 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 1, i64* @RDX_2264_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %331, %struct.Memory** %MEMORY, align 8
  br label %inst_401337

inst_401337:                                      ; preds = %inst_401332
  %332 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %332, i64* @RIP_2472_293da00, align 8
  %333 = add i64 %332, 5
  store volatile i64 %333, i64* %NEXT_PC, align 8
  %334 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 44, i64* @RCX_2248_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %334, %struct.Memory** %MEMORY, align 8
  br label %inst_40133c

inst_40133c:                                      ; preds = %inst_401337
  %335 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %335, i64* @RIP_2472_293da00, align 8
  %336 = add i64 %335, 5
  store volatile i64 %336, i64* %NEXT_PC, align 8
  %337 = load i64, i64* %NEXT_PC, align 8
  %338 = sub i64 %337, 529
  %339 = load i64, i64* %NEXT_PC, align 8
  %340 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %341 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i122 = add i64 %341, -8
  %342 = inttoptr i64 %sub.i.i122 to i64*
  %343 = inttoptr i64 %sub.i.i122 to i64*
  %344 = ptrtoint i64* %343 to i64
  store i64 %339, i64* %342, align 8
  store i64 %sub.i.i122, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %338, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %338, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %339, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %340, %struct.Memory** %MEMORY, align 8
  %345 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %346 = call %struct.Memory* @ext_404250__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %345)
  store %struct.Memory* %346, %struct.Memory** %MEMORY, align 8
  store i8* @data_401341, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401341 to i64), i64* %NEXT_PC, align 8
  br label %inst_401341

inst_401341:                                      ; preds = %inst_40133c
  %347 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %347, i64* @RIP_2472_293da00, align 8
  %348 = add i64 %347, 5
  store volatile i64 %348, i64* %NEXT_PC, align 8
  %349 = load i64, i64* %NEXT_PC, align 8
  %350 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %349, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %349, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %350, %struct.Memory** %MEMORY, align 8
  br label %inst_401346

inst_40134b:                                      ; preds = %inst_401346
  %351 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %351, i64* @RIP_2472_293da00, align 8
  %352 = add i64 %351, 4
  store volatile i64 %352, i64* %NEXT_PC, align 8
  %353 = load i64, i64* @RBP_2328_293da00, align 8
  %354 = sub i64 %353, 104
  %355 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %354, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %355, %struct.Memory** %MEMORY, align 8
  br label %inst_40134f

inst_40134f:                                      ; preds = %inst_40134b
  %356 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %356, i64* @RIP_2472_293da00, align 8
  %357 = add i64 %356, 5
  store volatile i64 %357, i64* %NEXT_PC, align 8
  %358 = load i64, i64* %NEXT_PC, align 8
  %359 = sub i64 %358, 692
  %360 = load i64, i64* %NEXT_PC, align 8
  %361 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %362 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i127 = add i64 %362, -8
  %363 = inttoptr i64 %sub.i.i127 to i64*
  %364 = inttoptr i64 %sub.i.i127 to i64*
  %365 = ptrtoint i64* %364 to i64
  store i64 %360, i64* %363, align 8
  store i64 %sub.i.i127, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %359, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %359, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %360, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %361, %struct.Memory** %MEMORY, align 8
  %366 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %367 = call %struct.Memory* @ext_404210__ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %366)
  store %struct.Memory* %367, %struct.Memory** %MEMORY, align 8
  store i8* @data_401354, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401354 to i64), i64* %NEXT_PC, align 8
  br label %inst_401354

inst_401354:                                      ; preds = %inst_40134f
  %368 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %368, i64* @RIP_2472_293da00, align 8
  %369 = add i64 %368, 7
  store volatile i64 %369, i64* %NEXT_PC, align 8
  %370 = load i64, i64* @RBP_2328_293da00, align 8
  %371 = sub i64 %370, 144
  %372 = load i64, i64* @RAX_2216_293da00, align 8
  %373 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %374 = inttoptr i64 %371 to i64*
  %375 = inttoptr i64 %371 to i64*
  %376 = ptrtoint i64* %375 to i64
  store i64 %372, i64* %374, align 8
  store volatile %struct.Memory* %373, %struct.Memory** %MEMORY, align 8
  br label %inst_40135b

inst_40135b:                                      ; preds = %inst_401354
  %377 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %377, i64* @RIP_2472_293da00, align 8
  %378 = add i64 %377, 5
  store volatile i64 %378, i64* %NEXT_PC, align 8
  %379 = load i64, i64* %NEXT_PC, align 8
  %380 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %379, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %379, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %380, %struct.Memory** %MEMORY, align 8
  br label %inst_401360

inst_401365:                                      ; preds = %inst_401360
  %381 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %381, i64* @RIP_2472_293da00, align 8
  %382 = add i64 %381, 7
  store volatile i64 %382, i64* %NEXT_PC, align 8
  %383 = load i64, i64* @RBP_2328_293da00, align 8
  %384 = sub i64 %383, 144
  %385 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %386 = inttoptr i64 %384 to i64*
  %387 = inttoptr i64 %384 to i64*
  %388 = ptrtoint i64* %387 to i64
  %389 = load i64, i64* %386, align 8
  store i64 %389, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %385, %struct.Memory** %MEMORY, align 8
  br label %inst_40136c

inst_40136c:                                      ; preds = %inst_401365
  %390 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %390, i64* @RIP_2472_293da00, align 8
  %391 = add i64 %390, 5
  store volatile i64 %391, i64* %NEXT_PC, align 8
  %392 = load i64, i64* %NEXT_PC, align 8
  %393 = sub i64 %392, 705
  %394 = load i64, i64* %NEXT_PC, align 8
  %395 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %396 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i115 = add i64 %396, -8
  %397 = inttoptr i64 %sub.i.i115 to i64*
  %398 = inttoptr i64 %sub.i.i115 to i64*
  %399 = ptrtoint i64* %398 to i64
  store i64 %394, i64* %397, align 8
  store i64 %sub.i.i115, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %393, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %393, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %394, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %395, %struct.Memory** %MEMORY, align 8
  %400 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %401 = call %struct.Memory* @ext_404218__ZNSolsEPFRSoS_E(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %400)
  store %struct.Memory* %401, %struct.Memory** %MEMORY, align 8
  store i8* @data_401371, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401371 to i64), i64* %NEXT_PC, align 8
  br label %inst_401371

inst_401371:                                      ; preds = %inst_40136c
  %402 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %402, i64* @RIP_2472_293da00, align 8
  %403 = add i64 %402, 5
  store volatile i64 %403, i64* %NEXT_PC, align 8
  %404 = load i64, i64* %NEXT_PC, align 8
  %405 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %404, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %404, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %405, %struct.Memory** %MEMORY, align 8
  br label %inst_401376

inst_40137d:                                      ; preds = %inst_401376
  %406 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %406, i64* @RIP_2472_293da00, align 8
  %407 = add i64 %406, 4
  store volatile i64 %407, i64* %NEXT_PC, align 8
  %408 = load i64, i64* @RBP_2328_293da00, align 8
  %409 = sub i64 %408, 104
  %410 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %409, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %410, %struct.Memory** %MEMORY, align 8
  br label %inst_401381

inst_401381:                                      ; preds = %inst_40137d
  %411 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %411, i64* @RIP_2472_293da00, align 8
  %412 = add i64 %411, 5
  store volatile i64 %412, i64* %NEXT_PC, align 8
  %413 = load i64, i64* %NEXT_PC, align 8
  %414 = sub i64 %413, 790
  %415 = load i64, i64* %NEXT_PC, align 8
  %416 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %417 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i106 = add i64 %417, -8
  %418 = inttoptr i64 %sub.i.i106 to i64*
  %419 = inttoptr i64 %sub.i.i106 to i64*
  %420 = ptrtoint i64* %419 to i64
  store i64 %415, i64* %418, align 8
  store i64 %sub.i.i106, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %414, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %414, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %415, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %416, %struct.Memory** %MEMORY, align 8
  %421 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %422 = call %struct.Memory* @ext_4041f8__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %421)
  store %struct.Memory* %422, %struct.Memory** %MEMORY, align 8
  store i8* @data_401386, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401386 to i64), i64* %NEXT_PC, align 8
  br label %inst_401386

inst_401386:                                      ; preds = %inst_401381
  %423 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %423, i64* @RIP_2472_293da00, align 8
  %424 = add i64 %423, 4
  store volatile i64 %424, i64* %NEXT_PC, align 8
  %425 = load i64, i64* @RBP_2328_293da00, align 8
  %426 = sub i64 %425, 40
  %427 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %426, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %427, %struct.Memory** %MEMORY, align 8
  br label %inst_40138a

inst_40138a:                                      ; preds = %inst_401386
  %428 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %428, i64* @RIP_2472_293da00, align 8
  %429 = add i64 %428, 5
  store volatile i64 %429, i64* %NEXT_PC, align 8
  %430 = load i64, i64* %NEXT_PC, align 8
  %431 = sub i64 %430, 799
  %432 = load i64, i64* %NEXT_PC, align 8
  %433 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %434 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i96 = add i64 %434, -8
  %435 = inttoptr i64 %sub.i.i96 to i64*
  %436 = inttoptr i64 %sub.i.i96 to i64*
  %437 = ptrtoint i64* %436 to i64
  store i64 %432, i64* %435, align 8
  store i64 %sub.i.i96, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %431, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %431, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %432, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %433, %struct.Memory** %MEMORY, align 8
  %438 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %439 = call %struct.Memory* @ext_4041f8__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %438)
  store %struct.Memory* %439, %struct.Memory** %MEMORY, align 8
  store i8* @data_40138f, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_40138f to i64), i64* %NEXT_PC, align 8
  br label %inst_40138f

inst_40138f:                                      ; preds = %inst_40138a
  %440 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %440, i64* @RIP_2472_293da00, align 8
  %441 = add i64 %440, 3
  store volatile i64 %441, i64* %NEXT_PC, align 8
  %442 = load i64, i64* @RBP_2328_293da00, align 8
  %443 = sub i64 %442, 4
  %444 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %445 = inttoptr i64 %443 to i32*
  %446 = inttoptr i64 %443 to i32*
  %447 = ptrtoint i32* %446 to i64
  %448 = load i32, i32* %445, align 4
  %conv.i.i89 = zext i32 %448 to i64
  store i64 %conv.i.i89, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %444, %struct.Memory** %MEMORY, align 8
  br label %inst_401392

inst_401392:                                      ; preds = %inst_40138f
  %449 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %449, i64* @RIP_2472_293da00, align 8
  %450 = add i64 %449, 7
  store volatile i64 %450, i64* %NEXT_PC, align 8
  %451 = load i64, i64* @RSP_2312_293da00, align 8
  %452 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %add.i.i67 = add i64 144, %451
  store i64 %add.i.i67, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i68 = icmp ult i64 %add.i.i67, %451
  %cmp1.i.i.i = icmp ult i64 %add.i.i67, 144
  %453 = or i1 %cmp.i.i.i68, %cmp1.i.i.i
  %conv.i.i69 = zext i1 %453 to i8
  store i8 %conv.i.i69, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i71 = trunc i64 %add.i.i67 to i32
  %conv.i.i.i.i.i72 = and i32 %conv.i.i.i.i71, 255
  %454 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i72) #14, !range !1308
  %455 = trunc i32 %454 to i8
  %456 = and i8 %455, 1
  %457 = xor i8 %456, 1
  store i8 %457, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i74 = xor i64 144, %451
  %xor1.i.i.i.i75 = xor i64 %xor.i25.i.i.i74, %add.i.i67
  %and.i.i.i.i76 = lshr i64 %xor1.i.i.i.i75, 4
  %458 = trunc i64 %and.i.i.i.i76 to i8
  %459 = and i8 %458, 1
  store i8 %459, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i78 = icmp eq i64 %add.i.i67, 0
  %conv5.i.i.i79 = zext i1 %cmp.i24.i.i.i78 to i8
  store i8 %conv5.i.i.i79, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i81 = lshr i64 %add.i.i67, 63
  %460 = trunc i64 %res.lobit.i.i.i81 to i8
  store i8 %460, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i83 = lshr i64 %451, 63
  %xor.i.i.i.i = xor i64 %res.lobit.i.i.i81, %shr.i.i.i.i83
  %add.i.i.i.i84 = add nuw nsw i64 %xor.i.i.i.i, %res.lobit.i.i.i81
  %cmp.i.i.i.i85 = icmp eq i64 %add.i.i.i.i84, 2
  %conv11.i.i.i86 = zext i1 %cmp.i.i.i.i85 to i8
  store i8 %conv11.i.i.i86, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %452, %struct.Memory** %MEMORY, align 8
  br label %inst_401399

inst_401399:                                      ; preds = %inst_401392
  %461 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %461, i64* @RIP_2472_293da00, align 8
  %462 = add i64 %461, 1
  store volatile i64 %462, i64* %NEXT_PC, align 8
  %463 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %464 = load i64*, i64** @RSP_2312_2948f30, align 8
  %465 = load i64*, i64** @RSP_2312_2948f30, align 8
  %466 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i62 = add i64 %466, 8
  store i64 %add.i.i62, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %467 = ptrtoint i64* %465 to i64
  %468 = load i64, i64* %464, align 8
  store i64 %468, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %463, %struct.Memory** %MEMORY, align 8
  br label %inst_40139a

inst_40139a:                                      ; preds = %inst_401399
  %469 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %469, i64* @RIP_2472_293da00, align 8
  %470 = add i64 %469, 1
  store volatile i64 %470, i64* %NEXT_PC, align 8
  %471 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %472 = load i64*, i64** @RSP_2312_2948f30, align 8
  %473 = load i64*, i64** @RSP_2312_2948f30, align 8
  %474 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %475 = ptrtoint i64* %473 to i64
  %476 = load i64, i64* %472, align 8
  store i64 %476, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %476, i64* %NEXT_PC, align 8, !tbaa !1290
  %477 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %477, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %471, %struct.Memory** %MEMORY, align 8
  %478 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %478

inst_40139f:                                      ; preds = %inst_40139b
  %479 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %479, i64* @RIP_2472_293da00, align 8
  %480 = add i64 %479, 3
  store volatile i64 %480, i64* %NEXT_PC, align 8
  %481 = load i64, i64* @RBP_2328_293da00, align 8
  %482 = sub i64 %481, 60
  %483 = load i32, i32* @RDX_2264_293d9e8, align 4
  %484 = zext i32 %483 to i64
  %485 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %486 = inttoptr i64 %482 to i32*
  %487 = inttoptr i64 %482 to i32*
  %488 = ptrtoint i32* %487 to i64
  store i32 %483, i32* %486, align 4
  store volatile %struct.Memory* %485, %struct.Memory** %MEMORY, align 8
  br label %inst_4013a2

inst_4013a2:                                      ; preds = %inst_40139f
  %489 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %489, i64* @RIP_2472_293da00, align 8
  %490 = add i64 %489, 4
  store volatile i64 %490, i64* %NEXT_PC, align 8
  %491 = load i64, i64* @RBP_2328_293da00, align 8
  %492 = sub i64 %491, 48
  %493 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %492, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %493, %struct.Memory** %MEMORY, align 8
  br label %inst_4013a6

inst_4013a6:                                      ; preds = %inst_4013a2
  %494 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %494, i64* @RIP_2472_293da00, align 8
  %495 = add i64 %494, 5
  store volatile i64 %495, i64* %NEXT_PC, align 8
  %496 = load i64, i64* %NEXT_PC, align 8
  %497 = sub i64 %496, 747
  %498 = load i64, i64* %NEXT_PC, align 8
  %499 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %500 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i49 = add i64 %500, -8
  %501 = inttoptr i64 %sub.i.i49 to i64*
  %502 = inttoptr i64 %sub.i.i49 to i64*
  %503 = ptrtoint i64* %502 to i64
  store i64 %498, i64* %501, align 8
  store i64 %sub.i.i49, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %497, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %497, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %498, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %499, %struct.Memory** %MEMORY, align 8
  %504 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %505 = call %struct.Memory* @ext_404220__ZNSaIcED1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %504)
  store %struct.Memory* %505, %struct.Memory** %MEMORY, align 8
  store i8* @data_4013ab, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4013ab to i64), i64* %NEXT_PC, align 8
  br label %inst_4013ab

inst_4013ab:                                      ; preds = %inst_4013a6
  %506 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %506, i64* @RIP_2472_293da00, align 8
  %507 = add i64 %506, 5
  store volatile i64 %507, i64* %NEXT_PC, align 8
  %508 = load i64, i64* %NEXT_PC, align 8
  %509 = add i64 %508, 58
  %510 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %509, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %509, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %510, %struct.Memory** %MEMORY, align 8
  br label %inst_4013ea

inst_4013b4:                                      ; preds = %inst_4013b0
  %511 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %511, i64* @RIP_2472_293da00, align 8
  %512 = add i64 %511, 3
  store volatile i64 %512, i64* %NEXT_PC, align 8
  %513 = load i64, i64* @RBP_2328_293da00, align 8
  %514 = sub i64 %513, 60
  %515 = load i32, i32* @RDX_2264_293d9e8, align 4
  %516 = zext i32 %515 to i64
  %517 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %518 = inttoptr i64 %514 to i32*
  %519 = inttoptr i64 %514 to i32*
  %520 = ptrtoint i32* %519 to i64
  store i32 %515, i32* %518, align 4
  store volatile %struct.Memory* %517, %struct.Memory** %MEMORY, align 8
  br label %inst_4013b7

inst_4013b7:                                      ; preds = %inst_4013b4
  %521 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %521, i64* @RIP_2472_293da00, align 8
  %522 = add i64 %521, 5
  store volatile i64 %522, i64* %NEXT_PC, align 8
  %523 = load i64, i64* %NEXT_PC, align 8
  %524 = add i64 %523, 37
  %525 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %524, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %524, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %525, %struct.Memory** %MEMORY, align 8
  br label %inst_4013e1

inst_4013c0:                                      ; preds = %inst_4013bc
  %526 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %526, i64* @RIP_2472_293da00, align 8
  %527 = add i64 %526, 3
  store volatile i64 %527, i64* %NEXT_PC, align 8
  %528 = load i64, i64* @RBP_2328_293da00, align 8
  %529 = sub i64 %528, 60
  %530 = load i32, i32* @RDX_2264_293d9e8, align 4
  %531 = zext i32 %530 to i64
  %532 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %533 = inttoptr i64 %529 to i32*
  %534 = inttoptr i64 %529 to i32*
  %535 = ptrtoint i32* %534 to i64
  store i32 %530, i32* %533, align 4
  store volatile %struct.Memory* %532, %struct.Memory** %MEMORY, align 8
  br label %inst_4013c3

inst_4013c3:                                      ; preds = %inst_4013c0
  %536 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %536, i64* @RIP_2472_293da00, align 8
  %537 = add i64 %536, 4
  store volatile i64 %537, i64* %NEXT_PC, align 8
  %538 = load i64, i64* @RBP_2328_293da00, align 8
  %539 = sub i64 %538, 112
  %540 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %539, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %540, %struct.Memory** %MEMORY, align 8
  br label %inst_4013c7

inst_4013c7:                                      ; preds = %inst_4013c3
  %541 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %541, i64* @RIP_2472_293da00, align 8
  %542 = add i64 %541, 5
  store volatile i64 %542, i64* %NEXT_PC, align 8
  %543 = load i64, i64* %NEXT_PC, align 8
  %544 = sub i64 %543, 780
  %545 = load i64, i64* %NEXT_PC, align 8
  %546 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %547 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i24 = add i64 %547, -8
  %548 = inttoptr i64 %sub.i.i24 to i64*
  %549 = inttoptr i64 %sub.i.i24 to i64*
  %550 = ptrtoint i64* %549 to i64
  store i64 %545, i64* %548, align 8
  store i64 %sub.i.i24, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %544, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %544, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %545, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %546, %struct.Memory** %MEMORY, align 8
  %551 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %552 = call %struct.Memory* @ext_404220__ZNSaIcED1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %551)
  store %struct.Memory* %552, %struct.Memory** %MEMORY, align 8
  store i8* @data_4013cc, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4013cc to i64), i64* %NEXT_PC, align 8
  br label %inst_4013cc

inst_4013cc:                                      ; preds = %inst_4013c7
  %553 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %553, i64* @RIP_2472_293da00, align 8
  %554 = add i64 %553, 5
  store volatile i64 %554, i64* %NEXT_PC, align 8
  %555 = load i64, i64* %NEXT_PC, align 8
  %556 = add i64 %555, 16
  %557 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %556, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %556, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %557, %struct.Memory** %MEMORY, align 8
  br label %inst_4013e1

inst_4013d5:                                      ; preds = %inst_4013d1
  %558 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %558, i64* @RIP_2472_293da00, align 8
  %559 = add i64 %558, 3
  store volatile i64 %559, i64* %NEXT_PC, align 8
  %560 = load i64, i64* @RBP_2328_293da00, align 8
  %561 = sub i64 %560, 60
  %562 = load i32, i32* @RDX_2264_293d9e8, align 4
  %563 = zext i32 %562 to i64
  %564 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %565 = inttoptr i64 %561 to i32*
  %566 = inttoptr i64 %561 to i32*
  %567 = ptrtoint i32* %566 to i64
  store i32 %562, i32* %565, align 4
  store volatile %struct.Memory* %564, %struct.Memory** %MEMORY, align 8
  br label %inst_4013d8

inst_4013d8:                                      ; preds = %inst_4013d5
  %568 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %568, i64* @RIP_2472_293da00, align 8
  %569 = add i64 %568, 4
  store volatile i64 %569, i64* %NEXT_PC, align 8
  %570 = load i64, i64* @RBP_2328_293da00, align 8
  %571 = sub i64 %570, 104
  %572 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %571, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %572, %struct.Memory** %MEMORY, align 8
  br label %inst_4013dc

inst_4013dc:                                      ; preds = %inst_4013d8
  %573 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %573, i64* @RIP_2472_293da00, align 8
  %574 = add i64 %573, 5
  store volatile i64 %574, i64* %NEXT_PC, align 8
  %575 = load i64, i64* %NEXT_PC, align 8
  %576 = sub i64 %575, 881
  %577 = load i64, i64* %NEXT_PC, align 8
  %578 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %579 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i16 = add i64 %579, -8
  %580 = inttoptr i64 %sub.i.i16 to i64*
  %581 = inttoptr i64 %sub.i.i16 to i64*
  %582 = ptrtoint i64* %581 to i64
  store i64 %577, i64* %580, align 8
  store i64 %sub.i.i16, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %576, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %576, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %577, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %578, %struct.Memory** %MEMORY, align 8
  %583 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %584 = call %struct.Memory* @ext_4041f8__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %583)
  store %struct.Memory* %584, %struct.Memory** %MEMORY, align 8
  store i8* @data_4013e1, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4013e1 to i64), i64* %NEXT_PC, align 8
  br label %inst_4013e1

inst_4013e5:                                      ; preds = %inst_4013e1
  %585 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %585, i64* @RIP_2472_293da00, align 8
  %586 = add i64 %585, 5
  store volatile i64 %586, i64* %NEXT_PC, align 8
  %587 = load i64, i64* %NEXT_PC, align 8
  %588 = sub i64 %587, 890
  %589 = load i64, i64* %NEXT_PC, align 8
  %590 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %591 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i5 = add i64 %591, -8
  %592 = inttoptr i64 %sub.i.i5 to i64*
  %593 = inttoptr i64 %sub.i.i5 to i64*
  %594 = ptrtoint i64* %593 to i64
  store i64 %589, i64* %592, align 8
  store i64 %sub.i.i5, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %588, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %588, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %589, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %590, %struct.Memory** %MEMORY, align 8
  %595 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %596 = call %struct.Memory* @ext_4041f8__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %595)
  store %struct.Memory* %596, %struct.Memory** %MEMORY, align 8
  store i8* @data_4013ea, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4013ea to i64), i64* %NEXT_PC, align 8
  br label %inst_4013ea

inst_4013ee:                                      ; preds = %inst_4013ea
  %597 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %597, i64* @RIP_2472_293da00, align 8
  %598 = add i64 %597, 5
  store volatile i64 %598, i64* %NEXT_PC, align 8
  %599 = load i64, i64* %NEXT_PC, align 8
  %600 = sub i64 %599, 739
  %601 = load i64, i64* %NEXT_PC, align 8
  %602 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %603 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i = add i64 %603, -8
  %604 = inttoptr i64 %sub.i.i to i64*
  %605 = inttoptr i64 %sub.i.i to i64*
  %606 = ptrtoint i64* %605 to i64
  store i64 %601, i64* %604, align 8
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %600, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %600, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %601, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %602, %struct.Memory** %MEMORY, align 8
  %607 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %608 = call %struct.Memory* @ext_404240__Unwind_Resume(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %607)
  store %struct.Memory* %608, %struct.Memory** %MEMORY, align 8
  store i8* @data_4013f3, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4013f3 to i64), i64* %NEXT_PC, align 8
  br label %inst_4013f3

inst_4013f3:                                      ; preds = %inst_4013ee
  %609 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %609, i64* @RIP_2472_293da00, align 8
  %610 = add i64 %609, 10
  store volatile i64 %610, i64* %NEXT_PC, align 8
  %611 = load i64, i64* @RAX_2216_293da00, align 8
  %612 = load i64, i64* @RAX_2216_293da00, align 8
  %613 = mul i64 %612, 1
  %614 = add i64 %611, %613
  %615 = load i16, i16* @RAX_2216_293d9d0, align 2
  %616 = zext i16 %615 to i64
  %617 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %617, %struct.Memory** %MEMORY, align 8
  br label %inst_4013fd

inst_4013fd:                                      ; preds = %inst_4013f3
  %618 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %618, i64* @RIP_2472_293da00, align 8
  %619 = add i64 %618, 3
  store volatile i64 %619, i64* %NEXT_PC, align 8
  %620 = load i32, i32* @RAX_2216_293d9e8, align 4
  %621 = zext i32 %620 to i64
  %622 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %622, %struct.Memory** %MEMORY, align 8
  %623 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %623
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401280_frame_dummy(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %1 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 11, i32 0, i32 0
  %2 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 7, i32 0, i32 0
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (void ()* @frame_dummy to i64), i64* %NEXT_PC, align 8
  store void ()* @frame_dummy, void ()** @RIP_2472_294e750, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401280

inst_401280:                                      ; preds = %0
  %3 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %3, i64* @RIP_2472_293da00, align 8
  %4 = add i64 %3, 4
  store volatile i64 %4, i64* %NEXT_PC, align 8
  %5 = load i32, i32* @RDX_2264_293d9e8, align 4
  %6 = zext i32 %5 to i64
  %7 = load i32, i32* @RDI_2296_293d9e8, align 4
  %8 = zext i32 %7 to i64
  %9 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %9, %struct.Memory** %MEMORY, align 8
  br label %inst_401284

inst_401286:                                      ; No predecessors!
  %10 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %10, i64* @RIP_2472_293da00, align 8
  %11 = add i64 %10, 10
  store volatile i64 %11, i64* %NEXT_PC, align 8
  %12 = load i64, i64* @RAX_2216_293da00, align 8
  %13 = load i64, i64* @RAX_2216_293da00, align 8
  %14 = mul i64 %13, 1
  %15 = add i64 %12, %14
  %16 = load i16, i16* @RAX_2216_293d9d0, align 2
  %17 = zext i16 %16 to i64
  %18 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %18, %struct.Memory** %MEMORY, align 8
  %19 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %19

inst_401284:                                      ; preds = %inst_401280
  %20 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %20, i64* @RIP_2472_293da00, align 8
  %21 = add i64 %20, 2
  store volatile i64 %21, i64* %NEXT_PC, align 8
  %22 = load i64, i64* %NEXT_PC, align 8
  %23 = sub i64 %22, 118
  %24 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %23, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %23, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %24, %struct.Memory** %MEMORY, align 8
  br label %inst_401210

inst_401210:                                      ; preds = %inst_401284
  %25 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %26 = load i64, i64* %NEXT_PC, align 8
  %27 = call %struct.Memory* @sub_401210_register_tm_clones(%struct.State* @__mcsema_reg_state, i64 %26, %struct.Memory* %25)
  store %struct.Memory* %27, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %27
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401250___do_global_dtors_aux(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %1 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 11, i32 0, i32 0
  %2 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 7, i32 0, i32 0
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (void ()* @__do_global_dtors_aux to i64), i64* %NEXT_PC, align 8
  store void ()* @__do_global_dtors_aux, void ()** @RIP_2472_294e750, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401250

inst_40126f:                                      ; No predecessors!
  %3 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %3, i64* @RIP_2472_293da00, align 8
  %4 = add i64 %3, 1
  store volatile i64 %4, i64* %NEXT_PC, align 8
  %5 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %5, %struct.Memory** %MEMORY, align 8
  br label %inst_401270

inst_401250:                                      ; preds = %0
  %6 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %6, i64* @RIP_2472_293da00, align 8
  %7 = add i64 %6, 4
  store volatile i64 %7, i64* %NEXT_PC, align 8
  %8 = load i32, i32* @RDX_2264_293d9e8, align 4
  %9 = zext i32 %8 to i64
  %10 = load i32, i32* @RDI_2296_293d9e8, align 4
  %11 = zext i32 %10 to i64
  %12 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %12, %struct.Memory** %MEMORY, align 8
  br label %inst_401254

inst_401271:                                      ; No predecessors!
  %13 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %13, i64* @RIP_2472_293da00, align 8
  %14 = add i64 %13, 11
  store volatile i64 %14, i64* %NEXT_PC, align 8
  %15 = load i64, i64* @RAX_2216_293da00, align 8
  %16 = load i64, i64* @RAX_2216_293da00, align 8
  %17 = mul i64 %16, 1
  %18 = add i64 %15, %17
  %19 = load i16, i16* @RAX_2216_293d9d0, align 2
  %20 = zext i16 %19 to i64
  %21 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %21, %struct.Memory** %MEMORY, align 8
  br label %inst_40127c

inst_401270:                                      ; preds = %58, %inst_40126f
  %22 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %22, i64* @RIP_2472_293da00, align 8
  %23 = add i64 %22, 1
  store volatile i64 %23, i64* %NEXT_PC, align 8
  %24 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %25 = load i64*, i64** @RSP_2312_2948f30, align 8
  %26 = load i64*, i64** @RSP_2312_2948f30, align 8
  %27 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %28 = ptrtoint i64* %26 to i64
  %29 = load i64, i64* %25, align 8
  store i64 %29, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %29, i64* %NEXT_PC, align 8, !tbaa !1290
  %30 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i8 = add i64 %30, 8
  store i64 %add.i.i8, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %24, %struct.Memory** %MEMORY, align 8
  %31 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %31

inst_40125d:                                      ; preds = %59
  %32 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %32, i64* @RIP_2472_293da00, align 8
  %33 = add i64 %32, 1
  store volatile i64 %33, i64* %NEXT_PC, align 8
  %34 = load i64, i64* @RBP_2328_293da00, align 8
  %35 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %36 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %36, -8
  %37 = inttoptr i64 %sub.i.i.i to i64*
  %38 = inttoptr i64 %sub.i.i.i to i64*
  %39 = ptrtoint i64* %38 to i64
  store i64 %34, i64* %37, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %35, %struct.Memory** %MEMORY, align 8
  br label %inst_40125e

inst_401254:                                      ; preds = %inst_401250
  %40 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %40, i64* @RIP_2472_293da00, align 8
  %41 = add i64 %40, 7
  store volatile i64 %41, i64* %NEXT_PC, align 8
  %42 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %43 = load i8, i8* @data_4041d0, align 1
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = zext i8 %43 to i32
  %44 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i) #14, !range !1308
  %45 = trunc i32 %44 to i8
  %46 = and i8 %45, 1
  %47 = xor i8 %46, 1
  store i8 %47, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i8 %43, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i8 %43, 7
  store i8 %res.lobit.i.i.i, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %48 = lshr i8 %43, 7
  %xor1215.i.i.i.i = xor i8 %res.lobit.i.i.i, %48
  %narrow.i.i.i.i = add nuw nsw i8 %xor1215.i.i.i.i, %48
  %cmp.i.i.i.i = icmp eq i8 %narrow.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %42, %struct.Memory** %MEMORY, align 8
  br label %inst_40125b

inst_40125b:                                      ; preds = %inst_401254
  %49 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %49, i64* @RIP_2472_293da00, align 8
  %50 = add i64 %49, 2
  store volatile i64 %50, i64* %NEXT_PC, align 8
  %51 = load i64, i64* %NEXT_PC, align 8
  %52 = add i64 %51, 19
  %53 = load i64, i64* %NEXT_PC, align 8
  %54 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %55 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %tobool.not.i = icmp eq i8 %55, 0
  %frombool.i = zext i1 %tobool.not.i to i8
  store i8 %frombool.i, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %cond1.i.i = select i1 %tobool.not.i, i64 %52, i64 %53
  store i64 %cond1.i.i, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %54, %struct.Memory** %MEMORY, align 8
  %56 = load i8, i8* %BRANCH_TAKEN, align 1
  %57 = icmp eq i8 %56, 1
  br i1 %57, label %58, label %59

58:                                               ; preds = %inst_40125b
  br label %inst_401270

59:                                               ; preds = %inst_40125b
  br label %inst_40125d

inst_40125e:                                      ; preds = %inst_40125d
  %60 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %60, i64* @RIP_2472_293da00, align 8
  %61 = add i64 %60, 3
  store volatile i64 %61, i64* %NEXT_PC, align 8
  %62 = load i64, i64* @RSP_2312_293da00, align 8
  %63 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %62, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %63, %struct.Memory** %MEMORY, align 8
  br label %inst_401261

inst_401261:                                      ; preds = %inst_40125e
  %64 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %64, i64* @RIP_2472_293da00, align 8
  %65 = add i64 %64, 5
  store volatile i64 %65, i64* %NEXT_PC, align 8
  %66 = load i64, i64* %NEXT_PC, align 8
  %67 = sub i64 %66, 134
  %68 = load i64, i64* %NEXT_PC, align 8
  %69 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %70 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i = add i64 %70, -8
  %71 = inttoptr i64 %sub.i.i to i64*
  %72 = inttoptr i64 %sub.i.i to i64*
  %73 = ptrtoint i64* %72 to i64
  store i64 %68, i64* %71, align 8
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %67, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %67, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %68, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %69, %struct.Memory** %MEMORY, align 8
  %74 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %75 = call %struct.Memory* @sub_4011e0_deregister_tm_clones(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %74)
  store %struct.Memory* %75, %struct.Memory** %MEMORY, align 8
  store i8* @data_401266, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401266 to i64), i64* %NEXT_PC, align 8
  br label %inst_401266

inst_401266:                                      ; preds = %inst_401261
  %76 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %76, i64* @RIP_2472_293da00, align 8
  %77 = add i64 %76, 7
  store volatile i64 %77, i64* %NEXT_PC, align 8
  %78 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i8 1, i8* @data_4041d0, align 1
  store volatile %struct.Memory* %78, %struct.Memory** %MEMORY, align 8
  br label %inst_40126d

inst_40126d:                                      ; preds = %inst_401266
  %79 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %79, i64* @RIP_2472_293da00, align 8
  %80 = add i64 %79, 1
  store volatile i64 %80, i64* %NEXT_PC, align 8
  %81 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %82 = load i64*, i64** @RSP_2312_2948f30, align 8
  %83 = load i64*, i64** @RSP_2312_2948f30, align 8
  %84 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i2 = add i64 %84, 8
  store i64 %add.i.i2, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %85 = ptrtoint i64* %83 to i64
  %86 = load i64, i64* %82, align 8
  store i64 %86, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %81, %struct.Memory** %MEMORY, align 8
  br label %inst_40126e

inst_40126e:                                      ; preds = %inst_40126d
  %87 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %87, i64* @RIP_2472_293da00, align 8
  %88 = add i64 %87, 1
  store volatile i64 %88, i64* %NEXT_PC, align 8
  %89 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %90 = load i64*, i64** @RSP_2312_2948f30, align 8
  %91 = load i64*, i64** @RSP_2312_2948f30, align 8
  %92 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %93 = ptrtoint i64* %91 to i64
  %94 = load i64, i64* %90, align 8
  store i64 %94, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %94, i64* %NEXT_PC, align 8, !tbaa !1290
  %95 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %95, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %89, %struct.Memory** %MEMORY, align 8
  %96 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %96

inst_40127c:                                      ; preds = %inst_401271
  %97 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %97, i64* @RIP_2472_293da00, align 8
  %98 = add i64 %97, 4
  store volatile i64 %98, i64* %NEXT_PC, align 8
  %99 = load i32, i32* @RAX_2216_293d9e8, align 4
  %100 = zext i32 %99 to i64
  %101 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %101, %struct.Memory** %MEMORY, align 8
  %102 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %102
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401000__init_proc(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %STATE.i = alloca %struct.State*, align 8
  %MEMORY.i = alloca %struct.Memory*, align 8
  %NEXT_PC.i = alloca i64, align 8
  %ESBASE.i = alloca i64, align 8
  %DSBASE.i = alloca i64, align 8
  %CSBASE.i = alloca i64, align 8
  %SSBASE.i = alloca i64, align 8
  %1 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 11, i32 0, i32 0
  %2 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 7, i32 0, i32 0
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (void ()* @.init_proc to i64), i64* %NEXT_PC, align 8
  store void ()* @.init_proc, void ()** @RIP_2472_294e750, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401000

inst_401000:                                      ; preds = %0
  %3 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %3, i64* @RIP_2472_293da00, align 8
  %4 = add i64 %3, 4
  store volatile i64 %4, i64* %NEXT_PC, align 8
  %5 = load i32, i32* @RDX_2264_293d9e8, align 4
  %6 = zext i32 %5 to i64
  %7 = load i32, i32* @RDI_2296_293d9e8, align 4
  %8 = zext i32 %7 to i64
  %9 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %9, %struct.Memory** %MEMORY, align 8
  br label %inst_401004

inst_401014:                                      ; preds = %103
  %10 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %10, i64* @RIP_2472_293da00, align 8
  %11 = add i64 %10, 2
  store volatile i64 %11, i64* %NEXT_PC, align 8
  %12 = load i64, i64* @RAX_2216_293da00, align 8
  %13 = load i64, i64* %NEXT_PC, align 8
  %14 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %15 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i = add i64 %15, -8
  %16 = inttoptr i64 %sub.i.i to i64*
  %17 = inttoptr i64 %sub.i.i to i64*
  %18 = ptrtoint i64* %17 to i64
  store i64 %13, i64* %16, align 8
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %12, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %12, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %13, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %14, %struct.Memory** %MEMORY, align 8
  %19 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %20 = load i64, i64* %NEXT_PC, align 8
  %21 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %21)
  %22 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %22)
  %23 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %23)
  %24 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %24)
  %25 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %25)
  %26 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %26)
  %27 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %27)
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE.i, align 8, !noalias !1326
  store %struct.Memory* %19, %struct.Memory** %MEMORY.i, align 8, !noalias !1326
  store volatile i64 %20, i64* %NEXT_PC.i, align 8, !noalias !1326
  store volatile i64 0, i64* %ESBASE.i, align 8, !noalias !1326
  store volatile i64 0, i64* %DSBASE.i, align 8, !noalias !1326
  store volatile i64 0, i64* %CSBASE.i, align 8, !noalias !1326
  store volatile i64 0, i64* %SSBASE.i, align 8, !noalias !1326
  %28 = inttoptr i64 %20 to i64 (i64, i64, i64, i64, i64, i64, i64, i64)*
  %29 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1330, !noalias !1331
  %30 = add i64 %29, 8
  %31 = load i64*, i64** @RSP_2312_2948f30, align 8
  %32 = load i64*, i64** @RSP_2312_2948f30, align 8
  %33 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1330, !noalias !1331
  %34 = ptrtoint i64* %32 to i64
  %35 = load i64, i64* %31, align 8
  %param0.i = load i64, i64* @RDI_2296_293da00, align 8, !alias.scope !1330, !noalias !1331
  %param1.i = load i64, i64* @RSI_2280_293da00, align 8, !alias.scope !1330, !noalias !1331
  %param2.i = load i64, i64* @RDX_2264_293da00, align 8, !alias.scope !1330, !noalias !1331
  %param3.i = load i64, i64* @RCX_2248_293da00, align 8, !alias.scope !1330, !noalias !1331
  %param4.i = load i64, i64* @R8_2344_293da00, align 8, !alias.scope !1330, !noalias !1331
  %param5.i = load i64, i64* @R9_2360_293da00, align 8, !alias.scope !1330, !noalias !1331
  %36 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1330, !noalias !1331
  %37 = add i64 %36, 8
  %38 = inttoptr i64 %37 to i64*
  %39 = inttoptr i64 %37 to i64*
  %40 = ptrtoint i64* %39 to i64
  %41 = load i64, i64* %38, align 8
  %42 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1330, !noalias !1331
  %43 = add i64 %42, 16
  %44 = inttoptr i64 %43 to i64*
  %45 = inttoptr i64 %43 to i64*
  %46 = ptrtoint i64* %45 to i64
  %47 = load i64, i64* %44, align 8
  %48 = call i64 %28(i64 %param0.i, i64 %param1.i, i64 %param2.i, i64 %param3.i, i64 %param4.i, i64 %param5.i, i64 %41, i64 %47) #14
  store volatile i64 %48, i64* @RAX_2216_293da00, align 8, !alias.scope !1330, !noalias !1331
  store i64 %35, i64* %NEXT_PC.i, align 8, !noalias !1326
  store volatile i64 %30, i64* @RSP_2312_293da00, align 8, !alias.scope !1330, !noalias !1331
  %49 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %49)
  %50 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %50)
  %51 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %51)
  %52 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %52)
  %53 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %53)
  %54 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %54)
  %55 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %55)
  store %struct.Memory* %19, %struct.Memory** %MEMORY, align 8
  store i8* @data_401016, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401016 to i64), i64* %NEXT_PC, align 8
  br label %inst_401016

inst_401016:                                      ; preds = %102, %inst_401014
  %56 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %56, i64* @RIP_2472_293da00, align 8
  %57 = add i64 %56, 4
  store volatile i64 %57, i64* %NEXT_PC, align 8
  %58 = load i64, i64* @RSP_2312_293da00, align 8
  %59 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %add.i.i3 = add i64 8, %58
  store i64 %add.i.i3, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i = icmp ult i64 %add.i.i3, %58
  %cmp1.i.i.i = icmp ult i64 %add.i.i3, 8
  %60 = or i1 %cmp.i.i.i, %cmp1.i.i.i
  %conv.i.i = zext i1 %60 to i8
  store i8 %conv.i.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = trunc i64 %add.i.i3 to i32
  %conv.i.i.i.i.i = and i32 %conv.i.i.i.i, 255
  %61 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i) #14, !range !1308
  %62 = trunc i32 %61 to i8
  %63 = and i8 %62, 1
  %64 = xor i8 %63, 1
  store i8 %64, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i = xor i64 8, %58
  %xor1.i.i.i.i = xor i64 %xor.i25.i.i.i, %add.i.i3
  %and.i.i.i.i = lshr i64 %xor1.i.i.i.i, 4
  %65 = trunc i64 %and.i.i.i.i to i8
  %66 = and i8 %65, 1
  store i8 %66, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i64 %add.i.i3, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i64 %add.i.i3, 63
  %67 = trunc i64 %res.lobit.i.i.i to i8
  store i8 %67, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i = lshr i64 %58, 63
  %xor.i.i.i.i = xor i64 %res.lobit.i.i.i, %shr.i.i.i.i
  %add.i.i.i.i = add nuw nsw i64 %xor.i.i.i.i, %res.lobit.i.i.i
  %cmp.i.i.i.i = icmp eq i64 %add.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %59, %struct.Memory** %MEMORY, align 8
  br label %inst_40101a

inst_401004:                                      ; preds = %inst_401000
  %68 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %68, i64* @RIP_2472_293da00, align 8
  %69 = add i64 %68, 4
  store volatile i64 %69, i64* %NEXT_PC, align 8
  %70 = load i64, i64* @RSP_2312_293da00, align 8
  %71 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i4 = sub i64 %70, 8
  store i64 %sub.i.i4, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i5 = icmp ult i64 %70, 8
  %conv.i.i6 = zext i1 %cmp.i.i.i5 to i8
  store i8 %conv.i.i6, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i8 = trunc i64 %sub.i.i4 to i32
  %conv.i.i.i.i.i9 = and i32 %conv.i.i.i.i8, 255
  %72 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i9) #14, !range !1308
  %73 = trunc i32 %72 to i8
  %74 = and i8 %73, 1
  %75 = xor i8 %74, 1
  store i8 %75, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i11 = xor i64 8, %70
  %xor1.i.i.i.i12 = xor i64 %xor.i25.i.i.i11, %sub.i.i4
  %and.i.i.i.i13 = lshr i64 %xor1.i.i.i.i12, 4
  %76 = trunc i64 %and.i.i.i.i13 to i8
  %77 = and i8 %76, 1
  store i8 %77, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i15 = icmp eq i64 %sub.i.i4, 0
  %conv5.i.i.i16 = zext i1 %cmp.i24.i.i.i15 to i8
  store i8 %conv5.i.i.i16, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i18 = lshr i64 %sub.i.i4, 63
  %78 = trunc i64 %res.lobit.i.i.i18 to i8
  store i8 %78, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i20 = lshr i64 %70, 63
  %xor3.i.i.i.i = xor i64 %res.lobit.i.i.i18, %shr.i.i.i.i20
  %add.i.i.i.i21 = add nuw nsw i64 %xor3.i.i.i.i, %shr.i.i.i.i20
  %cmp.i.i.i.i22 = icmp eq i64 %add.i.i.i.i21, 2
  %conv11.i.i.i23 = zext i1 %cmp.i.i.i.i22 to i8
  store i8 %conv11.i.i.i23, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %71, %struct.Memory** %MEMORY, align 8
  br label %inst_401008

inst_401008:                                      ; preds = %inst_401004
  %79 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %79, i64* @RIP_2472_293da00, align 8
  %80 = add i64 %79, 7
  store volatile i64 %80, i64* %NEXT_PC, align 8
  %81 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %82 = load i64, i64* bitcast (i8** @data_403ff8 to i64*), align 8
  store i64 %82, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %81, %struct.Memory** %MEMORY, align 8
  br label %inst_40100f

inst_40100f:                                      ; preds = %inst_401008
  %83 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %83, i64* @RIP_2472_293da00, align 8
  %84 = add i64 %83, 3
  store volatile i64 %84, i64* %NEXT_PC, align 8
  %85 = load i64, i64* @RAX_2216_293da00, align 8
  %86 = load i64, i64* @RAX_2216_293da00, align 8
  %87 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %and.i.i = and i64 %86, %85
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i = trunc i64 %and.i.i to i32
  %conv.i.i.i.i27 = and i32 %conv.i.i.i, 255
  %88 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i27) #14, !range !1308
  %89 = trunc i32 %88 to i8
  %90 = and i8 %89, 1
  %91 = xor i8 %90, 1
  store i8 %91, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i = icmp eq i64 %and.i.i, 0
  %conv3.i.i = zext i1 %cmp.i1.i.i to i8
  store i8 %conv3.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i = lshr i64 %and.i.i, 63
  %92 = trunc i64 %res.lobit.i.i to i8
  store i8 %92, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %87, %struct.Memory** %MEMORY, align 8
  br label %inst_401012

inst_401012:                                      ; preds = %inst_40100f
  %93 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %93, i64* @RIP_2472_293da00, align 8
  %94 = add i64 %93, 2
  store volatile i64 %94, i64* %NEXT_PC, align 8
  %95 = load i64, i64* %NEXT_PC, align 8
  %96 = add i64 %95, 2
  %97 = load i64, i64* %NEXT_PC, align 8
  %98 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %99 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  store i8 %99, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %tobool.not.i = icmp eq i8 %99, 0
  %cond1.i.i = select i1 %tobool.not.i, i64 %97, i64 %96
  store i64 %cond1.i.i, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %98, %struct.Memory** %MEMORY, align 8
  %100 = load i8, i8* %BRANCH_TAKEN, align 1
  %101 = icmp eq i8 %100, 1
  br i1 %101, label %102, label %103

102:                                              ; preds = %inst_401012
  br label %inst_401016

103:                                              ; preds = %inst_401012
  br label %inst_401014

inst_40101a:                                      ; preds = %inst_401016
  %104 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %104, i64* @RIP_2472_293da00, align 8
  %105 = add i64 %104, 1
  store volatile i64 %105, i64* %NEXT_PC, align 8
  %106 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %107 = load i64*, i64** @RSP_2312_2948f30, align 8
  %108 = load i64*, i64** @RSP_2312_2948f30, align 8
  %109 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %110 = ptrtoint i64* %108 to i64
  %111 = load i64, i64* %107, align 8
  store i64 %111, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %111, i64* %NEXT_PC, align 8, !tbaa !1290
  %112 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %112, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %106, %struct.Memory** %MEMORY, align 8
  %113 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %113
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401210_register_tm_clones(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %STATE.i = alloca %struct.State*, align 8
  %MEMORY.i = alloca %struct.Memory*, align 8
  %NEXT_PC.i = alloca i64, align 8
  %ESBASE.i = alloca i64, align 8
  %DSBASE.i = alloca i64, align 8
  %CSBASE.i = alloca i64, align 8
  %SSBASE.i = alloca i64, align 8
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @register_tm_clones to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @register_tm_clones, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401210

inst_401240:                                      ; preds = %168, %126, %119, %98
  %1 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %1, i64* @RIP_2472_293da00, align 8
  %2 = add i64 %1, 1
  store volatile i64 %2, i64* %NEXT_PC, align 8
  %3 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %4 = load i64*, i64** @RSP_2312_2948f30, align 8
  %5 = load i64*, i64** @RSP_2312_2948f30, align 8
  %6 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %7 = ptrtoint i64* %5 to i64
  %8 = load i64, i64* %4, align 8
  store i64 %8, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %8, i64* %NEXT_PC, align 8, !tbaa !1290
  %9 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %9, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %3, %struct.Memory** %MEMORY, align 8
  %10 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %10

inst_401241:                                      ; preds = %168, %126
  %11 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %11, i64* @RIP_2472_293da00, align 8
  %12 = add i64 %11, 11
  store volatile i64 %12, i64* %NEXT_PC, align 8
  %13 = load i64, i64* @RAX_2216_293da00, align 8
  %14 = load i64, i64* @RAX_2216_293da00, align 8
  %15 = mul i64 %14, 1
  %16 = add i64 %13, %15
  %17 = load i16, i16* @RAX_2216_293d9d0, align 2
  %18 = zext i16 %17 to i64
  %19 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %19, %struct.Memory** %MEMORY, align 8
  br label %inst_40124c

inst_40122f:                                      ; preds = %99
  %20 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %20, i64* @RIP_2472_293da00, align 8
  %21 = add i64 %20, 5
  store volatile i64 %21, i64* %NEXT_PC, align 8
  %22 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 0, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %22, %struct.Memory** %MEMORY, align 8
  br label %inst_401234

inst_401210:                                      ; preds = %0
  %23 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %23, i64* @RIP_2472_293da00, align 8
  %24 = add i64 %23, 5
  store volatile i64 %24, i64* %NEXT_PC, align 8
  %25 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 4210872, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %25, %struct.Memory** %MEMORY, align 8
  br label %inst_401215

inst_401239:                                      ; preds = %120
  %26 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %26, i64* @RIP_2472_293da00, align 8
  %27 = add i64 %26, 5
  store volatile i64 %27, i64* %NEXT_PC, align 8
  %28 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 4210872, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %28, %struct.Memory** %MEMORY, align 8
  br label %inst_40123e

inst_401215:                                      ; preds = %inst_401210
  %29 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %29, i64* @RIP_2472_293da00, align 8
  %30 = add i64 %29, 7
  store volatile i64 %30, i64* %NEXT_PC, align 8
  %31 = load i64, i64* @RSI_2280_293da00, align 8
  %32 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i = sub i64 %31, 4210872
  store i64 %sub.i.i, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  %cmp.i.i.i = icmp ult i64 %31, 4210872
  %conv.i.i = zext i1 %cmp.i.i.i to i8
  store i8 %conv.i.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = trunc i64 %sub.i.i to i32
  %conv.i.i.i.i.i = and i32 %conv.i.i.i.i, 255
  %33 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i) #14, !range !1308
  %34 = trunc i32 %33 to i8
  %35 = and i8 %34, 1
  %36 = xor i8 %35, 1
  store i8 %36, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i = xor i64 4210872, %31
  %xor1.i.i.i.i = xor i64 %xor.i25.i.i.i, %sub.i.i
  %and.i.i.i.i = lshr i64 %xor1.i.i.i.i, 4
  %37 = trunc i64 %and.i.i.i.i to i8
  %38 = and i8 %37, 1
  store i8 %38, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i64 %sub.i.i, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i64 %sub.i.i, 63
  %39 = trunc i64 %res.lobit.i.i.i to i8
  store i8 %39, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i = lshr i64 %31, 63
  %xor3.i.i.i.i = xor i64 %res.lobit.i.i.i, %shr.i.i.i.i
  %add.i.i.i.i = add nuw nsw i64 %xor3.i.i.i.i, %shr.i.i.i.i
  %cmp.i.i.i.i = icmp eq i64 %add.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %32, %struct.Memory** %MEMORY, align 8
  br label %inst_40121c

inst_40121c:                                      ; preds = %inst_401215
  %40 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %40, i64* @RIP_2472_293da00, align 8
  %41 = add i64 %40, 3
  store volatile i64 %41, i64* %NEXT_PC, align 8
  %42 = load i64, i64* @RSI_2280_293da00, align 8
  %43 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %42, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %43, %struct.Memory** %MEMORY, align 8
  br label %inst_40121f

inst_40121f:                                      ; preds = %inst_40121c
  %44 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %44, i64* @RIP_2472_293da00, align 8
  %45 = add i64 %44, 4
  store volatile i64 %45, i64* %NEXT_PC, align 8
  %46 = load i64, i64* @RSI_2280_293da00, align 8
  %47 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %shr.i141.i = lshr i64 %46, 62
  %tobool.i44 = icmp ne i8 0, 0
  %new_val.0.i45 = lshr i64 %shr.i141.i, 1
  store i64 %new_val.0.i45, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  %48 = trunc i64 %shr.i141.i to i8
  %49 = and i8 %48, 1
  store i8 %49, i8* @CF_2065_293d9b8, align 1, !tbaa !1314
  %conv.i.i48 = trunc i64 %new_val.0.i45 to i32
  %conv.i.i.i49 = and i32 %conv.i.i48, 255
  %50 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i49) #14, !range !1308
  %51 = trunc i32 %50 to i8
  %52 = and i8 %51, 1
  %53 = xor i8 %52, 1
  store i8 %53, i8* @PF_2067_293d9b8, align 1, !tbaa !1314
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1314
  %cmp.i.i = icmp eq i64 %new_val.0.i45, 0
  %conv80.i = zext i1 %cmp.i.i to i8
  store i8 %conv80.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1314
  store i8 0, i8* @SF_2073_293d9b8, align 1, !tbaa !1314
  %conv92.i = zext i1 %tobool.i44 to i8
  store i8 %conv92.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1314
  store volatile %struct.Memory* %47, %struct.Memory** %MEMORY, align 8
  br label %inst_401223

inst_401223:                                      ; preds = %inst_40121f
  %54 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %54, i64* @RIP_2472_293da00, align 8
  %55 = add i64 %54, 4
  store volatile i64 %55, i64* %NEXT_PC, align 8
  %56 = load i64, i64* @RAX_2216_293da00, align 8
  %57 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %shr.i162.i = ashr i64 %56, 2
  %tobool.i = icmp ne i8 0, 0
  %phi.cast.i = zext i1 %tobool.i to i8
  %new_val.0.i32 = ashr i64 %shr.i162.i, 1
  store i64 %new_val.0.i32, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  %58 = trunc i64 %shr.i162.i to i8
  %59 = and i8 %58, 1
  store i8 %59, i8* @CF_2065_293d9b8, align 1, !tbaa !1314
  %conv.i.i35 = trunc i64 %new_val.0.i32 to i32
  %conv.i.i.i36 = and i32 %conv.i.i35, 255
  %60 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i36) #14, !range !1308
  %61 = trunc i32 %60 to i8
  %62 = and i8 %61, 1
  %63 = xor i8 %62, 1
  store i8 %63, i8* @PF_2067_293d9b8, align 1, !tbaa !1314
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1314
  %cmp.i159.i39 = icmp eq i64 %new_val.0.i32, 0
  %conv88.i40 = zext i1 %cmp.i159.i39 to i8
  store i8 %conv88.i40, i8* @ZF_2071_293d9b8, align 1, !tbaa !1314
  %new_val.0.in.lobit.i42 = lshr i64 %shr.i162.i, 63
  %64 = trunc i64 %new_val.0.in.lobit.i42 to i8
  store i8 %64, i8* @SF_2073_293d9b8, align 1, !tbaa !1314
  store i8 %phi.cast.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1314
  store volatile %struct.Memory* %57, %struct.Memory** %MEMORY, align 8
  br label %inst_401227

inst_401227:                                      ; preds = %inst_401223
  %65 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %65, i64* @RIP_2472_293da00, align 8
  %66 = add i64 %65, 3
  store volatile i64 %66, i64* %NEXT_PC, align 8
  %67 = load i64, i64* @RSI_2280_293da00, align 8
  %68 = load i64, i64* @RAX_2216_293da00, align 8
  %69 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %add.i.i10 = add i64 %68, %67
  store i64 %add.i.i10, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  %cmp.i.i.i11 = icmp ult i64 %add.i.i10, %67
  %cmp1.i.i.i = icmp ult i64 %add.i.i10, %68
  %70 = or i1 %cmp.i.i.i11, %cmp1.i.i.i
  %conv.i.i12 = zext i1 %70 to i8
  store i8 %conv.i.i12, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i14 = trunc i64 %add.i.i10 to i32
  %conv.i.i.i.i.i15 = and i32 %conv.i.i.i.i14, 255
  %71 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i15) #14, !range !1308
  %72 = trunc i32 %71 to i8
  %73 = and i8 %72, 1
  %74 = xor i8 %73, 1
  store i8 %74, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i17 = xor i64 %68, %67
  %xor1.i.i.i.i18 = xor i64 %xor.i25.i.i.i17, %add.i.i10
  %and.i.i.i.i19 = lshr i64 %xor1.i.i.i.i18, 4
  %75 = trunc i64 %and.i.i.i.i19 to i8
  %76 = and i8 %75, 1
  store i8 %76, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i21 = icmp eq i64 %add.i.i10, 0
  %conv5.i.i.i22 = zext i1 %cmp.i24.i.i.i21 to i8
  store i8 %conv5.i.i.i22, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i24 = lshr i64 %add.i.i10, 63
  %77 = trunc i64 %res.lobit.i.i.i24 to i8
  store i8 %77, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i26 = lshr i64 %67, 63
  %shr1.i.i.i.i = lshr i64 %68, 63
  %xor.i.i.i.i = xor i64 %res.lobit.i.i.i24, %shr.i.i.i.i26
  %xor3.i.i.i.i27 = xor i64 %res.lobit.i.i.i24, %shr1.i.i.i.i
  %add.i.i.i.i28 = add nuw nsw i64 %xor.i.i.i.i, %xor3.i.i.i.i27
  %cmp.i.i.i.i29 = icmp eq i64 %add.i.i.i.i28, 2
  %conv11.i.i.i30 = zext i1 %cmp.i.i.i.i29 to i8
  store i8 %conv11.i.i.i30, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %69, %struct.Memory** %MEMORY, align 8
  br label %inst_40122a

inst_40122a:                                      ; preds = %inst_401227
  %78 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %78, i64* @RIP_2472_293da00, align 8
  %79 = add i64 %78, 3
  store volatile i64 %79, i64* %NEXT_PC, align 8
  %80 = load i64, i64* @RSI_2280_293da00, align 8
  %81 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %new_val.0.i = ashr i64 %80, 1
  store i64 %new_val.0.i, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  %82 = trunc i64 %80 to i8
  %83 = and i8 %82, 1
  store i8 %83, i8* @CF_2065_293d9b8, align 1, !tbaa !1314
  %conv.i.i7 = trunc i64 %new_val.0.i to i32
  %conv.i.i.i8 = and i32 %conv.i.i7, 255
  %84 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i8) #14, !range !1308
  %85 = trunc i32 %84 to i8
  %86 = and i8 %85, 1
  %87 = xor i8 %86, 1
  store i8 %87, i8* @PF_2067_293d9b8, align 1, !tbaa !1314
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1314
  %cmp.i159.i = icmp eq i64 %new_val.0.i, 0
  %conv88.i = zext i1 %cmp.i159.i to i8
  store i8 %conv88.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1314
  %new_val.0.in.lobit.i = lshr i64 %80, 63
  %88 = trunc i64 %new_val.0.in.lobit.i to i8
  store i8 %88, i8* @SF_2073_293d9b8, align 1, !tbaa !1314
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1314
  store volatile %struct.Memory* %81, %struct.Memory** %MEMORY, align 8
  br label %inst_40122d

inst_40122d:                                      ; preds = %inst_40122a
  %89 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %89, i64* @RIP_2472_293da00, align 8
  %90 = add i64 %89, 2
  store volatile i64 %90, i64* %NEXT_PC, align 8
  %91 = load i64, i64* %NEXT_PC, align 8
  %92 = add i64 %91, 17
  %93 = load i64, i64* %NEXT_PC, align 8
  %94 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %95 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  store i8 %95, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %tobool.not.i5 = icmp eq i8 %95, 0
  %cond1.i.i6 = select i1 %tobool.not.i5, i64 %93, i64 %92
  store i64 %cond1.i.i6, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %94, %struct.Memory** %MEMORY, align 8
  %96 = load i8, i8* %BRANCH_TAKEN, align 1
  %97 = icmp eq i8 %96, 1
  br i1 %97, label %98, label %99

98:                                               ; preds = %inst_40122d
  br label %inst_401240

99:                                               ; preds = %inst_40122d
  br label %inst_40122f

inst_401234:                                      ; preds = %inst_40122f
  %100 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %100, i64* @RIP_2472_293da00, align 8
  %101 = add i64 %100, 3
  store volatile i64 %101, i64* %NEXT_PC, align 8
  %102 = load i64, i64* @RAX_2216_293da00, align 8
  %103 = load i64, i64* @RAX_2216_293da00, align 8
  %104 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %and.i.i = and i64 %103, %102
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i = trunc i64 %and.i.i to i32
  %conv.i.i.i.i3 = and i32 %conv.i.i.i, 255
  %105 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i3) #14, !range !1308
  %106 = trunc i32 %105 to i8
  %107 = and i8 %106, 1
  %108 = xor i8 %107, 1
  store i8 %108, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i = icmp eq i64 %and.i.i, 0
  %conv3.i.i = zext i1 %cmp.i1.i.i to i8
  store i8 %conv3.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i = lshr i64 %and.i.i, 63
  %109 = trunc i64 %res.lobit.i.i to i8
  store i8 %109, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %104, %struct.Memory** %MEMORY, align 8
  br label %inst_401237

inst_401237:                                      ; preds = %inst_401234
  %110 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %110, i64* @RIP_2472_293da00, align 8
  %111 = add i64 %110, 2
  store volatile i64 %111, i64* %NEXT_PC, align 8
  %112 = load i64, i64* %NEXT_PC, align 8
  %113 = add i64 %112, 7
  %114 = load i64, i64* %NEXT_PC, align 8
  %115 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %116 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  store i8 %116, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %tobool.not.i = icmp eq i8 %116, 0
  %cond1.i.i = select i1 %tobool.not.i, i64 %114, i64 %113
  store i64 %cond1.i.i, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %115, %struct.Memory** %MEMORY, align 8
  %117 = load i8, i8* %BRANCH_TAKEN, align 1
  %118 = icmp eq i8 %117, 1
  br i1 %118, label %119, label %120

119:                                              ; preds = %inst_401237
  br label %inst_401240

120:                                              ; preds = %inst_401237
  br label %inst_401239

inst_40123e:                                      ; preds = %inst_401239
  %121 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %121, i64* @RIP_2472_293da00, align 8
  %122 = add i64 %121, 2
  store volatile i64 %122, i64* %NEXT_PC, align 8
  %123 = load i64, i64* @RAX_2216_293da00, align 8
  %124 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %123, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %123, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %124, %struct.Memory** %MEMORY, align 8
  %125 = load i64, i64* @RIP_2472_293da00, align 8
  br label %168

126:                                              ; preds = %168
  %127 = sub i64 ptrtoint (i8* @data_401241 to i64), %125
  %128 = trunc i64 %127 to i32
  %129 = zext i32 %128 to i64
  switch i64 %129, label %130 [
    i64 0, label %inst_401241
    i64 1, label %inst_401240
  ]

130:                                              ; preds = %126
  %131 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %132 = load i64, i64* %NEXT_PC, align 8
  %133 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %133)
  %134 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %134)
  %135 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %135)
  %136 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %136)
  %137 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %137)
  %138 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %138)
  %139 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %139)
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE.i, align 8, !noalias !1332
  store %struct.Memory* %131, %struct.Memory** %MEMORY.i, align 8, !noalias !1332
  store volatile i64 %132, i64* %NEXT_PC.i, align 8, !noalias !1332
  store volatile i64 0, i64* %ESBASE.i, align 8, !noalias !1332
  store volatile i64 0, i64* %DSBASE.i, align 8, !noalias !1332
  store volatile i64 0, i64* %CSBASE.i, align 8, !noalias !1332
  store volatile i64 0, i64* %SSBASE.i, align 8, !noalias !1332
  %140 = inttoptr i64 %132 to i64 (i64, i64, i64, i64, i64, i64, i64, i64)*
  %141 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1336, !noalias !1337
  %142 = add i64 %141, 8
  %143 = load i64*, i64** @RSP_2312_2948f30, align 8
  %144 = load i64*, i64** @RSP_2312_2948f30, align 8
  %145 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1336, !noalias !1337
  %146 = ptrtoint i64* %144 to i64
  %147 = load i64, i64* %143, align 8
  %param0.i = load i64, i64* @RDI_2296_293da00, align 8, !alias.scope !1336, !noalias !1337
  %param1.i = load i64, i64* @RSI_2280_293da00, align 8, !alias.scope !1336, !noalias !1337
  %param2.i = load i64, i64* @RDX_2264_293da00, align 8, !alias.scope !1336, !noalias !1337
  %param3.i = load i64, i64* @RCX_2248_293da00, align 8, !alias.scope !1336, !noalias !1337
  %param4.i = load i64, i64* @R8_2344_293da00, align 8, !alias.scope !1336, !noalias !1337
  %param5.i = load i64, i64* @R9_2360_293da00, align 8, !alias.scope !1336, !noalias !1337
  %148 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1336, !noalias !1337
  %149 = add i64 %148, 8
  %150 = inttoptr i64 %149 to i64*
  %151 = inttoptr i64 %149 to i64*
  %152 = ptrtoint i64* %151 to i64
  %153 = load i64, i64* %150, align 8
  %154 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1336, !noalias !1337
  %155 = add i64 %154, 16
  %156 = inttoptr i64 %155 to i64*
  %157 = inttoptr i64 %155 to i64*
  %158 = ptrtoint i64* %157 to i64
  %159 = load i64, i64* %156, align 8
  %160 = call i64 %140(i64 %param0.i, i64 %param1.i, i64 %param2.i, i64 %param3.i, i64 %param4.i, i64 %param5.i, i64 %153, i64 %159) #14
  store volatile i64 %160, i64* @RAX_2216_293da00, align 8, !alias.scope !1336, !noalias !1337
  store i64 %147, i64* %NEXT_PC.i, align 8, !noalias !1332
  store volatile i64 %142, i64* @RSP_2312_293da00, align 8, !alias.scope !1336, !noalias !1337
  %161 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %161)
  %162 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %162)
  %163 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %163)
  %164 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %164)
  %165 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %165)
  %166 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %166)
  %167 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %167)
  store %struct.Memory* %131, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %131

168:                                              ; preds = %inst_40123e
  switch i64 %125, label %126 [
    i64 4198977, label %inst_401241
    i64 4198976, label %inst_401240
  ]

inst_40124c:                                      ; preds = %inst_401241
  %169 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %169, i64* @RIP_2472_293da00, align 8
  %170 = add i64 %169, 4
  store volatile i64 %170, i64* %NEXT_PC, align 8
  %171 = load i32, i32* @RAX_2216_293d9e8, align 4
  %172 = zext i32 %171 to i64
  %173 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %173, %struct.Memory** %MEMORY, align 8
  %174 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %174
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401400__ZNSt7__cxx114stodERKNS_12basic_stringIcSt11char_traitsIcESaIcEEEPm(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZNSt7__cxx114stodERKNS_12basic_stringIcSt11char_traitsIcESaIcEEEPm to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZNSt7__cxx114stodERKNS_12basic_stringIcSt11char_traitsIcESaIcEEEPm, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401400

inst_401400:                                      ; preds = %0
  %1 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %1, i64* @RIP_2472_293da00, align 8
  %2 = add i64 %1, 1
  store volatile i64 %2, i64* %NEXT_PC, align 8
  %3 = load i64, i64* @RBP_2328_293da00, align 8
  %4 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %5 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %5, -8
  %6 = inttoptr i64 %sub.i.i.i to i64*
  %7 = inttoptr i64 %sub.i.i.i to i64*
  %8 = ptrtoint i64* %7 to i64
  store i64 %3, i64* %6, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %4, %struct.Memory** %MEMORY, align 8
  br label %inst_401401

inst_40143f:                                      ; No predecessors!
  %9 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %9, i64* @RIP_2472_293da00, align 8
  %10 = add i64 %9, 1
  store volatile i64 %10, i64* %NEXT_PC, align 8
  %11 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %11, %struct.Memory** %MEMORY, align 8
  %12 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %12

inst_401401:                                      ; preds = %inst_401400
  %13 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %13, i64* @RIP_2472_293da00, align 8
  %14 = add i64 %13, 3
  store volatile i64 %14, i64* %NEXT_PC, align 8
  %15 = load i64, i64* @RSP_2312_293da00, align 8
  %16 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %15, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %16, %struct.Memory** %MEMORY, align 8
  br label %inst_401404

inst_401404:                                      ; preds = %inst_401401
  %17 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %17, i64* @RIP_2472_293da00, align 8
  %18 = add i64 %17, 4
  store volatile i64 %18, i64* %NEXT_PC, align 8
  %19 = load i64, i64* @RSP_2312_293da00, align 8
  %20 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i = sub i64 %19, 16
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i = icmp ult i64 %19, 16
  %conv.i.i = zext i1 %cmp.i.i.i to i8
  store i8 %conv.i.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = trunc i64 %sub.i.i to i32
  %conv.i.i.i.i.i = and i32 %conv.i.i.i.i, 255
  %21 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i) #14, !range !1308
  %22 = trunc i32 %21 to i8
  %23 = and i8 %22, 1
  %24 = xor i8 %23, 1
  store i8 %24, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i = xor i64 16, %19
  %xor1.i.i.i.i = xor i64 %xor.i25.i.i.i, %sub.i.i
  %and.i.i.i.i = lshr i64 %xor1.i.i.i.i, 4
  %25 = trunc i64 %and.i.i.i.i to i8
  %26 = and i8 %25, 1
  store i8 %26, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i64 %sub.i.i, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i64 %sub.i.i, 63
  %27 = trunc i64 %res.lobit.i.i.i to i8
  store i8 %27, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i = lshr i64 %19, 63
  %xor3.i.i.i.i = xor i64 %res.lobit.i.i.i, %shr.i.i.i.i
  %add.i.i.i.i = add nuw nsw i64 %xor3.i.i.i.i, %shr.i.i.i.i
  %cmp.i.i.i.i = icmp eq i64 %add.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %20, %struct.Memory** %MEMORY, align 8
  br label %inst_401408

inst_401408:                                      ; preds = %inst_401404
  %28 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %28, i64* @RIP_2472_293da00, align 8
  %29 = add i64 %28, 4
  store volatile i64 %29, i64* %NEXT_PC, align 8
  %30 = load i64, i64* @RBP_2328_293da00, align 8
  %31 = sub i64 %30, 8
  %32 = load i64, i64* @RDI_2296_293da00, align 8
  %33 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %34 = inttoptr i64 %31 to i64*
  %35 = inttoptr i64 %31 to i64*
  %36 = ptrtoint i64* %35 to i64
  store i64 %32, i64* %34, align 8
  store volatile %struct.Memory* %33, %struct.Memory** %MEMORY, align 8
  br label %inst_40140c

inst_40140c:                                      ; preds = %inst_401408
  %37 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %37, i64* @RIP_2472_293da00, align 8
  %38 = add i64 %37, 4
  store volatile i64 %38, i64* %NEXT_PC, align 8
  %39 = load i64, i64* @RBP_2328_293da00, align 8
  %40 = sub i64 %39, 16
  %41 = load i64, i64* @RSI_2280_293da00, align 8
  %42 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %43 = inttoptr i64 %40 to i64*
  %44 = inttoptr i64 %40 to i64*
  %45 = ptrtoint i64* %44 to i64
  store i64 %41, i64* %43, align 8
  store volatile %struct.Memory* %42, %struct.Memory** %MEMORY, align 8
  br label %inst_401410

inst_401410:                                      ; preds = %inst_40140c
  %46 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %46, i64* @RIP_2472_293da00, align 8
  %47 = add i64 %46, 4
  store volatile i64 %47, i64* %NEXT_PC, align 8
  %48 = load i64, i64* @RBP_2328_293da00, align 8
  %49 = sub i64 %48, 8
  %50 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %51 = inttoptr i64 %49 to i64*
  %52 = inttoptr i64 %49 to i64*
  %53 = ptrtoint i64* %52 to i64
  %54 = load i64, i64* %51, align 8
  store i64 %54, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %50, %struct.Memory** %MEMORY, align 8
  br label %inst_401414

inst_401414:                                      ; preds = %inst_401410
  %55 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %55, i64* @RIP_2472_293da00, align 8
  %56 = add i64 %55, 5
  store volatile i64 %56, i64* %NEXT_PC, align 8
  %57 = load i64, i64* %NEXT_PC, align 8
  %58 = sub i64 %57, 985
  %59 = load i64, i64* %NEXT_PC, align 8
  %60 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %61 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i29 = add i64 %61, -8
  %62 = inttoptr i64 %sub.i.i29 to i64*
  %63 = inttoptr i64 %sub.i.i29 to i64*
  %64 = ptrtoint i64* %63 to i64
  store i64 %59, i64* %62, align 8
  store i64 %sub.i.i29, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %58, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %58, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %59, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %60, %struct.Memory** %MEMORY, align 8
  %65 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %66 = call %struct.Memory* @ext_4041e8__ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %65)
  store %struct.Memory* %66, %struct.Memory** %MEMORY, align 8
  store i8* @data_401419, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401419 to i64), i64* %NEXT_PC, align 8
  br label %inst_401419

inst_401419:                                      ; preds = %inst_401414
  %67 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %67, i64* @RIP_2472_293da00, align 8
  %68 = add i64 %67, 4
  store volatile i64 %68, i64* %NEXT_PC, align 8
  %69 = load i64, i64* @RBP_2328_293da00, align 8
  %70 = sub i64 %69, 16
  %71 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %72 = inttoptr i64 %70 to i64*
  %73 = inttoptr i64 %70 to i64*
  %74 = ptrtoint i64* %73 to i64
  %75 = load i64, i64* %72, align 8
  store i64 %75, i64* @RCX_2248_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %71, %struct.Memory** %MEMORY, align 8
  br label %inst_40141d

inst_40141d:                                      ; preds = %inst_401419
  %76 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %76, i64* @RIP_2472_293da00, align 8
  %77 = add i64 %76, 10
  store volatile i64 %77, i64* %NEXT_PC, align 8
  %78 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 (i64, i64)* @strtod, i64 (i64, i64)** @RDI_2296_37b08d0, align 8
  store volatile %struct.Memory* %78, %struct.Memory** %MEMORY, align 8
  br label %inst_401427

inst_401427:                                      ; preds = %inst_40141d
  %79 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %79, i64* @RIP_2472_293da00, align 8
  %80 = add i64 %79, 10
  store volatile i64 %80, i64* %NEXT_PC, align 8
  %81 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i8* @data_402015, i8** @RSI_2280_2948dd0, align 8
  store volatile %struct.Memory* %81, %struct.Memory** %MEMORY, align 8
  br label %inst_401431

inst_401431:                                      ; preds = %inst_401427
  %82 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %82, i64* @RIP_2472_293da00, align 8
  %83 = add i64 %82, 3
  store volatile i64 %83, i64* %NEXT_PC, align 8
  %84 = load i64, i64* @RAX_2216_293da00, align 8
  %85 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %84, i64* @RDX_2264_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %85, %struct.Memory** %MEMORY, align 8
  br label %inst_401434

inst_401434:                                      ; preds = %inst_401431
  %86 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %86, i64* @RIP_2472_293da00, align 8
  %87 = add i64 %86, 5
  store volatile i64 %87, i64* %NEXT_PC, align 8
  %88 = load i64, i64* %NEXT_PC, align 8
  %89 = add i64 %88, 7
  %90 = load i64, i64* %NEXT_PC, align 8
  %91 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %92 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i33 = add i64 %92, -8
  %93 = inttoptr i64 %sub.i.i33 to i64*
  %94 = inttoptr i64 %sub.i.i33 to i64*
  %95 = ptrtoint i64* %94 to i64
  store i64 %90, i64* %93, align 8
  store i64 %sub.i.i33, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %89, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %89, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %90, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %91, %struct.Memory** %MEMORY, align 8
  %96 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %97 = call %struct.Memory* @sub_401440__ZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %96)
  store %struct.Memory* %97, %struct.Memory** %MEMORY, align 8
  store i8* @data_401439, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401439 to i64), i64* %NEXT_PC, align 8
  br label %inst_401439

inst_401439:                                      ; preds = %inst_401434
  %98 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %98, i64* @RIP_2472_293da00, align 8
  %99 = add i64 %98, 4
  store volatile i64 %99, i64* %NEXT_PC, align 8
  %100 = load i64, i64* @RSP_2312_293da00, align 8
  %101 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %add.i.i4 = add i64 16, %100
  store i64 %add.i.i4, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i5 = icmp ult i64 %add.i.i4, %100
  %cmp1.i.i.i = icmp ult i64 %add.i.i4, 16
  %102 = or i1 %cmp.i.i.i5, %cmp1.i.i.i
  %conv.i.i6 = zext i1 %102 to i8
  store i8 %conv.i.i6, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i8 = trunc i64 %add.i.i4 to i32
  %conv.i.i.i.i.i9 = and i32 %conv.i.i.i.i8, 255
  %103 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i9) #14, !range !1308
  %104 = trunc i32 %103 to i8
  %105 = and i8 %104, 1
  %106 = xor i8 %105, 1
  store i8 %106, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i11 = xor i64 16, %100
  %xor1.i.i.i.i12 = xor i64 %xor.i25.i.i.i11, %add.i.i4
  %and.i.i.i.i13 = lshr i64 %xor1.i.i.i.i12, 4
  %107 = trunc i64 %and.i.i.i.i13 to i8
  %108 = and i8 %107, 1
  store i8 %108, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i15 = icmp eq i64 %add.i.i4, 0
  %conv5.i.i.i16 = zext i1 %cmp.i24.i.i.i15 to i8
  store i8 %conv5.i.i.i16, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i18 = lshr i64 %add.i.i4, 63
  %109 = trunc i64 %res.lobit.i.i.i18 to i8
  store i8 %109, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i20 = lshr i64 %100, 63
  %xor.i.i.i.i = xor i64 %res.lobit.i.i.i18, %shr.i.i.i.i20
  %add.i.i.i.i21 = add nuw nsw i64 %xor.i.i.i.i, %res.lobit.i.i.i18
  %cmp.i.i.i.i22 = icmp eq i64 %add.i.i.i.i21, 2
  %conv11.i.i.i23 = zext i1 %cmp.i.i.i.i22 to i8
  store i8 %conv11.i.i.i23, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %101, %struct.Memory** %MEMORY, align 8
  br label %inst_40143d

inst_40143d:                                      ; preds = %inst_401439
  %110 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %110, i64* @RIP_2472_293da00, align 8
  %111 = add i64 %110, 1
  store volatile i64 %111, i64* %NEXT_PC, align 8
  %112 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %113 = load i64*, i64** @RSP_2312_2948f30, align 8
  %114 = load i64*, i64** @RSP_2312_2948f30, align 8
  %115 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i2 = add i64 %115, 8
  store i64 %add.i.i2, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %116 = ptrtoint i64* %114 to i64
  %117 = load i64, i64* %113, align 8
  store i64 %117, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %112, %struct.Memory** %MEMORY, align 8
  br label %inst_40143e

inst_40143e:                                      ; preds = %inst_40143d
  %118 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %118, i64* @RIP_2472_293da00, align 8
  %119 = add i64 %118, 1
  store volatile i64 %119, i64* %NEXT_PC, align 8
  %120 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %121 = load i64*, i64** @RSP_2312_2948f30, align 8
  %122 = load i64*, i64** @RSP_2312_2948f30, align 8
  %123 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %124 = ptrtoint i64* %122 to i64
  %125 = load i64, i64* %121, align 8
  store i64 %125, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %125, i64* %NEXT_PC, align 8, !tbaa !1290
  %126 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %126, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %120, %struct.Memory** %MEMORY, align 8
  %127 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %127
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_4011e0_deregister_tm_clones(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %STATE.i = alloca %struct.State*, align 8
  %MEMORY.i = alloca %struct.Memory*, align 8
  %NEXT_PC.i = alloca i64, align 8
  %ESBASE.i = alloca i64, align 8
  %DSBASE.i = alloca i64, align 8
  %CSBASE.i = alloca i64, align 8
  %SSBASE.i = alloca i64, align 8
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @deregister_tm_clones to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @deregister_tm_clones, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_4011e0

inst_4011e0:                                      ; preds = %0
  %1 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %1, i64* @RIP_2472_293da00, align 8
  %2 = add i64 %1, 5
  store volatile i64 %2, i64* %NEXT_PC, align 8
  %3 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 4210872, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %3, %struct.Memory** %MEMORY, align 8
  br label %inst_4011e5

inst_401200:                                      ; preds = %73, %52, %inst_4011fe
  %4 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %4, i64* @RIP_2472_293da00, align 8
  %5 = add i64 %4, 1
  store volatile i64 %5, i64* %NEXT_PC, align 8
  %6 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %7 = load i64*, i64** @RSP_2312_2948f30, align 8
  %8 = load i64*, i64** @RSP_2312_2948f30, align 8
  %9 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %10 = ptrtoint i64* %8 to i64
  %11 = load i64, i64* %7, align 8
  store i64 %11, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %11, i64* %NEXT_PC, align 8, !tbaa !1290
  %12 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %12, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %6, %struct.Memory** %MEMORY, align 8
  %13 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %13

inst_401201:                                      ; preds = %121, %80
  %14 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %14, i64* @RIP_2472_293da00, align 8
  %15 = add i64 %14, 11
  store volatile i64 %15, i64* %NEXT_PC, align 8
  %16 = load i64, i64* @RAX_2216_293da00, align 8
  %17 = load i64, i64* @RAX_2216_293da00, align 8
  %18 = mul i64 %17, 1
  %19 = add i64 %16, %18
  %20 = load i16, i16* @RAX_2216_293d9d0, align 2
  %21 = zext i16 %20 to i64
  %22 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %22, %struct.Memory** %MEMORY, align 8
  br label %inst_40120c

inst_4011ed:                                      ; preds = %53
  %23 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %23, i64* @RIP_2472_293da00, align 8
  %24 = add i64 %23, 5
  store volatile i64 %24, i64* %NEXT_PC, align 8
  %25 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 0, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %25, %struct.Memory** %MEMORY, align 8
  br label %inst_4011f2

inst_4011f7:                                      ; preds = %74
  %26 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %26, i64* @RIP_2472_293da00, align 8
  %27 = add i64 %26, 5
  store volatile i64 %27, i64* %NEXT_PC, align 8
  %28 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 4210872, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %28, %struct.Memory** %MEMORY, align 8
  br label %inst_4011fc

inst_4011fe:                                      ; preds = %121, %80
  %29 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %29, i64* @RIP_2472_293da00, align 8
  %30 = add i64 %29, 2
  store volatile i64 %30, i64* %NEXT_PC, align 8
  %31 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %31, %struct.Memory** %MEMORY, align 8
  br label %inst_401200

inst_4011e5:                                      ; preds = %inst_4011e0
  %32 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %32, i64* @RIP_2472_293da00, align 8
  %33 = add i64 %32, 6
  store volatile i64 %33, i64* %NEXT_PC, align 8
  %34 = load i64, i64* @RAX_2216_293da00, align 8
  %35 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i = sub i64 %34, 4210872
  %cmp.i.i.i = icmp ult i64 %34, 4210872
  %conv.i.i = zext i1 %cmp.i.i.i to i8
  store i8 %conv.i.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i6 = trunc i64 %sub.i.i to i32
  %conv.i.i.i.i.i = and i32 %conv.i.i.i.i6, 255
  %36 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i) #14, !range !1308
  %37 = trunc i32 %36 to i8
  %38 = and i8 %37, 1
  %39 = xor i8 %38, 1
  store i8 %39, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i = xor i64 4210872, %34
  %xor1.i.i.i.i = xor i64 %xor.i25.i.i.i, %sub.i.i
  %and.i.i.i.i = lshr i64 %xor1.i.i.i.i, 4
  %40 = trunc i64 %and.i.i.i.i to i8
  %41 = and i8 %40, 1
  store i8 %41, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i64 %sub.i.i, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i64 %sub.i.i, 63
  %42 = trunc i64 %res.lobit.i.i.i to i8
  store i8 %42, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i = lshr i64 %34, 63
  %xor3.i.i.i.i = xor i64 %res.lobit.i.i.i, %shr.i.i.i.i
  %add.i.i.i.i = add nuw nsw i64 %xor3.i.i.i.i, %shr.i.i.i.i
  %cmp.i.i.i.i = icmp eq i64 %add.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %35, %struct.Memory** %MEMORY, align 8
  br label %inst_4011eb

inst_4011eb:                                      ; preds = %inst_4011e5
  %43 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %43, i64* @RIP_2472_293da00, align 8
  %44 = add i64 %43, 2
  store volatile i64 %44, i64* %NEXT_PC, align 8
  %45 = load i64, i64* %NEXT_PC, align 8
  %46 = add i64 %45, 19
  %47 = load i64, i64* %NEXT_PC, align 8
  %48 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %49 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  store i8 %49, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %tobool.not.i3 = icmp eq i8 %49, 0
  %cond1.i.i4 = select i1 %tobool.not.i3, i64 %47, i64 %46
  store i64 %cond1.i.i4, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %48, %struct.Memory** %MEMORY, align 8
  %50 = load i8, i8* %BRANCH_TAKEN, align 1
  %51 = icmp eq i8 %50, 1
  br i1 %51, label %52, label %53

52:                                               ; preds = %inst_4011eb
  br label %inst_401200

53:                                               ; preds = %inst_4011eb
  br label %inst_4011ed

inst_4011f2:                                      ; preds = %inst_4011ed
  %54 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %54, i64* @RIP_2472_293da00, align 8
  %55 = add i64 %54, 3
  store volatile i64 %55, i64* %NEXT_PC, align 8
  %56 = load i64, i64* @RAX_2216_293da00, align 8
  %57 = load i64, i64* @RAX_2216_293da00, align 8
  %58 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %and.i.i = and i64 %57, %56
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i = trunc i64 %and.i.i to i32
  %conv.i.i.i.i = and i32 %conv.i.i.i, 255
  %59 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i) #14, !range !1308
  %60 = trunc i32 %59 to i8
  %61 = and i8 %60, 1
  %62 = xor i8 %61, 1
  store i8 %62, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i = icmp eq i64 %and.i.i, 0
  %conv3.i.i = zext i1 %cmp.i1.i.i to i8
  store i8 %conv3.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i = lshr i64 %and.i.i, 63
  %63 = trunc i64 %res.lobit.i.i to i8
  store i8 %63, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %58, %struct.Memory** %MEMORY, align 8
  br label %inst_4011f5

inst_4011f5:                                      ; preds = %inst_4011f2
  %64 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %64, i64* @RIP_2472_293da00, align 8
  %65 = add i64 %64, 2
  store volatile i64 %65, i64* %NEXT_PC, align 8
  %66 = load i64, i64* %NEXT_PC, align 8
  %67 = add i64 %66, 9
  %68 = load i64, i64* %NEXT_PC, align 8
  %69 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %70 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  store i8 %70, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %tobool.not.i = icmp eq i8 %70, 0
  %cond1.i.i = select i1 %tobool.not.i, i64 %68, i64 %67
  store i64 %cond1.i.i, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %69, %struct.Memory** %MEMORY, align 8
  %71 = load i8, i8* %BRANCH_TAKEN, align 1
  %72 = icmp eq i8 %71, 1
  br i1 %72, label %73, label %74

73:                                               ; preds = %inst_4011f5
  br label %inst_401200

74:                                               ; preds = %inst_4011f5
  br label %inst_4011f7

inst_4011fc:                                      ; preds = %inst_4011f7
  %75 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %75, i64* @RIP_2472_293da00, align 8
  %76 = add i64 %75, 2
  store volatile i64 %76, i64* %NEXT_PC, align 8
  %77 = load i64, i64* @RAX_2216_293da00, align 8
  %78 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %77, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %77, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %78, %struct.Memory** %MEMORY, align 8
  %79 = load i64, i64* @RIP_2472_293da00, align 8
  br label %121

80:                                               ; preds = %121
  %81 = sub i64 ptrtoint (i8* @data_401201 to i64), %79
  %82 = trunc i64 %81 to i32
  %83 = zext i32 %82 to i64
  switch i64 %83, label %84 [
    i64 0, label %inst_401201
    i64 3, label %inst_4011fe
  ]

84:                                               ; preds = %80
  %85 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %86 = load i64, i64* %NEXT_PC, align 8
  %87 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %87)
  %88 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %88)
  %89 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %89)
  %90 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %90)
  %91 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %91)
  %92 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %92)
  %93 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %93)
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE.i, align 8, !noalias !1338
  store %struct.Memory* %85, %struct.Memory** %MEMORY.i, align 8, !noalias !1338
  store volatile i64 %86, i64* %NEXT_PC.i, align 8, !noalias !1338
  store volatile i64 0, i64* %ESBASE.i, align 8, !noalias !1338
  store volatile i64 0, i64* %DSBASE.i, align 8, !noalias !1338
  store volatile i64 0, i64* %CSBASE.i, align 8, !noalias !1338
  store volatile i64 0, i64* %SSBASE.i, align 8, !noalias !1338
  %94 = inttoptr i64 %86 to i64 (i64, i64, i64, i64, i64, i64, i64, i64)*
  %95 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1342, !noalias !1343
  %96 = add i64 %95, 8
  %97 = load i64*, i64** @RSP_2312_2948f30, align 8
  %98 = load i64*, i64** @RSP_2312_2948f30, align 8
  %99 = ptrtoint i64* %98 to i64
  %100 = load i64, i64* %97, align 8
  %param0.i = load i64, i64* @RDI_2296_293da00, align 8, !alias.scope !1342, !noalias !1343
  %param1.i = load i64, i64* @RSI_2280_293da00, align 8, !alias.scope !1342, !noalias !1343
  %param2.i = load i64, i64* @RDX_2264_293da00, align 8, !alias.scope !1342, !noalias !1343
  %param3.i = load i64, i64* @RCX_2248_293da00, align 8, !alias.scope !1342, !noalias !1343
  %param4.i = load i64, i64* @R8_2344_293da00, align 8, !alias.scope !1342, !noalias !1343
  %param5.i = load i64, i64* @R9_2360_293da00, align 8, !alias.scope !1342, !noalias !1343
  %101 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1342, !noalias !1343
  %102 = add i64 %101, 8
  %103 = inttoptr i64 %102 to i64*
  %104 = inttoptr i64 %102 to i64*
  %105 = ptrtoint i64* %104 to i64
  %106 = load i64, i64* %103, align 8
  %107 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1342, !noalias !1343
  %108 = add i64 %107, 16
  %109 = inttoptr i64 %108 to i64*
  %110 = inttoptr i64 %108 to i64*
  %111 = ptrtoint i64* %110 to i64
  %112 = load i64, i64* %109, align 8
  %113 = call i64 %94(i64 %param0.i, i64 %param1.i, i64 %param2.i, i64 %param3.i, i64 %param4.i, i64 %param5.i, i64 %106, i64 %112) #14
  store volatile i64 %113, i64* @RAX_2216_293da00, align 8, !alias.scope !1342, !noalias !1343
  store i64 %100, i64* %NEXT_PC.i, align 8, !noalias !1338
  store volatile i64 %96, i64* @RSP_2312_293da00, align 8, !alias.scope !1342, !noalias !1343
  %114 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %114)
  %115 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %115)
  %116 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %116)
  %117 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %117)
  %118 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %118)
  %119 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %119)
  %120 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %120)
  store %struct.Memory* %85, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %85

121:                                              ; preds = %inst_4011fc
  switch i64 %79, label %80 [
    i64 4198913, label %inst_401201
    i64 4198910, label %inst_4011fe
  ]

inst_40120c:                                      ; preds = %inst_401201
  %122 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %122, i64* @RIP_2472_293da00, align 8
  %123 = add i64 %122, 4
  store volatile i64 %123, i64* %NEXT_PC, align 8
  %124 = load i32, i32* @RAX_2216_293d9e8, align 4
  %125 = zext i32 %124 to i64
  %126 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %126, %struct.Memory** %MEMORY, align 8
  %127 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %127
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_4011d0__dl_relocate_static_pie(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %1 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 11, i32 0, i32 0
  %2 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 7, i32 0, i32 0
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_dl_relocate_static_pie to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_dl_relocate_static_pie, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_4011d0

inst_4011d0:                                      ; preds = %0
  %3 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %3, i64* @RIP_2472_293da00, align 8
  %4 = add i64 %3, 4
  store volatile i64 %4, i64* %NEXT_PC, align 8
  %5 = load i32, i32* @RDX_2264_293d9e8, align 4
  %6 = zext i32 %5 to i64
  %7 = load i32, i32* @RDI_2296_293d9e8, align 4
  %8 = zext i32 %7 to i64
  %9 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %9, %struct.Memory** %MEMORY, align 8
  br label %inst_4011d4

inst_4011d5:                                      ; No predecessors!
  %10 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %10, i64* @RIP_2472_293da00, align 8
  %11 = add i64 %10, 10
  store volatile i64 %11, i64* %NEXT_PC, align 8
  %12 = load i64, i64* @RAX_2216_293da00, align 8
  %13 = load i64, i64* @RAX_2216_293da00, align 8
  %14 = mul i64 %13, 1
  %15 = add i64 %12, %14
  %16 = load i16, i16* @RAX_2216_293d9d0, align 2
  %17 = zext i16 %16 to i64
  %18 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %18, %struct.Memory** %MEMORY, align 8
  br label %inst_4011df

inst_4011d4:                                      ; preds = %inst_4011d0
  %19 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %19, i64* @RIP_2472_293da00, align 8
  %20 = add i64 %19, 1
  store volatile i64 %20, i64* %NEXT_PC, align 8
  %21 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %22 = load i64*, i64** @RSP_2312_2948f30, align 8
  %23 = load i64*, i64** @RSP_2312_2948f30, align 8
  %24 = ptrtoint i64* %23 to i64
  %25 = load i64, i64* %22, align 8
  store i64 %25, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %25, i64* %NEXT_PC, align 8, !tbaa !1290
  %26 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %26, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %21, %struct.Memory** %MEMORY, align 8
  %27 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %27

inst_4011df:                                      ; preds = %inst_4011d5
  %28 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %28, i64* @RIP_2472_293da00, align 8
  %29 = add i64 %28, 1
  store volatile i64 %29, i64* %NEXT_PC, align 8
  %30 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %30, %struct.Memory** %MEMORY, align 8
  %31 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %31
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_4011a0__start(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %STATE.i = alloca %struct.State*, align 8
  %MEMORY.i = alloca %struct.Memory*, align 8
  %NEXT_PC.i = alloca i64, align 8
  %ESBASE.i = alloca i64, align 8
  %DSBASE.i = alloca i64, align 8
  %CSBASE.i = alloca i64, align 8
  %SSBASE.i = alloca i64, align 8
  %RDI = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  %1 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 17, i32 0, i32 0
  %2 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 11, i32 0, i32 0
  %3 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 7, i32 0, i32 0
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (void ()* @_start to i64), i64* %NEXT_PC, align 8
  store void ()* @_start, void ()** @RIP_2472_294e750, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_4011a0

inst_4011a0:                                      ; preds = %0
  %4 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %4, i64* @RIP_2472_293da00, align 8
  %5 = add i64 %4, 4
  store volatile i64 %5, i64* %NEXT_PC, align 8
  %6 = load i32, i32* @RDX_2264_293d9e8, align 4
  %7 = zext i32 %6 to i64
  %8 = load i32, i32* @RDI_2296_293d9e8, align 4
  %9 = zext i32 %8 to i64
  %10 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %10, %struct.Memory** %MEMORY, align 8
  br label %inst_4011a4

inst_4011c6:                                      ; No predecessors!
  %11 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %11, i64* @RIP_2472_293da00, align 8
  %12 = add i64 %11, 10
  store volatile i64 %12, i64* %NEXT_PC, align 8
  %13 = load i64, i64* @RAX_2216_293da00, align 8
  %14 = load i64, i64* @RAX_2216_293da00, align 8
  %15 = mul i64 %14, 1
  %16 = add i64 %13, %15
  %17 = load i16, i16* @RAX_2216_293d9d0, align 2
  %18 = zext i16 %17 to i64
  %19 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %19, %struct.Memory** %MEMORY, align 8
  %20 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %20

inst_4011a4:                                      ; preds = %inst_4011a0
  %21 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %21, i64* @RIP_2472_293da00, align 8
  %22 = add i64 %21, 2
  store volatile i64 %22, i64* %NEXT_PC, align 8
  %23 = load i32, i32* @RBP_2328_293d9e8, align 4
  %24 = zext i32 %23 to i64
  %25 = load i32, i32* @RBP_2328_293d9e8, align 4
  %26 = zext i32 %25 to i64
  %27 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %xor3.i26.i = xor i64 %26, %24
  %xor3.i.i = trunc i64 %xor3.i26.i to i32
  %conv.i24.i = and i64 %xor3.i26.i, 4294967295
  store i64 %conv.i24.i, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = and i32 %xor3.i.i, 255
  %28 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i) #14, !range !1308
  %29 = trunc i32 %28 to i8
  %30 = and i8 %29, 1
  %31 = xor i8 %30, 1
  store i8 %31, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i = icmp eq i32 %xor3.i.i, 0
  %conv3.i.i = zext i1 %cmp.i1.i.i to i8
  store i8 %conv3.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i = lshr i32 %xor3.i.i, 31
  %32 = trunc i32 %res.lobit.i.i to i8
  store i8 %32, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %27, %struct.Memory** %MEMORY, align 8
  br label %inst_4011a6

inst_4011a6:                                      ; preds = %inst_4011a4
  %33 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %33, i64* @RIP_2472_293da00, align 8
  %34 = add i64 %33, 3
  store volatile i64 %34, i64* %NEXT_PC, align 8
  %35 = load i64, i64* @RDX_2264_293da00, align 8
  %36 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %35, i64* @R9_2360_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %36, %struct.Memory** %MEMORY, align 8
  br label %inst_4011a9

inst_4011a9:                                      ; preds = %inst_4011a6
  %37 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %37, i64* @RIP_2472_293da00, align 8
  %38 = add i64 %37, 1
  store volatile i64 %38, i64* %NEXT_PC, align 8
  %39 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %40 = load i64*, i64** @RSP_2312_2948f30, align 8
  %41 = load i64*, i64** @RSP_2312_2948f30, align 8
  %42 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %42, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %43 = ptrtoint i64* %41 to i64
  %44 = load i64, i64* %40, align 8
  store i64 %44, i64* @RSI_2280_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %39, %struct.Memory** %MEMORY, align 8
  br label %inst_4011aa

inst_4011aa:                                      ; preds = %inst_4011a9
  %45 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %45, i64* @RIP_2472_293da00, align 8
  %46 = add i64 %45, 3
  store volatile i64 %46, i64* %NEXT_PC, align 8
  %47 = load i64, i64* @RSP_2312_293da00, align 8
  %48 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %47, i64* @RDX_2264_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %48, %struct.Memory** %MEMORY, align 8
  br label %inst_4011ad

inst_4011ad:                                      ; preds = %inst_4011aa
  %49 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %49, i64* @RIP_2472_293da00, align 8
  %50 = add i64 %49, 4
  store volatile i64 %50, i64* %NEXT_PC, align 8
  %51 = load i64, i64* @RSP_2312_293da00, align 8
  %52 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %and.i.i = and i64 -16, %51
  store i64 %and.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i = trunc i64 %and.i.i to i32
  %conv.i.i.i.i2 = and i32 %conv.i.i.i, 255
  %53 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i2) #14, !range !1308
  %54 = trunc i32 %53 to i8
  %55 = and i8 %54, 1
  %56 = xor i8 %55, 1
  store i8 %56, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i4 = icmp eq i64 %and.i.i, 0
  %conv3.i.i5 = zext i1 %cmp.i1.i.i4 to i8
  store i8 %conv3.i.i5, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i7 = lshr i64 %and.i.i, 63
  %57 = trunc i64 %res.lobit.i.i7 to i8
  store i8 %57, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %52, %struct.Memory** %MEMORY, align 8
  br label %inst_4011b1

inst_4011b1:                                      ; preds = %inst_4011ad
  %58 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %58, i64* @RIP_2472_293da00, align 8
  %59 = add i64 %58, 1
  store volatile i64 %59, i64* %NEXT_PC, align 8
  %60 = load i64, i64* @RAX_2216_293da00, align 8
  %61 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %62 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %62, -8
  %63 = inttoptr i64 %sub.i.i.i to i64*
  %64 = inttoptr i64 %sub.i.i.i to i64*
  %65 = ptrtoint i64* %64 to i64
  store i64 %60, i64* %63, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %61, %struct.Memory** %MEMORY, align 8
  br label %inst_4011b2

inst_4011b2:                                      ; preds = %inst_4011b1
  %66 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %66, i64* @RIP_2472_293da00, align 8
  %67 = add i64 %66, 1
  store volatile i64 %67, i64* %NEXT_PC, align 8
  %68 = load i64, i64* @RSP_2312_293da00, align 8
  %69 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %70 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i14 = add i64 %70, -8
  %71 = inttoptr i64 %sub.i.i.i14 to i64*
  %72 = inttoptr i64 %sub.i.i.i14 to i64*
  %73 = ptrtoint i64* %72 to i64
  store i64 %68, i64* %71, align 8
  store i64 %sub.i.i.i14, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %69, %struct.Memory** %MEMORY, align 8
  br label %inst_4011b3

inst_4011b3:                                      ; preds = %inst_4011b2
  %74 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %74, i64* @RIP_2472_293da00, align 8
  %75 = add i64 %74, 3
  store volatile i64 %75, i64* %NEXT_PC, align 8
  %76 = load i32, i32* @R8_2344_293d9e8, align 4
  %77 = zext i32 %76 to i64
  %78 = load i32, i32* @R8_2344_293d9e8, align 4
  %79 = zext i32 %78 to i64
  %80 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %xor3.i26.i16 = xor i64 %79, %77
  %xor3.i.i17 = trunc i64 %xor3.i26.i16 to i32
  %conv.i24.i18 = and i64 %xor3.i26.i16, 4294967295
  store i64 %conv.i24.i18, i64* @R8_2344_293da00, align 8, !tbaa !1290
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i20 = and i32 %xor3.i.i17, 255
  %81 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i20) #14, !range !1308
  %82 = trunc i32 %81 to i8
  %83 = and i8 %82, 1
  %84 = xor i8 %83, 1
  store i8 %84, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i22 = icmp eq i32 %xor3.i.i17, 0
  %conv3.i.i23 = zext i1 %cmp.i1.i.i22 to i8
  store i8 %conv3.i.i23, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i25 = lshr i32 %xor3.i.i17, 31
  %85 = trunc i32 %res.lobit.i.i25 to i8
  store i8 %85, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %80, %struct.Memory** %MEMORY, align 8
  br label %inst_4011b6

inst_4011b6:                                      ; preds = %inst_4011b3
  %86 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %86, i64* @RIP_2472_293da00, align 8
  %87 = add i64 %86, 2
  store volatile i64 %87, i64* %NEXT_PC, align 8
  %88 = load i32, i32* @RCX_2248_293d9e8, align 4
  %89 = zext i32 %88 to i64
  %90 = load i32, i32* @RCX_2248_293d9e8, align 4
  %91 = zext i32 %90 to i64
  %92 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %xor3.i26.i29 = xor i64 %91, %89
  %xor3.i.i30 = trunc i64 %xor3.i26.i29 to i32
  %conv.i24.i31 = and i64 %xor3.i26.i29, 4294967295
  store i64 %conv.i24.i31, i64* @RCX_2248_293da00, align 8, !tbaa !1290
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i33 = and i32 %xor3.i.i30, 255
  %93 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i33) #14, !range !1308
  %94 = trunc i32 %93 to i8
  %95 = and i8 %94, 1
  %96 = xor i8 %95, 1
  store i8 %96, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i35 = icmp eq i32 %xor3.i.i30, 0
  %conv3.i.i36 = zext i1 %cmp.i1.i.i35 to i8
  store i8 %conv3.i.i36, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i38 = lshr i32 %xor3.i.i30, 31
  %97 = trunc i32 %res.lobit.i.i38 to i8
  store i8 %97, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %92, %struct.Memory** %MEMORY, align 8
  br label %inst_4011b8

inst_4011b8:                                      ; preds = %inst_4011b6
  %98 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %98, i64* @RIP_2472_293da00, align 8
  %99 = add i64 %98, 7
  store volatile i64 %99, i64* %NEXT_PC, align 8
  %100 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i32 (i32, i8**, i8**)* @main, i32 (i32, i8**, i8**)** @RDI_2296_2af2220, align 8
  store volatile %struct.Memory* %100, %struct.Memory** %MEMORY, align 8
  br label %inst_4011bf

inst_4011bf:                                      ; preds = %inst_4011b8
  %101 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %101, i64* @RIP_2472_293da00, align 8
  %102 = add i64 %101, 6
  store volatile i64 %102, i64* %NEXT_PC, align 8
  %103 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %104 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i = add i64 %104, -8
  %105 = load i64, i64* bitcast (i8** @data_403ff0 to i64*), align 8
  %106 = inttoptr i64 %sub.i.i to i64*
  %107 = inttoptr i64 %sub.i.i to i64*
  %108 = ptrtoint i64* %107 to i64
  store i64 ptrtoint (i8** @data_403ff0 to i64), i64* %106, align 8
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %105, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %105, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 ptrtoint (i8** @data_403ff0 to i64), i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %103, %struct.Memory** %MEMORY, align 8
  %109 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %110 = load i64, i64* %NEXT_PC, align 8
  %111 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %111)
  %112 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %112)
  %113 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %113)
  %114 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %114)
  %115 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %115)
  %116 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %116)
  %117 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %117)
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE.i, align 8, !noalias !1345
  store %struct.Memory* %109, %struct.Memory** %MEMORY.i, align 8, !noalias !1345
  store volatile i64 %110, i64* %NEXT_PC.i, align 8, !noalias !1345
  store volatile i64 0, i64* %ESBASE.i, align 8, !noalias !1345
  store volatile i64 0, i64* %DSBASE.i, align 8, !noalias !1345
  store volatile i64 0, i64* %CSBASE.i, align 8, !noalias !1345
  store volatile i64 0, i64* %SSBASE.i, align 8, !noalias !1345
  %118 = inttoptr i64 %110 to i64 (i64, i64, i64, i64, i64, i64, i64, i64)*
  %119 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1349, !noalias !1350
  %120 = add i64 %119, 8
  %121 = load i64*, i64** @RSP_2312_2948f30, align 8
  %122 = load i64*, i64** @RSP_2312_2948f30, align 8
  %123 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1349, !noalias !1350
  %124 = ptrtoint i64* %122 to i64
  %125 = load i64, i64* %121, align 8
  %param0.i = load i64, i64* @RDI_2296_293da00, align 8, !alias.scope !1349, !noalias !1350
  %param1.i = load i64, i64* @RSI_2280_293da00, align 8, !alias.scope !1349, !noalias !1350
  %param2.i = load i64, i64* @RDX_2264_293da00, align 8, !alias.scope !1349, !noalias !1350
  %param3.i = load i64, i64* @RCX_2248_293da00, align 8, !alias.scope !1349, !noalias !1350
  %param4.i = load i64, i64* @R8_2344_293da00, align 8, !alias.scope !1349, !noalias !1350
  %param5.i = load i64, i64* @R9_2360_293da00, align 8, !alias.scope !1349, !noalias !1350
  %126 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1349, !noalias !1350
  %127 = add i64 %126, 8
  %128 = inttoptr i64 %127 to i64*
  %129 = inttoptr i64 %127 to i64*
  %130 = ptrtoint i64* %129 to i64
  %131 = load i64, i64* %128, align 8
  %132 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1349, !noalias !1350
  %133 = add i64 %132, 16
  %134 = inttoptr i64 %133 to i64*
  %135 = inttoptr i64 %133 to i64*
  %136 = ptrtoint i64* %135 to i64
  %137 = load i64, i64* %134, align 8
  %138 = call i64 %118(i64 %param0.i, i64 %param1.i, i64 %param2.i, i64 %param3.i, i64 %param4.i, i64 %param5.i, i64 %131, i64 %137) #14
  store volatile i64 %138, i64* @RAX_2216_293da00, align 8, !alias.scope !1349, !noalias !1350
  store i64 %125, i64* %NEXT_PC.i, align 8, !noalias !1345
  store volatile i64 %120, i64* @RSP_2312_293da00, align 8, !alias.scope !1349, !noalias !1350
  %139 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %139)
  %140 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %140)
  %141 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %141)
  %142 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %142)
  %143 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %143)
  %144 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %144)
  %145 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %145)
  store %struct.Memory* %109, %struct.Memory** %MEMORY, align 8
  store i8* @data_4011c5, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4011c5 to i64), i64* %NEXT_PC, align 8
  br label %inst_4011c5

inst_4011c5:                                      ; preds = %inst_4011bf
  %146 = load i64, i64* %NEXT_PC, align 8
  store i64 %146, i64* @RIP_2472_293da00, align 8
  %147 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  call void @abort() #14
  unreachable

__remill_error.exit:                              ; No predecessors!
  ret %struct.Memory* undef
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401190__GLOBAL__sub_I_MotivatingExample_cpp(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_GLOBAL__sub_I_MotivatingExample.cpp to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_GLOBAL__sub_I_MotivatingExample.cpp, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401190

inst_401190:                                      ; preds = %0
  %1 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %1, i64* @RIP_2472_293da00, align 8
  %2 = add i64 %1, 1
  store volatile i64 %2, i64* %NEXT_PC, align 8
  %3 = load i64, i64* @RBP_2328_293da00, align 8
  %4 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %5 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %5, -8
  %6 = inttoptr i64 %sub.i.i.i to i64*
  %7 = inttoptr i64 %sub.i.i.i to i64*
  %8 = ptrtoint i64* %7 to i64
  store i64 %3, i64* %6, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %4, %struct.Memory** %MEMORY, align 8
  br label %inst_401191

inst_40119b:                                      ; No predecessors!
  %9 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %9, i64* @RIP_2472_293da00, align 8
  %10 = add i64 %9, 5
  store volatile i64 %10, i64* %NEXT_PC, align 8
  %11 = load i64, i64* @RAX_2216_293da00, align 8
  %12 = load i64, i64* @RAX_2216_293da00, align 8
  %13 = mul i64 %12, 1
  %14 = add i64 %11, %13
  %15 = load i32, i32* @RAX_2216_293d9e8, align 4
  %16 = zext i32 %15 to i64
  %17 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %17, %struct.Memory** %MEMORY, align 8
  %18 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %18

inst_401191:                                      ; preds = %inst_401190
  %19 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %19, i64* @RIP_2472_293da00, align 8
  %20 = add i64 %19, 3
  store volatile i64 %20, i64* %NEXT_PC, align 8
  %21 = load i64, i64* @RSP_2312_293da00, align 8
  %22 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %21, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %22, %struct.Memory** %MEMORY, align 8
  br label %inst_401194

inst_401194:                                      ; preds = %inst_401191
  %23 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %23, i64* @RIP_2472_293da00, align 8
  %24 = add i64 %23, 5
  store volatile i64 %24, i64* %NEXT_PC, align 8
  %25 = load i64, i64* %NEXT_PC, align 8
  %26 = sub i64 %25, 73
  %27 = load i64, i64* %NEXT_PC, align 8
  %28 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %29 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i = add i64 %29, -8
  %30 = inttoptr i64 %sub.i.i to i64*
  %31 = inttoptr i64 %sub.i.i to i64*
  %32 = ptrtoint i64* %31 to i64
  store i64 %27, i64* %30, align 8
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %26, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %26, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %27, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %28, %struct.Memory** %MEMORY, align 8
  %33 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %34 = call %struct.Memory* @sub_401150___cxx_global_var_init(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %33)
  store %struct.Memory* %34, %struct.Memory** %MEMORY, align 8
  store i8* @data_401199, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401199 to i64), i64* %NEXT_PC, align 8
  br label %inst_401199

inst_401199:                                      ; preds = %inst_401194
  %35 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %35, i64* @RIP_2472_293da00, align 8
  %36 = add i64 %35, 1
  store volatile i64 %36, i64* %NEXT_PC, align 8
  %37 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %38 = load i64*, i64** @RSP_2312_2948f30, align 8
  %39 = load i64*, i64** @RSP_2312_2948f30, align 8
  %40 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i2 = add i64 %40, 8
  store i64 %add.i.i2, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %41 = ptrtoint i64* %39 to i64
  %42 = load i64, i64* %38, align 8
  store i64 %42, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %37, %struct.Memory** %MEMORY, align 8
  br label %inst_40119a

inst_40119a:                                      ; preds = %inst_401199
  %43 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %43, i64* @RIP_2472_293da00, align 8
  %44 = add i64 %43, 1
  store volatile i64 %44, i64* %NEXT_PC, align 8
  %45 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %46 = load i64*, i64** @RSP_2312_2948f30, align 8
  %47 = load i64*, i64** @RSP_2312_2948f30, align 8
  %48 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %49 = ptrtoint i64* %47 to i64
  %50 = load i64, i64* %46, align 8
  store i64 %50, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %50, i64* %NEXT_PC, align 8, !tbaa !1290
  %51 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %51, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %45, %struct.Memory** %MEMORY, align 8
  %52 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %52
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401150___cxx_global_var_init(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %RDX = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  %RSI = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  %RAX = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %RDI = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @__cxx_global_var_init to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @__cxx_global_var_init, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401150

inst_401150:                                      ; preds = %0
  %1 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %1, i64* @RIP_2472_293da00, align 8
  %2 = add i64 %1, 1
  store volatile i64 %2, i64* %NEXT_PC, align 8
  %3 = load i64, i64* @RBP_2328_293da00, align 8
  %4 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %5 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %5, -8
  %6 = inttoptr i64 %sub.i.i.i to i64*
  %7 = inttoptr i64 %sub.i.i.i to i64*
  %8 = ptrtoint i64* %7 to i64
  store i64 %3, i64* %6, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %4, %struct.Memory** %MEMORY, align 8
  br label %inst_401151

inst_40118b:                                      ; No predecessors!
  %9 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %9, i64* @RIP_2472_293da00, align 8
  %10 = add i64 %9, 5
  store volatile i64 %10, i64* %NEXT_PC, align 8
  %11 = load i64, i64* @RAX_2216_293da00, align 8
  %12 = load i64, i64* @RAX_2216_293da00, align 8
  %13 = mul i64 %12, 1
  %14 = add i64 %11, %13
  %15 = load i32, i32* @RAX_2216_293d9e8, align 4
  %16 = zext i32 %15 to i64
  %17 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %17, %struct.Memory** %MEMORY, align 8
  %18 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %18

inst_401151:                                      ; preds = %inst_401150
  %19 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %19, i64* @RIP_2472_293da00, align 8
  %20 = add i64 %19, 3
  store volatile i64 %20, i64* %NEXT_PC, align 8
  %21 = load i64, i64* @RSP_2312_293da00, align 8
  %22 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %21, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %22, %struct.Memory** %MEMORY, align 8
  br label %inst_401154

inst_401154:                                      ; preds = %inst_401151
  %23 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %23, i64* @RIP_2472_293da00, align 8
  %24 = add i64 %23, 10
  store volatile i64 %24, i64* %NEXT_PC, align 8
  %25 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i8* @data_4041d1, i8** @RDI_2296_2948dd0, align 8
  store volatile %struct.Memory* %25, %struct.Memory** %MEMORY, align 8
  br label %inst_40115e

inst_40115e:                                      ; preds = %inst_401154
  %26 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %26, i64* @RIP_2472_293da00, align 8
  %27 = add i64 %26, 5
  store volatile i64 %27, i64* %NEXT_PC, align 8
  %28 = load i64, i64* %NEXT_PC, align 8
  %29 = sub i64 %28, 115
  %30 = load i64, i64* %NEXT_PC, align 8
  %31 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %32 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i = add i64 %32, -8
  %33 = inttoptr i64 %sub.i.i to i64*
  %34 = inttoptr i64 %sub.i.i to i64*
  %35 = ptrtoint i64* %34 to i64
  store i64 %30, i64* %33, align 8
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %29, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %29, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %30, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %31, %struct.Memory** %MEMORY, align 8
  %36 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %37 = call %struct.Memory* @ext_404238__ZNSt8ios_base4InitC1Ev(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %36)
  store %struct.Memory* %37, %struct.Memory** %MEMORY, align 8
  store i8* @data_401163, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401163 to i64), i64* %NEXT_PC, align 8
  br label %inst_401163

inst_401163:                                      ; preds = %inst_40115e
  %38 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %38, i64* @RIP_2472_293da00, align 8
  %39 = add i64 %38, 10
  store volatile i64 %39, i64* %NEXT_PC, align 8
  %40 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 (i64)* @_ZNSt8ios_base4InitD1Ev, i64 (i64)** @RAX_2216_294cc80, align 8
  store volatile %struct.Memory* %40, %struct.Memory** %MEMORY, align 8
  br label %inst_40116d

inst_40116d:                                      ; preds = %inst_401163
  %41 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %41, i64* @RIP_2472_293da00, align 8
  %42 = add i64 %41, 3
  store volatile i64 %42, i64* %NEXT_PC, align 8
  %43 = load i64, i64* @RAX_2216_293da00, align 8
  %44 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %43, i64* @RDI_2296_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %44, %struct.Memory** %MEMORY, align 8
  br label %inst_401170

inst_401170:                                      ; preds = %inst_40116d
  %45 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %45, i64* @RIP_2472_293da00, align 8
  %46 = add i64 %45, 10
  store volatile i64 %46, i64* %NEXT_PC, align 8
  %47 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i8* @data_4041d1, i8** @RSI_2280_2948dd0, align 8
  store volatile %struct.Memory* %47, %struct.Memory** %MEMORY, align 8
  br label %inst_40117a

inst_40117a:                                      ; preds = %inst_401170
  %48 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %48, i64* @RIP_2472_293da00, align 8
  %49 = add i64 %48, 10
  store volatile i64 %49, i64* %NEXT_PC, align 8
  %50 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i8* @data_4040b0, i8** @RDX_2264_2948dd0, align 8
  store volatile %struct.Memory* %50, %struct.Memory** %MEMORY, align 8
  br label %inst_401184

inst_401184:                                      ; preds = %inst_40117a
  %51 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %51, i64* @RIP_2472_293da00, align 8
  %52 = add i64 %51, 5
  store volatile i64 %52, i64* %NEXT_PC, align 8
  %53 = load i64, i64* %NEXT_PC, align 8
  %54 = sub i64 %53, 249
  %55 = load i64, i64* %NEXT_PC, align 8
  %56 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %57 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i7 = add i64 %57, -8
  %58 = inttoptr i64 %sub.i.i7 to i64*
  %59 = inttoptr i64 %sub.i.i7 to i64*
  %60 = ptrtoint i64* %59 to i64
  store i64 %55, i64* %58, align 8
  store i64 %sub.i.i7, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %54, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %54, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %55, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %56, %struct.Memory** %MEMORY, align 8
  %61 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %62 = call %struct.Memory* @ext_404208___cxa_atexit(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %61)
  store %struct.Memory* %62, %struct.Memory** %MEMORY, align 8
  store i8* @data_401189, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401189 to i64), i64* %NEXT_PC, align 8
  br label %inst_401189

inst_401189:                                      ; preds = %inst_401184
  %63 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %63, i64* @RIP_2472_293da00, align 8
  %64 = add i64 %63, 1
  store volatile i64 %64, i64* %NEXT_PC, align 8
  %65 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %66 = load i64*, i64** @RSP_2312_2948f30, align 8
  %67 = load i64*, i64** @RSP_2312_2948f30, align 8
  %68 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i2 = add i64 %68, 8
  store i64 %add.i.i2, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %69 = ptrtoint i64* %67 to i64
  %70 = load i64, i64* %66, align 8
  store i64 %70, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %65, %struct.Memory** %MEMORY, align 8
  br label %inst_40118a

inst_40118a:                                      ; preds = %inst_401189
  %71 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %71, i64* @RIP_2472_293da00, align 8
  %72 = add i64 %71, 1
  store volatile i64 %72, i64* %NEXT_PC, align 8
  %73 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %74 = load i64*, i64** @RSP_2312_2948f30, align 8
  %75 = load i64*, i64** @RSP_2312_2948f30, align 8
  %76 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %77 = ptrtoint i64* %75 to i64
  %78 = load i64, i64* %74, align 8
  store i64 %78, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %78, i64* %NEXT_PC, align 8, !tbaa !1290
  %79 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %79, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %73, %struct.Memory** %MEMORY, align 8
  %80 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %80
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401020(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %STATE.i = alloca %struct.State*, align 8
  %MEMORY.i = alloca %struct.Memory*, align 8
  %NEXT_PC.i = alloca i64, align 8
  %ESBASE.i = alloca i64, align 8
  %DSBASE.i = alloca i64, align 8
  %CSBASE.i = alloca i64, align 8
  %SSBASE.i = alloca i64, align 8
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_401020 to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @callback_sub_401020, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401020

inst_401020:                                      ; preds = %0
  %1 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %1, i64* @RIP_2472_293da00, align 8
  %2 = add i64 %1, 6
  store volatile i64 %2, i64* %NEXT_PC, align 8
  %3 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %4 = load i64, i64* bitcast (i8* @data_404008 to i64*), align 8
  %5 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %5, -8
  %6 = inttoptr i64 %sub.i.i.i to i64*
  %7 = inttoptr i64 %sub.i.i.i to i64*
  %8 = ptrtoint i64* %7 to i64
  store i64 %4, i64* %6, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %3, %struct.Memory** %MEMORY, align 8
  br label %inst_401026

inst_40102c:                                      ; preds = %62, %20
  %9 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %9, i64* @RIP_2472_293da00, align 8
  %10 = add i64 %9, 4
  store volatile i64 %10, i64* %NEXT_PC, align 8
  %11 = load i32, i32* @RAX_2216_293d9e8, align 4
  %12 = zext i32 %11 to i64
  %13 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %13, %struct.Memory** %MEMORY, align 8
  %14 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %14

inst_401026:                                      ; preds = %inst_401020
  %15 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %15, i64* @RIP_2472_293da00, align 8
  %16 = add i64 %15, 6
  store volatile i64 %16, i64* %NEXT_PC, align 8
  %17 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %18 = load i64, i64* bitcast (i8* @data_404010 to i64*), align 8
  store i64 %18, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %18, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %17, %struct.Memory** %MEMORY, align 8
  %19 = load i64, i64* @RIP_2472_293da00, align 8
  br label %62

20:                                               ; preds = %62
  %21 = sub i64 ptrtoint (i8* @data_40102c to i64), %19
  %22 = trunc i64 %21 to i32
  %23 = zext i32 %22 to i64
  switch i64 %23, label %24 [
    i64 0, label %inst_40102c
  ]

24:                                               ; preds = %20
  %25 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %26 = load i64, i64* %NEXT_PC, align 8
  %27 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %27)
  %28 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %28)
  %29 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %29)
  %30 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %30)
  %31 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %31)
  %32 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %32)
  %33 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %33)
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE.i, align 8, !noalias !1353
  store %struct.Memory* %25, %struct.Memory** %MEMORY.i, align 8, !noalias !1353
  store volatile i64 %26, i64* %NEXT_PC.i, align 8, !noalias !1353
  store volatile i64 0, i64* %ESBASE.i, align 8, !noalias !1353
  store volatile i64 0, i64* %DSBASE.i, align 8, !noalias !1353
  store volatile i64 0, i64* %CSBASE.i, align 8, !noalias !1353
  store volatile i64 0, i64* %SSBASE.i, align 8, !noalias !1353
  %34 = inttoptr i64 %26 to i64 (i64, i64, i64, i64, i64, i64, i64, i64)*
  %35 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1357, !noalias !1358
  %36 = add i64 %35, 8
  %37 = load i64*, i64** @RSP_2312_2948f30, align 8
  %38 = load i64*, i64** @RSP_2312_2948f30, align 8
  %39 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1357, !noalias !1358
  %40 = ptrtoint i64* %38 to i64
  %41 = load i64, i64* %37, align 8
  %param0.i = load i64, i64* @RDI_2296_293da00, align 8, !alias.scope !1357, !noalias !1358
  %param1.i = load i64, i64* @RSI_2280_293da00, align 8, !alias.scope !1357, !noalias !1358
  %param2.i = load i64, i64* @RDX_2264_293da00, align 8, !alias.scope !1357, !noalias !1358
  %param3.i = load i64, i64* @RCX_2248_293da00, align 8, !alias.scope !1357, !noalias !1358
  %param4.i = load i64, i64* @R8_2344_293da00, align 8, !alias.scope !1357, !noalias !1358
  %param5.i = load i64, i64* @R9_2360_293da00, align 8, !alias.scope !1357, !noalias !1358
  %42 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1357, !noalias !1358
  %43 = add i64 %42, 8
  %44 = inttoptr i64 %43 to i64*
  %45 = inttoptr i64 %43 to i64*
  %46 = ptrtoint i64* %45 to i64
  %47 = load i64, i64* %44, align 8
  %48 = load i64, i64* @RSP_2312_293da00, align 8, !alias.scope !1357, !noalias !1358
  %49 = add i64 %48, 16
  %50 = inttoptr i64 %49 to i64*
  %51 = inttoptr i64 %49 to i64*
  %52 = ptrtoint i64* %51 to i64
  %53 = load i64, i64* %50, align 8
  %54 = call i64 %34(i64 %param0.i, i64 %param1.i, i64 %param2.i, i64 %param3.i, i64 %param4.i, i64 %param5.i, i64 %47, i64 %53) #14
  store volatile i64 %54, i64* @RAX_2216_293da00, align 8, !alias.scope !1357, !noalias !1358
  store i64 %41, i64* %NEXT_PC.i, align 8, !noalias !1353
  store volatile i64 %36, i64* @RSP_2312_293da00, align 8, !alias.scope !1357, !noalias !1358
  %55 = bitcast %struct.State** %STATE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %55)
  %56 = bitcast %struct.Memory** %MEMORY.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %56)
  %57 = bitcast i64* %NEXT_PC.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %57)
  %58 = bitcast i64* %ESBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %58)
  %59 = bitcast i64* %DSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %59)
  %60 = bitcast i64* %CSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %60)
  %61 = bitcast i64* %SSBASE.i to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %61)
  store %struct.Memory* %25, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %25

62:                                               ; preds = %inst_401026
  switch i64 %19, label %20 [
    i64 4198444, label %inst_40102c
  ]
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_401560__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoC2Ev(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoC2Ev to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoC2Ev, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_401560

inst_401560:                                      ; preds = %0
  %1 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %1, i64* @RIP_2472_293da00, align 8
  %2 = add i64 %1, 1
  store volatile i64 %2, i64* %NEXT_PC, align 8
  %3 = load i64, i64* @RBP_2328_293da00, align 8
  %4 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %5 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %5, -8
  %6 = inttoptr i64 %sub.i.i.i to i64*
  %7 = inttoptr i64 %sub.i.i.i to i64*
  %8 = ptrtoint i64* %7 to i64
  store i64 %3, i64* %6, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %4, %struct.Memory** %MEMORY, align 8
  br label %inst_401561

inst_401592:                                      ; No predecessors!
  %9 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %9, i64* @RIP_2472_293da00, align 8
  %10 = add i64 %9, 10
  store volatile i64 %10, i64* %NEXT_PC, align 8
  %11 = load i64, i64* @RAX_2216_293da00, align 8
  %12 = load i64, i64* @RAX_2216_293da00, align 8
  %13 = mul i64 %12, 1
  %14 = add i64 %11, %13
  %15 = load i16, i16* @RAX_2216_293d9d0, align 2
  %16 = zext i16 %15 to i64
  %17 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %17, %struct.Memory** %MEMORY, align 8
  br label %inst_40159c

inst_401561:                                      ; preds = %inst_401560
  %18 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %18, i64* @RIP_2472_293da00, align 8
  %19 = add i64 %18, 3
  store volatile i64 %19, i64* %NEXT_PC, align 8
  %20 = load i64, i64* @RSP_2312_293da00, align 8
  %21 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %20, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %21, %struct.Memory** %MEMORY, align 8
  br label %inst_401564

inst_401564:                                      ; preds = %inst_401561
  %22 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %22, i64* @RIP_2472_293da00, align 8
  %23 = add i64 %22, 4
  store volatile i64 %23, i64* %NEXT_PC, align 8
  %24 = load i64, i64* @RSP_2312_293da00, align 8
  %25 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i = sub i64 %24, 16
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i = icmp ult i64 %24, 16
  %conv.i.i = zext i1 %cmp.i.i.i to i8
  store i8 %conv.i.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = trunc i64 %sub.i.i to i32
  %conv.i.i.i.i.i = and i32 %conv.i.i.i.i, 255
  %26 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i) #14, !range !1308
  %27 = trunc i32 %26 to i8
  %28 = and i8 %27, 1
  %29 = xor i8 %28, 1
  store i8 %29, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i = xor i64 16, %24
  %xor1.i.i.i.i = xor i64 %xor.i25.i.i.i, %sub.i.i
  %and.i.i.i.i = lshr i64 %xor1.i.i.i.i, 4
  %30 = trunc i64 %and.i.i.i.i to i8
  %31 = and i8 %30, 1
  store i8 %31, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i64 %sub.i.i, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i64 %sub.i.i, 63
  %32 = trunc i64 %res.lobit.i.i.i to i8
  store i8 %32, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i = lshr i64 %24, 63
  %xor3.i.i.i.i = xor i64 %res.lobit.i.i.i, %shr.i.i.i.i
  %add.i.i.i.i = add nuw nsw i64 %xor3.i.i.i.i, %shr.i.i.i.i
  %cmp.i.i.i.i = icmp eq i64 %add.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %25, %struct.Memory** %MEMORY, align 8
  br label %inst_401568

inst_401568:                                      ; preds = %inst_401564
  %33 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %33, i64* @RIP_2472_293da00, align 8
  %34 = add i64 %33, 4
  store volatile i64 %34, i64* %NEXT_PC, align 8
  %35 = load i64, i64* @RBP_2328_293da00, align 8
  %36 = sub i64 %35, 8
  %37 = load i64, i64* @RDI_2296_293da00, align 8
  %38 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %39 = inttoptr i64 %36 to i64*
  %40 = inttoptr i64 %36 to i64*
  %41 = ptrtoint i64* %40 to i64
  store i64 %37, i64* %39, align 8
  store volatile %struct.Memory* %38, %struct.Memory** %MEMORY, align 8
  br label %inst_40156c

inst_40156c:                                      ; preds = %inst_401568
  %42 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %42, i64* @RIP_2472_293da00, align 8
  %43 = add i64 %42, 4
  store volatile i64 %43, i64* %NEXT_PC, align 8
  %44 = load i64, i64* @RBP_2328_293da00, align 8
  %45 = sub i64 %44, 8
  %46 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %47 = inttoptr i64 %45 to i64*
  %48 = inttoptr i64 %45 to i64*
  %49 = ptrtoint i64* %48 to i64
  %50 = load i64, i64* %47, align 8
  store i64 %50, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %46, %struct.Memory** %MEMORY, align 8
  br label %inst_401570

inst_401570:                                      ; preds = %inst_40156c
  %51 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %51, i64* @RIP_2472_293da00, align 8
  %52 = add i64 %51, 4
  store volatile i64 %52, i64* %NEXT_PC, align 8
  %53 = load i64, i64* @RBP_2328_293da00, align 8
  %54 = sub i64 %53, 16
  %55 = load i64, i64* @RAX_2216_293da00, align 8
  %56 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %57 = inttoptr i64 %54 to i64*
  %58 = inttoptr i64 %54 to i64*
  %59 = ptrtoint i64* %58 to i64
  store i64 %55, i64* %57, align 8
  store volatile %struct.Memory* %56, %struct.Memory** %MEMORY, align 8
  br label %inst_401574

inst_401574:                                      ; preds = %inst_401570
  %60 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %60, i64* @RIP_2472_293da00, align 8
  %61 = add i64 %60, 5
  store volatile i64 %61, i64* %NEXT_PC, align 8
  %62 = load i64, i64* %NEXT_PC, align 8
  %63 = sub i64 %62, 1353
  %64 = load i64, i64* %NEXT_PC, align 8
  %65 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %66 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i30 = add i64 %66, -8
  %67 = inttoptr i64 %sub.i.i30 to i64*
  %68 = inttoptr i64 %sub.i.i30 to i64*
  %69 = ptrtoint i64* %68 to i64
  store i64 %64, i64* %67, align 8
  store i64 %sub.i.i30, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %63, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %63, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %64, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %65, %struct.Memory** %MEMORY, align 8
  %70 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %71 = call %struct.Memory* @ext_4041e0___errno_location(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %70)
  store %struct.Memory* %71, %struct.Memory** %MEMORY, align 8
  store i8* @data_401579, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401579 to i64), i64* %NEXT_PC, align 8
  br label %inst_401579

inst_401579:                                      ; preds = %inst_401574
  %72 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %72, i64* @RIP_2472_293da00, align 8
  %73 = add i64 %72, 2
  store volatile i64 %73, i64* %NEXT_PC, align 8
  %74 = load i32*, i32** @RAX_2216_294e270, align 8
  %75 = load i32*, i32** @RAX_2216_294e270, align 8
  %76 = load i64, i64* @RAX_2216_293da00, align 8
  %77 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %78 = ptrtoint i32* %75 to i64
  %79 = load i32, i32* %74, align 4
  %conv.i.i33 = zext i32 %79 to i64
  store i64 %conv.i.i33, i64* @RCX_2248_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %77, %struct.Memory** %MEMORY, align 8
  br label %inst_40157b

inst_40157b:                                      ; preds = %inst_401579
  %80 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %80, i64* @RIP_2472_293da00, align 8
  %81 = add i64 %80, 4
  store volatile i64 %81, i64* %NEXT_PC, align 8
  %82 = load i64, i64* @RBP_2328_293da00, align 8
  %83 = sub i64 %82, 16
  %84 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %85 = inttoptr i64 %83 to i64*
  %86 = inttoptr i64 %83 to i64*
  %87 = ptrtoint i64* %86 to i64
  %88 = load i64, i64* %85, align 8
  store i64 %88, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %84, %struct.Memory** %MEMORY, align 8
  br label %inst_40157f

inst_40157f:                                      ; preds = %inst_40157b
  %89 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %89, i64* @RIP_2472_293da00, align 8
  %90 = add i64 %89, 2
  store volatile i64 %90, i64* %NEXT_PC, align 8
  %91 = load i32*, i32** @RAX_2216_294e270, align 8
  %92 = load i32*, i32** @RAX_2216_294e270, align 8
  %93 = load i64, i64* @RAX_2216_293da00, align 8
  %94 = load i32, i32* @RCX_2248_293d9e8, align 4
  %95 = zext i32 %94 to i64
  %96 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %97 = ptrtoint i32* %92 to i64
  store i32 %94, i32* %91, align 4
  store volatile %struct.Memory* %96, %struct.Memory** %MEMORY, align 8
  br label %inst_401581

inst_401581:                                      ; preds = %inst_40157f
  %98 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %98, i64* @RIP_2472_293da00, align 8
  %99 = add i64 %98, 5
  store volatile i64 %99, i64* %NEXT_PC, align 8
  %100 = load i64, i64* %NEXT_PC, align 8
  %101 = sub i64 %100, 1366
  %102 = load i64, i64* %NEXT_PC, align 8
  %103 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %104 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i37 = add i64 %104, -8
  %105 = inttoptr i64 %sub.i.i37 to i64*
  %106 = inttoptr i64 %sub.i.i37 to i64*
  %107 = ptrtoint i64* %106 to i64
  store i64 %102, i64* %105, align 8
  store i64 %sub.i.i37, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %101, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %101, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %102, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %103, %struct.Memory** %MEMORY, align 8
  %108 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %109 = call %struct.Memory* @ext_4041e0___errno_location(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %108)
  store %struct.Memory* %109, %struct.Memory** %MEMORY, align 8
  store i8* @data_401586, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_401586 to i64), i64* %NEXT_PC, align 8
  br label %inst_401586

inst_401586:                                      ; preds = %inst_401581
  %110 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %110, i64* @RIP_2472_293da00, align 8
  %111 = add i64 %110, 6
  store volatile i64 %111, i64* %NEXT_PC, align 8
  %112 = load i32*, i32** @RAX_2216_294e270, align 8
  %113 = load i32*, i32** @RAX_2216_294e270, align 8
  %114 = load i64, i64* @RAX_2216_293da00, align 8
  %115 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %116 = ptrtoint i32* %113 to i64
  store i32 0, i32* %112, align 4
  store volatile %struct.Memory* %115, %struct.Memory** %MEMORY, align 8
  br label %inst_40158c

inst_40158c:                                      ; preds = %inst_401586
  %117 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %117, i64* @RIP_2472_293da00, align 8
  %118 = add i64 %117, 4
  store volatile i64 %118, i64* %NEXT_PC, align 8
  %119 = load i64, i64* @RSP_2312_293da00, align 8
  %120 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %add.i.i4 = add i64 16, %119
  store i64 %add.i.i4, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i5 = icmp ult i64 %add.i.i4, %119
  %cmp1.i.i.i = icmp ult i64 %add.i.i4, 16
  %121 = or i1 %cmp.i.i.i5, %cmp1.i.i.i
  %conv.i.i6 = zext i1 %121 to i8
  store i8 %conv.i.i6, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i8 = trunc i64 %add.i.i4 to i32
  %conv.i.i.i.i.i9 = and i32 %conv.i.i.i.i8, 255
  %122 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i9) #14, !range !1308
  %123 = trunc i32 %122 to i8
  %124 = and i8 %123, 1
  %125 = xor i8 %124, 1
  store i8 %125, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i11 = xor i64 16, %119
  %xor1.i.i.i.i12 = xor i64 %xor.i25.i.i.i11, %add.i.i4
  %and.i.i.i.i13 = lshr i64 %xor1.i.i.i.i12, 4
  %126 = trunc i64 %and.i.i.i.i13 to i8
  %127 = and i8 %126, 1
  store i8 %127, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i15 = icmp eq i64 %add.i.i4, 0
  %conv5.i.i.i16 = zext i1 %cmp.i24.i.i.i15 to i8
  store i8 %conv5.i.i.i16, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i18 = lshr i64 %add.i.i4, 63
  %128 = trunc i64 %res.lobit.i.i.i18 to i8
  store i8 %128, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i20 = lshr i64 %119, 63
  %xor.i.i.i.i = xor i64 %res.lobit.i.i.i18, %shr.i.i.i.i20
  %add.i.i.i.i21 = add nuw nsw i64 %xor.i.i.i.i, %res.lobit.i.i.i18
  %cmp.i.i.i.i22 = icmp eq i64 %add.i.i.i.i21, 2
  %conv11.i.i.i23 = zext i1 %cmp.i.i.i.i22 to i8
  store i8 %conv11.i.i.i23, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %120, %struct.Memory** %MEMORY, align 8
  br label %inst_401590

inst_401590:                                      ; preds = %inst_40158c
  %129 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %129, i64* @RIP_2472_293da00, align 8
  %130 = add i64 %129, 1
  store volatile i64 %130, i64* %NEXT_PC, align 8
  %131 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %132 = load i64*, i64** @RSP_2312_2948f30, align 8
  %133 = load i64*, i64** @RSP_2312_2948f30, align 8
  %134 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i2 = add i64 %134, 8
  store i64 %add.i.i2, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %135 = ptrtoint i64* %133 to i64
  %136 = load i64, i64* %132, align 8
  store i64 %136, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %131, %struct.Memory** %MEMORY, align 8
  br label %inst_401591

inst_401591:                                      ; preds = %inst_401590
  %137 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %137, i64* @RIP_2472_293da00, align 8
  %138 = add i64 %137, 1
  store volatile i64 %138, i64* %NEXT_PC, align 8
  %139 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %140 = load i64*, i64** @RSP_2312_2948f30, align 8
  %141 = load i64*, i64** @RSP_2312_2948f30, align 8
  %142 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %143 = ptrtoint i64* %141 to i64
  %144 = load i64, i64* %140, align 8
  store i64 %144, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %144, i64* %NEXT_PC, align 8, !tbaa !1290
  %145 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %145, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %139, %struct.Memory** %MEMORY, align 8
  %146 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %146

inst_40159c:                                      ; preds = %inst_401592
  %147 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %147, i64* @RIP_2472_293da00, align 8
  %148 = add i64 %147, 4
  store volatile i64 %148, i64* %NEXT_PC, align 8
  %149 = load i32, i32* @RAX_2216_293d9e8, align 4
  %150 = zext i32 %149 to i64
  %151 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %151, %struct.Memory** %MEMORY, align 8
  %152 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %152
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_4015a0__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN10_Range_chk6_S_chkEdSt17integral_constantIbLb0EE(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %1 = getelementptr inbounds %struct.State, %struct.State* %state, i32 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0
  %XMM0 = bitcast i64* %1 to [16 x i8]*, !remill_register !1315
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN10_Range_chk6_S_chkEdSt17integral_constantIbLb0EE to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN10_Range_chk6_S_chkEdSt17integral_constantIbLb0EE, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_4015a0

inst_4015a0:                                      ; preds = %0
  %2 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RIP_2472_293da00, align 8
  %3 = add i64 %2, 1
  store volatile i64 %3, i64* %NEXT_PC, align 8
  %4 = load i64, i64* @RBP_2328_293da00, align 8
  %5 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %6 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %6, -8
  %7 = inttoptr i64 %sub.i.i.i to i64*
  %8 = inttoptr i64 %sub.i.i.i to i64*
  %9 = ptrtoint i64* %8 to i64
  store i64 %4, i64* %7, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %5, %struct.Memory** %MEMORY, align 8
  br label %inst_4015a1

inst_4015b2:                                      ; No predecessors!
  %10 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %10, i64* @RIP_2472_293da00, align 8
  %11 = add i64 %10, 10
  store volatile i64 %11, i64* %NEXT_PC, align 8
  %12 = load i64, i64* @RAX_2216_293da00, align 8
  %13 = load i64, i64* @RAX_2216_293da00, align 8
  %14 = mul i64 %13, 1
  %15 = add i64 %12, %14
  %16 = load i16, i16* @RAX_2216_293d9d0, align 2
  %17 = zext i16 %16 to i64
  %18 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %18, %struct.Memory** %MEMORY, align 8
  br label %inst_4015bc

inst_4015a1:                                      ; preds = %inst_4015a0
  %19 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %19, i64* @RIP_2472_293da00, align 8
  %20 = add i64 %19, 3
  store volatile i64 %20, i64* %NEXT_PC, align 8
  %21 = load i64, i64* @RSP_2312_293da00, align 8
  %22 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %21, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %22, %struct.Memory** %MEMORY, align 8
  br label %inst_4015a4

inst_4015a4:                                      ; preds = %inst_4015a1
  %23 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %23, i64* @RIP_2472_293da00, align 8
  %24 = add i64 %23, 2
  store volatile i64 %24, i64* %NEXT_PC, align 8
  %25 = load i32, i32* @RAX_2216_293d9e8, align 4
  %26 = zext i32 %25 to i64
  %27 = load i32, i32* @RAX_2216_293d9e8, align 4
  %28 = zext i32 %27 to i64
  %29 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %xor3.i26.i = xor i64 %28, %26
  %xor3.i.i = trunc i64 %xor3.i26.i to i32
  %conv.i24.i = and i64 %xor3.i26.i, 4294967295
  store i64 %conv.i24.i, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = and i32 %xor3.i.i, 255
  %30 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i) #14, !range !1308
  %31 = trunc i32 %30 to i8
  %32 = and i8 %31, 1
  %33 = xor i8 %32, 1
  store i8 %33, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i = icmp eq i32 %xor3.i.i, 0
  %conv3.i.i = zext i1 %cmp.i1.i.i to i8
  store i8 %conv3.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i = lshr i32 %xor3.i.i, 31
  %34 = trunc i32 %res.lobit.i.i to i8
  store i8 %34, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %29, %struct.Memory** %MEMORY, align 8
  br label %inst_4015a6

inst_4015a6:                                      ; preds = %inst_4015a4
  %35 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %35, i64* @RIP_2472_293da00, align 8
  %36 = add i64 %35, 5
  store volatile i64 %36, i64* %NEXT_PC, align 8
  %37 = load i64, i64* @RBP_2328_293da00, align 8
  %38 = sub i64 %37, 16
  %XMM01 = bitcast [16 x i8]* %XMM0 to i8*
  %39 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %retval.sroa.0.0.copyload.i.i = load double, double* @XMM0_16_293d8f8, align 1, !tbaa.struct !1324
  %40 = inttoptr i64 %38 to double*
  %41 = inttoptr i64 %38 to double*
  %42 = ptrtoint double* %41 to i64
  store double %retval.sroa.0.0.copyload.i.i, double* %40, align 8
  store volatile %struct.Memory* %39, %struct.Memory** %MEMORY, align 8
  br label %inst_4015ab

inst_4015ab:                                      ; preds = %inst_4015a6
  %43 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %43, i64* @RIP_2472_293da00, align 8
  %44 = add i64 %43, 2
  store volatile i64 %44, i64* %NEXT_PC, align 8
  %45 = load i8, i8* @RAX_2216_293d9b8, align 1
  %46 = zext i8 %45 to i64
  %47 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %and3.i22.i = and i64 1, %46
  %and3.i.i = trunc i64 %and3.i22.i to i8
  store i8 %and3.i.i, i8* @RAX_2216_293d9b8, align 1, !tbaa !1314
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %48 = trunc i64 %and3.i22.i to i32
  %conv.i.i.i = and i32 %48, 255
  %49 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i) #14, !range !1308
  %50 = trunc i32 %49 to i8
  %51 = and i8 %50, 1
  %52 = xor i8 %51, 1
  store i8 %52, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %cmp.i1.i.i7 = icmp eq i8 %and3.i.i, 0
  %conv3.i.i8 = zext i1 %cmp.i1.i.i7 to i8
  store i8 %conv3.i.i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i10 = lshr i8 %and3.i.i, 7
  store i8 %res.lobit.i.i10, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  store i8 0, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  store volatile %struct.Memory* %47, %struct.Memory** %MEMORY, align 8
  br label %inst_4015ad

inst_4015ad:                                      ; preds = %inst_4015ab
  %53 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %53, i64* @RIP_2472_293da00, align 8
  %54 = add i64 %53, 3
  store volatile i64 %54, i64* %NEXT_PC, align 8
  %55 = load i8, i8* @RAX_2216_293d9b8, align 1
  %56 = zext i8 %55 to i64
  %57 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %conv.i11.i = and i64 %56, 255
  store i64 %conv.i11.i, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %57, %struct.Memory** %MEMORY, align 8
  br label %inst_4015b0

inst_4015b0:                                      ; preds = %inst_4015ad
  %58 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %58, i64* @RIP_2472_293da00, align 8
  %59 = add i64 %58, 1
  store volatile i64 %59, i64* %NEXT_PC, align 8
  %60 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %61 = load i64*, i64** @RSP_2312_2948f30, align 8
  %62 = load i64*, i64** @RSP_2312_2948f30, align 8
  %63 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i3 = add i64 %63, 8
  store i64 %add.i.i3, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %64 = ptrtoint i64* %62 to i64
  %65 = load i64, i64* %61, align 8
  store i64 %65, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %60, %struct.Memory** %MEMORY, align 8
  br label %inst_4015b1

inst_4015b1:                                      ; preds = %inst_4015b0
  %66 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %66, i64* @RIP_2472_293da00, align 8
  %67 = add i64 %66, 1
  store volatile i64 %67, i64* %NEXT_PC, align 8
  %68 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %69 = load i64*, i64** @RSP_2312_2948f30, align 8
  %70 = load i64*, i64** @RSP_2312_2948f30, align 8
  %71 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %72 = ptrtoint i64* %70 to i64
  %73 = load i64, i64* %69, align 8
  store i64 %73, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %73, i64* %NEXT_PC, align 8, !tbaa !1290
  %74 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i = add i64 %74, 8
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %68, %struct.Memory** %MEMORY, align 8
  %75 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %75

inst_4015bc:                                      ; preds = %inst_4015b2
  %76 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %76, i64* @RIP_2472_293da00, align 8
  %77 = add i64 %76, 4
  store volatile i64 %77, i64* %NEXT_PC, align 8
  %78 = load i32, i32* @RAX_2216_293d9e8, align 4
  %79 = zext i32 %78 to i64
  %80 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store volatile %struct.Memory* %80, %struct.Memory** %MEMORY, align 8
  %81 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %81
}

; Function Attrs: noinline
define internal %struct.Memory* @sub_4015c0__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoD2Ev(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  store i64 ptrtoint (i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoD2Ev to i64), i64* %NEXT_PC, align 8
  store i64 (i64, i64, i64, i64, i64, i64, i64, i64)* @_ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoD2Ev, i64 (i64, i64, i64, i64, i64, i64, i64, i64)** @RIP_2472_37b0970, align 8
  %stack_ptr_var = alloca i64, i64 1, align 8
  %frame_ptr_var = alloca i64, i64 1, align 8
  br label %inst_4015c0

inst_4015c0:                                      ; preds = %0
  %1 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %1, i64* @RIP_2472_293da00, align 8
  %2 = add i64 %1, 1
  store volatile i64 %2, i64* %NEXT_PC, align 8
  %3 = load i64, i64* @RBP_2328_293da00, align 8
  %4 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %5 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i.i = add i64 %5, -8
  %6 = inttoptr i64 %sub.i.i.i to i64*
  %7 = inttoptr i64 %sub.i.i.i to i64*
  %8 = ptrtoint i64* %7 to i64
  store i64 %3, i64* %6, align 8
  store i64 %sub.i.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %4, %struct.Memory** %MEMORY, align 8
  br label %inst_4015c1

inst_4015e2:                                      ; preds = %107
  %9 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %9, i64* @RIP_2472_293da00, align 8
  %10 = add i64 %9, 4
  store volatile i64 %10, i64* %NEXT_PC, align 8
  %11 = load i64, i64* @RBP_2328_293da00, align 8
  %12 = sub i64 %11, 16
  %13 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %14 = inttoptr i64 %12 to i64*
  %15 = inttoptr i64 %12 to i64*
  %16 = ptrtoint i64* %15 to i64
  %17 = load i64, i64* %14, align 8
  store i64 %17, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %13, %struct.Memory** %MEMORY, align 8
  br label %inst_4015e6

inst_4015f5:                                      ; preds = %inst_4015f3, %106
  %18 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %18, i64* @RIP_2472_293da00, align 8
  %19 = add i64 %18, 4
  store volatile i64 %19, i64* %NEXT_PC, align 8
  %20 = load i64, i64* @RSP_2312_293da00, align 8
  %21 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %add.i.i = add i64 32, %20
  store i64 %add.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i = icmp ult i64 %add.i.i, %20
  %cmp1.i.i.i = icmp ult i64 %add.i.i, 32
  %22 = or i1 %cmp.i.i.i, %cmp1.i.i.i
  %conv.i.i = zext i1 %22 to i8
  store i8 %conv.i.i, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i = trunc i64 %add.i.i to i32
  %conv.i.i.i.i.i = and i32 %conv.i.i.i.i, 255
  %23 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i) #14, !range !1308
  %24 = trunc i32 %23 to i8
  %25 = and i8 %24, 1
  %26 = xor i8 %25, 1
  store i8 %26, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i = xor i64 32, %20
  %xor1.i.i.i.i = xor i64 %xor.i25.i.i.i, %add.i.i
  %and.i.i.i.i = lshr i64 %xor1.i.i.i.i, 4
  %27 = trunc i64 %and.i.i.i.i to i8
  %28 = and i8 %27, 1
  store i8 %28, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i = icmp eq i64 %add.i.i, 0
  %conv5.i.i.i = zext i1 %cmp.i24.i.i.i to i8
  store i8 %conv5.i.i.i, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i = lshr i64 %add.i.i, 63
  %29 = trunc i64 %res.lobit.i.i.i to i8
  store i8 %29, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i = lshr i64 %20, 63
  %xor.i.i.i.i = xor i64 %res.lobit.i.i.i, %shr.i.i.i.i
  %add.i.i.i.i = add nuw nsw i64 %xor.i.i.i.i, %res.lobit.i.i.i
  %cmp.i.i.i.i = icmp eq i64 %add.i.i.i.i, 2
  %conv11.i.i.i = zext i1 %cmp.i.i.i.i to i8
  store i8 %conv11.i.i.i, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %21, %struct.Memory** %MEMORY, align 8
  br label %inst_4015f9

inst_4015c1:                                      ; preds = %inst_4015c0
  %30 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %30, i64* @RIP_2472_293da00, align 8
  %31 = add i64 %30, 3
  store volatile i64 %31, i64* %NEXT_PC, align 8
  %32 = load i64, i64* @RSP_2312_293da00, align 8
  %33 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  store i64 %32, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %33, %struct.Memory** %MEMORY, align 8
  br label %inst_4015c4

inst_4015c4:                                      ; preds = %inst_4015c1
  %34 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %34, i64* @RIP_2472_293da00, align 8
  %35 = add i64 %34, 4
  store volatile i64 %35, i64* %NEXT_PC, align 8
  %36 = load i64, i64* @RSP_2312_293da00, align 8
  %37 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %sub.i.i = sub i64 %36, 32
  store i64 %sub.i.i, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %cmp.i.i.i6 = icmp ult i64 %36, 32
  %conv.i.i7 = zext i1 %cmp.i.i.i6 to i8
  store i8 %conv.i.i7, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i9 = trunc i64 %sub.i.i to i32
  %conv.i.i.i.i.i10 = and i32 %conv.i.i.i.i9, 255
  %38 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i10) #14, !range !1308
  %39 = trunc i32 %38 to i8
  %40 = and i8 %39, 1
  %41 = xor i8 %40, 1
  store i8 %41, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  %xor.i25.i.i.i12 = xor i64 32, %36
  %xor1.i.i.i.i13 = xor i64 %xor.i25.i.i.i12, %sub.i.i
  %and.i.i.i.i14 = lshr i64 %xor1.i.i.i.i13, 4
  %42 = trunc i64 %and.i.i.i.i14 to i8
  %43 = and i8 %42, 1
  store i8 %43, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i16 = icmp eq i64 %sub.i.i, 0
  %conv5.i.i.i17 = zext i1 %cmp.i24.i.i.i16 to i8
  store i8 %conv5.i.i.i17, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i19 = lshr i64 %sub.i.i, 63
  %44 = trunc i64 %res.lobit.i.i.i19 to i8
  store i8 %44, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i21 = lshr i64 %36, 63
  %xor3.i.i.i.i = xor i64 %res.lobit.i.i.i19, %shr.i.i.i.i21
  %add.i.i.i.i22 = add nuw nsw i64 %xor3.i.i.i.i, %shr.i.i.i.i21
  %cmp.i.i.i.i23 = icmp eq i64 %add.i.i.i.i22, 2
  %conv11.i.i.i24 = zext i1 %cmp.i.i.i.i23 to i8
  store i8 %conv11.i.i.i24, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %37, %struct.Memory** %MEMORY, align 8
  br label %inst_4015c8

inst_4015c8:                                      ; preds = %inst_4015c4
  %45 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %45, i64* @RIP_2472_293da00, align 8
  %46 = add i64 %45, 4
  store volatile i64 %46, i64* %NEXT_PC, align 8
  %47 = load i64, i64* @RBP_2328_293da00, align 8
  %48 = sub i64 %47, 8
  %49 = load i64, i64* @RDI_2296_293da00, align 8
  %50 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %51 = inttoptr i64 %48 to i64*
  %52 = inttoptr i64 %48 to i64*
  %53 = ptrtoint i64* %52 to i64
  store i64 %49, i64* %51, align 8
  store volatile %struct.Memory* %50, %struct.Memory** %MEMORY, align 8
  br label %inst_4015cc

inst_4015cc:                                      ; preds = %inst_4015c8
  %54 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %54, i64* @RIP_2472_293da00, align 8
  %55 = add i64 %54, 4
  store volatile i64 %55, i64* %NEXT_PC, align 8
  %56 = load i64, i64* @RBP_2328_293da00, align 8
  %57 = sub i64 %56, 8
  %58 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %59 = inttoptr i64 %57 to i64*
  %60 = inttoptr i64 %57 to i64*
  %61 = ptrtoint i64* %60 to i64
  %62 = load i64, i64* %59, align 8
  store i64 %62, i64* @RAX_2216_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %58, %struct.Memory** %MEMORY, align 8
  br label %inst_4015d0

inst_4015d0:                                      ; preds = %inst_4015cc
  %63 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %63, i64* @RIP_2472_293da00, align 8
  %64 = add i64 %63, 4
  store volatile i64 %64, i64* %NEXT_PC, align 8
  %65 = load i64, i64* @RBP_2328_293da00, align 8
  %66 = sub i64 %65, 16
  %67 = load i64, i64* @RAX_2216_293da00, align 8
  %68 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %69 = inttoptr i64 %66 to i64*
  %70 = inttoptr i64 %66 to i64*
  %71 = ptrtoint i64* %70 to i64
  store i64 %67, i64* %69, align 8
  store volatile %struct.Memory* %68, %struct.Memory** %MEMORY, align 8
  br label %inst_4015d4

inst_4015d4:                                      ; preds = %inst_4015d0
  %72 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %72, i64* @RIP_2472_293da00, align 8
  %73 = add i64 %72, 5
  store volatile i64 %73, i64* %NEXT_PC, align 8
  %74 = load i64, i64* %NEXT_PC, align 8
  %75 = sub i64 %74, 1449
  %76 = load i64, i64* %NEXT_PC, align 8
  %77 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %78 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i31 = add i64 %78, -8
  %79 = inttoptr i64 %sub.i.i31 to i64*
  %80 = inttoptr i64 %sub.i.i31 to i64*
  %81 = ptrtoint i64* %80 to i64
  store i64 %76, i64* %79, align 8
  store i64 %sub.i.i31, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %75, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %75, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %76, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %77, %struct.Memory** %MEMORY, align 8
  %82 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %83 = call %struct.Memory* @ext_4041e0___errno_location(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %82)
  store %struct.Memory* %83, %struct.Memory** %MEMORY, align 8
  store i8* @data_4015d9, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4015d9 to i64), i64* %NEXT_PC, align 8
  br label %inst_4015d9

inst_4015d9:                                      ; preds = %inst_4015d4
  %84 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %84, i64* @RIP_2472_293da00, align 8
  %85 = add i64 %84, 3
  store volatile i64 %85, i64* %NEXT_PC, align 8
  %86 = load i32*, i32** @RAX_2216_294e270, align 8
  %87 = load i32*, i32** @RAX_2216_294e270, align 8
  %88 = load i64, i64* @RAX_2216_293da00, align 8
  %89 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %90 = ptrtoint i32* %87 to i64
  %91 = load i32, i32* %86, align 4
  store i8 0, i8* @CF_2065_293d9b8, align 1, !tbaa !1294
  %conv.i.i.i.i.i35 = and i32 %91, 255
  %92 = call i32 @llvm.ctpop.i32(i32 %conv.i.i.i.i.i35) #14, !range !1308
  %93 = trunc i32 %92 to i8
  %94 = and i8 %93, 1
  %95 = xor i8 %94, 1
  store i8 %95, i8* @PF_2067_293d9b8, align 1, !tbaa !1309
  store i8 0, i8* @AF_2069_293d9b8, align 1, !tbaa !1310
  %cmp.i24.i.i.i38 = icmp eq i32 %91, 0
  %conv5.i.i.i39 = zext i1 %cmp.i24.i.i.i38 to i8
  store i8 %conv5.i.i.i39, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %res.lobit.i.i.i41 = lshr i32 %91, 31
  %96 = trunc i32 %res.lobit.i.i.i41 to i8
  store i8 %96, i8* @SF_2073_293d9b8, align 1, !tbaa !1312
  %shr.i.i.i.i43 = lshr i32 %91, 31
  %xor3.i.i.i.i44 = xor i32 %res.lobit.i.i.i41, %shr.i.i.i.i43
  %add.i.i.i.i45 = add nuw nsw i32 %xor3.i.i.i.i44, %shr.i.i.i.i43
  %cmp.i.i.i.i46 = icmp eq i32 %add.i.i.i.i45, 2
  %conv11.i.i.i47 = zext i1 %cmp.i.i.i.i46 to i8
  store i8 %conv11.i.i.i47, i8* @OF_2077_293d9b8, align 1, !tbaa !1313
  store volatile %struct.Memory* %89, %struct.Memory** %MEMORY, align 8
  br label %inst_4015dc

inst_4015dc:                                      ; preds = %inst_4015d9
  %97 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %97, i64* @RIP_2472_293da00, align 8
  %98 = add i64 %97, 6
  store volatile i64 %98, i64* %NEXT_PC, align 8
  %99 = load i64, i64* %NEXT_PC, align 8
  %100 = add i64 %99, 19
  %101 = load i64, i64* %NEXT_PC, align 8
  %102 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %103 = load i8, i8* @ZF_2071_293d9b8, align 1, !tbaa !1311
  %tobool.not.i = icmp eq i8 %103, 0
  %frombool.i = zext i1 %tobool.not.i to i8
  store i8 %frombool.i, i8* %BRANCH_TAKEN, align 1, !tbaa !1314
  %cond1.i.i = select i1 %tobool.not.i, i64 %100, i64 %101
  store i64 %cond1.i.i, i64* %NEXT_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %102, %struct.Memory** %MEMORY, align 8
  %104 = load i8, i8* %BRANCH_TAKEN, align 1
  %105 = icmp eq i8 %104, 1
  br i1 %105, label %106, label %107

106:                                              ; preds = %inst_4015dc
  br label %inst_4015f5

107:                                              ; preds = %inst_4015dc
  br label %inst_4015e2

inst_4015e6:                                      ; preds = %inst_4015e2
  %108 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %108, i64* @RIP_2472_293da00, align 8
  %109 = add i64 %108, 2
  store volatile i64 %109, i64* %NEXT_PC, align 8
  %110 = load i32*, i32** @RAX_2216_294e270, align 8
  %111 = load i32*, i32** @RAX_2216_294e270, align 8
  %112 = load i64, i64* @RAX_2216_293da00, align 8
  %113 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %114 = ptrtoint i32* %111 to i64
  %115 = load i32, i32* %110, align 4
  %conv.i.i52 = zext i32 %115 to i64
  store i64 %conv.i.i52, i64* @RCX_2248_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %113, %struct.Memory** %MEMORY, align 8
  br label %inst_4015e8

inst_4015e8:                                      ; preds = %inst_4015e6
  %116 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %116, i64* @RIP_2472_293da00, align 8
  %117 = add i64 %116, 3
  store volatile i64 %117, i64* %NEXT_PC, align 8
  %118 = load i64, i64* @RBP_2328_293da00, align 8
  %119 = sub i64 %118, 20
  %120 = load i32, i32* @RCX_2248_293d9e8, align 4
  %121 = zext i32 %120 to i64
  %122 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %123 = inttoptr i64 %119 to i32*
  %124 = inttoptr i64 %119 to i32*
  %125 = ptrtoint i32* %124 to i64
  store i32 %120, i32* %123, align 4
  store volatile %struct.Memory* %122, %struct.Memory** %MEMORY, align 8
  br label %inst_4015eb

inst_4015eb:                                      ; preds = %inst_4015e8
  %126 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %126, i64* @RIP_2472_293da00, align 8
  %127 = add i64 %126, 5
  store volatile i64 %127, i64* %NEXT_PC, align 8
  %128 = load i64, i64* %NEXT_PC, align 8
  %129 = sub i64 %128, 1472
  %130 = load i64, i64* %NEXT_PC, align 8
  %131 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %132 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %sub.i.i55 = add i64 %132, -8
  %133 = inttoptr i64 %sub.i.i55 to i64*
  %134 = inttoptr i64 %sub.i.i55 to i64*
  %135 = ptrtoint i64* %134 to i64
  store i64 %130, i64* %133, align 8
  store i64 %sub.i.i55, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store i64 %129, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %129, i64* %NEXT_PC, align 8, !tbaa !1290
  store i64 %130, i64* %RETURN_PC, align 8, !tbaa !1290
  store volatile %struct.Memory* %131, %struct.Memory** %MEMORY, align 8
  %136 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %137 = call %struct.Memory* @ext_4041e0___errno_location(%struct.State* @__mcsema_reg_state, i64 undef, %struct.Memory* %136)
  store %struct.Memory* %137, %struct.Memory** %MEMORY, align 8
  store i8* @data_4015f0, i8** @RIP_2472_2948dd0, align 8
  store i64 ptrtoint (i8* @data_4015f0 to i64), i64* %NEXT_PC, align 8
  br label %inst_4015f0

inst_4015f0:                                      ; preds = %inst_4015eb
  %138 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %138, i64* @RIP_2472_293da00, align 8
  %139 = add i64 %138, 3
  store volatile i64 %139, i64* %NEXT_PC, align 8
  %140 = load i64, i64* @RBP_2328_293da00, align 8
  %141 = sub i64 %140, 20
  %142 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %143 = inttoptr i64 %141 to i32*
  %144 = inttoptr i64 %141 to i32*
  %145 = ptrtoint i32* %144 to i64
  %146 = load i32, i32* %143, align 4
  %conv.i.i50 = zext i32 %146 to i64
  store i64 %conv.i.i50, i64* @RCX_2248_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %142, %struct.Memory** %MEMORY, align 8
  br label %inst_4015f3

inst_4015f3:                                      ; preds = %inst_4015f0
  %147 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %147, i64* @RIP_2472_293da00, align 8
  %148 = add i64 %147, 2
  store volatile i64 %148, i64* %NEXT_PC, align 8
  %149 = load i32*, i32** @RAX_2216_294e270, align 8
  %150 = load i32*, i32** @RAX_2216_294e270, align 8
  %151 = load i64, i64* @RAX_2216_293da00, align 8
  %152 = load i32, i32* @RCX_2248_293d9e8, align 4
  %153 = zext i32 %152 to i64
  %154 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %155 = ptrtoint i32* %150 to i64
  store i32 %152, i32* %149, align 4
  store volatile %struct.Memory* %154, %struct.Memory** %MEMORY, align 8
  br label %inst_4015f5

inst_4015f9:                                      ; preds = %inst_4015f5
  %156 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %156, i64* @RIP_2472_293da00, align 8
  %157 = add i64 %156, 1
  store volatile i64 %157, i64* %NEXT_PC, align 8
  %158 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %159 = load i64*, i64** @RSP_2312_2948f30, align 8
  %160 = load i64*, i64** @RSP_2312_2948f30, align 8
  %161 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i4 = add i64 %161, 8
  store i64 %add.i.i4, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  %162 = ptrtoint i64* %160 to i64
  %163 = load i64, i64* %159, align 8
  store i64 %163, i64* @RBP_2328_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %158, %struct.Memory** %MEMORY, align 8
  br label %inst_4015fa

inst_4015fa:                                      ; preds = %inst_4015f9
  %164 = load volatile i64, i64* %NEXT_PC, align 8
  store volatile i64 %164, i64* @RIP_2472_293da00, align 8
  %165 = add i64 %164, 1
  store volatile i64 %165, i64* %NEXT_PC, align 8
  %166 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  %167 = load i64*, i64** @RSP_2312_2948f30, align 8
  %168 = load i64*, i64** @RSP_2312_2948f30, align 8
  %169 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %170 = ptrtoint i64* %168 to i64
  %171 = load i64, i64* %167, align 8
  store i64 %171, i64* @RIP_2472_293da00, align 8, !tbaa !1290
  store i64 %171, i64* %NEXT_PC, align 8, !tbaa !1290
  %172 = load i64, i64* @RSP_2312_293da00, align 8, !tbaa !1314
  %add.i.i2 = add i64 %172, 8
  store i64 %add.i.i2, i64* @RSP_2312_293da00, align 8, !tbaa !1290
  store volatile %struct.Memory* %166, %struct.Memory** %MEMORY, align 8
  %173 = load %struct.Memory*, %struct.Memory** %MEMORY, align 8
  ret %struct.Memory* %173
}

; Function Attrs: noinline
define weak x86_64_sysvcc void @__gmon_start__() #11 !remill.function.type !1359 {
  ret void
}

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1359 extern_weak x86_64_sysvcc i64 @__gxx_personality_v0() #8

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1359 extern_weak x86_64_sysvcc i64 @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(i64, i64) #8

; Function Attrs: noinline
define internal %struct.Memory* @ext_404248__ZNSaIcEC1Ev(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %9 = call i64 @_ZNSaIcEC1Ev(i64 %param0)
  store volatile i64 %9, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1360 extern_weak x86_64_sysvcc i64 @_ZNSaIcEC1Ev(i64) #8

; Function Attrs: noinline
define internal %struct.Memory* @ext_404238__ZNSt8ios_base4InitC1Ev(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %9 = call i64 @_ZNSt8ios_base4InitC1Ev(i64 %param0)
  store volatile i64 %9, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1360 extern_weak x86_64_sysvcc i64 @_ZNSt8ios_base4InitC1Ev(i64) #8

; Function Attrs: noinline
define internal %struct.Memory* @ext_404228__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %param2 = load i64, i64* @RDX_2264_293da00, align 8
  %param3 = load i64, i64* @RCX_2248_293da00, align 8
  %param4 = load i64, i64* @R8_2344_293da00, align 8
  %param5 = load i64, i64* @R9_2360_293da00, align 8
  %9 = load i64, i64* @RSP_2312_293da00, align 8
  %10 = add i64 %9, 8
  %11 = inttoptr i64 %10 to i64*
  %12 = inttoptr i64 %10 to i64*
  %13 = ptrtoint i64* %12 to i64
  %14 = load i64, i64* %11, align 8
  %15 = load i64, i64* @RSP_2312_293da00, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  %20 = load i64, i64* %17, align 8
  %21 = call i64 (...) @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(i64 %param0, i64 %param1, i64 %param2, i64 %param3, i64 %param4, i64 %param5, i64 %14, i64 %20)
  store volatile i64 %21, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: noinline
declare !remill.function.type !1360 i64 @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(...) #11

; Function Attrs: noinline
define internal %struct.Memory* @ext_404218__ZNSolsEPFRSoS_E(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %9 = call i64 @_ZNSolsEPFRSoS_E(i64 %param0, i64 %param1)
  store volatile i64 %9, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1360 extern_weak x86_64_sysvcc i64 @_ZNSolsEPFRSoS_E(i64, i64) #8

; Function Attrs: noinline
define internal %struct.Memory* @ext_404208___cxa_atexit(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %param2 = load i64, i64* @RDX_2264_293da00, align 8
  %9 = call i64 @__cxa_atexit(i64 %param0, i64 %param1, i64 %param2)
  store volatile i64 %9, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1360 extern_weak x86_64_sysvcc i64 @__cxa_atexit(i64, i64, i64) #8

; Function Attrs: noinline
define internal %struct.Memory* @ext_4041f8__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %param2 = load i64, i64* @RDX_2264_293da00, align 8
  %param3 = load i64, i64* @RCX_2248_293da00, align 8
  %param4 = load i64, i64* @R8_2344_293da00, align 8
  %param5 = load i64, i64* @R9_2360_293da00, align 8
  %9 = load i64, i64* @RSP_2312_293da00, align 8
  %10 = add i64 %9, 8
  %11 = inttoptr i64 %10 to i64*
  %12 = inttoptr i64 %10 to i64*
  %13 = ptrtoint i64* %12 to i64
  %14 = load i64, i64* %11, align 8
  %15 = load i64, i64* @RSP_2312_293da00, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  %20 = load i64, i64* %17, align 8
  %21 = call i64 (...) @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(i64 %param0, i64 %param1, i64 %param2, i64 %param3, i64 %param4, i64 %param5, i64 %14, i64 %20)
  store volatile i64 %21, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: noinline
declare !remill.function.type !1360 i64 @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(...) #11

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1359 extern_weak x86_64_sysvcc i64 @strtod(i64, i64) #8

; Function Attrs: noinline
define internal %struct.Memory* @ext_404220__ZNSaIcED1Ev(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %9 = call i64 @_ZNSaIcED1Ev(i64 %param0)
  store volatile i64 %9, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1360 extern_weak x86_64_sysvcc i64 @_ZNSaIcED1Ev(i64) #8

; Function Attrs: noinline
declare !remill.function.type !1360 i64 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(...) #11

define internal i64 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv_novarargs(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) {
  %9 = call i64 (...) @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7)
  ret i64 %9
}

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1360 extern_weak x86_64_sysvcc i64 @__errno_location() #8

; Function Attrs: noinline
define internal %struct.Memory* @ext_4041e8__ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %param2 = load i64, i64* @RDX_2264_293da00, align 8
  %param3 = load i64, i64* @RCX_2248_293da00, align 8
  %param4 = load i64, i64* @R8_2344_293da00, align 8
  %param5 = load i64, i64* @R9_2360_293da00, align 8
  %9 = load i64, i64* @RSP_2312_293da00, align 8
  %10 = add i64 %9, 8
  %11 = inttoptr i64 %10 to i64*
  %12 = inttoptr i64 %10 to i64*
  %13 = ptrtoint i64* %12 to i64
  %14 = load i64, i64* %11, align 8
  %15 = load i64, i64* @RSP_2312_293da00, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  %20 = load i64, i64* %17, align 8
  %21 = call i64 (...) @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(i64 %param0, i64 %param1, i64 %param2, i64 %param3, i64 %param4, i64 %param5, i64 %14, i64 %20)
  store volatile i64 %21, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: noinline
declare !remill.function.type !1360 i64 @_ZSt24__throw_invalid_argumentPKc(...) #11

define internal i64 @_ZSt24__throw_invalid_argumentPKc_novarargs(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) {
  %9 = call i64 (...) @_ZSt24__throw_invalid_argumentPKc(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7)
  ret i64 %9
}

define internal i64 @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev_novarargs.2(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) {
  %9 = call i64 (...) @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7)
  ret i64 %9
}

; Function Attrs: noinline
define internal %struct.Memory* @ext_4041e0___errno_location(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %9 = call i64 @__errno_location()
  store volatile i64 %9, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: noinline
define internal %struct.Memory* @ext_4041f0__ZSt24__throw_invalid_argumentPKc(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %param2 = load i64, i64* @RDX_2264_293da00, align 8
  %param3 = load i64, i64* @RCX_2248_293da00, align 8
  %param4 = load i64, i64* @R8_2344_293da00, align 8
  %param5 = load i64, i64* @R9_2360_293da00, align 8
  %9 = load i64, i64* @RSP_2312_293da00, align 8
  %10 = add i64 %9, 8
  %11 = inttoptr i64 %10 to i64*
  %12 = inttoptr i64 %10 to i64*
  %13 = ptrtoint i64* %12 to i64
  %14 = load i64, i64* %11, align 8
  %15 = load i64, i64* @RSP_2312_293da00, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  %20 = load i64, i64* %17, align 8
  %21 = call i64 (...) @_ZSt24__throw_invalid_argumentPKc(i64 %param0, i64 %param1, i64 %param2, i64 %param3, i64 %param4, i64 %param5, i64 %14, i64 %20)
  store volatile i64 %21, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: noinline
declare !remill.function.type !1359 extern_weak x86_64_sysvcc void @__libc_start_main(i32 (i32, i8**, i8**)*, i32, i8**, i8*, i32 (i32, i8**, i8**)*, void ()*, void ()*, i32*) #11

; Function Attrs: noinline
declare !remill.function.type !1360 i64 @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE(...) #11

define internal i64 @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE_novarargs(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) {
  %9 = call i64 (...) @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7)
  ret i64 %9
}

; Function Attrs: noinline
define internal %struct.Memory* @ext_404210__ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %param2 = load i64, i64* @RDX_2264_293da00, align 8
  %param3 = load i64, i64* @RCX_2248_293da00, align 8
  %param4 = load i64, i64* @R8_2344_293da00, align 8
  %param5 = load i64, i64* @R9_2360_293da00, align 8
  %9 = load i64, i64* @RSP_2312_293da00, align 8
  %10 = add i64 %9, 8
  %11 = inttoptr i64 %10 to i64*
  %12 = inttoptr i64 %10 to i64*
  %13 = ptrtoint i64* %12 to i64
  %14 = load i64, i64* %11, align 8
  %15 = load i64, i64* @RSP_2312_293da00, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  %20 = load i64, i64* %17, align 8
  %21 = call i64 (...) @_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE(i64 %param0, i64 %param1, i64 %param2, i64 %param3, i64 %param4, i64 %param5, i64 %14, i64 %20)
  store volatile i64 %21, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: noinline
define internal %struct.Memory* @ext_404230__ZSt20__throw_out_of_rangePKc(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %param2 = load i64, i64* @RDX_2264_293da00, align 8
  %param3 = load i64, i64* @RCX_2248_293da00, align 8
  %param4 = load i64, i64* @R8_2344_293da00, align 8
  %param5 = load i64, i64* @R9_2360_293da00, align 8
  %9 = load i64, i64* @RSP_2312_293da00, align 8
  %10 = add i64 %9, 8
  %11 = inttoptr i64 %10 to i64*
  %12 = inttoptr i64 %10 to i64*
  %13 = ptrtoint i64* %12 to i64
  %14 = load i64, i64* %11, align 8
  %15 = load i64, i64* @RSP_2312_293da00, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  %20 = load i64, i64* %17, align 8
  %21 = call i64 (...) @_ZSt20__throw_out_of_rangePKc(i64 %param0, i64 %param1, i64 %param2, i64 %param3, i64 %param4, i64 %param5, i64 %14, i64 %20)
  store volatile i64 %21, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: noinline
declare !remill.function.type !1360 i64 @_ZSt20__throw_out_of_rangePKc(...) #11

define internal i64 @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3__novarargs.5(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) {
  %9 = call i64 (...) @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7)
  ret i64 %9
}

; Function Attrs: noinline
define internal %struct.Memory* @ext_404240__Unwind_Resume(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %9 = call i64 @_Unwind_Resume(i64 %param0)
  store volatile i64 %9, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1360 extern_weak x86_64_sysvcc i64 @_Unwind_Resume(i64) #8

define internal i64 @_ZSt20__throw_out_of_rangePKc_novarargs.6(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) {
  %9 = call i64 (...) @_ZSt20__throw_out_of_rangePKc(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7)
  ret i64 %9
}

; Function Attrs: noinline
define internal %struct.Memory* @ext_404250__ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #10 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %next_pc = alloca i64, i64 0, align 8
  store i64 %pc, i64* %next_pc, align 8
  %MEMORY1 = alloca %struct.Memory*, align 8
  %PC2 = alloca i64, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY1, align 8
  store i64 %pc, i64* %PC2, align 8
  %1 = load i64, i64* @RSP_2312_293da00, align 8
  %2 = add i64 %1, 8
  %3 = load i64, i64* @RSP_2312_293da00, align 8
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i64*
  %6 = inttoptr i64 %4 to i64*
  %7 = ptrtoint i64* %6 to i64
  %8 = load i64, i64* %5, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %param2 = load i64, i64* @RDX_2264_293da00, align 8
  %param3 = load i64, i64* @RCX_2248_293da00, align 8
  %param4 = load i64, i64* @R8_2344_293da00, align 8
  %param5 = load i64, i64* @R9_2360_293da00, align 8
  %9 = load i64, i64* @RSP_2312_293da00, align 8
  %10 = add i64 %9, 8
  %11 = inttoptr i64 %10 to i64*
  %12 = inttoptr i64 %10 to i64*
  %13 = ptrtoint i64* %12 to i64
  %14 = load i64, i64* %11, align 8
  %15 = load i64, i64* @RSP_2312_293da00, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  %20 = load i64, i64* %17, align 8
  %21 = call i64 (...) @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc(i64 %param0, i64 %param1, i64 %param2, i64 %param3, i64 %param4, i64 %param5, i64 %14, i64 %20)
  store volatile i64 %21, i64* @RAX_2216_293da00, align 8
  store i64 %8, i64* %NEXT_PC, align 8
  store volatile i64 %2, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: noinline
declare !remill.function.type !1360 i64 @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc(...) #11

; Function Attrs: nobuiltin noinline
declare !remill.function.type !1359 extern_weak x86_64_sysvcc i64 @_ZNSt8ios_base4InitD1Ev(i64) #8

define internal i64 @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc_novarargs.7(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) {
  %9 = call i64 (...) @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE6insertEmmc(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7)
  ret i64 %9
}

; Function Attrs: alwaysinline inlinehint nounwind
define dso_local %struct.Memory* @__mcsema_detach_call_value(%struct.State* noalias nonnull align 1 %state, i64 %pc, %struct.Memory* noalias %memory) #12 !remill.function.type !1361 {
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca %struct.State*, align 8
  store %struct.State* @__mcsema_reg_state, %struct.State** %STATE, align 8
  %MEMORY = alloca %struct.Memory*, align 8
  store %struct.Memory* %memory, %struct.Memory** %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store volatile i64 %pc, i64* %NEXT_PC, align 8
  %ESBASE = alloca i64, align 8
  store volatile i64 0, i64* %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store volatile i64 0, i64* %DSBASE, align 8
  %CSBASE = alloca i64, align 8
  store volatile i64 0, i64* %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store volatile i64 0, i64* %SSBASE, align 8
  %1 = inttoptr i64 %pc to i64 (i64, i64, i64, i64, i64, i64, i64, i64)*
  %2 = load i64, i64* @RSP_2312_293da00, align 8
  %3 = add i64 %2, 8
  %4 = load i64, i64* @RSP_2312_293da00, align 8
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to i64*
  %7 = inttoptr i64 %5 to i64*
  %8 = ptrtoint i64* %7 to i64
  %9 = load i64, i64* %6, align 8
  %param0 = load i64, i64* @RDI_2296_293da00, align 8
  %param1 = load i64, i64* @RSI_2280_293da00, align 8
  %param2 = load i64, i64* @RDX_2264_293da00, align 8
  %param3 = load i64, i64* @RCX_2248_293da00, align 8
  %param4 = load i64, i64* @R8_2344_293da00, align 8
  %param5 = load i64, i64* @R9_2360_293da00, align 8
  %10 = load i64, i64* @RSP_2312_293da00, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  %15 = load i64, i64* %12, align 8
  %16 = load i64, i64* @RSP_2312_293da00, align 8
  %17 = add i64 %16, 16
  %18 = inttoptr i64 %17 to i64*
  %19 = inttoptr i64 %17 to i64*
  %20 = ptrtoint i64* %19 to i64
  %21 = load i64, i64* %18, align 8
  %22 = call i64 %1(i64 %param0, i64 %param1, i64 %param2, i64 %param3, i64 %param4, i64 %param5, i64 %15, i64 %21)
  store volatile i64 %22, i64* @RAX_2216_293da00, align 8
  store i64 %9, i64* %NEXT_PC, align 8
  store volatile i64 %3, i64* @RSP_2312_293da00, align 8
  ret %struct.Memory* %memory
}

; Function Attrs: nobuiltin noinline
define dso_local i64 @_ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoD2Ev(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 !remill.function.type !1360 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_4015c0__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoD2Ev(%struct.State* %9, i64 4199872, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

define %struct.State* @__mcsema_init_reg_state() {
entry:
  %0 = load volatile i64, i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 13, i32 0, i32 0), align 8
  %1 = icmp eq i64 %0, 0
  br i1 %1, label %is_null, label %end

is_null:                                          ; preds = %entry
  store i64 and (i64 ptrtoint (i8* getelementptr inbounds ([1048576 x i8], [1048576 x i8]* @__mcsema_stack, i32 0, i32 1048064) to i64), i64 -16), i64* getelementptr inbounds (%struct.State, %struct.State* @__mcsema_reg_state, i32 0, i32 6, i32 13, i32 0, i32 0), align 8
  call void @__mcsema_early_init()
  br label %end

end:                                              ; preds = %is_null, %entry
  ret %struct.State* @__mcsema_reg_state
}

define internal void @__mcsema_early_init() {
  %1 = load volatile i1, i1* @0, align 1
  br i1 %1, label %2, label %3

2:                                                ; preds = %0
  ret void

3:                                                ; preds = %0
  store volatile i1 true, i1* @0, align 1
  ret void
}

; Function Attrs: nobuiltin noinline
define dso_local i64 @_ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN10_Range_chk6_S_chkEdSt17integral_constantIbLb0EE(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 !remill.function.type !1360 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_4015a0__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN10_Range_chk6_S_chkEdSt17integral_constantIbLb0EE(%struct.State* %9, i64 4199840, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: nobuiltin noinline
define dso_local i64 @_ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoC2Ev(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 !remill.function.type !1360 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_401560__ZZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_EN11_Save_errnoC2Ev(%struct.State* %9, i64 4199776, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: nobuiltin noinline
define private i64 @callback_sub_401020(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_401020(%struct.State* %9, i64 4198432, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: nobuiltin noinline
define private i64 @__cxx_global_var_init(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_401150___cxx_global_var_init(%struct.State* %9, i64 4198736, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: nobuiltin noinline
define private i64 @_GLOBAL__sub_I_MotivatingExample.cpp(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_401190__GLOBAL__sub_I_MotivatingExample_cpp(%struct.State* %9, i64 4198800, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: nobuiltin noinline
define private i64 @_dl_relocate_static_pie(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_4011d0__dl_relocate_static_pie(%struct.State* %9, i64 4198864, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: nobuiltin noinline
define private i64 @deregister_tm_clones(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_4011e0_deregister_tm_clones(%struct.State* %9, i64 4198880, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: nobuiltin noinline
define dso_local i64 @_ZNSt7__cxx114stodERKNS_12basic_stringIcSt11char_traitsIcESaIcEEEPm(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 !remill.function.type !1360 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_401400__ZNSt7__cxx114stodERKNS_12basic_stringIcSt11char_traitsIcESaIcEEEPm(%struct.State* %9, i64 4199424, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: nobuiltin noinline
define private i64 @register_tm_clones(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_401210_register_tm_clones(%struct.State* %9, i64 4198928, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: nobuiltin noinline
define x86_64_sysvcc i32 @main(i32 %param0, i8** %param1, i8** %param2) #8 !remill.function.type !1360 {
  %1 = call %struct.State* @__mcsema_init_reg_state()
  %2 = getelementptr inbounds %struct.State, %struct.State* %1, i32 0, i32 6, i32 11, i32 0, i32 0
  %EDI = bitcast i64* %2 to i32*, !remill_register !1366
  store volatile i32 %param0, i32* %EDI, align 4
  %RSI = getelementptr inbounds %struct.State, %struct.State* %1, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 0, i64* %RSI, align 8
  %3 = ptrtoint i8** %param1 to i64
  store volatile i64 %3, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %1, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 0, i64* %RDX, align 8
  %4 = ptrtoint i8** %param2 to i64
  store volatile i64 %4, i64* %RDX, align 8
  %5 = call %struct.Memory* @sub_401290_main(%struct.State* %1, i64 4199056, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %1, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %6 = load i64, i64* %RAX, align 8
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

; Function Attrs: nobuiltin noinline
define dso_local i64 @_ZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #8 !remill.function.type !1360 {
  %9 = call %struct.State* @__mcsema_init_reg_state()
  %RDI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 11, i32 0, i32 0, !remill_register !1344
  store volatile i64 %0, i64* %RDI, align 8
  %RSI = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 9, i32 0, i32 0, !remill_register !1325
  store volatile i64 %1, i64* %RSI, align 8
  %RDX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 7, i32 0, i32 0, !remill_register !1351
  store volatile i64 %2, i64* %RDX, align 8
  %RCX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 5, i32 0, i32 0, !remill_register !1362
  store volatile i64 %3, i64* %RCX, align 8
  %R8 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 17, i32 0, i32 0, !remill_register !1363
  store volatile i64 %4, i64* %R8, align 8
  %R9 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 19, i32 0, i32 0, !remill_register !1364
  store volatile i64 %5, i64* %R9, align 8
  %RSP = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %10 = load i64, i64* %RSP, align 8
  %11 = add i64 %10, 8
  %12 = inttoptr i64 %11 to i64*
  %13 = inttoptr i64 %11 to i64*
  %14 = ptrtoint i64* %13 to i64
  store i64 %6, i64* %12, align 8
  %RSP1 = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 13, i32 0, i32 0, !remill_register !1365
  %15 = load i64, i64* %RSP1, align 8
  %16 = add i64 %15, 16
  %17 = inttoptr i64 %16 to i64*
  %18 = inttoptr i64 %16 to i64*
  %19 = ptrtoint i64* %18 to i64
  store i64 %7, i64* %17, align 8
  %20 = call %struct.Memory* @sub_401440__ZN9__gnu_cxx6__stoaIddcJEEET0_PFT_PKT1_PPS3_DpT2_EPKcS5_PmS9_(%struct.State* %9, i64 4199488, %struct.Memory* null)
  %RAX = getelementptr inbounds %struct.State, %struct.State* %9, i32 0, i32 6, i32 1, i32 0, i32 0, !remill_register !1352
  %21 = load i64, i64* %RAX, align 8
  ret i64 %21
}

; Function Attrs: noinline optnone
define %struct.State* @__mcsema_debug_get_reg_state() #13 {
  ret %struct.State* @__mcsema_reg_state
}

attributes #0 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noduplicate noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noduplicate noinline nounwind optnone readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noduplicate noinline nounwind optnone readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noduplicate noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin noinline }
attributes #9 = { noreturn }
attributes #10 = { noinline "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noinline }
attributes #12 = { alwaysinline inlinehint nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-builtins" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noinline optnone }
attributes #14 = { nounwind }

!llvm.ident = !{!0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!llvm.dbg.cu = !{!4}

!0 = !{!"clang version 11.0.1 (https://github.com/trailofbits/vcpkg.git 4592a93cc4ca82f1963dba08413c43639662d7ae)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_11, file: !5, producer: "clang version 11.0.1 (https://github.com/trailofbits/vcpkg.git 4592a93cc4ca82f1963dba08413c43639662d7ae)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !6, imports: !7, splitDebugInlining: false, nameTableKind: None)
!5 = !DIFile(filename: "/home/zyl/btfinaltest-llvm11_debug/remill/lib/Arch/X86/Runtime/BasicBlock.cpp", directory: "/home/zyl/btfinaltest-llvm11_debug/remill-build/lib/Arch/X86/Runtime")
!6 = !{}
!7 = !{!8, !13, !20, !24, !31, !35, !40, !42, !50, !54, !58, !72, !76, !80, !84, !88, !93, !97, !101, !105, !109, !117, !121, !125, !127, !131, !135, !140, !146, !150, !154, !156, !164, !168, !176, !178, !182, !186, !190, !194, !199, !204, !209, !210, !211, !212, !214, !215, !216, !217, !218, !219, !220, !276, !280, !297, !300, !305, !313, !318, !322, !326, !330, !334, !336, !338, !342, !348, !352, !358, !364, !366, !370, !374, !378, !382, !393, !395, !399, !403, !407, !409, !413, !417, !421, !423, !425, !429, !437, !441, !445, !449, !451, !457, !459, !465, !469, !473, !477, !481, !485, !489, !491, !493, !497, !501, !505, !507, !511, !515, !517, !519, !523, !527, !531, !535, !536, !537, !538, !539, !540, !541, !542, !543, !544, !545, !550, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !580, !583, !585, !587, !589, !591, !593, !595, !597, !599, !601, !603, !605, !607, !610, !612, !616, !620, !625, !629, !631, !633, !635, !637, !639, !641, !643, !645, !647, !649, !651, !653, !655, !659, !665, !670, !674, !676, !678, !680, !682, !689, !693, !697, !701, !705, !709, !714, !718, !720, !724, !730, !734, !739, !741, !743, !747, !751, !755, !757, !759, !761, !763, !767, !769, !771, !775, !779, !783, !787, !791, !793, !795, !799, !803, !807, !811, !813, !815, !819, !823, !824, !825, !826, !827, !828, !834, !836, !838, !842, !844, !846, !848, !850, !852, !854, !856, !861, !865, !867, !869, !874, !876, !878, !880, !882, !884, !886, !889, !891, !893, !897, !901, !903, !905, !907, !909, !911, !913, !915, !917, !919, !921, !925, !929, !931, !933, !935, !937, !939, !941, !943, !945, !947, !949, !951, !953, !955, !957, !959, !963, !967, !971, !973, !975, !977, !979, !981, !983, !985, !987, !989, !993, !997, !1001, !1003, !1005, !1007, !1011, !1015, !1019, !1021, !1023, !1025, !1027, !1029, !1031, !1033, !1035, !1037, !1039, !1041, !1043, !1047, !1051, !1055, !1057, !1059, !1061, !1063, !1067, !1071, !1073, !1075, !1077, !1079, !1081, !1083, !1087, !1091, !1093, !1095, !1097, !1099, !1103, !1107, !1111, !1113, !1115, !1117, !1119, !1121, !1123, !1127, !1131, !1135, !1137, !1141, !1145, !1147, !1149, !1151, !1153, !1155, !1157, !1162, !1164, !1167, !1172, !1174, !1180, !1182, !1184, !1186, !1191, !1193, !1199, !1201, !1203, !1204, !1205, !1206, !1207, !1208, !1209, !1210, !1211, !1212, !1213, !1214, !1215, !1221, !1225, !1229, !1233, !1237, !1241, !1243, !1245, !1247, !1251, !1255, !1259, !1263, !1267, !1269, !1271, !1273, !1277, !1281, !1285, !1287}
!8 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !9, entity: !10, file: !12, line: 58)
!9 = !DINamespace(name: "__gnu_debug", scope: null)
!10 = !DINamespace(name: "__debug", scope: !11)
!11 = !DINamespace(name: "std", scope: null)
!12 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/debug/debug.h", directory: "")
!13 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !14, file: !19, line: 52)
!14 = !DISubprogram(name: "abs", scope: !15, file: !15, line: 840, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!15 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!16 = !DISubroutineType(types: !17)
!17 = !{!18, !18}
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/std_abs.h", directory: "")
!20 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !21, file: !23, line: 127)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !15, line: 62, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !15, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!23 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdlib", directory: "")
!24 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !25, file: !23, line: 128)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !15, line: 70, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !15, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !27, identifier: "_ZTS6ldiv_t")
!27 = !{!28, !30}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !26, file: !15, line: 68, baseType: !29, size: 64)
!29 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !26, file: !15, line: 69, baseType: !29, size: 64, offset: 64)
!31 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !32, file: !23, line: 130)
!32 = !DISubprogram(name: "abort", scope: !15, file: !15, line: 591, type: !33, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !36, file: !23, line: 134)
!36 = !DISubprogram(name: "atexit", scope: !15, file: !15, line: 595, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!37 = !DISubroutineType(types: !38)
!38 = !{!18, !39}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !41, file: !23, line: 137)
!41 = !DISubprogram(name: "at_quick_exit", scope: !15, file: !15, line: 600, type: !37, flags: DIFlagPrototyped, spFlags: 0)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !43, file: !23, line: 140)
!43 = !DISubprogram(name: "atof", scope: !15, file: !15, line: 101, type: !44, flags: DIFlagPrototyped, spFlags: 0)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !47}
!46 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !49)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !51, file: !23, line: 141)
!51 = !DISubprogram(name: "atoi", scope: !15, file: !15, line: 104, type: !52, flags: DIFlagPrototyped, spFlags: 0)
!52 = !DISubroutineType(types: !53)
!53 = !{!18, !47}
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !55, file: !23, line: 142)
!55 = !DISubprogram(name: "atol", scope: !15, file: !15, line: 107, type: !56, flags: DIFlagPrototyped, spFlags: 0)
!56 = !DISubroutineType(types: !57)
!57 = !{!29, !47}
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !59, file: !23, line: 143)
!59 = !DISubprogram(name: "bsearch", scope: !15, file: !15, line: 820, type: !60, flags: DIFlagPrototyped, spFlags: 0)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !63, !63, !65, !65, !68}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !66, line: 46, baseType: !67)
!66 = !DIFile(filename: "vcpkg_ubuntu-20.04_llvm-11_amd64/installed/x64-linux-rel/tools/llvm/lib/clang/11.0.1/include/stddef.h", directory: "/home/zyl/btfinaltest-llvm11_debug")
!67 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !15, line: 808, baseType: !69)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DISubroutineType(types: !71)
!71 = !{!18, !63, !63}
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !73, file: !23, line: 144)
!73 = !DISubprogram(name: "calloc", scope: !15, file: !15, line: 542, type: !74, flags: DIFlagPrototyped, spFlags: 0)
!74 = !DISubroutineType(types: !75)
!75 = !{!62, !65, !65}
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !77, file: !23, line: 145)
!77 = !DISubprogram(name: "div", scope: !15, file: !15, line: 852, type: !78, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DISubroutineType(types: !79)
!79 = !{!21, !18, !18}
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !81, file: !23, line: 146)
!81 = !DISubprogram(name: "exit", scope: !15, file: !15, line: 617, type: !82, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!82 = !DISubroutineType(types: !83)
!83 = !{null, !18}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !85, file: !23, line: 147)
!85 = !DISubprogram(name: "free", scope: !15, file: !15, line: 565, type: !86, flags: DIFlagPrototyped, spFlags: 0)
!86 = !DISubroutineType(types: !87)
!87 = !{null, !62}
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !89, file: !23, line: 148)
!89 = !DISubprogram(name: "getenv", scope: !15, file: !15, line: 634, type: !90, flags: DIFlagPrototyped, spFlags: 0)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !47}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !94, file: !23, line: 149)
!94 = !DISubprogram(name: "labs", scope: !15, file: !15, line: 841, type: !95, flags: DIFlagPrototyped, spFlags: 0)
!95 = !DISubroutineType(types: !96)
!96 = !{!29, !29}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !98, file: !23, line: 150)
!98 = !DISubprogram(name: "ldiv", scope: !15, file: !15, line: 854, type: !99, flags: DIFlagPrototyped, spFlags: 0)
!99 = !DISubroutineType(types: !100)
!100 = !{!25, !29, !29}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !102, file: !23, line: 151)
!102 = !DISubprogram(name: "malloc", scope: !15, file: !15, line: 539, type: !103, flags: DIFlagPrototyped, spFlags: 0)
!103 = !DISubroutineType(types: !104)
!104 = !{!62, !65}
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !106, file: !23, line: 153)
!106 = !DISubprogram(name: "mblen", scope: !15, file: !15, line: 922, type: !107, flags: DIFlagPrototyped, spFlags: 0)
!107 = !DISubroutineType(types: !108)
!108 = !{!18, !47, !65}
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !110, file: !23, line: 154)
!110 = !DISubprogram(name: "mbstowcs", scope: !15, file: !15, line: 933, type: !111, flags: DIFlagPrototyped, spFlags: 0)
!111 = !DISubroutineType(types: !112)
!112 = !{!65, !113, !116, !65}
!113 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !114)
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!116 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !47)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !118, file: !23, line: 155)
!118 = !DISubprogram(name: "mbtowc", scope: !15, file: !15, line: 925, type: !119, flags: DIFlagPrototyped, spFlags: 0)
!119 = !DISubroutineType(types: !120)
!120 = !{!18, !113, !116, !65}
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !122, file: !23, line: 157)
!122 = !DISubprogram(name: "qsort", scope: !15, file: !15, line: 830, type: !123, flags: DIFlagPrototyped, spFlags: 0)
!123 = !DISubroutineType(types: !124)
!124 = !{null, !62, !65, !65, !68}
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !126, file: !23, line: 160)
!126 = !DISubprogram(name: "quick_exit", scope: !15, file: !15, line: 623, type: !82, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !128, file: !23, line: 163)
!128 = !DISubprogram(name: "rand", scope: !15, file: !15, line: 453, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!129 = !DISubroutineType(types: !130)
!130 = !{!18}
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !132, file: !23, line: 164)
!132 = !DISubprogram(name: "realloc", scope: !15, file: !15, line: 550, type: !133, flags: DIFlagPrototyped, spFlags: 0)
!133 = !DISubroutineType(types: !134)
!134 = !{!62, !62, !65}
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !136, file: !23, line: 165)
!136 = !DISubprogram(name: "srand", scope: !15, file: !15, line: 455, type: !137, flags: DIFlagPrototyped, spFlags: 0)
!137 = !DISubroutineType(types: !138)
!138 = !{null, !139}
!139 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !141, file: !23, line: 166)
!141 = !DISubprogram(name: "strtod", scope: !15, file: !15, line: 117, type: !142, flags: DIFlagPrototyped, spFlags: 0)
!142 = !DISubroutineType(types: !143)
!143 = !{!46, !116, !144}
!144 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !145)
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !147, file: !23, line: 167)
!147 = !DISubprogram(name: "strtol", scope: !15, file: !15, line: 176, type: !148, flags: DIFlagPrototyped, spFlags: 0)
!148 = !DISubroutineType(types: !149)
!149 = !{!29, !116, !144, !18}
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !151, file: !23, line: 168)
!151 = !DISubprogram(name: "strtoul", scope: !15, file: !15, line: 180, type: !152, flags: DIFlagPrototyped, spFlags: 0)
!152 = !DISubroutineType(types: !153)
!153 = !{!67, !116, !144, !18}
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !155, file: !23, line: 169)
!155 = !DISubprogram(name: "system", scope: !15, file: !15, line: 784, type: !52, flags: DIFlagPrototyped, spFlags: 0)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !157, file: !23, line: 171)
!157 = !DISubprogram(name: "wcstombs", scope: !15, file: !15, line: 936, type: !158, flags: DIFlagPrototyped, spFlags: 0)
!158 = !DISubroutineType(types: !159)
!159 = !{!65, !160, !161, !65}
!160 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !92)
!161 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !162)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!163 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !115)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !165, file: !23, line: 172)
!165 = !DISubprogram(name: "wctomb", scope: !15, file: !15, line: 929, type: !166, flags: DIFlagPrototyped, spFlags: 0)
!166 = !DISubroutineType(types: !167)
!167 = !{!18, !92, !115}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !170, file: !23, line: 200)
!169 = !DINamespace(name: "__gnu_cxx", scope: null)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !15, line: 80, baseType: !171)
!171 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !15, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !172, identifier: "_ZTS7lldiv_t")
!172 = !{!173, !175}
!173 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !171, file: !15, line: 78, baseType: !174, size: 64)
!174 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !171, file: !15, line: 79, baseType: !174, size: 64, offset: 64)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !177, file: !23, line: 206)
!177 = !DISubprogram(name: "_Exit", scope: !15, file: !15, line: 629, type: !82, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !179, file: !23, line: 210)
!179 = !DISubprogram(name: "llabs", scope: !15, file: !15, line: 844, type: !180, flags: DIFlagPrototyped, spFlags: 0)
!180 = !DISubroutineType(types: !181)
!181 = !{!174, !174}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !183, file: !23, line: 216)
!183 = !DISubprogram(name: "lldiv", scope: !15, file: !15, line: 858, type: !184, flags: DIFlagPrototyped, spFlags: 0)
!184 = !DISubroutineType(types: !185)
!185 = !{!170, !174, !174}
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !187, file: !23, line: 227)
!187 = !DISubprogram(name: "atoll", scope: !15, file: !15, line: 112, type: !188, flags: DIFlagPrototyped, spFlags: 0)
!188 = !DISubroutineType(types: !189)
!189 = !{!174, !47}
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !191, file: !23, line: 228)
!191 = !DISubprogram(name: "strtoll", scope: !15, file: !15, line: 200, type: !192, flags: DIFlagPrototyped, spFlags: 0)
!192 = !DISubroutineType(types: !193)
!193 = !{!174, !116, !144, !18}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !195, file: !23, line: 229)
!195 = !DISubprogram(name: "strtoull", scope: !15, file: !15, line: 205, type: !196, flags: DIFlagPrototyped, spFlags: 0)
!196 = !DISubroutineType(types: !197)
!197 = !{!198, !116, !144, !18}
!198 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !200, file: !23, line: 231)
!200 = !DISubprogram(name: "strtof", scope: !15, file: !15, line: 123, type: !201, flags: DIFlagPrototyped, spFlags: 0)
!201 = !DISubroutineType(types: !202)
!202 = !{!203, !116, !144}
!203 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !205, file: !23, line: 232)
!205 = !DISubprogram(name: "strtold", scope: !15, file: !15, line: 126, type: !206, flags: DIFlagPrototyped, spFlags: 0)
!206 = !DISubroutineType(types: !207)
!207 = !{!208, !116, !144}
!208 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !170, file: !23, line: 240)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !177, file: !23, line: 242)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !179, file: !23, line: 244)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !213, file: !23, line: 245)
!213 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !169, file: !23, line: 213, type: !184, flags: DIFlagPrototyped, spFlags: 0)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !183, file: !23, line: 246)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !187, file: !23, line: 248)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !200, file: !23, line: 249)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !191, file: !23, line: 250)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !195, file: !23, line: 251)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !205, file: !23, line: 252)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !221, file: !222, line: 57)
!221 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !223, file: !222, line: 79, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !224, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!222 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/bits/exception_ptr.h", directory: "")
!223 = !DINamespace(name: "__exception_ptr", scope: !11)
!224 = !{!225, !226, !230, !233, !234, !239, !240, !244, !250, !254, !258, !261, !262, !265, !269}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !221, file: !222, line: 81, baseType: !62, size: 64)
!226 = !DISubprogram(name: "exception_ptr", scope: !221, file: !222, line: 83, type: !227, scopeLine: 83, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!227 = !DISubroutineType(types: !228)
!228 = !{null, !229, !62}
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !221, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!230 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !221, file: !222, line: 85, type: !231, scopeLine: 85, flags: DIFlagPrototyped, spFlags: 0)
!231 = !DISubroutineType(types: !232)
!232 = !{null, !229}
!233 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !221, file: !222, line: 86, type: !231, scopeLine: 86, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !221, file: !222, line: 88, type: !235, scopeLine: 88, flags: DIFlagPrototyped, spFlags: 0)
!235 = !DISubroutineType(types: !236)
!236 = !{!62, !237}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!238 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !221)
!239 = !DISubprogram(name: "exception_ptr", scope: !221, file: !222, line: 96, type: !231, scopeLine: 96, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!240 = !DISubprogram(name: "exception_ptr", scope: !221, file: !222, line: 98, type: !241, scopeLine: 98, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!241 = !DISubroutineType(types: !242)
!242 = !{null, !229, !243}
!243 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !238, size: 64)
!244 = !DISubprogram(name: "exception_ptr", scope: !221, file: !222, line: 101, type: !245, scopeLine: 101, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!245 = !DISubroutineType(types: !246)
!246 = !{null, !229, !247}
!247 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !11, file: !248, line: 262, baseType: !249)
!248 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/x86_64-linux-gnu/c++/9/bits/c++config.h", directory: "")
!249 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!250 = !DISubprogram(name: "exception_ptr", scope: !221, file: !222, line: 105, type: !251, scopeLine: 105, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!251 = !DISubroutineType(types: !252)
!252 = !{null, !229, !253}
!253 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !221, size: 64)
!254 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !221, file: !222, line: 118, type: !255, scopeLine: 118, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!255 = !DISubroutineType(types: !256)
!256 = !{!257, !229, !243}
!257 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !221, size: 64)
!258 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !221, file: !222, line: 122, type: !259, scopeLine: 122, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!259 = !DISubroutineType(types: !260)
!260 = !{!257, !229, !253}
!261 = !DISubprogram(name: "~exception_ptr", scope: !221, file: !222, line: 129, type: !231, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!262 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !221, file: !222, line: 132, type: !263, scopeLine: 132, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!263 = !DISubroutineType(types: !264)
!264 = !{null, !229, !257}
!265 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !221, file: !222, line: 144, type: !266, scopeLine: 144, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!266 = !DISubroutineType(types: !267)
!267 = !{!268, !237}
!268 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!269 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !221, file: !222, line: 153, type: !270, scopeLine: 153, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!270 = !DISubroutineType(types: !271)
!271 = !{!272, !237}
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64)
!273 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !274)
!274 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !11, file: !275, line: 88, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!275 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/typeinfo", directory: "")
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !223, entity: !277, file: !222, line: 73)
!277 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !11, file: !222, line: 69, type: !278, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!278 = !DISubroutineType(types: !279)
!279 = !{null, !221}
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !281, file: !296, line: 64)
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !282, line: 6, baseType: !283)
!282 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "")
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !284, line: 21, baseType: !285)
!284 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "")
!285 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !284, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !286, identifier: "_ZTS11__mbstate_t")
!286 = !{!287, !288}
!287 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !285, file: !284, line: 15, baseType: !18, size: 32)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !285, file: !284, line: 20, baseType: !289, size: 32, offset: 32)
!289 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !285, file: !284, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !290, identifier: "_ZTSN11__mbstate_tUt_E")
!290 = !{!291, !292}
!291 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !289, file: !284, line: 18, baseType: !139, size: 32)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !289, file: !284, line: 19, baseType: !293, size: 32)
!293 = !DICompositeType(tag: DW_TAG_array_type, baseType: !49, size: 32, elements: !294)
!294 = !{!295}
!295 = !DISubrange(count: 4)
!296 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cwchar", directory: "")
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !298, file: !296, line: 141)
!298 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !299, line: 20, baseType: !139)
!299 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "")
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !301, file: !296, line: 143)
!301 = !DISubprogram(name: "btowc", scope: !302, file: !302, line: 284, type: !303, flags: DIFlagPrototyped, spFlags: 0)
!302 = !DIFile(filename: "/usr/include/wchar.h", directory: "")
!303 = !DISubroutineType(types: !304)
!304 = !{!298, !18}
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !306, file: !296, line: 144)
!306 = !DISubprogram(name: "fgetwc", scope: !302, file: !302, line: 726, type: !307, flags: DIFlagPrototyped, spFlags: 0)
!307 = !DISubroutineType(types: !308)
!308 = !{!298, !309}
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64)
!310 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !311, line: 5, baseType: !312)
!311 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "")
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !311, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !314, file: !296, line: 145)
!314 = !DISubprogram(name: "fgetws", scope: !302, file: !302, line: 755, type: !315, flags: DIFlagPrototyped, spFlags: 0)
!315 = !DISubroutineType(types: !316)
!316 = !{!114, !113, !18, !317}
!317 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !309)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !319, file: !296, line: 146)
!319 = !DISubprogram(name: "fputwc", scope: !302, file: !302, line: 740, type: !320, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DISubroutineType(types: !321)
!321 = !{!298, !115, !309}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !323, file: !296, line: 147)
!323 = !DISubprogram(name: "fputws", scope: !302, file: !302, line: 762, type: !324, flags: DIFlagPrototyped, spFlags: 0)
!324 = !DISubroutineType(types: !325)
!325 = !{!18, !161, !317}
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !327, file: !296, line: 148)
!327 = !DISubprogram(name: "fwide", scope: !302, file: !302, line: 573, type: !328, flags: DIFlagPrototyped, spFlags: 0)
!328 = !DISubroutineType(types: !329)
!329 = !{!18, !309, !18}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !331, file: !296, line: 149)
!331 = !DISubprogram(name: "fwprintf", scope: !302, file: !302, line: 580, type: !332, flags: DIFlagPrototyped, spFlags: 0)
!332 = !DISubroutineType(types: !333)
!333 = !{!18, !317, !161, null}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !335, file: !296, line: 150)
!335 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !302, file: !302, line: 640, type: !332, flags: DIFlagPrototyped, spFlags: 0)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !337, file: !296, line: 151)
!337 = !DISubprogram(name: "getwc", scope: !302, file: !302, line: 727, type: !307, flags: DIFlagPrototyped, spFlags: 0)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !339, file: !296, line: 152)
!339 = !DISubprogram(name: "getwchar", scope: !302, file: !302, line: 733, type: !340, flags: DIFlagPrototyped, spFlags: 0)
!340 = !DISubroutineType(types: !341)
!341 = !{!298}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !343, file: !296, line: 153)
!343 = !DISubprogram(name: "mbrlen", scope: !302, file: !302, line: 307, type: !344, flags: DIFlagPrototyped, spFlags: 0)
!344 = !DISubroutineType(types: !345)
!345 = !{!65, !116, !65, !346}
!346 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !347)
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !281, size: 64)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !349, file: !296, line: 154)
!349 = !DISubprogram(name: "mbrtowc", scope: !302, file: !302, line: 296, type: !350, flags: DIFlagPrototyped, spFlags: 0)
!350 = !DISubroutineType(types: !351)
!351 = !{!65, !113, !116, !65, !346}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !353, file: !296, line: 155)
!353 = !DISubprogram(name: "mbsinit", scope: !302, file: !302, line: 292, type: !354, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DISubroutineType(types: !355)
!355 = !{!18, !356}
!356 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !357, size: 64)
!357 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !281)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !359, file: !296, line: 156)
!359 = !DISubprogram(name: "mbsrtowcs", scope: !302, file: !302, line: 337, type: !360, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DISubroutineType(types: !361)
!361 = !{!65, !113, !362, !65, !346}
!362 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !363)
!363 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !365, file: !296, line: 157)
!365 = !DISubprogram(name: "putwc", scope: !302, file: !302, line: 741, type: !320, flags: DIFlagPrototyped, spFlags: 0)
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !367, file: !296, line: 158)
!367 = !DISubprogram(name: "putwchar", scope: !302, file: !302, line: 747, type: !368, flags: DIFlagPrototyped, spFlags: 0)
!368 = !DISubroutineType(types: !369)
!369 = !{!298, !115}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !371, file: !296, line: 160)
!371 = !DISubprogram(name: "swprintf", scope: !302, file: !302, line: 590, type: !372, flags: DIFlagPrototyped, spFlags: 0)
!372 = !DISubroutineType(types: !373)
!373 = !{!18, !113, !65, !161, null}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !375, file: !296, line: 162)
!375 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !302, file: !302, line: 647, type: !376, flags: DIFlagPrototyped, spFlags: 0)
!376 = !DISubroutineType(types: !377)
!377 = !{!18, !161, !161, null}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !379, file: !296, line: 163)
!379 = !DISubprogram(name: "ungetwc", scope: !302, file: !302, line: 770, type: !380, flags: DIFlagPrototyped, spFlags: 0)
!380 = !DISubroutineType(types: !381)
!381 = !{!298, !298, !309}
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !383, file: !296, line: 164)
!383 = !DISubprogram(name: "vfwprintf", scope: !302, file: !302, line: 598, type: !384, flags: DIFlagPrototyped, spFlags: 0)
!384 = !DISubroutineType(types: !385)
!385 = !{!18, !317, !161, !386}
!386 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !387, size: 64)
!387 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !5, size: 192, flags: DIFlagTypePassByValue, elements: !388, identifier: "_ZTS13__va_list_tag")
!388 = !{!389, !390, !391, !392}
!389 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !387, file: !5, baseType: !139, size: 32)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !387, file: !5, baseType: !139, size: 32, offset: 32)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !387, file: !5, baseType: !62, size: 64, offset: 64)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !387, file: !5, baseType: !62, size: 64, offset: 128)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !394, file: !296, line: 166)
!394 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !302, file: !302, line: 693, type: !384, flags: DIFlagPrototyped, spFlags: 0)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !396, file: !296, line: 169)
!396 = !DISubprogram(name: "vswprintf", scope: !302, file: !302, line: 611, type: !397, flags: DIFlagPrototyped, spFlags: 0)
!397 = !DISubroutineType(types: !398)
!398 = !{!18, !113, !65, !161, !386}
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !400, file: !296, line: 172)
!400 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !302, file: !302, line: 700, type: !401, flags: DIFlagPrototyped, spFlags: 0)
!401 = !DISubroutineType(types: !402)
!402 = !{!18, !161, !161, !386}
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !404, file: !296, line: 174)
!404 = !DISubprogram(name: "vwprintf", scope: !302, file: !302, line: 606, type: !405, flags: DIFlagPrototyped, spFlags: 0)
!405 = !DISubroutineType(types: !406)
!406 = !{!18, !161, !386}
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !408, file: !296, line: 176)
!408 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !302, file: !302, line: 697, type: !405, flags: DIFlagPrototyped, spFlags: 0)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !410, file: !296, line: 178)
!410 = !DISubprogram(name: "wcrtomb", scope: !302, file: !302, line: 301, type: !411, flags: DIFlagPrototyped, spFlags: 0)
!411 = !DISubroutineType(types: !412)
!412 = !{!65, !160, !115, !346}
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !414, file: !296, line: 179)
!414 = !DISubprogram(name: "wcscat", scope: !302, file: !302, line: 97, type: !415, flags: DIFlagPrototyped, spFlags: 0)
!415 = !DISubroutineType(types: !416)
!416 = !{!114, !113, !161}
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !418, file: !296, line: 180)
!418 = !DISubprogram(name: "wcscmp", scope: !302, file: !302, line: 106, type: !419, flags: DIFlagPrototyped, spFlags: 0)
!419 = !DISubroutineType(types: !420)
!420 = !{!18, !162, !162}
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !422, file: !296, line: 181)
!422 = !DISubprogram(name: "wcscoll", scope: !302, file: !302, line: 131, type: !419, flags: DIFlagPrototyped, spFlags: 0)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !424, file: !296, line: 182)
!424 = !DISubprogram(name: "wcscpy", scope: !302, file: !302, line: 87, type: !415, flags: DIFlagPrototyped, spFlags: 0)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !426, file: !296, line: 183)
!426 = !DISubprogram(name: "wcscspn", scope: !302, file: !302, line: 187, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{!65, !162, !162}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !430, file: !296, line: 184)
!430 = !DISubprogram(name: "wcsftime", scope: !302, file: !302, line: 834, type: !431, flags: DIFlagPrototyped, spFlags: 0)
!431 = !DISubroutineType(types: !432)
!432 = !{!65, !113, !65, !161, !433}
!433 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !434)
!434 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !435, size: 64)
!435 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !436)
!436 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !302, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !438, file: !296, line: 185)
!438 = !DISubprogram(name: "wcslen", scope: !302, file: !302, line: 222, type: !439, flags: DIFlagPrototyped, spFlags: 0)
!439 = !DISubroutineType(types: !440)
!440 = !{!65, !162}
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !442, file: !296, line: 186)
!442 = !DISubprogram(name: "wcsncat", scope: !302, file: !302, line: 101, type: !443, flags: DIFlagPrototyped, spFlags: 0)
!443 = !DISubroutineType(types: !444)
!444 = !{!114, !113, !161, !65}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !446, file: !296, line: 187)
!446 = !DISubprogram(name: "wcsncmp", scope: !302, file: !302, line: 109, type: !447, flags: DIFlagPrototyped, spFlags: 0)
!447 = !DISubroutineType(types: !448)
!448 = !{!18, !162, !162, !65}
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !450, file: !296, line: 188)
!450 = !DISubprogram(name: "wcsncpy", scope: !302, file: !302, line: 92, type: !443, flags: DIFlagPrototyped, spFlags: 0)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !452, file: !296, line: 189)
!452 = !DISubprogram(name: "wcsrtombs", scope: !302, file: !302, line: 343, type: !453, flags: DIFlagPrototyped, spFlags: 0)
!453 = !DISubroutineType(types: !454)
!454 = !{!65, !160, !455, !65, !346}
!455 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !456)
!456 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !458, file: !296, line: 190)
!458 = !DISubprogram(name: "wcsspn", scope: !302, file: !302, line: 191, type: !427, flags: DIFlagPrototyped, spFlags: 0)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !460, file: !296, line: 191)
!460 = !DISubprogram(name: "wcstod", scope: !302, file: !302, line: 377, type: !461, flags: DIFlagPrototyped, spFlags: 0)
!461 = !DISubroutineType(types: !462)
!462 = !{!46, !161, !463}
!463 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !464)
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !466, file: !296, line: 193)
!466 = !DISubprogram(name: "wcstof", scope: !302, file: !302, line: 382, type: !467, flags: DIFlagPrototyped, spFlags: 0)
!467 = !DISubroutineType(types: !468)
!468 = !{!203, !161, !463}
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !470, file: !296, line: 195)
!470 = !DISubprogram(name: "wcstok", scope: !302, file: !302, line: 217, type: !471, flags: DIFlagPrototyped, spFlags: 0)
!471 = !DISubroutineType(types: !472)
!472 = !{!114, !113, !161, !463}
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !474, file: !296, line: 196)
!474 = !DISubprogram(name: "wcstol", scope: !302, file: !302, line: 428, type: !475, flags: DIFlagPrototyped, spFlags: 0)
!475 = !DISubroutineType(types: !476)
!476 = !{!29, !161, !463, !18}
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !478, file: !296, line: 197)
!478 = !DISubprogram(name: "wcstoul", scope: !302, file: !302, line: 433, type: !479, flags: DIFlagPrototyped, spFlags: 0)
!479 = !DISubroutineType(types: !480)
!480 = !{!67, !161, !463, !18}
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !482, file: !296, line: 198)
!482 = !DISubprogram(name: "wcsxfrm", scope: !302, file: !302, line: 135, type: !483, flags: DIFlagPrototyped, spFlags: 0)
!483 = !DISubroutineType(types: !484)
!484 = !{!65, !113, !161, !65}
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !486, file: !296, line: 199)
!486 = !DISubprogram(name: "wctob", scope: !302, file: !302, line: 288, type: !487, flags: DIFlagPrototyped, spFlags: 0)
!487 = !DISubroutineType(types: !488)
!488 = !{!18, !298}
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !490, file: !296, line: 200)
!490 = !DISubprogram(name: "wmemcmp", scope: !302, file: !302, line: 258, type: !447, flags: DIFlagPrototyped, spFlags: 0)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !492, file: !296, line: 201)
!492 = !DISubprogram(name: "wmemcpy", scope: !302, file: !302, line: 262, type: !443, flags: DIFlagPrototyped, spFlags: 0)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !494, file: !296, line: 202)
!494 = !DISubprogram(name: "wmemmove", scope: !302, file: !302, line: 267, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!495 = !DISubroutineType(types: !496)
!496 = !{!114, !114, !162, !65}
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !498, file: !296, line: 203)
!498 = !DISubprogram(name: "wmemset", scope: !302, file: !302, line: 271, type: !499, flags: DIFlagPrototyped, spFlags: 0)
!499 = !DISubroutineType(types: !500)
!500 = !{!114, !114, !115, !65}
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !502, file: !296, line: 204)
!502 = !DISubprogram(name: "wprintf", scope: !302, file: !302, line: 587, type: !503, flags: DIFlagPrototyped, spFlags: 0)
!503 = !DISubroutineType(types: !504)
!504 = !{!18, !161, null}
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !506, file: !296, line: 205)
!506 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !302, file: !302, line: 644, type: !503, flags: DIFlagPrototyped, spFlags: 0)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !508, file: !296, line: 206)
!508 = !DISubprogram(name: "wcschr", scope: !302, file: !302, line: 164, type: !509, flags: DIFlagPrototyped, spFlags: 0)
!509 = !DISubroutineType(types: !510)
!510 = !{!114, !162, !115}
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !512, file: !296, line: 207)
!512 = !DISubprogram(name: "wcspbrk", scope: !302, file: !302, line: 201, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!513 = !DISubroutineType(types: !514)
!514 = !{!114, !162, !162}
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !516, file: !296, line: 208)
!516 = !DISubprogram(name: "wcsrchr", scope: !302, file: !302, line: 174, type: !509, flags: DIFlagPrototyped, spFlags: 0)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !518, file: !296, line: 209)
!518 = !DISubprogram(name: "wcsstr", scope: !302, file: !302, line: 212, type: !513, flags: DIFlagPrototyped, spFlags: 0)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !520, file: !296, line: 210)
!520 = !DISubprogram(name: "wmemchr", scope: !302, file: !302, line: 253, type: !521, flags: DIFlagPrototyped, spFlags: 0)
!521 = !DISubroutineType(types: !522)
!522 = !{!114, !162, !115, !65}
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !524, file: !296, line: 251)
!524 = !DISubprogram(name: "wcstold", scope: !302, file: !302, line: 384, type: !525, flags: DIFlagPrototyped, spFlags: 0)
!525 = !DISubroutineType(types: !526)
!526 = !{!208, !161, !463}
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !528, file: !296, line: 260)
!528 = !DISubprogram(name: "wcstoll", scope: !302, file: !302, line: 441, type: !529, flags: DIFlagPrototyped, spFlags: 0)
!529 = !DISubroutineType(types: !530)
!530 = !{!174, !161, !463, !18}
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !532, file: !296, line: 261)
!532 = !DISubprogram(name: "wcstoull", scope: !302, file: !302, line: 448, type: !533, flags: DIFlagPrototyped, spFlags: 0)
!533 = !DISubroutineType(types: !534)
!534 = !{!198, !161, !463, !18}
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !524, file: !296, line: 267)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !528, file: !296, line: 268)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !532, file: !296, line: 269)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !466, file: !296, line: 283)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !394, file: !296, line: 286)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !400, file: !296, line: 289)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !408, file: !296, line: 292)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !524, file: !296, line: 296)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !528, file: !296, line: 297)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !532, file: !296, line: 298)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !546, file: !549, line: 47)
!546 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !547, line: 224, baseType: !548)
!547 = !DIFile(filename: "vcpkg_ubuntu-20.04_llvm-11_amd64/installed/x64-linux-rel/tools/llvm/lib/clang/11.0.1/include/stdint.h", directory: "/home/zyl/btfinaltest-llvm11_debug")
!548 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!549 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdint", directory: "")
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !551, file: !549, line: 48)
!551 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !547, line: 205, baseType: !552)
!552 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !554, file: !549, line: 49)
!554 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !547, line: 167, baseType: !18)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !556, file: !549, line: 50)
!556 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !547, line: 96, baseType: !29)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !558, file: !549, line: 52)
!558 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !547, line: 234, baseType: !546)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !560, file: !549, line: 53)
!560 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !547, line: 217, baseType: !551)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !562, file: !549, line: 54)
!562 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !547, line: 186, baseType: !554)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !564, file: !549, line: 55)
!564 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !547, line: 112, baseType: !556)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !566, file: !549, line: 57)
!566 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !547, line: 232, baseType: !546)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !568, file: !549, line: 58)
!568 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !547, line: 215, baseType: !551)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !570, file: !549, line: 59)
!570 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !547, line: 184, baseType: !554)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !572, file: !549, line: 60)
!572 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !547, line: 110, baseType: !556)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !574, file: !549, line: 62)
!574 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !547, line: 262, baseType: !29)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !576, file: !549, line: 63)
!576 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !547, line: 249, baseType: !29)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !578, file: !549, line: 65)
!578 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !547, line: 226, baseType: !579)
!579 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !581, file: !549, line: 66)
!581 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !547, line: 207, baseType: !582)
!582 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !584, file: !549, line: 67)
!584 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !547, line: 172, baseType: !139)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !586, file: !549, line: 68)
!586 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !547, line: 98, baseType: !67)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !588, file: !549, line: 70)
!588 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !547, line: 235, baseType: !578)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !590, file: !549, line: 71)
!590 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !547, line: 218, baseType: !581)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !592, file: !549, line: 72)
!592 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !547, line: 187, baseType: !584)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !594, file: !549, line: 73)
!594 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !547, line: 113, baseType: !586)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !596, file: !549, line: 75)
!596 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !547, line: 233, baseType: !578)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !598, file: !549, line: 76)
!598 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !547, line: 216, baseType: !581)
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !600, file: !549, line: 77)
!600 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !547, line: 185, baseType: !584)
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !602, file: !549, line: 78)
!602 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !547, line: 111, baseType: !586)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !604, file: !549, line: 80)
!604 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !547, line: 263, baseType: !67)
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !606, file: !549, line: 81)
!606 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !547, line: 256, baseType: !67)
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !608, file: !609, line: 44)
!608 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !11, file: !248, line: 258, baseType: !67)
!609 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/ext/new_allocator.h", directory: "")
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !611, file: !609, line: 45)
!611 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !11, file: !248, line: 259, baseType: !29)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !613, file: !615, line: 53)
!613 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !614, line: 51, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!614 = !DIFile(filename: "/usr/include/locale.h", directory: "")
!615 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/clocale", directory: "")
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !617, file: !615, line: 54)
!617 = !DISubprogram(name: "setlocale", scope: !614, file: !614, line: 122, type: !618, flags: DIFlagPrototyped, spFlags: 0)
!618 = !DISubroutineType(types: !619)
!619 = !{!92, !18, !47}
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !621, file: !615, line: 55)
!621 = !DISubprogram(name: "localeconv", scope: !614, file: !614, line: 125, type: !622, flags: DIFlagPrototyped, spFlags: 0)
!622 = !DISubroutineType(types: !623)
!623 = !{!624}
!624 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !613, size: 64)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !626, file: !628, line: 64)
!626 = !DISubprogram(name: "isalnum", scope: !627, file: !627, line: 108, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!628 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cctype", directory: "")
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !630, file: !628, line: 65)
!630 = !DISubprogram(name: "isalpha", scope: !627, file: !627, line: 109, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !632, file: !628, line: 66)
!632 = !DISubprogram(name: "iscntrl", scope: !627, file: !627, line: 110, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !634, file: !628, line: 67)
!634 = !DISubprogram(name: "isdigit", scope: !627, file: !627, line: 111, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !636, file: !628, line: 68)
!636 = !DISubprogram(name: "isgraph", scope: !627, file: !627, line: 113, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !638, file: !628, line: 69)
!638 = !DISubprogram(name: "islower", scope: !627, file: !627, line: 112, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !640, file: !628, line: 70)
!640 = !DISubprogram(name: "isprint", scope: !627, file: !627, line: 114, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !642, file: !628, line: 71)
!642 = !DISubprogram(name: "ispunct", scope: !627, file: !627, line: 115, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !644, file: !628, line: 72)
!644 = !DISubprogram(name: "isspace", scope: !627, file: !627, line: 116, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !646, file: !628, line: 73)
!646 = !DISubprogram(name: "isupper", scope: !627, file: !627, line: 117, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !648, file: !628, line: 74)
!648 = !DISubprogram(name: "isxdigit", scope: !627, file: !627, line: 118, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !650, file: !628, line: 75)
!650 = !DISubprogram(name: "tolower", scope: !627, file: !627, line: 122, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !652, file: !628, line: 76)
!652 = !DISubprogram(name: "toupper", scope: !627, file: !627, line: 125, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !654, file: !628, line: 87)
!654 = !DISubprogram(name: "isblank", scope: !627, file: !627, line: 130, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !656, file: !658, line: 98)
!656 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !657, line: 7, baseType: !312)
!657 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!658 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstdio", directory: "")
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !660, file: !658, line: 99)
!660 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !661, line: 84, baseType: !662)
!661 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !663, line: 14, baseType: !664)
!663 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "")
!664 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !663, line: 10, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !666, file: !658, line: 101)
!666 = !DISubprogram(name: "clearerr", scope: !661, file: !661, line: 757, type: !667, flags: DIFlagPrototyped, spFlags: 0)
!667 = !DISubroutineType(types: !668)
!668 = !{null, !669}
!669 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !656, size: 64)
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !671, file: !658, line: 102)
!671 = !DISubprogram(name: "fclose", scope: !661, file: !661, line: 213, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!672 = !DISubroutineType(types: !673)
!673 = !{!18, !669}
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !675, file: !658, line: 103)
!675 = !DISubprogram(name: "feof", scope: !661, file: !661, line: 759, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !677, file: !658, line: 104)
!677 = !DISubprogram(name: "ferror", scope: !661, file: !661, line: 761, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !679, file: !658, line: 105)
!679 = !DISubprogram(name: "fflush", scope: !661, file: !661, line: 218, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !681, file: !658, line: 106)
!681 = !DISubprogram(name: "fgetc", scope: !661, file: !661, line: 485, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !683, file: !658, line: 107)
!683 = !DISubprogram(name: "fgetpos", scope: !661, file: !661, line: 731, type: !684, flags: DIFlagPrototyped, spFlags: 0)
!684 = !DISubroutineType(types: !685)
!685 = !{!18, !686, !687}
!686 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !669)
!687 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !688)
!688 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !660, size: 64)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !690, file: !658, line: 108)
!690 = !DISubprogram(name: "fgets", scope: !661, file: !661, line: 564, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!691 = !DISubroutineType(types: !692)
!692 = !{!92, !160, !18, !686}
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !694, file: !658, line: 109)
!694 = !DISubprogram(name: "fopen", scope: !661, file: !661, line: 246, type: !695, flags: DIFlagPrototyped, spFlags: 0)
!695 = !DISubroutineType(types: !696)
!696 = !{!669, !116, !116}
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !698, file: !658, line: 110)
!698 = !DISubprogram(name: "fprintf", scope: !661, file: !661, line: 326, type: !699, flags: DIFlagPrototyped, spFlags: 0)
!699 = !DISubroutineType(types: !700)
!700 = !{!18, !686, !116, null}
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !702, file: !658, line: 111)
!702 = !DISubprogram(name: "fputc", scope: !661, file: !661, line: 521, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!703 = !DISubroutineType(types: !704)
!704 = !{!18, !18, !669}
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !706, file: !658, line: 112)
!706 = !DISubprogram(name: "fputs", scope: !661, file: !661, line: 626, type: !707, flags: DIFlagPrototyped, spFlags: 0)
!707 = !DISubroutineType(types: !708)
!708 = !{!18, !116, !686}
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !710, file: !658, line: 113)
!710 = !DISubprogram(name: "fread", scope: !661, file: !661, line: 646, type: !711, flags: DIFlagPrototyped, spFlags: 0)
!711 = !DISubroutineType(types: !712)
!712 = !{!65, !713, !65, !65, !686}
!713 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !62)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !715, file: !658, line: 114)
!715 = !DISubprogram(name: "freopen", scope: !661, file: !661, line: 252, type: !716, flags: DIFlagPrototyped, spFlags: 0)
!716 = !DISubroutineType(types: !717)
!717 = !{!669, !116, !116, !686}
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !719, file: !658, line: 115)
!719 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !661, file: !661, line: 407, type: !699, flags: DIFlagPrototyped, spFlags: 0)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !721, file: !658, line: 116)
!721 = !DISubprogram(name: "fseek", scope: !661, file: !661, line: 684, type: !722, flags: DIFlagPrototyped, spFlags: 0)
!722 = !DISubroutineType(types: !723)
!723 = !{!18, !669, !29, !18}
!724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !725, file: !658, line: 117)
!725 = !DISubprogram(name: "fsetpos", scope: !661, file: !661, line: 736, type: !726, flags: DIFlagPrototyped, spFlags: 0)
!726 = !DISubroutineType(types: !727)
!727 = !{!18, !669, !728}
!728 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !729, size: 64)
!729 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !660)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !731, file: !658, line: 118)
!731 = !DISubprogram(name: "ftell", scope: !661, file: !661, line: 689, type: !732, flags: DIFlagPrototyped, spFlags: 0)
!732 = !DISubroutineType(types: !733)
!733 = !{!29, !669}
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !735, file: !658, line: 119)
!735 = !DISubprogram(name: "fwrite", scope: !661, file: !661, line: 652, type: !736, flags: DIFlagPrototyped, spFlags: 0)
!736 = !DISubroutineType(types: !737)
!737 = !{!65, !738, !65, !65, !686}
!738 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !63)
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !740, file: !658, line: 120)
!740 = !DISubprogram(name: "getc", scope: !661, file: !661, line: 486, type: !672, flags: DIFlagPrototyped, spFlags: 0)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !742, file: !658, line: 121)
!742 = !DISubprogram(name: "getchar", scope: !661, file: !661, line: 492, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!743 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !744, file: !658, line: 124)
!744 = !DISubprogram(name: "gets", scope: !661, file: !661, line: 577, type: !745, flags: DIFlagPrototyped, spFlags: 0)
!745 = !DISubroutineType(types: !746)
!746 = !{!92, !92}
!747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !748, file: !658, line: 126)
!748 = !DISubprogram(name: "perror", scope: !661, file: !661, line: 775, type: !749, flags: DIFlagPrototyped, spFlags: 0)
!749 = !DISubroutineType(types: !750)
!750 = !{null, !47}
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !752, file: !658, line: 127)
!752 = !DISubprogram(name: "printf", scope: !661, file: !661, line: 332, type: !753, flags: DIFlagPrototyped, spFlags: 0)
!753 = !DISubroutineType(types: !754)
!754 = !{!18, !116, null}
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !756, file: !658, line: 128)
!756 = !DISubprogram(name: "putc", scope: !661, file: !661, line: 522, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !758, file: !658, line: 129)
!758 = !DISubprogram(name: "putchar", scope: !661, file: !661, line: 528, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !760, file: !658, line: 130)
!760 = !DISubprogram(name: "puts", scope: !661, file: !661, line: 632, type: !52, flags: DIFlagPrototyped, spFlags: 0)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !762, file: !658, line: 131)
!762 = !DISubprogram(name: "remove", scope: !661, file: !661, line: 146, type: !52, flags: DIFlagPrototyped, spFlags: 0)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !764, file: !658, line: 132)
!764 = !DISubprogram(name: "rename", scope: !661, file: !661, line: 148, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!765 = !DISubroutineType(types: !766)
!766 = !{!18, !47, !47}
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !768, file: !658, line: 133)
!768 = !DISubprogram(name: "rewind", scope: !661, file: !661, line: 694, type: !667, flags: DIFlagPrototyped, spFlags: 0)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !770, file: !658, line: 134)
!770 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !661, file: !661, line: 410, type: !753, flags: DIFlagPrototyped, spFlags: 0)
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !772, file: !658, line: 135)
!772 = !DISubprogram(name: "setbuf", scope: !661, file: !661, line: 304, type: !773, flags: DIFlagPrototyped, spFlags: 0)
!773 = !DISubroutineType(types: !774)
!774 = !{null, !686, !160}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !776, file: !658, line: 136)
!776 = !DISubprogram(name: "setvbuf", scope: !661, file: !661, line: 308, type: !777, flags: DIFlagPrototyped, spFlags: 0)
!777 = !DISubroutineType(types: !778)
!778 = !{!18, !686, !160, !18, !65}
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !780, file: !658, line: 137)
!780 = !DISubprogram(name: "sprintf", scope: !661, file: !661, line: 334, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!781 = !DISubroutineType(types: !782)
!782 = !{!18, !160, !116, null}
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !784, file: !658, line: 138)
!784 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !661, file: !661, line: 412, type: !785, flags: DIFlagPrototyped, spFlags: 0)
!785 = !DISubroutineType(types: !786)
!786 = !{!18, !116, !116, null}
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !788, file: !658, line: 139)
!788 = !DISubprogram(name: "tmpfile", scope: !661, file: !661, line: 173, type: !789, flags: DIFlagPrototyped, spFlags: 0)
!789 = !DISubroutineType(types: !790)
!790 = !{!669}
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !792, file: !658, line: 141)
!792 = !DISubprogram(name: "tmpnam", scope: !661, file: !661, line: 187, type: !745, flags: DIFlagPrototyped, spFlags: 0)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !794, file: !658, line: 143)
!794 = !DISubprogram(name: "ungetc", scope: !661, file: !661, line: 639, type: !703, flags: DIFlagPrototyped, spFlags: 0)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !796, file: !658, line: 144)
!796 = !DISubprogram(name: "vfprintf", scope: !661, file: !661, line: 341, type: !797, flags: DIFlagPrototyped, spFlags: 0)
!797 = !DISubroutineType(types: !798)
!798 = !{!18, !686, !116, !386}
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !800, file: !658, line: 145)
!800 = !DISubprogram(name: "vprintf", scope: !661, file: !661, line: 347, type: !801, flags: DIFlagPrototyped, spFlags: 0)
!801 = !DISubroutineType(types: !802)
!802 = !{!18, !116, !386}
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !804, file: !658, line: 146)
!804 = !DISubprogram(name: "vsprintf", scope: !661, file: !661, line: 349, type: !805, flags: DIFlagPrototyped, spFlags: 0)
!805 = !DISubroutineType(types: !806)
!806 = !{!18, !160, !116, !386}
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !808, file: !658, line: 175)
!808 = !DISubprogram(name: "snprintf", scope: !661, file: !661, line: 354, type: !809, flags: DIFlagPrototyped, spFlags: 0)
!809 = !DISubroutineType(types: !810)
!810 = !{!18, !160, !65, !116, null}
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !812, file: !658, line: 176)
!812 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !661, file: !661, line: 451, type: !797, flags: DIFlagPrototyped, spFlags: 0)
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !814, file: !658, line: 177)
!814 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !661, file: !661, line: 456, type: !801, flags: DIFlagPrototyped, spFlags: 0)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !816, file: !658, line: 178)
!816 = !DISubprogram(name: "vsnprintf", scope: !661, file: !661, line: 358, type: !817, flags: DIFlagPrototyped, spFlags: 0)
!817 = !DISubroutineType(types: !818)
!818 = !{!18, !160, !65, !116, !386}
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !169, entity: !820, file: !658, line: 179)
!820 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !661, file: !661, line: 459, type: !821, flags: DIFlagPrototyped, spFlags: 0)
!821 = !DISubroutineType(types: !822)
!822 = !{!18, !116, !116, !386}
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !808, file: !658, line: 185)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !812, file: !658, line: 186)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !814, file: !658, line: 187)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !816, file: !658, line: 188)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !820, file: !658, line: 189)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !829, file: !833, line: 83)
!829 = !DISubprogram(name: "acos", scope: !830, file: !830, line: 53, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!830 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "")
!831 = !DISubroutineType(types: !832)
!832 = !{!46, !46}
!833 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cmath", directory: "")
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !835, file: !833, line: 102)
!835 = !DISubprogram(name: "asin", scope: !830, file: !830, line: 55, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !837, file: !833, line: 121)
!837 = !DISubprogram(name: "atan", scope: !830, file: !830, line: 57, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !839, file: !833, line: 140)
!839 = !DISubprogram(name: "atan2", scope: !830, file: !830, line: 59, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!840 = !DISubroutineType(types: !841)
!841 = !{!46, !46, !46}
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !843, file: !833, line: 161)
!843 = !DISubprogram(name: "ceil", scope: !830, file: !830, line: 159, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !845, file: !833, line: 180)
!845 = !DISubprogram(name: "cos", scope: !830, file: !830, line: 62, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !847, file: !833, line: 199)
!847 = !DISubprogram(name: "cosh", scope: !830, file: !830, line: 71, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !849, file: !833, line: 218)
!849 = !DISubprogram(name: "exp", scope: !830, file: !830, line: 95, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !851, file: !833, line: 237)
!851 = !DISubprogram(name: "fabs", scope: !830, file: !830, line: 162, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !853, file: !833, line: 256)
!853 = !DISubprogram(name: "floor", scope: !830, file: !830, line: 165, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !855, file: !833, line: 275)
!855 = !DISubprogram(name: "fmod", scope: !830, file: !830, line: 168, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !857, file: !833, line: 296)
!857 = !DISubprogram(name: "frexp", scope: !830, file: !830, line: 98, type: !858, flags: DIFlagPrototyped, spFlags: 0)
!858 = !DISubroutineType(types: !859)
!859 = !{!46, !46, !860}
!860 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !862, file: !833, line: 315)
!862 = !DISubprogram(name: "ldexp", scope: !830, file: !830, line: 101, type: !863, flags: DIFlagPrototyped, spFlags: 0)
!863 = !DISubroutineType(types: !864)
!864 = !{!46, !46, !18}
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !866, file: !833, line: 334)
!866 = !DISubprogram(name: "log", scope: !830, file: !830, line: 104, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !868, file: !833, line: 353)
!868 = !DISubprogram(name: "log10", scope: !830, file: !830, line: 107, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !870, file: !833, line: 372)
!870 = !DISubprogram(name: "modf", scope: !830, file: !830, line: 110, type: !871, flags: DIFlagPrototyped, spFlags: 0)
!871 = !DISubroutineType(types: !872)
!872 = !{!46, !46, !873}
!873 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !875, file: !833, line: 384)
!875 = !DISubprogram(name: "pow", scope: !830, file: !830, line: 140, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !877, file: !833, line: 421)
!877 = !DISubprogram(name: "sin", scope: !830, file: !830, line: 64, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !879, file: !833, line: 440)
!879 = !DISubprogram(name: "sinh", scope: !830, file: !830, line: 73, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !881, file: !833, line: 459)
!881 = !DISubprogram(name: "sqrt", scope: !830, file: !830, line: 143, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !883, file: !833, line: 478)
!883 = !DISubprogram(name: "tan", scope: !830, file: !830, line: 66, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !885, file: !833, line: 497)
!885 = !DISubprogram(name: "tanh", scope: !830, file: !830, line: 75, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !887, file: !833, line: 1065)
!887 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !888, line: 150, baseType: !46)
!888 = !DIFile(filename: "/usr/include/math.h", directory: "")
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !890, file: !833, line: 1066)
!890 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !888, line: 149, baseType: !203)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !892, file: !833, line: 1069)
!892 = !DISubprogram(name: "acosh", scope: !830, file: !830, line: 85, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !894, file: !833, line: 1070)
!894 = !DISubprogram(name: "acoshf", scope: !830, file: !830, line: 85, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!895 = !DISubroutineType(types: !896)
!896 = !{!203, !203}
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !898, file: !833, line: 1071)
!898 = !DISubprogram(name: "acoshl", scope: !830, file: !830, line: 85, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!899 = !DISubroutineType(types: !900)
!900 = !{!208, !208}
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !902, file: !833, line: 1073)
!902 = !DISubprogram(name: "asinh", scope: !830, file: !830, line: 87, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !904, file: !833, line: 1074)
!904 = !DISubprogram(name: "asinhf", scope: !830, file: !830, line: 87, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !906, file: !833, line: 1075)
!906 = !DISubprogram(name: "asinhl", scope: !830, file: !830, line: 87, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !908, file: !833, line: 1077)
!908 = !DISubprogram(name: "atanh", scope: !830, file: !830, line: 89, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !910, file: !833, line: 1078)
!910 = !DISubprogram(name: "atanhf", scope: !830, file: !830, line: 89, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !912, file: !833, line: 1079)
!912 = !DISubprogram(name: "atanhl", scope: !830, file: !830, line: 89, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !914, file: !833, line: 1081)
!914 = !DISubprogram(name: "cbrt", scope: !830, file: !830, line: 152, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !916, file: !833, line: 1082)
!916 = !DISubprogram(name: "cbrtf", scope: !830, file: !830, line: 152, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !918, file: !833, line: 1083)
!918 = !DISubprogram(name: "cbrtl", scope: !830, file: !830, line: 152, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !920, file: !833, line: 1085)
!920 = !DISubprogram(name: "copysign", scope: !830, file: !830, line: 196, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !922, file: !833, line: 1086)
!922 = !DISubprogram(name: "copysignf", scope: !830, file: !830, line: 196, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DISubroutineType(types: !924)
!924 = !{!203, !203, !203}
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !926, file: !833, line: 1087)
!926 = !DISubprogram(name: "copysignl", scope: !830, file: !830, line: 196, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!927 = !DISubroutineType(types: !928)
!928 = !{!208, !208, !208}
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !930, file: !833, line: 1089)
!930 = !DISubprogram(name: "erf", scope: !830, file: !830, line: 228, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !932, file: !833, line: 1090)
!932 = !DISubprogram(name: "erff", scope: !830, file: !830, line: 228, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !934, file: !833, line: 1091)
!934 = !DISubprogram(name: "erfl", scope: !830, file: !830, line: 228, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !936, file: !833, line: 1093)
!936 = !DISubprogram(name: "erfc", scope: !830, file: !830, line: 229, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !938, file: !833, line: 1094)
!938 = !DISubprogram(name: "erfcf", scope: !830, file: !830, line: 229, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !940, file: !833, line: 1095)
!940 = !DISubprogram(name: "erfcl", scope: !830, file: !830, line: 229, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !942, file: !833, line: 1097)
!942 = !DISubprogram(name: "exp2", scope: !830, file: !830, line: 130, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !944, file: !833, line: 1098)
!944 = !DISubprogram(name: "exp2f", scope: !830, file: !830, line: 130, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !946, file: !833, line: 1099)
!946 = !DISubprogram(name: "exp2l", scope: !830, file: !830, line: 130, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !948, file: !833, line: 1101)
!948 = !DISubprogram(name: "expm1", scope: !830, file: !830, line: 119, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !950, file: !833, line: 1102)
!950 = !DISubprogram(name: "expm1f", scope: !830, file: !830, line: 119, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !952, file: !833, line: 1103)
!952 = !DISubprogram(name: "expm1l", scope: !830, file: !830, line: 119, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !954, file: !833, line: 1105)
!954 = !DISubprogram(name: "fdim", scope: !830, file: !830, line: 326, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !956, file: !833, line: 1106)
!956 = !DISubprogram(name: "fdimf", scope: !830, file: !830, line: 326, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !958, file: !833, line: 1107)
!958 = !DISubprogram(name: "fdiml", scope: !830, file: !830, line: 326, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !960, file: !833, line: 1109)
!960 = !DISubprogram(name: "fma", scope: !830, file: !830, line: 335, type: !961, flags: DIFlagPrototyped, spFlags: 0)
!961 = !DISubroutineType(types: !962)
!962 = !{!46, !46, !46, !46}
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !964, file: !833, line: 1110)
!964 = !DISubprogram(name: "fmaf", scope: !830, file: !830, line: 335, type: !965, flags: DIFlagPrototyped, spFlags: 0)
!965 = !DISubroutineType(types: !966)
!966 = !{!203, !203, !203, !203}
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !968, file: !833, line: 1111)
!968 = !DISubprogram(name: "fmal", scope: !830, file: !830, line: 335, type: !969, flags: DIFlagPrototyped, spFlags: 0)
!969 = !DISubroutineType(types: !970)
!970 = !{!208, !208, !208, !208}
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !972, file: !833, line: 1113)
!972 = !DISubprogram(name: "fmax", scope: !830, file: !830, line: 329, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !974, file: !833, line: 1114)
!974 = !DISubprogram(name: "fmaxf", scope: !830, file: !830, line: 329, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !976, file: !833, line: 1115)
!976 = !DISubprogram(name: "fmaxl", scope: !830, file: !830, line: 329, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !978, file: !833, line: 1117)
!978 = !DISubprogram(name: "fmin", scope: !830, file: !830, line: 332, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !980, file: !833, line: 1118)
!980 = !DISubprogram(name: "fminf", scope: !830, file: !830, line: 332, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !982, file: !833, line: 1119)
!982 = !DISubprogram(name: "fminl", scope: !830, file: !830, line: 332, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !984, file: !833, line: 1121)
!984 = !DISubprogram(name: "hypot", scope: !830, file: !830, line: 147, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !986, file: !833, line: 1122)
!986 = !DISubprogram(name: "hypotf", scope: !830, file: !830, line: 147, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!987 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !988, file: !833, line: 1123)
!988 = !DISubprogram(name: "hypotl", scope: !830, file: !830, line: 147, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !990, file: !833, line: 1125)
!990 = !DISubprogram(name: "ilogb", scope: !830, file: !830, line: 280, type: !991, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DISubroutineType(types: !992)
!992 = !{!18, !46}
!993 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !994, file: !833, line: 1126)
!994 = !DISubprogram(name: "ilogbf", scope: !830, file: !830, line: 280, type: !995, flags: DIFlagPrototyped, spFlags: 0)
!995 = !DISubroutineType(types: !996)
!996 = !{!18, !203}
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !998, file: !833, line: 1127)
!998 = !DISubprogram(name: "ilogbl", scope: !830, file: !830, line: 280, type: !999, flags: DIFlagPrototyped, spFlags: 0)
!999 = !DISubroutineType(types: !1000)
!1000 = !{!18, !208}
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1002, file: !833, line: 1129)
!1002 = !DISubprogram(name: "lgamma", scope: !830, file: !830, line: 230, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1004, file: !833, line: 1130)
!1004 = !DISubprogram(name: "lgammaf", scope: !830, file: !830, line: 230, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1006, file: !833, line: 1131)
!1006 = !DISubprogram(name: "lgammal", scope: !830, file: !830, line: 230, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!1007 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1008, file: !833, line: 1134)
!1008 = !DISubprogram(name: "llrint", scope: !830, file: !830, line: 316, type: !1009, flags: DIFlagPrototyped, spFlags: 0)
!1009 = !DISubroutineType(types: !1010)
!1010 = !{!174, !46}
!1011 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1012, file: !833, line: 1135)
!1012 = !DISubprogram(name: "llrintf", scope: !830, file: !830, line: 316, type: !1013, flags: DIFlagPrototyped, spFlags: 0)
!1013 = !DISubroutineType(types: !1014)
!1014 = !{!174, !203}
!1015 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1016, file: !833, line: 1136)
!1016 = !DISubprogram(name: "llrintl", scope: !830, file: !830, line: 316, type: !1017, flags: DIFlagPrototyped, spFlags: 0)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{!174, !208}
!1019 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1020, file: !833, line: 1138)
!1020 = !DISubprogram(name: "llround", scope: !830, file: !830, line: 322, type: !1009, flags: DIFlagPrototyped, spFlags: 0)
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1022, file: !833, line: 1139)
!1022 = !DISubprogram(name: "llroundf", scope: !830, file: !830, line: 322, type: !1013, flags: DIFlagPrototyped, spFlags: 0)
!1023 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1024, file: !833, line: 1140)
!1024 = !DISubprogram(name: "llroundl", scope: !830, file: !830, line: 322, type: !1017, flags: DIFlagPrototyped, spFlags: 0)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1026, file: !833, line: 1143)
!1026 = !DISubprogram(name: "log1p", scope: !830, file: !830, line: 122, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1028, file: !833, line: 1144)
!1028 = !DISubprogram(name: "log1pf", scope: !830, file: !830, line: 122, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!1029 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1030, file: !833, line: 1145)
!1030 = !DISubprogram(name: "log1pl", scope: !830, file: !830, line: 122, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1032, file: !833, line: 1147)
!1032 = !DISubprogram(name: "log2", scope: !830, file: !830, line: 133, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1034, file: !833, line: 1148)
!1034 = !DISubprogram(name: "log2f", scope: !830, file: !830, line: 133, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1036, file: !833, line: 1149)
!1036 = !DISubprogram(name: "log2l", scope: !830, file: !830, line: 133, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!1037 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1038, file: !833, line: 1151)
!1038 = !DISubprogram(name: "logb", scope: !830, file: !830, line: 125, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1040, file: !833, line: 1152)
!1040 = !DISubprogram(name: "logbf", scope: !830, file: !830, line: 125, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1042, file: !833, line: 1153)
!1042 = !DISubprogram(name: "logbl", scope: !830, file: !830, line: 125, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!1043 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1044, file: !833, line: 1155)
!1044 = !DISubprogram(name: "lrint", scope: !830, file: !830, line: 314, type: !1045, flags: DIFlagPrototyped, spFlags: 0)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!29, !46}
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1048, file: !833, line: 1156)
!1048 = !DISubprogram(name: "lrintf", scope: !830, file: !830, line: 314, type: !1049, flags: DIFlagPrototyped, spFlags: 0)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!29, !203}
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1052, file: !833, line: 1157)
!1052 = !DISubprogram(name: "lrintl", scope: !830, file: !830, line: 314, type: !1053, flags: DIFlagPrototyped, spFlags: 0)
!1053 = !DISubroutineType(types: !1054)
!1054 = !{!29, !208}
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1056, file: !833, line: 1159)
!1056 = !DISubprogram(name: "lround", scope: !830, file: !830, line: 320, type: !1045, flags: DIFlagPrototyped, spFlags: 0)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1058, file: !833, line: 1160)
!1058 = !DISubprogram(name: "lroundf", scope: !830, file: !830, line: 320, type: !1049, flags: DIFlagPrototyped, spFlags: 0)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1060, file: !833, line: 1161)
!1060 = !DISubprogram(name: "lroundl", scope: !830, file: !830, line: 320, type: !1053, flags: DIFlagPrototyped, spFlags: 0)
!1061 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1062, file: !833, line: 1163)
!1062 = !DISubprogram(name: "nan", scope: !830, file: !830, line: 201, type: !44, flags: DIFlagPrototyped, spFlags: 0)
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1064, file: !833, line: 1164)
!1064 = !DISubprogram(name: "nanf", scope: !830, file: !830, line: 201, type: !1065, flags: DIFlagPrototyped, spFlags: 0)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!203, !47}
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1068, file: !833, line: 1165)
!1068 = !DISubprogram(name: "nanl", scope: !830, file: !830, line: 201, type: !1069, flags: DIFlagPrototyped, spFlags: 0)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!208, !47}
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1072, file: !833, line: 1167)
!1072 = !DISubprogram(name: "nearbyint", scope: !830, file: !830, line: 294, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1074, file: !833, line: 1168)
!1074 = !DISubprogram(name: "nearbyintf", scope: !830, file: !830, line: 294, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1076, file: !833, line: 1169)
!1076 = !DISubprogram(name: "nearbyintl", scope: !830, file: !830, line: 294, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1078, file: !833, line: 1171)
!1078 = !DISubprogram(name: "nextafter", scope: !830, file: !830, line: 259, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1080, file: !833, line: 1172)
!1080 = !DISubprogram(name: "nextafterf", scope: !830, file: !830, line: 259, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1082, file: !833, line: 1173)
!1082 = !DISubprogram(name: "nextafterl", scope: !830, file: !830, line: 259, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1084, file: !833, line: 1175)
!1084 = !DISubprogram(name: "nexttoward", scope: !830, file: !830, line: 261, type: !1085, flags: DIFlagPrototyped, spFlags: 0)
!1085 = !DISubroutineType(types: !1086)
!1086 = !{!46, !46, !208}
!1087 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1088, file: !833, line: 1176)
!1088 = !DISubprogram(name: "nexttowardf", scope: !830, file: !830, line: 261, type: !1089, flags: DIFlagPrototyped, spFlags: 0)
!1089 = !DISubroutineType(types: !1090)
!1090 = !{!203, !203, !208}
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1092, file: !833, line: 1177)
!1092 = !DISubprogram(name: "nexttowardl", scope: !830, file: !830, line: 261, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1094, file: !833, line: 1179)
!1094 = !DISubprogram(name: "remainder", scope: !830, file: !830, line: 272, type: !840, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1096, file: !833, line: 1180)
!1096 = !DISubprogram(name: "remainderf", scope: !830, file: !830, line: 272, type: !923, flags: DIFlagPrototyped, spFlags: 0)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1098, file: !833, line: 1181)
!1098 = !DISubprogram(name: "remainderl", scope: !830, file: !830, line: 272, type: !927, flags: DIFlagPrototyped, spFlags: 0)
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1100, file: !833, line: 1183)
!1100 = !DISubprogram(name: "remquo", scope: !830, file: !830, line: 307, type: !1101, flags: DIFlagPrototyped, spFlags: 0)
!1101 = !DISubroutineType(types: !1102)
!1102 = !{!46, !46, !46, !860}
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1104, file: !833, line: 1184)
!1104 = !DISubprogram(name: "remquof", scope: !830, file: !830, line: 307, type: !1105, flags: DIFlagPrototyped, spFlags: 0)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{!203, !203, !203, !860}
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1108, file: !833, line: 1185)
!1108 = !DISubprogram(name: "remquol", scope: !830, file: !830, line: 307, type: !1109, flags: DIFlagPrototyped, spFlags: 0)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!208, !208, !208, !860}
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1112, file: !833, line: 1187)
!1112 = !DISubprogram(name: "rint", scope: !830, file: !830, line: 256, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1114, file: !833, line: 1188)
!1114 = !DISubprogram(name: "rintf", scope: !830, file: !830, line: 256, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1116, file: !833, line: 1189)
!1116 = !DISubprogram(name: "rintl", scope: !830, file: !830, line: 256, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1118, file: !833, line: 1191)
!1118 = !DISubprogram(name: "round", scope: !830, file: !830, line: 298, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1120, file: !833, line: 1192)
!1120 = !DISubprogram(name: "roundf", scope: !830, file: !830, line: 298, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1122, file: !833, line: 1193)
!1122 = !DISubprogram(name: "roundl", scope: !830, file: !830, line: 298, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1124, file: !833, line: 1195)
!1124 = !DISubprogram(name: "scalbln", scope: !830, file: !830, line: 290, type: !1125, flags: DIFlagPrototyped, spFlags: 0)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!46, !46, !29}
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1128, file: !833, line: 1196)
!1128 = !DISubprogram(name: "scalblnf", scope: !830, file: !830, line: 290, type: !1129, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!203, !203, !29}
!1131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1132, file: !833, line: 1197)
!1132 = !DISubprogram(name: "scalblnl", scope: !830, file: !830, line: 290, type: !1133, flags: DIFlagPrototyped, spFlags: 0)
!1133 = !DISubroutineType(types: !1134)
!1134 = !{!208, !208, !29}
!1135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1136, file: !833, line: 1199)
!1136 = !DISubprogram(name: "scalbn", scope: !830, file: !830, line: 276, type: !863, flags: DIFlagPrototyped, spFlags: 0)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1138, file: !833, line: 1200)
!1138 = !DISubprogram(name: "scalbnf", scope: !830, file: !830, line: 276, type: !1139, flags: DIFlagPrototyped, spFlags: 0)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!203, !203, !18}
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1142, file: !833, line: 1201)
!1142 = !DISubprogram(name: "scalbnl", scope: !830, file: !830, line: 276, type: !1143, flags: DIFlagPrototyped, spFlags: 0)
!1143 = !DISubroutineType(types: !1144)
!1144 = !{!208, !208, !18}
!1145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1146, file: !833, line: 1203)
!1146 = !DISubprogram(name: "tgamma", scope: !830, file: !830, line: 235, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1148, file: !833, line: 1204)
!1148 = !DISubprogram(name: "tgammaf", scope: !830, file: !830, line: 235, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1150, file: !833, line: 1205)
!1150 = !DISubprogram(name: "tgammal", scope: !830, file: !830, line: 235, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1152, file: !833, line: 1207)
!1152 = !DISubprogram(name: "trunc", scope: !830, file: !830, line: 302, type: !831, flags: DIFlagPrototyped, spFlags: 0)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1154, file: !833, line: 1208)
!1154 = !DISubprogram(name: "truncf", scope: !830, file: !830, line: 302, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1156, file: !833, line: 1209)
!1156 = !DISubprogram(name: "truncl", scope: !830, file: !830, line: 302, type: !899, flags: DIFlagPrototyped, spFlags: 0)
!1157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1158, file: !1161, line: 58)
!1158 = !DIDerivedType(tag: DW_TAG_typedef, name: "fenv_t", file: !1159, line: 94, baseType: !1160)
!1159 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/fenv.h", directory: "")
!1160 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1159, line: 75, flags: DIFlagFwdDecl, identifier: "_ZTS6fenv_t")
!1161 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/fenv.h", directory: "")
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1163, file: !1161, line: 59)
!1163 = !DIDerivedType(tag: DW_TAG_typedef, name: "fexcept_t", file: !1159, line: 68, baseType: !582)
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1165, file: !1161, line: 62)
!1165 = !DISubprogram(name: "feclearexcept", scope: !1166, file: !1166, line: 71, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!1166 = !DIFile(filename: "/usr/include/fenv.h", directory: "")
!1167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1168, file: !1161, line: 63)
!1168 = !DISubprogram(name: "fegetexceptflag", scope: !1166, file: !1166, line: 75, type: !1169, flags: DIFlagPrototyped, spFlags: 0)
!1169 = !DISubroutineType(types: !1170)
!1170 = !{!18, !1171, !18}
!1171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1163, size: 64)
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1173, file: !1161, line: 64)
!1173 = !DISubprogram(name: "feraiseexcept", scope: !1166, file: !1166, line: 78, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!1174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1175, file: !1161, line: 65)
!1175 = !DISubprogram(name: "fesetexceptflag", scope: !1166, file: !1166, line: 88, type: !1176, flags: DIFlagPrototyped, spFlags: 0)
!1176 = !DISubroutineType(types: !1177)
!1177 = !{!18, !1178, !18}
!1178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1179, size: 64)
!1179 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1163)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1181, file: !1161, line: 66)
!1181 = !DISubprogram(name: "fetestexcept", scope: !1166, file: !1166, line: 92, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1183, file: !1161, line: 68)
!1183 = !DISubprogram(name: "fegetround", scope: !1166, file: !1166, line: 104, type: !129, flags: DIFlagPrototyped, spFlags: 0)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1185, file: !1161, line: 69)
!1185 = !DISubprogram(name: "fesetround", scope: !1166, file: !1166, line: 107, type: !16, flags: DIFlagPrototyped, spFlags: 0)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1187, file: !1161, line: 71)
!1187 = !DISubprogram(name: "fegetenv", scope: !1166, file: !1166, line: 114, type: !1188, flags: DIFlagPrototyped, spFlags: 0)
!1188 = !DISubroutineType(types: !1189)
!1189 = !{!18, !1190}
!1190 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1158, size: 64)
!1191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1192, file: !1161, line: 72)
!1192 = !DISubprogram(name: "feholdexcept", scope: !1166, file: !1166, line: 119, type: !1188, flags: DIFlagPrototyped, spFlags: 0)
!1193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1194, file: !1161, line: 73)
!1194 = !DISubprogram(name: "fesetenv", scope: !1166, file: !1166, line: 123, type: !1195, flags: DIFlagPrototyped, spFlags: 0)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{!18, !1197}
!1197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1198, size: 64)
!1198 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1158)
!1199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1200, file: !1161, line: 74)
!1200 = !DISubprogram(name: "feupdateenv", scope: !1166, file: !1166, line: 128, type: !1195, flags: DIFlagPrototyped, spFlags: 0)
!1201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1158, file: !1202, line: 61)
!1202 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cfenv", directory: "")
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1163, file: !1202, line: 62)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1165, file: !1202, line: 65)
!1205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1168, file: !1202, line: 66)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1173, file: !1202, line: 67)
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1175, file: !1202, line: 68)
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1181, file: !1202, line: 69)
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1183, file: !1202, line: 71)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1185, file: !1202, line: 72)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1187, file: !1202, line: 74)
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1192, file: !1202, line: 75)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1194, file: !1202, line: 76)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1200, file: !1202, line: 77)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1216, file: !1220, line: 77)
!1216 = !DISubprogram(name: "memchr", scope: !1217, file: !1217, line: 73, type: !1218, flags: DIFlagPrototyped, spFlags: 0)
!1217 = !DIFile(filename: "/usr/include/string.h", directory: "")
!1218 = !DISubroutineType(types: !1219)
!1219 = !{!63, !63, !18, !65}
!1220 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/9/../../../../include/c++/9/cstring", directory: "")
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1222, file: !1220, line: 78)
!1222 = !DISubprogram(name: "memcmp", scope: !1217, file: !1217, line: 64, type: !1223, flags: DIFlagPrototyped, spFlags: 0)
!1223 = !DISubroutineType(types: !1224)
!1224 = !{!18, !63, !63, !65}
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1226, file: !1220, line: 79)
!1226 = !DISubprogram(name: "memcpy", scope: !1217, file: !1217, line: 43, type: !1227, flags: DIFlagPrototyped, spFlags: 0)
!1227 = !DISubroutineType(types: !1228)
!1228 = !{!62, !713, !738, !65}
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1230, file: !1220, line: 80)
!1230 = !DISubprogram(name: "memmove", scope: !1217, file: !1217, line: 47, type: !1231, flags: DIFlagPrototyped, spFlags: 0)
!1231 = !DISubroutineType(types: !1232)
!1232 = !{!62, !62, !63, !65}
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1234, file: !1220, line: 81)
!1234 = !DISubprogram(name: "memset", scope: !1217, file: !1217, line: 61, type: !1235, flags: DIFlagPrototyped, spFlags: 0)
!1235 = !DISubroutineType(types: !1236)
!1236 = !{!62, !62, !18, !65}
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1238, file: !1220, line: 82)
!1238 = !DISubprogram(name: "strcat", scope: !1217, file: !1217, line: 130, type: !1239, flags: DIFlagPrototyped, spFlags: 0)
!1239 = !DISubroutineType(types: !1240)
!1240 = !{!92, !160, !116}
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1242, file: !1220, line: 83)
!1242 = !DISubprogram(name: "strcmp", scope: !1217, file: !1217, line: 137, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1244, file: !1220, line: 84)
!1244 = !DISubprogram(name: "strcoll", scope: !1217, file: !1217, line: 144, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1246, file: !1220, line: 85)
!1246 = !DISubprogram(name: "strcpy", scope: !1217, file: !1217, line: 122, type: !1239, flags: DIFlagPrototyped, spFlags: 0)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1248, file: !1220, line: 86)
!1248 = !DISubprogram(name: "strcspn", scope: !1217, file: !1217, line: 273, type: !1249, flags: DIFlagPrototyped, spFlags: 0)
!1249 = !DISubroutineType(types: !1250)
!1250 = !{!65, !47, !47}
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1252, file: !1220, line: 87)
!1252 = !DISubprogram(name: "strerror", scope: !1217, file: !1217, line: 397, type: !1253, flags: DIFlagPrototyped, spFlags: 0)
!1253 = !DISubroutineType(types: !1254)
!1254 = !{!92, !18}
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1256, file: !1220, line: 88)
!1256 = !DISubprogram(name: "strlen", scope: !1217, file: !1217, line: 385, type: !1257, flags: DIFlagPrototyped, spFlags: 0)
!1257 = !DISubroutineType(types: !1258)
!1258 = !{!65, !47}
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1260, file: !1220, line: 89)
!1260 = !DISubprogram(name: "strncat", scope: !1217, file: !1217, line: 133, type: !1261, flags: DIFlagPrototyped, spFlags: 0)
!1261 = !DISubroutineType(types: !1262)
!1262 = !{!92, !160, !116, !65}
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1264, file: !1220, line: 90)
!1264 = !DISubprogram(name: "strncmp", scope: !1217, file: !1217, line: 140, type: !1265, flags: DIFlagPrototyped, spFlags: 0)
!1265 = !DISubroutineType(types: !1266)
!1266 = !{!18, !47, !47, !65}
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1268, file: !1220, line: 91)
!1268 = !DISubprogram(name: "strncpy", scope: !1217, file: !1217, line: 125, type: !1261, flags: DIFlagPrototyped, spFlags: 0)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1270, file: !1220, line: 92)
!1270 = !DISubprogram(name: "strspn", scope: !1217, file: !1217, line: 277, type: !1249, flags: DIFlagPrototyped, spFlags: 0)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1272, file: !1220, line: 93)
!1272 = !DISubprogram(name: "strtok", scope: !1217, file: !1217, line: 336, type: !1239, flags: DIFlagPrototyped, spFlags: 0)
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1274, file: !1220, line: 94)
!1274 = !DISubprogram(name: "strxfrm", scope: !1217, file: !1217, line: 147, type: !1275, flags: DIFlagPrototyped, spFlags: 0)
!1275 = !DISubroutineType(types: !1276)
!1276 = !{!65, !160, !116, !65}
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1278, file: !1220, line: 95)
!1278 = !DISubprogram(name: "strchr", scope: !1217, file: !1217, line: 208, type: !1279, flags: DIFlagPrototyped, spFlags: 0)
!1279 = !DISubroutineType(types: !1280)
!1280 = !{!47, !47, !18}
!1281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1282, file: !1220, line: 96)
!1282 = !DISubprogram(name: "strpbrk", scope: !1217, file: !1217, line: 285, type: !1283, flags: DIFlagPrototyped, spFlags: 0)
!1283 = !DISubroutineType(types: !1284)
!1284 = !{!47, !47, !47}
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1286, file: !1220, line: 97)
!1286 = !DISubprogram(name: "strrchr", scope: !1217, file: !1217, line: 235, type: !1279, flags: DIFlagPrototyped, spFlags: 0)
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !11, entity: !1288, file: !1220, line: 98)
!1288 = !DISubprogram(name: "strstr", scope: !1217, file: !1217, line: 312, type: !1283, flags: DIFlagPrototyped, spFlags: 0)
!1289 = !{!"base.helper.semantics"}
!1290 = !{!1291, !1291, i64 0}
!1291 = !{!"long", !1292, i64 0}
!1292 = !{!"omnipotent char", !1293, i64 0}
!1293 = !{!"Simple C++ TBAA"}
!1294 = !{!1295, !1292, i64 2065}
!1295 = !{!"_ZTS5State", !1292, i64 16, !1296, i64 2064, !1292, i64 2080, !1297, i64 2088, !1299, i64 2112, !1301, i64 2208, !1302, i64 2480, !1303, i64 2608, !1304, i64 2736, !1292, i64 2760, !1292, i64 2768, !1305, i64 3280}
!1296 = !{!"_ZTS10ArithFlags", !1292, i64 0, !1292, i64 1, !1292, i64 2, !1292, i64 3, !1292, i64 4, !1292, i64 5, !1292, i64 6, !1292, i64 7, !1292, i64 8, !1292, i64 9, !1292, i64 10, !1292, i64 11, !1292, i64 12, !1292, i64 13, !1292, i64 14, !1292, i64 15}
!1297 = !{!"_ZTS8Segments", !1298, i64 0, !1292, i64 2, !1298, i64 4, !1292, i64 6, !1298, i64 8, !1292, i64 10, !1298, i64 12, !1292, i64 14, !1298, i64 16, !1292, i64 18, !1298, i64 20, !1292, i64 22}
!1298 = !{!"short", !1292, i64 0}
!1299 = !{!"_ZTS12AddressSpace", !1291, i64 0, !1300, i64 8, !1291, i64 16, !1300, i64 24, !1291, i64 32, !1300, i64 40, !1291, i64 48, !1300, i64 56, !1291, i64 64, !1300, i64 72, !1291, i64 80, !1300, i64 88}
!1300 = !{!"_ZTS3Reg", !1292, i64 0}
!1301 = !{!"_ZTS3GPR", !1291, i64 0, !1300, i64 8, !1291, i64 16, !1300, i64 24, !1291, i64 32, !1300, i64 40, !1291, i64 48, !1300, i64 56, !1291, i64 64, !1300, i64 72, !1291, i64 80, !1300, i64 88, !1291, i64 96, !1300, i64 104, !1291, i64 112, !1300, i64 120, !1291, i64 128, !1300, i64 136, !1291, i64 144, !1300, i64 152, !1291, i64 160, !1300, i64 168, !1291, i64 176, !1300, i64 184, !1291, i64 192, !1300, i64 200, !1291, i64 208, !1300, i64 216, !1291, i64 224, !1300, i64 232, !1291, i64 240, !1300, i64 248, !1291, i64 256, !1300, i64 264}
!1302 = !{!"_ZTS8X87Stack", !1292, i64 0}
!1303 = !{!"_ZTS3MMX", !1292, i64 0}
!1304 = !{!"_ZTS14FPUStatusFlags", !1292, i64 0, !1292, i64 1, !1292, i64 2, !1292, i64 3, !1292, i64 4, !1292, i64 5, !1292, i64 6, !1292, i64 7, !1292, i64 8, !1292, i64 9, !1292, i64 10, !1292, i64 11, !1292, i64 12, !1292, i64 13, !1292, i64 14, !1292, i64 15, !1292, i64 16, !1292, i64 17, !1292, i64 18, !1292, i64 19, !1292, i64 20}
!1305 = !{!"_ZTS13SegmentCaches", !1306, i64 0, !1306, i64 16, !1306, i64 32, !1306, i64 48, !1306, i64 64, !1306, i64 80}
!1306 = !{!"_ZTS13SegmentShadow", !1292, i64 0, !1307, i64 8, !1307, i64 12}
!1307 = !{!"int", !1292, i64 0}
!1308 = !{i32 0, i32 9}
!1309 = !{!1295, !1292, i64 2067}
!1310 = !{!1295, !1292, i64 2069}
!1311 = !{!1295, !1292, i64 2071}
!1312 = !{!1295, !1292, i64 2073}
!1313 = !{!1295, !1292, i64 2077}
!1314 = !{!1292, !1292, i64 0}
!1315 = !{[5 x i8] c"XMM0\00"}
!1316 = !{!1317, !1317, i64 0}
!1317 = !{!"double", !1292, i64 0}
!1318 = !{!1319, !1321}
!1319 = distinct !{!1319, !1320, !"__mcsema_detach_call_value: %state"}
!1320 = distinct !{!1320, !"__mcsema_detach_call_value"}
!1321 = distinct !{!1321, !1320, !"__mcsema_detach_call_value: %memory"}
!1322 = !{!1319}
!1323 = !{!1321}
!1324 = !{i64 0, i64 16, !1314}
!1325 = !{[4 x i8] c"RSI\00"}
!1326 = !{!1327, !1329}
!1327 = distinct !{!1327, !1328, !"__mcsema_detach_call_value: %state"}
!1328 = distinct !{!1328, !"__mcsema_detach_call_value"}
!1329 = distinct !{!1329, !1328, !"__mcsema_detach_call_value: %memory"}
!1330 = !{!1327}
!1331 = !{!1329}
!1332 = !{!1333, !1335}
!1333 = distinct !{!1333, !1334, !"__mcsema_detach_call_value: %state"}
!1334 = distinct !{!1334, !"__mcsema_detach_call_value"}
!1335 = distinct !{!1335, !1334, !"__mcsema_detach_call_value: %memory"}
!1336 = !{!1333}
!1337 = !{!1335}
!1338 = !{!1339, !1341}
!1339 = distinct !{!1339, !1340, !"__mcsema_detach_call_value: %state"}
!1340 = distinct !{!1340, !"__mcsema_detach_call_value"}
!1341 = distinct !{!1341, !1340, !"__mcsema_detach_call_value: %memory"}
!1342 = !{!1339}
!1343 = !{!1341}
!1344 = !{[4 x i8] c"RDI\00"}
!1345 = !{!1346, !1348}
!1346 = distinct !{!1346, !1347, !"__mcsema_detach_call_value: %state"}
!1347 = distinct !{!1347, !"__mcsema_detach_call_value"}
!1348 = distinct !{!1348, !1347, !"__mcsema_detach_call_value: %memory"}
!1349 = !{!1346}
!1350 = !{!1348}
!1351 = !{[4 x i8] c"RDX\00"}
!1352 = !{[4 x i8] c"RAX\00"}
!1353 = !{!1354, !1356}
!1354 = distinct !{!1354, !1355, !"__mcsema_detach_call_value: %state"}
!1355 = distinct !{!1355, !"__mcsema_detach_call_value"}
!1356 = distinct !{!1356, !1355, !"__mcsema_detach_call_value: %memory"}
!1357 = !{!1354}
!1358 = !{!1356}
!1359 = !{!"base.external.cfgexternal"}
!1360 = !{!"base.entrypoint"}
!1361 = !{!"base.helper.mcsema"}
!1362 = !{[4 x i8] c"RCX\00"}
!1363 = !{[3 x i8] c"R8\00"}
!1364 = !{[3 x i8] c"R9\00"}
!1365 = !{[4 x i8] c"RSP\00"}
!1366 = !{[4 x i8] c"EDI\00"}
