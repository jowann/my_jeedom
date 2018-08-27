//
//  UserPreferencesStorage.swift
//  MyJeedom
//
//  Created by Johann on 14/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation

class UserPreferencesStorage{
    private let _keyStorage:KeyStorage
    init(keyStorage:KeyStorage){
        _keyStorage = keyStorage
    }
    
    var userPreferences:UserPreferencesDto?{
        get{
            let userPreferencesDto: UserPreferencesDto? = _keyStorage.decode(key:"userPreferences")
            return userPreferencesDto
        }set{
            _keyStorage.encode(newValue, forKey: "userPreferences")
        }
    }
    
}
