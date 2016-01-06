//
// VIPERViewTests.m
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "VIPERView.h"
#import "VIPERPresenter.h"

@interface VIPERViewTests : XCTestCase

@property (nonatomic, strong) VIPERView *view;
@property (nonatomic, strong) id presenter;

@end

@implementation VIPERViewTests

- (void)setUp
{
    [super setUp];

    self.view = [[[NSBundle mainBundle] loadNibNamed:@"VIPER" owner:nil options:nil] firstObject];
    self.presenter = [OCMockObject niceMockForClass:[VIPERPresenter class]];

    [UIApplication sharedApplication].keyWindow.rootViewController = self.view;
    self.view.presenter = self.presenter;
}

- (void)tearDown
{
    [self.presenter verify];

    [super tearDown];
}

@end