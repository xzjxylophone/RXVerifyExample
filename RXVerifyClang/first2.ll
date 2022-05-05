; ModuleID = 'first.m'
source_filename = "first.m"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

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
@OBJC_SELECTOR_REFERENCES_ = private externally_initialized global i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_, i64 0, i64 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.1 = private unnamed_addr constant [5 x i8] c"init\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.2 = private externally_initialized global i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.1, i64 0, i64 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
@"OBJC_CLASS_$_RXAAAA" = global %struct._class_t { %struct._class_t* @"OBJC_METACLASS_$_RXAAAA", %struct._class_t* @"OBJC_CLASS_$_NSObject", %struct._objc_cache* @_objc_empty_cache, i8* (i8*, i8*)** null, %struct._class_ro_t* @"\01l_OBJC_CLASS_RO_$_RXAAAA" }, section "__DATA, __objc_data", align 8
@"OBJC_CLASSLIST_REFERENCES_$_.3" = private global %struct._class_t* @"OBJC_CLASS_$_RXAAAA", section "__DATA,__objc_classrefs,regular,no_dead_strip", align 8
@OBJC_METH_VAR_NAME_.4 = private unnamed_addr constant [6 x i8] c"array\00", section "__TEXT,__objc_methname,cstring_literals", align 1
@OBJC_SELECTOR_REFERENCES_.5 = private externally_initialized global i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.4, i64 0, i64 0), section "__DATA,__objc_selrefs,literal_pointers,no_dead_strip", align 8
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
@llvm.compiler.used = appending global [19 x i8*] [i8* bitcast ({ i32, i32, [6 x %struct._objc_method] }* @"\01l_OBJC_$_CLASS_METHODS_RXAAAA" to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_" to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.12" to i8*), i8* bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @OBJC_CLASS_NAME_, i32 0, i32 0), i8* bitcast ([1 x i8*]* @"OBJC_LABEL_CLASS_$" to i8*), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @OBJC_METH_VAR_NAME_.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.10, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.11, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.4, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.6, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.8, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @OBJC_METH_VAR_NAME_.9, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @OBJC_METH_VAR_TYPE_.7, i32 0, i32 0), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_ to i8*), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.2 to i8*), i8* bitcast (i8** @OBJC_SELECTOR_REFERENCES_.5 to i8*)], section "llvm.metadata"

; Function Attrs: ssp uwtable
define internal i8* @"\01+[RXAAAA array]"(i8* nocapture readnone, i8* nocapture readnone) #0 {
  %3 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_" to i8**), align 8
  %4 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %5 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %3, i8* %4), !clang.arc.no_objc_arc_exceptions !9
  %6 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.2, align 8, !invariant.load !9
  %7 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %5, i8* %6), !clang.arc.no_objc_arc_exceptions !9
  %8 = tail call i8* @objc_autoreleaseReturnValue(i8* %7) #4
  ret i8* %7
}

; Function Attrs: nonlazybind
declare i8* @objc_msgSend(i8*, i8*, ...) local_unnamed_addr #1

declare i8* @objc_autoreleaseReturnValue(i8*) local_unnamed_addr

; Function Attrs: ssp uwtable
define internal void @"\01+[RXAAAA test1]"(i8* nocapture readnone, i8* nocapture readnone) #0 {
  %3 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %4 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %5 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %3, i8* %4), !clang.arc.no_objc_arc_exceptions !9
  %6 = tail call i8* @objc_retainAutoreleasedReturnValue(i8* %5) #4
  tail call void @objc_release(i8* %5) #4, !clang.imprecise_release !9
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

declare i8* @objc_retainAutoreleasedReturnValue(i8*) local_unnamed_addr

; Function Attrs: nonlazybind
declare void @objc_release(i8*) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: ssp uwtable
define internal void @"\01+[RXAAAA test2]"(i8* nocapture readnone, i8* nocapture readnone) #0 {
  %3 = alloca i8*, align 8
  %4 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  %5 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %6 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %7 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %5, i8* %6), !clang.arc.no_objc_arc_exceptions !9
  %8 = tail call i8* @objc_retainAutoreleasedReturnValue(i8* %7) #4
  %9 = call i8* @objc_initWeak(i8** nonnull %3, i8* %7) #4
  call void @objc_release(i8* %7) #4, !clang.imprecise_release !9
  call void @objc_destroyWeak(i8** nonnull %3) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  ret void
}

declare i8* @objc_initWeak(i8**, i8*) local_unnamed_addr

declare void @objc_destroyWeak(i8**) local_unnamed_addr

; Function Attrs: ssp uwtable
define internal void @"\01+[RXAAAA test3]"(i8* nocapture readnone, i8* nocapture readnone) #0 {
  %3 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %4 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %5 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %3, i8* %4), !clang.arc.no_objc_arc_exceptions !9
  %6 = tail call i8* @objc_retainAutoreleasedReturnValue(i8* %5) #4
  call void @objc_release(i8* %5) #4, !clang.imprecise_release !9
  ret void
}

declare i8* @objc_autorelease(i8*) local_unnamed_addr

; Function Attrs: ssp uwtable
define internal void @"\01+[RXAAAA test4]"(i8* nocapture readnone, i8* nocapture readnone) #0 {
  %3 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %4 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %5 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %3, i8* %4), !clang.arc.no_objc_arc_exceptions !9
  %6 = tail call i8* @objc_unsafeClaimAutoreleasedReturnValue(i8* %5) #4
  ret void
}

declare i8* @objc_unsafeClaimAutoreleasedReturnValue(i8*) local_unnamed_addr

