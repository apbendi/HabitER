//
//  ViewController.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/19/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "HERViewController.h"
#import "HERAuthData.h"

@interface HERViewController ()

@end

@implementation HERViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)loadData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:HABITRPG_USER_ID forHTTPHeaderField:@"x-api-user"];
    [manager.requestSerializer setValue:HABITRPG_API_TOKEN forHTTPHeaderField:@"x-api-key"];


    [manager GET:@"https://habitrpg.com/api/v2/user/tasks" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error loading: %@", error);
    }];
}

@end
