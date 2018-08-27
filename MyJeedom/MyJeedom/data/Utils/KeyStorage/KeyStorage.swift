//
//  KeyStorage.swift
//  Frizbiz
//
//  Created by johann Vandromme on 18/09/2015.
//  Copyright © 2015 Frizbiz. All rights reserved.
//

import Foundation


protocol DataStorage{
    func setData(_ value:Data!, forKey:String)
    func dataForKey(_ key:String)->Data?
    
    var mustSynchronize : Bool{
        get
    }

    func synchronize()
    func resetStorage()
}


protocol KeyStorage:DataStorage{
    func setInt(_ value:Int!, forKey:String)
    func setFloat(_ value:Float!, forKey:String)
    func setDouble(_ value:Double!, forKey:String)
    func setString(_ value:String!, forKey:String)
    func setData(_ value:Data!, forKey:String)
    func setBool(_ value:Bool!, forKey:String)
    func encodeObject(_ value:NSCoding!, forKey:String)
    func decodeObjectForKey(_ key:String)->AnyObject?
    func encode<T:Codable>(_ value: T?, forKey key: String) 
    func decode<T:Decodable>(key: String) -> T?
    func intForKey(_ key: String)-> Int?
    func floatForKey(_ key:String)-> Float?
    func stringForKey(_ key:String)-> String?
    func doubleForKey(_ key:String)-> Double?
    func boolForKey(_ key:String)->Bool?
    func dataForKey(_ key:String)->Data?
    var mustSynchronize : Bool{
        get
    }
    func synchronize()
    
    func resetStorage()
}
