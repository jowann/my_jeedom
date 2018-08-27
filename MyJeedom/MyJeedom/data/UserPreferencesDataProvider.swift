//
//  UserPreferencesDataProvider.swift
//  MyJeedom
//
//  Created by Johann on 15/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift



class UserPreferencesDataProvider{
    private let _storage:UserPreferencesStorage
    

    init(storage:UserPreferencesStorage){
        _storage = storage
        
    }
    
    var userPreferences:Observable<UserPreferencesDto?>{
        get{
            return Observable.just(_storage.userPreferences)
        }
    }
    func set(userPreferences:UserPreferencesDto?)->Observable<Void>{
        _storage.userPreferences = userPreferences
        return Observable.just(())
    }
    
}
