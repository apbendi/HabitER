//
//  HERTask.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import "HERTask.h"

@interface HERTask ()
@property (nonatomic, copy, readwrite) NSString *text;
@property (nonatomic, readwrite) HERTaskType type;
@property (nonatomic, readwrite) NSString *ID;
@property (nonatomic, readwrite) BOOL canUpvote;
@property (nonatomic, readwrite) BOOL canDownvote;
@property (nonatomic, readwrite) BOOL canComplete;
@property (nonatomic, readwrite) BOOL isCompleted;
@end

@implementation HERTask

+ (HERTask *)taskWithJSON:(NSDictionary *)json
{
    HERTask *task = self.new;

    task.text = json[@"text"];
    task.type = [self typeWithString:json[@"type"]];
    task.ID = json[@"id"];
    task.canUpvote = [json.allKeys containsObject:@"up"] && [json[@"up"] boolValue];
    task.canDownvote = [json.allKeys containsObject:@"down"] && [json[@"down"] boolValue];
    task.canComplete = [json.allKeys containsObject:@"completed"];
    task.isCompleted = task.canComplete && [json[@"completed"] boolValue];

    return task;
}

+ (HERTaskType)typeWithString:(NSString *)string
{
    if ([string isEqualToString:@"habit"]) {
        return HERTaskTypeHabit;
    } else if ([string isEqualToString:@"daily"]) {
        return HERTaskTypeDaily;
    } else if ([string isEqualToString:@"todo"]) {
        return HERTaskTypeTodo;
    } else {
        return HERTaskTypeHabit;
    }
}

@end
