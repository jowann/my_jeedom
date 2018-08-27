//
//  FromSimpleStorage.swift
//  Frizbiz
//
//  Created by johann Vandromme on 19/09/2015.
//  Copyright © 2015 Frizbiz. All rights reserved.
//

import Foundation

class FromDataStorage : KeyStorage{
    
    
    let _dataStorage: DataStorage
    
    init(dataStorage:DataStorage){
        _dataStorage = dataStorage
    }
    
    func encode<T:Codable>(_ value: T?, forKey key: String) {
        let encodedData = try? JSONEncoder().encode(value)
        _dataStorage.setData(encodedData, forKey: key)
    }
    
    func decode<T:Decodable>(key: String) -> T? {
        guard let jsonData = _dataStorage.dataForKey(key) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: jsonData)
    }
    
    
    
    func set<T>(_ value :T!, forKey:String){
        var val = value
        if val != nil {
            let data = Data(bytes: /*UnsafePointer<UInt8>(*/&val/*)*/, count: MemoryLayout<T>.size)
            _dataStorage.setData(data, forKey:forKey)
        }
        else {
           _dataStorage.setData(nil, forKey:forKey)
        }
    }
    
    func setFloat(_ value:Float!, forKey:String){
        set(value, forKey:forKey)
    }
    func setDouble(_ value:Double!, forKey:String){
        set(value, forKey:forKey)
    }
    func setString(_ value:String!, forKey:String){
        if let value = value{
            let data = value.data(using: String.Encoding.utf8)
            _dataStorage.setData(data, forKey: forKey)
        } else{
            _dataStorage.setData(nil, forKey: forKey)
        }
        
    }
    func setData(_ value:Data!, forKey:String){
        _dataStorage.setData(value, forKey:forKey)
    }
    func setBool(_ value:Bool!, forKey:String){
        set(value, forKey:forKey)
    }
    func encodeObject(_ value:NSCoding!, forKey:String){
        if let value = value{
            let data = NSKeyedArchiver.archivedData(withRootObject: value)
            _dataStorage.setData(data, forKey:forKey)
        } else {
            _dataStorage.setData(nil, forKey:forKey)
        }
    }
    
    func decodeObjectForKey(_ key:String)->AnyObject?{
        if let data = _dataStorage.dataForKey(key){
            return NSKeyedUnarchiver.unarchiveObject(with: data) as AnyObject
        }
        return nil
        
    }
    
    
    func setInt(_ value:Int!, forKey:String){
        set(value, forKey:forKey)
        /*var val = value
        let data = NSData(bytes: &val, length: sizeof(Int))
        _simpleStorage.setData(data, forKey:forKey)*/
    }
    
    func intForKey(_ key: String)-> Int?{
        if let data = _dataStorage.dataForKey(key){
            var res = Int()
            (data as NSData).getBytes(&res, length: MemoryLayout<Int>.size)
            return res
        }
        return nil
    }
    
    func floatForKey(_ key:String)-> Float?{
        if let data = _dataStorage.dataForKey(key){
            var res = Float()
            (data as NSData).getBytes(&res, length: MemoryLayout<Float>.size)
            return res
        }
        return nil
    }
    
    func stringForKey(_ key:String)-> String?{
        if let data = _dataStorage.dataForKey(key){
            return NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String?
        }
        return nil
    }
    
    func doubleForKey(_ key:String)-> Double?{
        if let data = _dataStorage.dataForKey(key){
            var res = Double()
            (data as NSData).getBytes(&res, length: MemoryLayout<Double>.size)
            return res
        }
        return nil
    }
    
    func boolForKey(_ key:String)->Bool?{
        if let data = _dataStorage.dataForKey(key){
            var res = Bool()
            (data as NSData).getBytes(&res, length: MemoryLayout<Bool>.size)
            return res
        }
        return nil
    }
    
    func dataForKey(_ key:String)->Data?{
        return _dataStorage.dataForKey(key)
    }
    var mustSynchronize : Bool{
        get{
            return _dataStorage.mustSynchronize
        }
    }
    func synchronize(){
        _dataStorage.synchronize()
    }
    
    func resetStorage(){
        _dataStorage.resetStorage()
    }
    
 

}
