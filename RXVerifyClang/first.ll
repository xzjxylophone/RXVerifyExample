; ModuleID = 'first.m'
source_filename = "first.m"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

%0 = type opaque
%1 = type opaque
%struct._class_t = type { %struct._class_t*, %struct._class_t*, %struct._objc_cache*, i8* (i8*, i8*)**, %struct._class_ro_t* }
%struct._objc_cache = type opaque
%struct._class_ro_t = type { i32, i32, i32, i8*, i8*, %struct.__method_list_t*, %struct._objc_protocol_list*, %struct._ivar_list_t*, i8*, %struct._prop_list_t* }
%struct.__method_list_t = type { i32, i32, [0 x %struct._objc_method] }
%struct._objc_method = type { i8*, i8*, i8* }
%struct._objc_protocol_list = type { i64, [0 x %struct._protocol_t*] }
%struct._protocol_t = type { i8*, i8*, %struct._objc_protocol_list*, %struct.__method_list_t*, %struct.__method_list_t*, %struct.__method_list_t*, %struct.__method_list_t*, %struct._prop_list_t*, i32, i32, i8**, i8*, %struct._prop_list_t* }
%struct._ivar_list_t = type { i32, i32, [0 x %struct._ivar_t] }
%struct._ivar_t = type { i64*, i8*, i8*, i32, i32 }
%struct._prop_list_t = type { i32, i32, [0 x %struct._prop_t] }
%struct._prop_t = type { i8*, i8* }
%struct.__NSConstantString_tag = type { i32*, i32, i8*, i64 }

@"OBJC_CLASS_$_NSMutableArray" = external global %struct._class_t
@"OBJC_CLASSLIST_REFERENCES_$_" = private global %struct._class_t* @"OBJC_CLASS_$_NSMutableArray", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_ = private unnamed_addr constant [6 x i8] c"alloc\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_ = private externally_initialized global i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.1 = private unnamed_addr constant [5 x i8] c"init\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.2 = private externally_initialized global i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.1, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@"OBJC_CLASS_$_RXAAAA" = global %struct._class_t { %struct._class_t* @"OBJC_METACLASS_$_RXAAAA", %struct._class_t* @"OBJC_CLASS_$_NSObject", %struct._objc_cache* @_objc_empty_cache, i8* (i8*, i8*)** null, %struct._class_ro_t* @"\01l_OBJC_CLASS_RO_$_RXAAAA" }, section "__DATA, __objc_data", align 8
@"OBJC_CLASSLIST_REFERENCES_$_.3" = private global %struct._class_t* @"OBJC_CLASS_$_RXAAAA", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.4 = private unnamed_addr constant [6 x i8] c"array\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.5 = private externally_initialized global i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.4, i32 0, i32 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@_objc_empty_cache = external global %struct._objc_cache
@"OBJC_METACLASS_$_NSObject" = external global %struct._class_t
@OBJC_CLASS_NAME_ = private unnamed_addr constant [7 x i8] c"RXAAAA\00", section "__TEXT,__objc_classname,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_ = private unnamed_addr constant [8 x i8] c"@16@0:8\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.6 = private unnamed_addr constant [6 x i8] c"test1\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_TYPE_.7 = private unnamed_addr constant [8 x i8] c"v16@0:8\00", section "__TEXT,__objc_methtype,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.8 = private unnamed_addr constant [6 x i8] c"test2\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.9 = private unnamed_addr constant [6 x i8] c"test3\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.10 = private unnamed_addr constant [6 x i8] c"test4\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_METH_VAR_NAME_.11 = private unnamed_addr constant [6 x i8] c"test5\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@"\01l_OBJC_$_CLASS_METHODS_RXAAAA" = private global { i32, i32, [6 x %struct._objc_method] } { i32 24, i32 6, [6 x %struct._objc_method] [%struct._objc_method { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.4, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* bitcast (i8* (i8*, i8*)* @"\01+[RXAAAA array]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.6, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.7, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @"\01+[RXAAAA test1]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.8, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.7, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @"\01+[RXAAAA test2]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.9, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.7, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @"\01+[RXAAAA test3]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.10, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.7, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @"\01+[RXAAAA test4]" to i8*) }, %struct._objc_method { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.11, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.7, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @"\01+[RXAAAA test5]" to i8*) }] }, section "__DATA, __objc_const", align 8
@"\01l_OBJC_METACLASS_RO_$_RXAAAA" = private global %struct._class_ro_t { i32 129, i32 40, i32 40, i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), %struct.__method_list_t* bitcast ({ i32, i32, [6 x %struct._objc_method] }* @"\01l_OBJC_$_CLASS_METHODS_RXAAAA" to %struct.__method_list_t*), %struct._objc_protocol_list* null, %struct._ivar_list_t* null, i8* null, %struct._prop_list_t* null }, section "__DATA, __objc_const", align 8
@"OBJC_METACLASS_$_RXAAAA" = global %struct._class_t { %struct._class_t* @"OBJC_METACLASS_$_NSObject", %struct._class_t* @"OBJC_METACLASS_$_NSObject", %struct._objc_cache* @_objc_empty_cache, i8* (i8*, i8*)** null, %struct._class_ro_t* @"\01l_OBJC_METACLASS_RO_$_RXAAAA" }, section "__DATA, __objc_data", align 8
@"OBJC_CLASS_$_NSObject" = external global %struct._class_t
@"\01l_OBJC_CLASS_RO_$_RXAAAA" = private global %struct._class_ro_t { i32 128, i32 8, i32 8, i8* null, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), %struct.__method_list_t* null, %struct._objc_protocol_list* null, %struct._ivar_list_t* null, i8* null, %struct._prop_list_t* null }, section "__DATA, __objc_const", align 8
@__CFConstantStringClassReference = external global [0 x i32]
@.str = private unnamed_addr constant [3 x i8] c"%@\00", section "__TEXT,__cstring,cstring_literals", align 1
@_unnamed_cfstring_ = private global %struct.__NSConstantString_tag { i32* getelementptr inbounds ([0 x i32], [0 x i32]* @__CFConstantStringClassReference, i32 0, i32 0), i32 1992, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i64 2 }, section "__DATA,__cfstring", align 8
@"OBJC_CLASSLIST_REFERENCES_$_.12" = private global %struct._class_t* @"OBJC_CLASS_$_NSObject", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@"OBJC_LABEL_CLASS_$" = private global [1 x i8*] [i8* bitcast (%struct._class_t* @"OBJC_CLASS_$_RXAAAA" to i8*)], section "__DATA,__objc_classlist,regular,no_dead_strip", align 8
@llvm.compiler.used = appending global [19 x i8*] [i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_" to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_ to i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.1, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.2 to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.4, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.5 to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.6, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.7, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.8, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.9, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.10, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.11, i32 0, i32 0), i8* bitcast ({ i32, i32, [6 x %struct._objc_method] }* @"\01l_OBJC_$_CLASS_METHODS_RXAAAA" to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.12" to i8*), i8* bitcast ([1 x i8*]* @"OBJC_LABEL_CLASS_$" to i8*)], section "llvm.metadata"

