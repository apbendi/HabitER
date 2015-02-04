//
//  HERTask.h
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, HERTaskType) {
    HERTaskTypeHabit,
    HERTaskTypeDaily,
    HERTaskTypeTodo
};


@interface HERTask : NSObject


@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, readonly) HERTaskType type;
@property (nonatomic, readonly) NSString *ID;
@property (nonatomic, readonly) BOOL canUpvote;
@property (nonatomic, readonly) BOOL canDownvote;
@property (nonatomic, readonly) BOOL canComplete;
@property (nonatomic, readonly) BOOL isCompleted;


+ (HERTask *)taskWithJSON:(NSDictionary *)json;

@end
