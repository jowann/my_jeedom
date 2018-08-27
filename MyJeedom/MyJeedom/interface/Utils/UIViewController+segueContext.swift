//
//  UIViewController+segueContext.swift
//  CubeInStore
//
//  Created by Johann on 06/02/2017.
//  Copyright © 2017 Johann. All rights reserved.
//

import UIKit

extension UIViewController{
    @discardableResult func prepare(for segue:UIStoryboardSegue, context:ISegueContext?)->Bool{
        guard let context = context else{
            return false
        }
        context.linkWith(segue.destination)
        return true
    }
    
    func shouldPerformSegueWithIdentifier(_ identifier: String, context:ISegueContext?) -> Bool{
        guard let context = context else {
            return true
        }
        return context.shouldPerformSegue()
    }
}
