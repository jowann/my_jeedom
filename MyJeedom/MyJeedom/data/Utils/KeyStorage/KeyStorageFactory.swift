//
//  KeyStorageFactory.swift
//  Frizbiz
//
//  Created by johann Vandromme on 19/09/2015.
//  Copyright © 2015 Frizbiz. All rights reserved.
//

import Foundation
import KeychainSwift

class KeyStorageFactory{
    class func userDefaultsStorage(_ identifier:String)->KeyStorage{
        let storage = AutoSyncStorage(storage:FromDataStorage(dataStorage: UserDefaultsStorage(suiteName: identifier)))
        return storage
    }
    class func keyChainStorage(_ identifier: String)->KeyStorage{
        let keyChainStorage = KeyChainStorage()
        let storage = DrawerStorage(nextStorage: keyChainStorage, identifier: identifier)
        return AutoSyncStorage(storage:storage)
    }
    class func ramStorage()->KeyStorage{
        let storage = RamStorage()
        return storage
    }
}
