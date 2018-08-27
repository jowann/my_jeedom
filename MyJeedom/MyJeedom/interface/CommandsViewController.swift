//
//  EquipmentViewController.swift
//  MyJeedom
//
//  Created by Johann on 17/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class CommandsViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    private var commandsViewModel:CommandsViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nil
        tableView.delegate  = nil
        
        bind()        
        
        
    }
    
    func bind() {
       
        commandsViewModel.commandsDataSourceObs.subscribe(onNext: { (commands) in
            print(commands.count)
        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
        commandsViewModel.commandsDataSourceObs.bind(to:tableView.rx.items(cellIdentifier: "CommandTableViewCell",
                                                                           cellType: UITableViewCell.self)) {  row, element, cell in
                                                                            cell.textLabel?.text = "\(element.name)"
            }
            .disposed(by:disposeBag)
        
        tableView.rx.modelSelected(CommandViewModel.self).bind(to: commandsViewModel._commandSelected).disposed(by: disposeBag)
    }
    
    class SegueContext:ISegueContext{
        private let equipmentDto:EquipmentDto
        init(equipmentDto:EquipmentDto){
            self.equipmentDto = equipmentDto
        }
        func linkWith(_ viewController: UIViewController) {
            let commandsViewModel = CommandsViewModel(equipmentDto: equipmentDto)
            let equipmentViewController = viewController as! CommandsViewController
            equipmentViewController.commandsViewModel = commandsViewModel
        }
    }
}
