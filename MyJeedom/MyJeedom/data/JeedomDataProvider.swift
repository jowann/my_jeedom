//
//  JeedomDataProvider.swift
//  MyJeedom
//
//  Created by Johann on 16/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift

class JeedomDataProvider{
    private let _userPreferencesDataProvider:UserPreferencesDataProvider
    init(userPreferencesDataProvider:UserPreferencesDataProvider){
        _userPreferencesDataProvider = userPreferencesDataProvider
    }
    
    func retrieveAllData()->Observable<[ObjectDto]>{
        return _userPreferencesDataProvider.userPreferences
            .errorOnNil()
            .flatMap { (userPreferencesDto)->Observable<[ObjectDto]>  in
            return RetrieveAllDataUseCase(userPreferences: userPreferencesDto).perform()
            
        }
    }
    
    func performCommand(commandId:String)->Observable<Void>{
        return userPreferencesDataProvider.userPreferences
            .errorOnNil()
            .flatMap { (userPreferencesDto)  in
                return PerformCommandUseCase(userPreferences: userPreferencesDto, commandId:commandId).perform()
            }
        
    }
}
