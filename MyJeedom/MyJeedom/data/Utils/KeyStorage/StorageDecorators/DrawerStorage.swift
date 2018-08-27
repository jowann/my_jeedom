//
//  RamStorage.swift
//  Frizbiz
//
//  Created by johann Vandromme on 18/09/2015.
//  Copyright © 2015 Frizbiz. All rights reserved.
//

import Foundation


class DrawerStorage: KeyStorage{
    
   
    
    fileprivate var _dictionary : [String:AnyObject]
    fileprivate var _nextStorage : DataStorage?
    fileprivate let _storeIdentifier : String!
    
    init(nextStorage:DataStorage, identifier:String){
        _nextStorage = nextStorage
        _storeIdentifier = identifier
        if let dictionary = DrawerStorage.retrieveFromStorage(nextStorage, key:identifier){
            _dictionary = dictionary
        } else {
            _dictionary = [String:AnyObject]()
        }
     }
    
    
    init(){
        _nextStorage = nil
        _storeIdentifier = nil
        _dictionary = [String:AnyObject]()
    }
    
    func setInt(_ value:Int!, forKey:String){
        _dictionary[forKey] = value as AnyObject
        //_nextStorage?.setInt(value, forKey: forKey)
    }
    
    func setFloat(_ value:Float!, forKey:String){
        _dictionary[forKey] = value as AnyObject
        //_nextStorage?.setFloat(value, forKey: forKey)
    }
    func setDouble(_ value:Double!, forKey:String){
        _dictionary[forKey] = value as AnyObject
        //_nextStorage?.setDouble(value, forKey: forKey)
    }
    func setString(_ value:String!, forKey:String){
        _dictionary[forKey] = value as AnyObject
        //_nextStorage?.setString(value, forKey: forKey)
    }
    func setData(_ value:Data!, forKey:String){
        _dictionary[forKey] = value as AnyObject
        //_nextStorage?.setData(value, forKey: forKey)
    }
    func setBool(_ value:Bool!, forKey:String){
        _dictionary[forKey] = value as AnyObject
        //_nextStorage?.setBool(value, forKey:forKey)
    }
    
    func encodeObject(_ value:NSCoding!, forKey:String){
        if let value = value{
            let data = NSKeyedArchiver.archivedData(withRootObject: value)
            _dictionary[forKey] = data as AnyObject
        } else{
            _dictionary[forKey] = nil
        }
        //_nextStorage?.encodeObject(value, forKey: forKey)
    }
    
    func encode<T:Codable>(_ value: T?, forKey key: String){
        let data = try? JSONEncoder().encode(value)
        _dictionary[key] = data as AnyObject
    }
    func decode<T:Decodable>(key: String) -> T?{
        guard let jsonData = _dictionary[key] as? Data else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: jsonData)
    }
    
    
    
    func intForKey(_ key: String)-> Int?{
        return _dictionary[key] as? Int
    }
    
    func floatForKey(_ key:String)-> Float?{
        return _dictionary[key] as? Float
    }
    
    func stringForKey(_ key:String)-> String?{
        return _dictionary[key] as? String
    }
    
    func doubleForKey(_ key:String)-> Double?{
        return _dictionary[key] as? Double
    }
    
    func dataForKey(_ key:String)->Data?{
        return _dictionary[key] as? Data
    }
    
    func boolForKey(_ key:String)->Bool?{
        return _dictionary[key] as? Bool
    }
    
    func decodeObjectForKey(_ key:String)->AnyObject?{
        if let data = _dictionary[key] as? Data{
            return NSKeyedUnarchiver.unarchiveObject(with: data) as AnyObject
        }
        return nil
    }
    
    var mustSynchronize : Bool{
        get{
            return _nextStorage != nil
        }
    }
    func resetStorage() {
        _dictionary = [String:AnyObject]()
        _nextStorage?.setData(nil, forKey: _storeIdentifier)
    }
    
    func synchronize(){
        if let nextStorage = _nextStorage {
            let data = NSKeyedArchiver.archivedData(withRootObject: _dictionary)
            nextStorage.setData(data, forKey: _storeIdentifier)
            if nextStorage.mustSynchronize{
                nextStorage.synchronize()
            }
        }
    }
    
    static func retrieveFromStorage(_ storage:DataStorage?, key:String)->[String:AnyObject]?{
        if let data = storage?.dataForKey(key){
            return NSKeyedUnarchiver.unarchiveObject(with: data) as? [String:AnyObject]
        }else {
            return nil
        }
    }
}
