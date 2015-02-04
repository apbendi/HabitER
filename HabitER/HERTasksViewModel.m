//
//  HERTasksViewModel.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import "HERTasksViewModel.h"
#import "HERTaskCellViewModel.h"

@interface HERTasksViewModel()
// copy makes sure the array passed in won't change under me if mutable
@property (nonatomic, copy) NSArray *tasks;
@end

@implementation HERTasksViewModel

- (id)initWithTasks:(NSArray *)tasks
{
    self = [super init];

    if (self) {
        self.tasks = tasks;
        return self;
    }

    return nil;
}

- (NSInteger)numberOfTasks
{
    return [self.tasks count];
}

- (HERTaskCellViewModel *)taskCellViewModelForIndexPath:(NSIndexPath *)indexPath
{
    HERTask *task = [self.tasks objectAtIndex:indexPath.row];
    return [[HERTaskCellViewModel alloc] initWithTask:task];
}

@end
