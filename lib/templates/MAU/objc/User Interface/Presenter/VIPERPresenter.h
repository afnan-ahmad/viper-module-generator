//
// VIPERPresenter.h
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIPERProtocols.h"

@class VIPERWireFrame;

@interface VIPERPresenter : NSObject <VIPERPresenterProtocol, VIPERInteractorOutputProtocol>

@property (nonatomic, weak) id <VIPERViewProtocol> view;
@property (nonatomic, strong) id <VIPERInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <VIPERWireFrameProtocol> wireFrame;

@end
