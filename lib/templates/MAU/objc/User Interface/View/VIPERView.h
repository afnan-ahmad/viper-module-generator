//
// VIPERView.h
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VIPERProtocols.h"

@interface VIPERView : UIViewController <VIPERViewProtocol>

@property (nonatomic, strong) id <VIPERPresenterProtocol> presenter;

@end
