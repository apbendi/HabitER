//
//  HERTasksViewModelSpec.m
//  HabitER
//
//  Created by Ben DiFrancesco on 1/22/15.
//  Copyright (c) 2015 Ben DiFrancesco. All rights reserved.
//

#define EXP_SHORTHAND
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "HERTasksViewModel.h"


SpecBegin(HERTasksViewModel)

describe(@"HERTasksViewModel", ^{

    describe(@"nubmerOfTasks", ^{
        it(@"returns 0", ^{
            HERTasksViewModel *sut = [[HERTasksViewModel alloc] initWithTasks:@[@"Test1", @"Test2"]];
            expect(sut.numberOfTasks).to.equal(2);
        });
    });
});

SpecEnd
