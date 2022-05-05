//
//  RXAFURLSessionManagerPrivateDefine.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/23.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFURLSessionManagerPrivateDefine.h"



#ifndef NSFoundationVersionNumber_iOS_8_0
#define NSFoundationVersionNumber_With_Fixed_5871104061079552_bug 1140.11
#else
#define NSFoundationVersionNumber_With_Fixed_5871104061079552_bug NSFoundationVersionNumber_iOS_8_0
#endif

 dispatch_queue_t rx_url_session_manager_creation_queue() {
    static dispatch_queue_t rx_af_url_session_manager_creation_queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rx_af_url_session_manager_creation_queue = dispatch_queue_create("com.alamofire.networking.session.manager.creation", DISPATCH_QUEUE_SERIAL);
    });
    
    return rx_af_url_session_manager_creation_queue;
}

 void rx_url_session_manager_create_task_safely(dispatch_block_t block) {
    if (NSFoundationVersionNumber < NSFoundationVersionNumber_With_Fixed_5871104061079552_bug) {
        // Fix of bug
        // Open Radar:http://openradar.appspot.com/radar?id=5871104061079552 (status: Fixed in iOS8)
        // Issue about:https://github.com/AFNetworking/AFNetworking/issues/2093
        dispatch_sync(rx_url_session_manager_creation_queue(), block);
    } else {
        block();
    }
}

 dispatch_queue_t rx_url_session_manager_processing_queue() {
    static dispatch_queue_t rx_af_url_session_manager_processing_queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rx_af_url_session_manager_processing_queue = dispatch_queue_create("com.alamofire.networking.session.manager.processing", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return rx_af_url_session_manager_processing_queue;
}

 dispatch_group_t rx_url_session_manager_completion_group() {
    static dispatch_group_t rx_af_url_session_manager_completion_group;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rx_af_url_session_manager_completion_group = dispatch_group_create();
    });
    
    return rx_af_url_session_manager_completion_group;
}














