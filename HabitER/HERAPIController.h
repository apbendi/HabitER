//
//  HERAPIController.h
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HERAPITasksCompletionBlock)(NSArray *tasks);

@interface HERAPIController : NSObject

- (void)fetchTasksWithCompletion:(HERAPITasksCompletionBlock)block;

@end
