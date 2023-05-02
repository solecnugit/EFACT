; ModuleID = '/home/zyl/Stephen_Github/anvill/tools/ExternalFunctionAuto-Completion_test/pyelftools/../Result/liftedComplement.bc'
source_filename = "/home/zyl/Stephen_Github/anvill/tools/ExternalFunctionAuto-Completion_test/pyelftools/../Result/complement.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@__mcsema_externs = dso_local global [50 x i8*] [i8* bitcast (i64 (%struct._IO_FILE*)* @ftell to i8*), i8* bitcast (i32 (i32)* @isspace to i8*), i8* bitcast (i32** ()* @__ctype_toupper_loc to i8*), i8* bitcast (i32 (i32, %struct._IO_FILE*)* @ungetc to i8*), i8* bitcast (i32** ()* @__ctype_tolower_loc to i8*), i8* bitcast (float (float, i32*)* @frexpf to i8*), i8* bitcast (i32 ()* @rand to i8*), i8* bitcast (i64 (i8*, i8**, i32)* @strtoul to i8*), i8* bitcast (i64 (i8*)* @strlen to i8*), i8* bitcast (i32 (i8*)* @unlink to i8*), i8* bitcast (double (i64, i64)* @difftime to i8*), i8* bitcast (i8* (i8*, i64)* @getcwd to i8*), i8* bitcast (i8* (i8*, i8*, i64)* @strncpy to i8*), i8* bitcast (i8* (i8*, i32, i64)* @memset to i8*), i8* bitcast (void (double, double*, double*)* @sincos to i8*), i8* bitcast (double (i8*, i8**)* @strtod to i8*), i8* bitcast (i8* (i8*, i8*, i64)* @memcpy to i8*), i8* bitcast (i32 (i8*)* @system to i8*), i8* bitcast (i64 (i64*)* @time to i8*), i8* bitcast (i8* (i8*, i8*)* @strcpy to i8*), i8* bitcast (i32 (%struct._IO_FILE*)* @fclose to i8*), i8* bitcast (i32 (i32)* @isalnum to i8*), i8* bitcast (i16** ()* @__ctype_b_loc to i8*), i8* bitcast (i32 (%struct._IO_FILE*, i64, i32)* @fseek to i8*), i8* bitcast (i32 (i8*, %struct._IO_FILE*)* @fputs to i8*), i8* bitcast (i32 (%struct._IO_FILE*)* @fflush to i8*), i8* bitcast (%struct._IO_FILE* (i8*, i8*)* @fopen to i8*), i8* bitcast (void (i8*)* @free to i8*), i8* bitcast (void (i32)* @exit to i8*), i8* bitcast (i32 (i32, %struct._IO_FILE*)* @fputc to i8*), i8* bitcast (i8* (i64)* @malloc to i8*), i8* bitcast (i32 (i8*, i8*)* @strcmp to i8*), i8* bitcast (i64 (i8*, i8**, i32)* @strtol to i8*), i8* bitcast (i32 (i32)* @tolower to i8*), i8* bitcast (i32 (i8*)* @chdir to i8*), i8* bitcast (i64 (i8*, i64, i64, %struct._IO_FILE*)* @fread to i8*), i8* bitcast (i32 (%struct._IO_FILE*)* @feof to i8*), i8* bitcast (i8* (i8*, i8*)* @strtok to i8*), i8* bitcast (float (float, float)* @powf to i8*), i8* bitcast (i32 (%struct._IO_FILE*)* @fgetc to i8*), i8* bitcast (i8* (i8*, i32, %struct._IO_FILE*)* @fgets to i8*), i8* bitcast (i32 (i32)* @isalpha to i8*), i8* bitcast (i8* (i8*, i8*, i64)* @memmove to i8*), i8* bitcast (i8* (i8*, i64)* @realloc to i8*), i8* bitcast (float (float)* @expf to i8*), i8* bitcast (i8* (i8*, i8*)* @strcat to i8*), i8* bitcast (float (float)* @sqrtf to i8*), i8* bitcast (i32 (i32)* @toupper to i8*), i8* bitcast (i32 (i32, %struct._IO_FILE*)* @putc to i8*), i8* bitcast (i64 (i8*, i64, i64, %struct._IO_FILE*)* @fwrite to i8*)], align 16
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_complement.cpp, i8* null }]
@llvm.used = appending global [1 x i8*] [i8* bitcast ([50 x i8*]* @__mcsema_externs to i8*)], section "llvm.metadata"

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

declare dso_local i64 @ftell(%struct._IO_FILE*) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @isspace(i32) #4

; Function Attrs: nounwind readnone
declare dso_local i32** @__ctype_toupper_loc() #5

declare dso_local i32 @ungetc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind readnone
declare dso_local i32** @__ctype_tolower_loc() #5

; Function Attrs: nounwind
declare dso_local float @frexpf(float, i32*) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nounwind
declare dso_local i64 @strtoul(i8*, i8**, i32) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: nounwind
declare dso_local i32 @unlink(i8*) #2

; Function Attrs: nounwind readnone
declare dso_local double @difftime(i64, i64) #5

; Function Attrs: nounwind
declare dso_local i8* @getcwd(i8*, i64) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind
declare dso_local i8* @memset(i8*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local void @sincos(double, double*, double*) #2

; Function Attrs: nounwind
declare dso_local double @strtod(i8*, i8**) #2

; Function Attrs: nounwind
declare dso_local i8* @memcpy(i8*, i8*, i64) #2

declare dso_local i32 @system(i8*) #1

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @isalnum(i32) #4

; Function Attrs: nounwind readnone
declare dso_local i16** @__ctype_b_loc() #5

declare dso_local i32 @fseek(%struct._IO_FILE*, i64, i32) #1

declare dso_local i32 @fputs(i8*, %struct._IO_FILE*) #1

declare dso_local i32 @fflush(%struct._IO_FILE*) #1

declare dso_local noalias %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

declare dso_local i32 @fputc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8*, i8**, i32) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @tolower(i32) #4

; Function Attrs: nounwind
declare dso_local i32 @chdir(i8*) #2

declare dso_local i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare dso_local i32 @feof(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare dso_local i8* @strtok(i8*, i8*) #2

; Function Attrs: nounwind
declare dso_local float @powf(float, float) #2

declare dso_local i32 @fgetc(%struct._IO_FILE*) #1

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @isalpha(i32) #4

; Function Attrs: nounwind
declare dso_local i8* @memmove(i8*, i8*, i64) #2

; Function Attrs: nounwind
declare dso_local i8* @realloc(i8*, i64) #2

; Function Attrs: nounwind
declare dso_local float @expf(float) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #2

; Function Attrs: nounwind
declare dso_local float @sqrtf(float) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @toupper(i32) #4

declare dso_local i32 @putc(i32, %struct._IO_FILE*) #1

declare dso_local i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_complement.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 11.1.0-6"}
