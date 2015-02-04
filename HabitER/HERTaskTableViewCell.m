//
//  HERTaskTableViewCell.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import "HERTaskTableViewCell.h"
#import "HERTaskCellViewModel.h"

@interface HERTaskTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *taskTextLabel;
@property (weak, nonatomic) IBOutlet UIView *typeIndicatorView;
@end

@implementation HERTaskTableViewCell


- (void)configureWithViewModel:(HERTaskCellViewModel *)viewModel
{
    self.taskTextLabel.text = viewModel.text;
    self.typeIndicatorView.backgroundColor = viewModel.typeColor;
}

@end