; Function Attrs: noinline optnone ssp uwtable
define internal i8* @"\01+[RXAAAA array]"(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_", align 8
  %6 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %7 = bitcast %struct._class_t* %5 to i8*
  %8 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %7, i8* %6)
  %9 = bitcast i8* %8 to %0*
  %10 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.2, align 8, !invariant.load !9
  %11 = bitcast %0* %9 to i8*
  %12 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %11, i8* %10)
  %13 = bitcast i8* %12 to %0*
  %14 = bitcast %0* %13 to i8*
  %15 = tail call i8* @objc_autoreleaseReturnValue(i8* %14) #3
  ret i8* %15
}

; Function Attrs: nonlazybind
declare i8* @objc_msgSend(i8*, i8*, ...) #1

declare i8* @objc_autoreleaseReturnValue(i8*)

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01+[RXAAAA test1]"(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = call i8* @objc_retainAutoreleasedReturnValue(i8* %9) #3
  store i8* %10, i8** %5, align 8
  call void @objc_storeStrong(i8** %5, i8* null) #3
  ret void
}

declare i8* @objc_retainAutoreleasedReturnValue(i8*)

declare void @objc_storeStrong(i8**, i8*)

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01+[RXAAAA test2]"(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = call i8* @objc_retainAutoreleasedReturnValue(i8* %9) #3
  %11 = call i8* @objc_initWeak(i8** %5, i8* %10) #3
  call void @objc_release(i8* %10) #3, !clang.imprecise_release !9
  call void @objc_destroyWeak(i8** %5) #3
  ret void
}

declare i8* @objc_initWeak(i8**, i8*)

; Function Attrs: nonlazybind
declare void @objc_release(i8*) #1

declare void @objc_destroyWeak(i8**)

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01+[RXAAAA test3]"(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = call i8* @objc_retainAutoreleasedReturnValue(i8* %9) #3
  %11 = call i8* @objc_autorelease(i8* %10) #3
  store i8* %11, i8** %5, align 8
  ret void
}

declare i8* @objc_autorelease(i8*)

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01+[RXAAAA test4]"(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = call i8* @objc_unsafeClaimAutoreleasedReturnValue(i8* %9) #3
  store i8* %10, i8** %5, align 8
  ret void
}

declare i8* @objc_unsafeClaimAutoreleasedReturnValue(i8*)

; Function Attrs: noinline optnone ssp uwtable
define internal void @"\01+[RXAAAA test5]"(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = call i8* @objc_autoreleasePoolPush() #3
  %7 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %8 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %9 = bitcast %struct._class_t* %7 to i8*
  %10 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %9, i8* %8)
  %11 = call i8* @objc_retainAutoreleasedReturnValue(i8* %10) #3
  %12 = call i8* @objc_autorelease(i8* %11) #3
  store i8* %12, i8** %5, align 8
  call void @objc_autoreleasePoolPop(i8* %6)
  ret void
}

declare i8* @objc_autoreleasePoolPush()

declare void @objc_autoreleasePoolPop(i8*)

