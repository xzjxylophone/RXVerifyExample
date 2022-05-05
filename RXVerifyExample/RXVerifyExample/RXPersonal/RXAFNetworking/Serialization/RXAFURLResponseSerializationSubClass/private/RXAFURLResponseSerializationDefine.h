//
//  RXAFURLResponseSerializationDefine.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/15.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>


id RXAFJSONObjectByRemovingKeysWithNullValues(id JSONObject, NSJSONReadingOptions readingOptions);


NSError * RXAFErrorWithUnderlyingError(NSError *error, NSError *underlyingError);
BOOL RXAFErrorOrUnderlyingErrorHasCodeInDomain(NSError *error, NSInteger code, NSString *domain);

