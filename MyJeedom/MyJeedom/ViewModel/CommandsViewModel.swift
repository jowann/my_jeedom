//
//  EquipmentViewModel.swift
//  MyJeedom
//
//  Created by Johann on 17/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift

class CommandsViewModel:RxViewModel{
    //private let _equipmentDto:EquipmentDto
    private let disposeBag = DisposeBag()
    private let equipmentDto:EquipmentDto
    private let _commandsDataSource = BehaviorSubject<[CommandViewModel]>(value:[CommandViewModel]())
    let _commandSelected = PublishSubject<CommandViewModel>()
    
    lazy var commandsDataSourceObs:Observable<[CommandViewModel]> = _commandsDataSource
    lazy var commandSelected:AnyObserver<CommandViewModel> = _commandSelected.asObserver()
    
    init(equipmentDto:EquipmentDto) {
        self.equipmentDto = equipmentDto
        let commands = equipmentDto.cmds.filter({ (commandDto) -> Bool in
            return commandDto.isVisible == "1"
        }) .map({ (commandDto) -> CommandViewModel in
            return CommandViewModel(command: commandDto)
        })
        _commandsDataSource.onNext(commands)
        
        _commandSelected.flatMap { (commandViewModel) in
            return commandViewModel.perform()
        }.subscribe().disposed(by: disposeBag)
    }
}
