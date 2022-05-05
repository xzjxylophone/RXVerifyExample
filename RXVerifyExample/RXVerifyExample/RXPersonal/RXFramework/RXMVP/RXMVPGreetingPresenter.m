//
//  RXMVPGreetingPresenter.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMVPGreetingPresenter.h"
#import "RXMVPPerson.h"
@implementation RXMVPGreetingPresenter


#pragma mark - GreetingViewPresenterProtocol

- (void)initlization:(id<GreetingViewProtocol>)greetingViewProtocol person:(RXMVPPerson *)person
{
    self.greetingViewProtocol = greetingViewProtocol;
    self.person = person;
}
- (void)showGreeting
{
    NSString *greeting = [NSString stringWithFormat:@"Hello %@ %@", self.person.firstName, self.person.lastName];
    [self.greetingViewProtocol setGreeting:greeting];
}
@end
