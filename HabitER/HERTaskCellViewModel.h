//
//  HERTaskCellViewModel.h
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HERTaskCellActionBlock)(UITableViewRowAction *action, NSIndexPath *indexPath);
@class HERTask;

@interface HERTaskCellViewModel : NSObject

- (id)initWithTask:(HERTask *)task;

@property (nonatomic, readonly) NSString *text;
@property (nonatomic, readonly) UIColor *typeColor;

- (UITableViewRowAction *) markCompleteActionWithCompletionBlock:(HERTaskCellActionBlock)block;
- (UITableViewRowAction *) upvoteActionWithCompletionBlock:(HERTaskCellActionBlock)block;
- (UITableViewRowAction *) downvoteActionWithCompletionBlock:(HERTaskCellActionBlock)block;

@end
