//
//  KeyChainStorage.swift
//  Frizbiz
//
//  Created by johann Vandromme on 19/09/2015.
//  Copyright © 2015 Frizbiz. All rights reserved.
//

import Foundation
import KeychainSwift


class KeyChainStorage : DataStorage{
    let _keyChain : KeychainSwift
    
    init (){
        _keyChain = KeychainSwift()
    }
    func setData(_ value: Data!, forKey: String) {
        if let value = value {
            _keyChain.set(value, forKey: forKey)
        } else {
            _keyChain.delete(forKey)
        }
        
    }
    
    func dataForKey(_ key: String) -> Data? {
        return _keyChain.getData(key)
    }
    
    var mustSynchronize : Bool{
        get{
            return false
        }
    }
    func synchronize(){}
    
    func resetStorage() {
        _keyChain.clear()
    }
    
}
