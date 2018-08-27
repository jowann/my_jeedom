//
//  JeedomServiceUseCase.swift
//  MyJeedom
//
//  Created by Johann on 16/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire



class JeedomServiceUseCase<T:Decodable>:UseCase{
    private let _userPreferences:UserPreferencesDto
    private let _disposeBag = DisposeBag()
    private let _params:[String:String]
    
    init(userPreferences:UserPreferencesDto, jeedomtype:String, parameters:[String:String] = [String:String]()){
        _userPreferences = userPreferences
        var params = parameters
        params["type"] = jeedomtype
        _params = params
    }
    func perform() -> Observable<T> {
        
        var url = "\(_userPreferences.jeedomIp)/core/api/jeeApi.php?apikey=\(_userPreferences.apiKey)"
        url.addQueryParameters(_params)
        let observable = RxAlamofire.requestData(.get, url)
            .debug()
            .map { (response, data) -> T in
            return try JSONDecoder().decode(T.self, from: data)
        }
        return observable
    
    }
    
}

class JeedomServiceUseCaseVoid:UseCase{
    private let _userPreferences:UserPreferencesDto
    private let _disposeBag = DisposeBag()
    private let _params:[String:String]
    
    init(userPreferences:UserPreferencesDto, jeedomtype:String, parameters:[String:String] = [String:String]()){
        _userPreferences = userPreferences
        var params = parameters
        params["type"] = jeedomtype
        _params = params
    }
    func perform() -> Observable<Void> {
        
        var url = "\(_userPreferences.jeedomIp)/core/api/jeeApi.php?apikey=\(_userPreferences.apiKey)"
        url.addQueryParameters(_params)
        let observable = RxAlamofire.requestData(.get, url)
            .debug()
            .map { (response, data) -> Void in
               
                if let string = String(data: data, encoding: String.Encoding.utf8){
                    print(string)
                }
                
                return ()
        }
        return observable
        
    }
    
}
