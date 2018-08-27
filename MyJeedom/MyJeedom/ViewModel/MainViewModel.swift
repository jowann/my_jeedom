//
//  MainViewModel.swift
//  MyJeedom
//
//  Created by Johann on 15/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

class MainViewModel{

    private let disposeBag = DisposeBag()
    private let _coordinator:MainCoordinator
    
    private let _objectsDataSource = BehaviorSubject<[SectionModel<ObjectDto, EquipmentDto>]>(value: [SectionModel<ObjectDto, EquipmentDto>]())
    
    lazy var objectsDataSourceObs:Observable<[SectionModel<ObjectDto, EquipmentDto>]> = _objectsDataSource
    
    init(coordinator:MainCoordinator, userPreferencesDataProvider:UserPreferencesDataProvider){
        _coordinator = coordinator
    }
    
    func bindShowSettings(on:Observable<Void>){
        on.subscribe(onNext: { [weak self]() in
            self?._coordinator.showUserPreferences()
        }).disposed(by: disposeBag)
    }
    
    func bindModelSelected(_ equipementObs:Observable<EquipmentDto>){
        equipementObs.subscribe(onNext: { [weak self](equipmentDto) in
            self?._coordinator.showEquipment(equipmentDto)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    func viewDidLoad(){
        
    }
    
    func viewDidAppear(_ animated:Bool){
        
        jeedomDataProvider.retrieveAllData().map { (objects:[ObjectDto])  in
            return objects.map({ (object) -> SectionModel<ObjectDto, EquipmentDto> in
                return SectionModel(model: object, items: object.eqLogics)
            })
            }.catchError({ (error) -> Observable<[SectionModel<ObjectDto, EquipmentDto>]> in
                return Observable.just([SectionModel<ObjectDto, EquipmentDto>]())
            })
            .subscribe(_objectsDataSource).disposed(by: disposeBag)
        }
    }

