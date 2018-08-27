//
//  UserPreferencesViewModel.swift
//  MyJeedom
//
//  Created by Johann on 15/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift

class UserPreferencesViewModel{
    private let disposeBag = DisposeBag()
    
    func bindValidateClicked(to:Observable<Void>)  {
        to.subscribe(_validateClicked).disposed(by: disposeBag)
    }
    
    func bindIpDidChange(to:Observable<String?>){
        to.subscribe(_ipDidChange).disposed(by: disposeBag)
    }
    func bindApiKeyDidChange(to:Observable<String?>){
        to.subscribe(_apiKeyDidChange).disposed(by: disposeBag)
    }
    
    private let _validateClicked = PublishSubject<Void>()
    private let _ipDidChange = BehaviorSubject<String?>(value: nil)
    private let _apiKeyDidChange = BehaviorSubject<String?>(value: nil)
    
    init(){
        
        let observable = Observable.combineLatest(_ipDidChange,_apiKeyDidChange).map { (ip, apikey) -> UserPreferencesDto in
            guard let ip = ip, let apiKey = apikey else {
                throw CustomError()
            }
            return UserPreferencesDto(jeedomIp: ip, apiKey: apiKey)
        }
        
        _validateClicked.flatMap({ () in
            return observable
        }).flatMap { (userPreferencesDto) in
            return userPreferencesDataProvider.set(userPreferences: userPreferencesDto)
            }.subscribe{}.disposed(by: disposeBag)
    }
}
