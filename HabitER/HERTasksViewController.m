//
//  ViewController.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/19/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "HERTasksViewController.h"
#import "HERTasksController.h"
#import "HERTasksViewModel.h"
#import "HERTaskTableViewCell.h"
#import "HERTaskCellViewModel.h"

@interface HERTasksViewController ()
@property (nonatomic) HERTasksController *controller;
@end

@implementation HERTasksViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (!self) return nil;

    self.controller = [[HERTasksController alloc] init];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.controller loadTasks];

    [self.KVOController observe:self.controller keyPath:@"viewModel" options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew) block:^(id observer, id object, NSDictionary *change) {

        [self.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.controller.viewModel.numberOfTasks;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TaskCell";
    HERTaskTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    [cell configureWithViewModel:[self.controller.viewModel taskCellViewModelForIndexPath:indexPath]];

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected: %li", indexPath.row);
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewRowAction *completeAction = [[self.controller.viewModel taskCellViewModelForIndexPath:indexPath] markCompleteActionWithCompletionBlock:^(UITableViewRowAction *action, NSIndexPath *indexPath) {

        [self.controller markTaskCompleteAtIndexPath:indexPath];
    }];

    UITableViewRowAction *upvoteAction = [[self.controller.viewModel taskCellViewModelForIndexPath:indexPath] upvoteActionWithCompletionBlock:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"Hello from upvote block");
    }];

    UITableViewRowAction *downvoteAction = [[self.controller.viewModel taskCellViewModelForIndexPath:indexPath] downvoteActionWithCompletionBlock:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"Hello from downpvote block");
    }];

    NSMutableArray *actions = [NSMutableArray array];

    if (completeAction) {
        [actions addObject:completeAction];
    }

    if (upvoteAction) {
        [actions addObject:upvoteAction];
    }

    if (downvoteAction) {
        [actions addObject:downvoteAction];
    }

    return [actions copy];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

}


@end
