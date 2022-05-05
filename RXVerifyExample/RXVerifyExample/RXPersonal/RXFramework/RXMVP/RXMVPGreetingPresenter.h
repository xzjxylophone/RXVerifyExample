//
//  RXMVPGreetingPresenter.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RXMVPPerson;

@protocol GreetingViewProtocol
- (void)setGreeting:(NSString *)greeting;
@end

@protocol GreetingViewPresenterProtocol

- (void)initlization:(id<GreetingViewProtocol>)greetingViewProtocol person:(RXMVPPerson *)person;
- (void)showGreeting;

@end


@interface RXMVPGreetingPresenter : NSObject <GreetingViewPresenterProtocol>

@property (nonatomic, weak) id<GreetingViewProtocol> greetingViewProtocol;

@property (nonatomic, strong) RXMVPPerson *person;



@end
