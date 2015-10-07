//
// VIPERInteractor.swift
// PROJECT
//
// Created by AUTHOR on DATE.
// Copyright © YEAR COMPANY. All rights reserved.
//

import Foundation

class VIPERInteractor: VIPERInteractorInputProtocol
{
    weak var presenter: VIPERInteractorOutputProtocol?
    var APIDataManager: VIPERAPIDataManagerInputProtocol?
    var localDatamanager: VIPERLocalDataManagerInputProtocol?
    
    init() {}
}