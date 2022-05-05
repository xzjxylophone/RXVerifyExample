//
//  RXMVPGreetingViewController.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXMVPGreetingPresenter.h"

@interface RXMVPGreetingViewController : UIViewController <GreetingViewProtocol>


@property (nonatomic, strong) id<GreetingViewPresenterProtocol> greetingPresenter;


@end
