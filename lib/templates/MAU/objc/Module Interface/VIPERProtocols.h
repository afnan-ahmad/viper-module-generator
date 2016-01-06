//
// VIPERProtocols.h
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol VIPERInteractorOutputProtocol;
@protocol VIPERInteractorInputProtocol;
@protocol VIPERViewProtocol;
@protocol VIPERPresenterProtocol;
@protocol VIPERLocalDataManagerInputProtocol;
@protocol VIPERAPIDataManagerInputProtocol;

@class VIPERView;
@class VIPERWireFrame;

@protocol VIPERViewProtocol
@required
@property (nonatomic, strong) id <VIPERPresenterProtocol> presenter;
/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */
@end

@protocol VIPERWireFrameProtocol
@required
@property (nonatomic, strong) VIPERView *view;
+ (void)presentVIPERModuleFrom:(id)fromView;
/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@end

@protocol VIPERPresenterProtocol
@required
@property (nonatomic, weak) id <VIPERViewProtocol> view;
@property (nonatomic, strong) id <VIPERInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <VIPERWireFrameProtocol> wireFrame;
/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
@end

@protocol VIPERInteractorOutputProtocol
/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
@end

@protocol VIPERInteractorInputProtocol
@required
@property (nonatomic, weak) id <VIPERInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <VIPERAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <VIPERLocalDataManagerInputProtocol> localDataManager;
/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
@end


@protocol VIPERDataManagerInputProtocol
/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
@end

@protocol VIPERAPIDataManagerInputProtocol <VIPERDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
 */
@end

@protocol VIPERLocalDataManagerInputProtocol <VIPERDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> LOCLDATAMANAGER
 */
@end


