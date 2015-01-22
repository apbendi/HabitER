//
//  ViewController.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/19/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "HERViewController.h"
#import "HERTasksController.h"

@interface HERViewController ()
@property NSArray *loadedData;
@property (nonatomic) HERTasksController *tasksController;
@end

@implementation HERViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    if (self) {
        self.tasksController = [[HERTasksController alloc] init];
    }

    return nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)loadData
{

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.loadedData) {
        return [self.loadedData count];
    }

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TaskCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    // Configure the cell...
    if (self.loadedData) {
        cell.textLabel.text = [[self.loadedData objectAtIndex:indexPath.row]  objectForKey:@"text"];
        cell.detailTextLabel.text = [[self.loadedData objectAtIndex:indexPath.row]  objectForKey:@"type"];
    } else {
        cell.textLabel.text = @"Loading...";
        cell.detailTextLabel.text = @"Please Stand-By";
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected: %li", indexPath.row);
}

@end
