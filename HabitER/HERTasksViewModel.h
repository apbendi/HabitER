//
//  HERTasksViewModel.h
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HERTaskCellViewModel;

@interface HERTasksViewModel : NSObject

- (id)initWithTasks:(NSArray *)tasks;
- (HERTaskCellViewModel *)taskCellViewModelForIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, readonly) NSInteger numberOfTasks;

@end
