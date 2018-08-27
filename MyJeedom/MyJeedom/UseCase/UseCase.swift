//
//  UseCase.swift
//  MyJeedom
//
//  Created by Johann on 16/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation

protocol UseCase {
    associatedtype ReturnType
    func perform()->ReturnType
}