; Function Attrs: noinline optnone ssp uwtable
define i32 @main1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = call i8* @objc_retainAutoreleasedReturnValue(i8* %9) #3
  store i8* %10, i8** %5, align 8
  call void @objc_storeStrong(i8** %5, i8* null) #3
  ret i32 0
}

; Function Attrs: noinline optnone ssp uwtable
define i32 @main1_1(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = call i8* @objc_retainAutoreleasedReturnValue(i8* %9) #3
  store i8* %10, i8** %5, align 8
  %11 = load i8*, i8** %5, align 8
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to i8*), i8* %11)
  call void @objc_storeStrong(i8** %5, i8* null) #3
  ret i32 0
}

declare void @NSLog(i8*, ...) #2

; Function Attrs: noinline optnone ssp uwtable
define i32 @main2(i32, i8**) #0 personality i8* bitcast (i32 (...)* @__objc_personality_v0 to i8*) {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*
  %7 = alloca i32
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %8 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %9 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %10 = bitcast %struct._class_t* %8 to i8*
  %11 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %10, i8* %9)
  %12 = call i8* @objc_retainAutoreleasedReturnValue(i8* %11) #3
  %13 = call i8* @objc_initWeak(i8** %5, i8* %12) #3
  call void @objc_release(i8* %12) #3, !clang.imprecise_release !9
  %14 = call i8* @objc_loadWeakRetained(i8** %5) #3
  invoke void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to i8*), i8* %14)
          to label %15 unwind label %16

; <label>:15:                                     ; preds = %2
  call void @objc_release(i8* %14) #3, !clang.imprecise_release !9
  call void @objc_destroyWeak(i8** %5) #3
  ret i32 0

; <label>:16:                                     ; preds = %2
  %17 = landingpad { i8*, i32 }
          cleanup
  %18 = extractvalue { i8*, i32 } %17, 0
  store i8* %18, i8** %6, align 8
  %19 = extractvalue { i8*, i32 } %17, 1
  store i32 %19, i32* %7, align 4
  call void @objc_destroyWeak(i8** %5) #3
  br label %20

; <label>:20:                                     ; preds = %16
  %21 = load i8*, i8** %6, align 8
  %22 = load i32, i32* %7, align 4
  %23 = insertvalue { i8*, i32 } undef, i8* %21, 0
  %24 = insertvalue { i8*, i32 } %23, i32 %22, 1
  resume { i8*, i32 } %24
}

declare i8* @objc_loadWeakRetained(i8**)

declare i32 @__objc_personality_v0(...)

; Function Attrs: noinline optnone ssp uwtable
define i32 @main2_2(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = call i8* @objc_retainAutoreleasedReturnValue(i8* %9) #3
  %11 = call i8* @objc_initWeak(i8** %5, i8* %10) #3
  call void @objc_release(i8* %10) #3, !clang.imprecise_release !9
  call void @objc_destroyWeak(i8** %5) #3
  ret i32 0
}

; Function Attrs: noinline optnone ssp uwtable
define i32 @main3(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = call i8* @objc_retainAutoreleasedReturnValue(i8* %9) #3
  %11 = call i8* @objc_autorelease(i8* %10) #3
  store i8* %11, i8** %5, align 8
  %12 = load i8*, i8** %5, align 8
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to i8*), i8* %12)
  ret i32 0
}

; Function Attrs: noinline optnone ssp uwtable
define i32 @main4(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %6 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3", align 8
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %8 = bitcast %struct._class_t* %6 to i8*
  %9 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %8, i8* %7)
  %10 = call i8* @objc_unsafeClaimAutoreleasedReturnValue(i8* %9) #3
  store i8* %10, i8** %5, align 8
  %11 = load i8*, i8** %5, align 8
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to i8*), i8* %11)
  ret i32 0
}

; Function Attrs: noinline optnone ssp uwtable
define i32 @main5(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  %6 = call i8* @objc_autoreleasePoolPush() #3
  %7 = load %struct._class_t*, %struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.12", align 8
  %8 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %9 = bitcast %struct._class_t* %7 to i8*
  %10 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %9, i8* %8)
  %11 = bitcast i8* %10 to %1*
  %12 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.2, align 8, !invariant.load !9
  %13 = bitcast %1* %11 to i8*
  %14 = call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %13, i8* %12)
  %15 = bitcast i8* %14 to %1*
  %16 = bitcast %1* %15 to i8*
  %17 = call i8* @objc_autorelease(i8* %16) #3
  store i8* %17, i8** %5, align 8
  call void @objc_autoreleasePoolPop(i8* %6)
  ret i32 0
}

attributes #0 = { noinline optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nonlazybind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 14]}
!1 = !{i32 1, !"Objective-C Version", i32 2}
!2 = !{i32 1, !"Objective-C Image Info Version", i32 0}
!3 = !{i32 1, !"Objective-C Image Info Section", !"__DATA,__objc_imageinfo,regular,no_dead_strip"}
!4 = !{i32 4, !"Objective-C Garbage Collection", i32 0}
!5 = !{i32 1, !"Objective-C Class Properties", i32 64}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{!"Apple LLVM version 10.0.1 (clang-1001.0.46.3)"}
!9 = !{}
