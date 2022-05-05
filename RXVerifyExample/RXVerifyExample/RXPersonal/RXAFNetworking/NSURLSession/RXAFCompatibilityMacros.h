//
//  RXAFCompatibilityMacros.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/22.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#ifndef RXAFCompatibilityMacros_h
#define RXAFCompatibilityMacros_h

#ifdef API_UNAVAILABLE
#define RXAF_API_UNAVAILABLE(x) API_UNAVAILABLE(x)
#else
#define RXAF_API_UNAVAILABLE(x)
#endif // API_UNAVAILABLE

#if __has_warning("-Wunguarded-availability-new")
#define RXAF_CAN_USE_AT_AVAILABLE 1
#else
#define RXAF_CAN_USE_AT_AVAILABLE 0
#endif

#endif /* RXAFCompatibilityMacros_h */
