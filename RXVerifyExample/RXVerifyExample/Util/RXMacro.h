//
//  RXMacro.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/9/7.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//



#define RXWarningIgnore_Warc_performSelector_leaks(code)                        \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")     \
code;                                                                   \
_Pragma("clang diagnostic pop")                                         \


#define RXWarningIgnore_Wdeprecated_declarations(code)                        \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"")     \
code;                                                                   \
_Pragma("clang diagnostic pop")                                         \






