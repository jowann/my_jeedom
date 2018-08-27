//
//  RamStorage.swift
//  Frizbiz
//
//  Created by johann Vandromme on 18/09/2015.
//  Copyright © 2015 Frizbiz. All rights reserved.
//

import Foundation


class RamStorage: KeyStorage{
    
    
    fileprivate var _dictionary : [String:AnyObject]
    
    init(){
        _dictionary = [String:AnyObject]()
    }
    
    func setInt(_ value:Int!, forKey:String){
        _dictionary[forKey] = value as AnyObject
    }
    
    func setFloat(_ value:Float!, forKey:String){
        _dictionary[forKey] = value as AnyObject
    }
    func setDouble(_ value:Double!, forKey:String){
        _dictionary[forKey] = value as AnyObject
    }
    func setString(_ value:String!, forKey:String){
        guard let value = value else {
            _dictionary.removeValue(forKey: forKey)
            return 
        }
        _dictionary[forKey] = value as AnyObject
    }
    func setData(_ value:Data!, forKey:String){
        _dictionary[forKey] = value as AnyObject
    }
    func setBool(_ value:Bool!, forKey:String){
        _dictionary[forKey] = value as AnyObject
    }
    
    func encodeObject(_ value:NSCoding!, forKey:String){
        _dictionary[forKey] = value
    }
    
    
    func encode<T>(_ value: T?, forKey key: String) where T : Decodable, T : Encodable {
         _dictionary[key] = value as AnyObject
    }
    
    func decode<T>(key: String) -> T? where T : Decodable {
        return _dictionary[key] as? T
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
        return _dictionary[key]
    }
    
    var mustSynchronize : Bool{
        get{
            return false
        }
    }
    func resetStorage() {
        _dictionary = [String:AnyObject]()
    }
    
    func synchronize(){}
    
}
