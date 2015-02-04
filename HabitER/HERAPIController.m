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

@interface HERAPIController ()
@property (nonatomic) AFHTTPRequestOperationManager *manager;
@end

@implementation HERAPIController

- (id)init
{
    self = [super init];
    if (!self) return nil;

    self.manager = [AFHTTPRequestOperationManager manager];

    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [self.manager.requestSerializer setValue:HABITRPG_USER_ID forHTTPHeaderField:@"x-api-user"];
    [self.manager.requestSerializer setValue:HABITRPG_API_TOKEN forHTTPHeaderField:@"x-api-key"];

    return self;
}

- (void)fetchTasksWithCompletion:(HERAPITasksCompletionBlock)block
{
    // blows up in debug build
    NSParameterAssert(block);

    [self.manager GET:@"https://habitrpg.com/api/v2/user/tasks" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
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

- (void)completeTask:(HERTask *)task withCompletion:(HERAPITaskCompletionBlock)block
{
    NSString *path = [NSString stringWithFormat:@"https://habitrpg.com/api/v2/user/tasks/%@", task.ID];
    NSDictionary *parameters = @{ @"completed": [NSNumber numberWithBool:YES] };

    [self.manager PUT:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        HERTask *task = [HERTask taskWithJSON:responseObject];
        block(task);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
