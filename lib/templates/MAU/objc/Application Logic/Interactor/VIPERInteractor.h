//
// VIPERInteractor.h
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIPERProtocols.h"


@interface VIPERInteractor : NSObject <VIPERInteractorInputProtocol>

@property (nonatomic, weak) id <VIPERInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <VIPERAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <VIPERLocalDataManagerInputProtocol> localDataManager;

@end