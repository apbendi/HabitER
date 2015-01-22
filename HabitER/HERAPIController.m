//
//  HERAPIController.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "HERAPIController.h"
#import "HERAuthData.h"
#import "HERTask.h"
#import "HERTasksViewModel.h"

@implementation HERAPIController

- (void)fetchTasksWithCompletion:(HERAPITasksCompletionBlock)block
{
    // blows up in debug build
    NSParameterAssert(block);

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:HABITRPG_USER_ID forHTTPHeaderField:@"x-api-user"];
    [manager.requestSerializer setValue:HABITRPG_API_TOKEN forHTTPHeaderField:@"x-api-key"];


    [manager GET:@"https://habitrpg.com/api/v2/user/tasks" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        // TODO: checkout RXCollections

        NSMutableArray *tasks = [NSMutableArray array];

        for (NSDictionary *dictionary in responseObject) {
            HERTask *task = [HERTask taskWithJSON:dictionary];
            [tasks addObject:task];
        }


        block([tasks copy]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
