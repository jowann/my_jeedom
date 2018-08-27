//
//  PerformCommandUseCase.swift
//  MyJeedom
//
//  Created by Johann on 26/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation

class PerformCommandUseCase:JeedomServiceUseCaseVoid{
    init(userPreferences: UserPreferencesDto, commandId:String) {
        super.init(userPreferences: userPreferences, jeedomtype: "cmd", parameters:["id":commandId])
    }
    
}
