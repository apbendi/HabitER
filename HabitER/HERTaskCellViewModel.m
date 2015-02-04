//
//  HERTaskCellViewModel.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import "HERTaskCellViewModel.h"
#import "HERTask.h"

@interface HERTaskCellViewModel ()
@property (nonatomic) HERTask *task;
@end

@implementation HERTaskCellViewModel

- (id)initWithTask:(HERTask *)task
{
    self = [super init];

    if (!self) return nil;

    self.task = task;

    return self;
}

- (NSString *)text
{
    return self.task.text;
}

- (UIColor *)typeColor
{
    switch (self.task.type) {
        case HERTaskTypeHabit:
            return [UIColor greenColor];
        case HERTaskTypeDaily:
            return [UIColor blueColor];
        case HERTaskTypeTodo:
            return [UIColor orangeColor];
    }
}

- (UITableViewRowAction *) markCompleteActionWithCompletionBlock:(HERTaskCellActionBlock)block
{
    if (!self.task.canComplete) return nil;

    NSString *title;
    if (self.task.isCompleted) {
        title = @"☑️";
    } else {
        title = @"◽️";
    }

    return [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:title handler:block];
}

- (UITableViewRowAction *) upvoteActionWithCompletionBlock:(HERTaskCellActionBlock)block;
{
    if (!self.task.canUpvote) return nil;
    return [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"👍" handler:block];
}

- (UITableViewRowAction *) downvoteActionWithCompletionBlock:(HERTaskCellActionBlock)block;
{
    if (!self.task.canDownvote) return nil;
    return [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"👎" handler:block];
}

@end
