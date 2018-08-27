//
//  EquipmentDto.swift
//  MyJeedom
//
//  Created by Johann on 17/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation

struct EquipmentDto:Decodable{
    let id:String
    let name:String
    let cmds:[CommandDto]
    let isVisible:String
    let isEnable:String
}
