//
//  UserDefaultsStorage.swift
//  Frizbiz
//
//  Created by johann Vandromme on 19/09/2015.
//  Copyright © 2015 Frizbiz. All rights reserved.
//

import Foundation

class UserDefaultsStorage : DataStorage{
    fileprivate let _userDefaults : UserDefaults
    
    
    init(suiteName:String){
        _userDefaults = UserDefaults(suiteName: suiteName)!
    }
    
    func setData(_ value:Data!, forKey:String){
        _userDefaults.set(value, forKey: forKey)
    }
    func dataForKey(_ key:String)->Data?{
        return _userDefaults.data(forKey: key)
    }
    
    var mustSynchronize : Bool{
        get{
            return true
        }
    }
    
    func synchronize(){
        _userDefaults.synchronize()
    }
    func resetStorage(){
        let defaultsDictionary = _userDefaults.dictionaryRepresentation()
        for key in defaultsDictionary.keys {
            _userDefaults.removeObject(forKey: key)
        }
    }
}
