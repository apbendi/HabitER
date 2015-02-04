//
//  HERTasksController.h
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HERTasksViewModel;

@interface HERTasksController : NSObject

@property (nonatomic, readonly) HERTasksViewModel *viewModel;
- (void)loadTasks;
- (void)markTaskCompleteAtIndexPath:(NSIndexPath *)indexPath;

@end
