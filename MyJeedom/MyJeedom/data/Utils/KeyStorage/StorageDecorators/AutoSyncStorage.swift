//
//  AutoSyncStorage.swift
//  Frizbiz
//
//  Created by johann Vandromme on 19/09/2015.
//  Copyright © 2015 Frizbiz. All rights reserved.
//

import Foundation

class AutoSyncStorage : KeyStorage{
    
    
    fileprivate let _nextStorage: KeyStorage
    
    fileprivate var _syncNeeded : Bool{
        willSet(newValue){
            if _syncNeeded == false && newValue == true && _nextStorage.mustSynchronize{
                
                DispatchQueue.main.async(execute: { () -> Void in
                    self.synchronize()
                })
            }
        }
    }
    init(storage:KeyStorage){
        _nextStorage = storage
        _syncNeeded = false
    }
    func setInt(_ value:Int!, forKey:String){
        _nextStorage.setInt(value, forKey: forKey)
        _syncNeeded = true
    }
    func setFloat(_ value:Float!, forKey:String){
        _nextStorage.setFloat(value, forKey: forKey)
        _syncNeeded = true
    }
    func setDouble(_ value:Double!, forKey:String){
        _nextStorage.setDouble(value, forKey: forKey)
        _syncNeeded = true
    }
    func setString(_ value:String!, forKey:String){
        _nextStorage.setString(value, forKey: forKey)
        _syncNeeded = true
    }
    func setData(_ value:Data!, forKey:String){
        _nextStorage.setData(value, forKey: forKey)
        _syncNeeded = true
    }
    func setBool(_ value:Bool!, forKey:String){
        _nextStorage.setBool(value, forKey: forKey)
        _syncNeeded = true
    }
    func encodeObject(_ value:NSCoding!, forKey:String){
        _nextStorage.encodeObject(value, forKey: forKey)
        _syncNeeded = true
    }
    
    func decodeObjectForKey(_ key:String)->AnyObject?{
        return _nextStorage.decodeObjectForKey(key)
    }
    
    func encode<T>(_ value: T?, forKey key: String) where T : Decodable, T : Encodable {
        _nextStorage.encode(value, forKey: key)
        _syncNeeded = true

    }
    
    func decode<T>(key: String) -> T? where T : Decodable {
        return _nextStorage.decode(key: key)
    }
    func intForKey(_ key: String)-> Int?{
        return _nextStorage.intForKey(key)
    }
    func floatForKey(_ key:String)-> Float?{
        return _nextStorage.floatForKey(key)
    }
    func stringForKey(_ key:String)-> String?{
        return _nextStorage.stringForKey(key)
    }
    func doubleForKey(_ key:String)-> Double?{
        return _nextStorage.doubleForKey(key)
    }
    func boolForKey(_ key:String)->Bool?{
        return _nextStorage.boolForKey(key)
    }
    func dataForKey(_ key:String)->Data?{
        return _nextStorage.dataForKey(key)
    }
    var mustSynchronize : Bool{
        get{
            return false
        }
    }
    func synchronize(){
        _nextStorage.synchronize()
        _syncNeeded = false
    }
    
    func resetStorage(){
        _nextStorage.resetStorage()
        _syncNeeded = true
    }
}
