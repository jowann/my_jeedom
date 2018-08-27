//
//  ViewController.swift
//  MyJeedom
//
//  Created by Johann on 14/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var showSettingsButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    lazy var mainViewModel = MainViewModel(coordinator: MainCoordinator(mainViewController: self), userPreferencesDataProvider: userPreferencesDataProvider)
    
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainViewModel.viewDidAppear(animated)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel.viewDidLoad()
        mainViewModel.bindShowSettings(on:showSettingsButton.rx.tap.asObservable())
        // tableView
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<ObjectDto, EquipmentDto>>(
            configureCell: { (_, tv, indexPath, element) in
                let cell = tv.dequeueReusableCell(withIdentifier: "Cell")!
                cell.textLabel?.text = "\(element.name)"
                return cell
        },
            titleForHeaderInSection: { dataSource, sectionIndex in
                return dataSource[sectionIndex].identity.name
        })
        
        
        //mainViewModel.objectsDataSourceObs
        mainViewModel.objectsDataSourceObs            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        mainViewModel.bindModelSelected(tableView.rx.modelSelected(EquipmentDto.self).asObservable())
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        prepare(for: segue, context: sender as? ISegueContext)
    }

}

