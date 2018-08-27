//
//  MainCoordinator.swift
//  MyJeedom
//
//  Created by Johann on 15/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift

class MainCoordinator{
    private weak var _mainViewController:MainViewController?
    
    init(mainViewController:MainViewController){
        _mainViewController = mainViewController
    }
    
    func showEquipment(_ equipment:EquipmentDto){
        let segueContext = CommandsViewController.SegueContext(equipmentDto: equipment)
        _mainViewController?.performSegue(withIdentifier: "showEquipment", sender: segueContext)
    }
    
    func showUserPreferences(){
        let context = UserPreferencesViewController.SegueContext()
        _mainViewController?.performSegue(withIdentifier: "showUserPreferences", sender: context)


    }
}
