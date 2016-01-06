//
// VIPERPresenterTests.m
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "VIPERPresenter.h"
#import "VIPERWireFrame.h"
#import "VIPERView.h"
#import "VIPERInteractor.h"

@interface VIPERPresenterTests : XCTestCase

@property (nonatomic, strong) VIPERPresenter *presenter;
@property (nonatomic, strong) id wireframe;
@property (nonatomic, strong) id view;
@property (nonatomic, strong) id interactor;

@end

@implementation VIPERPresenterTests

- (void)setUp
{
    [super setUp];

    self.presenter = [[VIPERPresenter alloc] init];
    self.wireframe = [OCMockObject niceMockForClass:[VIPERWireFrame class]];
    self.view = [OCMockObject niceMockForClass:[VIPERView class]];
    self.interactor = [OCMockObject niceMockForClass:[VIPERInteractor class]];

    self.presenter.wireFrame = self.wireframe;
    self.presenter.view = self.view;
    self.presenter.interactor = self.interactor;

    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown
{
    [self.wireframe verify];
    [self.view verify];
    [self.interactor verify];

    [MagicalRecord cleanUp];

    [super tearDown];
}

@end