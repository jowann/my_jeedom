//
//  CommandDto.swift
//  MyJeedom
//
//  Created by Johann on 17/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation

struct CommandDto:Decodable{
    let id:String
    let name:String
    let type:String
    let subType:String
    let isVisible:String
    
}
