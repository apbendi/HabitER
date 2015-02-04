//
//  HERAPIController.h
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HERTask;

typedef void (^HERAPITasksCompletionBlock)(NSArray *tasks);
typedef void (^HERAPITaskCompletionBlock)(HERTask *task);

@interface HERAPIController : NSObject

- (void)fetchTasksWithCompletion:(HERAPITasksCompletionBlock)block;
- (void)completeTask:(HERTask *)task withCompletion:(HERAPITaskCompletionBlock)block;

@end
