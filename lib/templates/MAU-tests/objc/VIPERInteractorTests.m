//
// VIPERInteractorTests.m
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "VIPERInteractor.h"
#import "VIPERLocalDataManager.h"
#import "VIPERAPIDataManager.h"

@interface VIPERInteractorTests : XCTestCase

@property (nonatomic, strong) VIPERInteractor *interactor;
@property (nonatomic, strong) id presenter;
@property (nonatomic, strong) id dataManager;
@property (nonatomic, strong) id apiManager;

@end

@implementation VIPERInteractorTests

- (void)setUp
{
    [super setUp];

    self.dataManager = [OCMockObject niceMockForClass:[VIPERLocalDataManager class]];
    self.apiManager = [OCMockObject niceMockForClass:[VIPERAPIDataManager class]];

    self.interactor = [[VIPERInteractor alloc] init];
    self.presenter = [OCMockObject niceMockForProtocol:@protocol(VIPERInteractorOutputProtocol)];
    
    self.interactor.presenter = self.presenter;
    self.interactor.localDataManager = self.dataManager;
    self.interactor.APIDataManager = self.apiManager;


    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown
{
    [self.dataManager verify];
    [self.apiManager verify];
    [self.presenter verify];

    [MagicalRecord cleanUp];

    [super tearDown];
}

@end