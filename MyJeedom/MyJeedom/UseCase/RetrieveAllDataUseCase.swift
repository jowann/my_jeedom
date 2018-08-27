//
//  RetrieveAllDataUseCase.swift
//  MyJeedom
//
//  Created by Johann on 16/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

class RetrieveAllDataUseCase:JeedomServiceUseCase<[ObjectDto]>{
    init(userPreferences: UserPreferencesDto) {
        super.init(userPreferences: userPreferences, jeedomtype: "fullData")
    }
}
