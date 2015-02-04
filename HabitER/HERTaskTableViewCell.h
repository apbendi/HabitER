//
//  HERTaskTableViewCell.h
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HERTaskCellViewModel;

@interface HERTaskTableViewCell : UITableViewCell

- (void)configureWithViewModel:(HERTaskCellViewModel *)viewModel;

@end
