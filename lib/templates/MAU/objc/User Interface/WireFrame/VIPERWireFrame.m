//
// VIPERWireFrame.m
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

#import "VIPERWireFrame.h"

@implementation VIPERWireFrame

+ (void)presentVIPERModuleFrom:(UIViewController*)fromViewController
{
    // Generating module components
    id <VIPERViewProtocol> view = [[VIPERView alloc] init];
    id <VIPERPresenterProtocol, VIPERInteractorOutputProtocol> presenter = [VIPERPresenter new];
    id <VIPERInteractorInputProtocol> interactor = [VIPERInteractor new];
    id <VIPERAPIDataManagerInputProtocol> APIDataManager = [VIPERAPIDataManager new];
    id <VIPERLocalDataManagerInputProtocol> localDataManager = [VIPERLocalDataManager new];
    id <VIPERWireFrameProtocol> wireFrame= [VIPERWireFrame new];
    
    // Connecting
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    interactor.APIDataManager = APIDataManager;
    interactor.localDataManager = localDataManager;
    
    //TODO: - New view controller presentation (present, push, pop, .. )
}

@end
