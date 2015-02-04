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
#import "HERTask.h"

@interface HERTasksController ()
@property (nonatomic, readwrite) HERTasksViewModel *viewModel;
@property (nonatomic) NSArray *tasks;
@end

@implementation HERTasksController

- (void)loadTasks
{
    [[HERAPIController new]fetchTasksWithCompletion:^(NSArray *tasks) {
        self.tasks = tasks;
    }];
}

- (void)markTaskCompleteAtIndexPath:(NSIndexPath *)indexPath
{
    [[HERAPIController new] completeTask:self.tasks[indexPath.row] withCompletion:^(HERTask *task) {

        NSMutableArray *mutableTasks = [NSMutableArray arrayWithArray:self.tasks];

        [mutableTasks replaceObjectAtIndex:indexPath.row withObject:task];
        self.tasks = [mutableTasks copy];
    }];
}

// Alternatively: call an explicit update method
- (void)setTasks:(NSArray *)tasks
{
    _tasks = tasks;
    self.viewModel = [[HERTasksViewModel alloc] initWithTasks:tasks];
}

@end
