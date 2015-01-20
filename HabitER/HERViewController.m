//
//  ViewController.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/19/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "HERViewController.h"
#import "HERAuthData.h"

@interface HERViewController ()
@property NSArray *loadedData;
@end

@implementation HERViewController

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
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:HABITRPG_USER_ID forHTTPHeaderField:@"x-api-user"];
    [manager.requestSerializer setValue:HABITRPG_API_TOKEN forHTTPHeaderField:@"x-api-key"];


    [manager GET:@"https://habitrpg.com/api/v2/user/tasks" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        //NSLog(@"JSON: %@", responseObject);
        //NSLog(@"First: %@", responseObject[0][@"text"]);
        self.loadedData = responseObject;
        NSLog(@"Loaded Data: %@", self.loadedData);

        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error loading: %@", error);
    }];
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
