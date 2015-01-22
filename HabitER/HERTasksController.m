//
//  HERTasksController.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import "HERTasksController.h"
#import "HERAPIController.h"
#import "HERTasksViewModel.h"

@interface HERTasksController ()
@property (nonatomic, readwrite) HERTasksViewModel *viewModel;
@end

@implementation HERTasksController

- (void)loadTasks
{
    [[HERAPIController new]fetchTasksWithCompletion:^(NSArray *tasks) {
        self.viewModel = [[HERTasksViewModel alloc] initWithTasks:tasks];
    }];
}

@end
