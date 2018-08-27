//
//  CommandViewModel.swift
//  MyJeedom
//
//  Created by Johann on 25/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift

class CommandViewModel:RxViewModel{
    private let _command:CommandDto
    var name:String{
        return _command.name
    }
    init(command:CommandDto){
        _command = command
    }
    
    func perform()->Observable<Void>{
        return jeedomDataProvider.performCommand(commandId: _command.id).flatMap({ (voidResponse) -> Observable<Void> in
            return Observable.just(())
        })
    }
}
