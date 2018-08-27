//
//  ObjectDto.swift
//  MyJeedom
//
//  Created by Johann on 16/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation

struct ObjectDto:Decodable{
    let id:String
    let name: String
//    let father_id: String
//    let isVisible:String
    let eqLogics:[EquipmentDto]
}
