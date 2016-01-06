//
// VIPERWireFrame.h
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIPERProtocols.h"
#import "VIPERView.h"
#import "VIPERLocalDataManager.h"
#import "VIPERAPIDataManager.h"
#import "VIPERInteractor.h"
#import "VIPERPresenter.h"
#import "VIPERWireframe.h"
#import <UIKit/UIKit.h>

@interface VIPERWireFrame : NSObject <VIPERWireFrameProtocol>
@property (nonatomic, strong) VIPERView *view;

@end
