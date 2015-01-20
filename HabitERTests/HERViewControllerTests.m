//
//  HERViewControllerTests.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/19/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "HERViewController.h"

@interface HERViewController (Tests)
- (void)loadData;
@end

@interface HERViewControllerTests : XCTestCase
@property HERViewController *vc;
@property id vcMock;
@end

@implementation HERViewControllerTests

- (void)setUp {
    [super setUp];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vc = [storyboard instantiateViewControllerWithIdentifier:@"root"];

    // Problem - performs network request when executing this statement
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];

    self.vcMock = OCMPartialMock(self.vc);
}

- (void)tearDown {
    [super tearDown];
}

- (void)testViewDidLoad
{
    OCMExpect([self.vcMock loadData]);

    [self.vc viewDidLoad];

    OCMVerifyAll(self.vcMock);
}

@end