; Function Attrs: ssp uwtable
define internal void @"\01+[RXAAAA test5]"(i8* nocapture readnone, i8* nocapture readnone) #0 {
  %3 = tail call i8* @objc_autoreleasePoolPush() #4
  %4 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %5 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %6 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %4, i8* %5), !clang.arc.no_objc_arc_exceptions !9
  %7 = tail call i8* @objc_retainAutoreleasedReturnValue(i8* %6) #4
  call void @objc_release(i8* %6) #4, !clang.imprecise_release !9
  tail call void @objc_autoreleasePoolPop(i8* %3) #4, !clang.arc.no_objc_arc_exceptions !9
  ret void
}

declare i8* @objc_autoreleasePoolPush() local_unnamed_addr

declare void @objc_autoreleasePoolPop(i8*) local_unnamed_addr

; Function Attrs: ssp uwtable
define i32 @main1(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %4 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %5 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %3, i8* %4), !clang.arc.no_objc_arc_exceptions !9
  %6 = tail call i8* @objc_retainAutoreleasedReturnValue(i8* %5) #4
  tail call void @objc_release(i8* %5) #4, !clang.imprecise_release !9
  ret i32 0
}

; Function Attrs: ssp uwtable
define i32 @main1_1(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %4 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %5 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %3, i8* %4), !clang.arc.no_objc_arc_exceptions !9
  %6 = tail call i8* @objc_retainAutoreleasedReturnValue(i8* %5) #4
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to i8*), i8* %5), !clang.arc.no_objc_arc_exceptions !9
  tail call void @objc_release(i8* %5) #4, !clang.imprecise_release !9
  ret i32 0
}

declare void @NSLog(i8*, ...) local_unnamed_addr #3

; Function Attrs: ssp uwtable
define i32 @main2(i32, i8** nocapture readnone) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__objc_personality_v0 to i8*) {
  %3 = alloca i8*, align 8
  %4 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  %5 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %6 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %7 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %5, i8* %6), !clang.arc.no_objc_arc_exceptions !9
  %8 = tail call i8* @objc_retainAutoreleasedReturnValue(i8* %7) #4
  %9 = call i8* @objc_initWeak(i8** nonnull %3, i8* %7) #4
  call void @objc_release(i8* %7) #4, !clang.imprecise_release !9
  %10 = call i8* @objc_loadWeakRetained(i8** nonnull %3) #4
  invoke void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to i8*), i8* %10)
          to label %11 unwind label %12, !clang.arc.no_objc_arc_exceptions !9

; <label>:11:                                     ; preds = %2
  call void @objc_release(i8* %10) #4, !clang.imprecise_release !9
  call void @objc_destroyWeak(i8** nonnull %3) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  ret i32 0

; <label>:12:                                     ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  call void @objc_destroyWeak(i8** nonnull %3) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  resume { i8*, i32 } %13
}

declare i8* @objc_loadWeakRetained(i8**) local_unnamed_addr

declare i32 @__objc_personality_v0(...)

; Function Attrs: ssp uwtable
define i32 @main2_2(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = alloca i8*, align 8
  %4 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  %5 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %6 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %7 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %5, i8* %6), !clang.arc.no_objc_arc_exceptions !9
  %8 = tail call i8* @objc_retainAutoreleasedReturnValue(i8* %7) #4
  %9 = call i8* @objc_initWeak(i8** nonnull %3, i8* %7) #4
  call void @objc_release(i8* %7) #4, !clang.imprecise_release !9
  call void @objc_destroyWeak(i8** nonnull %3) #4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  ret i32 0
}

; Function Attrs: ssp uwtable
define i32 @main3(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %4 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %5 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %3, i8* %4), !clang.arc.no_objc_arc_exceptions !9
  %6 = tail call i8* @objc_retainAutoreleasedReturnValue(i8* %5) #4
  %7 = call i8* @objc_autorelease(i8* %5) #4
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to i8*), i8* %5), !clang.arc.no_objc_arc_exceptions !9
  ret i32 0
}

; Function Attrs: ssp uwtable
define i32 @main4(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.3" to i8**), align 8
  %4 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.5, align 8, !invariant.load !9
  %5 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %3, i8* %4), !clang.arc.no_objc_arc_exceptions !9
  %6 = tail call i8* @objc_unsafeClaimAutoreleasedReturnValue(i8* %5) #4
  notail call void (i8*, ...) @NSLog(i8* bitcast (%struct.__NSConstantString_tag* @_unnamed_cfstring_ to i8*), i8* %6), !clang.arc.no_objc_arc_exceptions !9
  ret i32 0
}

; Function Attrs: ssp uwtable
define i32 @main5(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = tail call i8* @objc_autoreleasePoolPush() #4
  %4 = load i8*, i8** bitcast (%struct._class_t** @"OBJC_CLASSLIST_REFERENCES_$_.12" to i8**), align 8
  %5 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_, align 8, !invariant.load !9
  %6 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %4, i8* %5), !clang.arc.no_objc_arc_exceptions !9
  %7 = load i8*, i8** @OBJC_SELECTOR_REFERENCES_.2, align 8, !invariant.load !9
  %8 = tail call i8* bitcast (i8* (i8*, i8*, ...)* @objc_msgSend to i8* (i8*, i8*)*)(i8* %6, i8* %7), !clang.arc.no_objc_arc_exceptions !9
  call void @objc_release(i8* %8) #4, !clang.imprecise_release !9
  tail call void @objc_autoreleasePoolPop(i8* %3) #4, !clang.arc.no_objc_arc_exceptions !9
  ret i32 0
}

attributes #0 = { ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nonlazybind }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

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
