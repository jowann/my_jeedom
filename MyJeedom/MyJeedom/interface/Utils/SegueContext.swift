//
//  SegueContext.swift
//  CubeInStore
//
//  Created by Johann on 06/02/2017.
//  Copyright © 2017 Johann. All rights reserved.
//

import Foundation
import UIKit

protocol ISegueContext {
    func linkWith(_ viewController:UIViewController)
   
}
extension ISegueContext{
    func shouldPerformSegue()->Bool{
        return true
    }
}
