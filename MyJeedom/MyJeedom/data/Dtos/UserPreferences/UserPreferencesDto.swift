//
//  UserPreferencesDto.swift
//  MyJeedom
//
//  Created by Johann on 14/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation

class UserPreferencesDto: Codable{
    let jeedomIp:String
    let apiKey:String
    
    init(jeedomIp:String, apiKey:String){
        self.jeedomIp = jeedomIp
        self.apiKey = apiKey
    }
}
