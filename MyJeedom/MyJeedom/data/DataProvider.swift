//
//  DataProvider.swift
//  MyJeedom
//
//  Created by Johann on 14/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift

private let dataProvider = ((UIApplication.shared.delegate) as! AppDelegate)._dataProvider
let userPreferencesDataProvider = dataProvider.userPreferencesDataProvider
var jeedomDataProvider = dataProvider.jeedomDataProvider

//lazy var userPreferencesDataProvider = data
class DataProvider{
    private lazy var userPreferencesKeyChain = KeyStorageFactory.keyChainStorage("userpreferences")
    private lazy var userPreferencesStorage = UserPreferencesStorage(keyStorage:userPreferencesKeyChain)
    
    var userPreferencesDataProvider:UserPreferencesDataProvider{
        return UserPreferencesDataProvider(storage: userPreferencesStorage)
    }
    var jeedomDataProvider:JeedomDataProvider{
        return JeedomDataProvider(userPreferencesDataProvider:userPreferencesDataProvider)
    }
    
}
