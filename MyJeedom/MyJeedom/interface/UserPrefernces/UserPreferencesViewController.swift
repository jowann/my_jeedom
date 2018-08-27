//
//  UserPreferencesViewController.swift
//  MyJeedom
//
//  Created by Johann on 15/08/2018.
//  Copyright © 2018 JoWann. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class UserPreferencesViewController: UIViewController {

    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var ipTextField:UITextField!
    @IBOutlet weak var apiKeyTextField:UITextField!
    
    private let disposeBag = DisposeBag()
    
    private var viewModel:UserPreferencesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    func bind(){
        viewModel.bindValidateClicked(to:validateButton.rx.tap.asObservable())
        viewModel.bindIpDidChange(to:ipTextField.rx.text.asObservable())
        viewModel.bindApiKeyDidChange(to:apiKeyTextField.rx.text.asObservable())
        
    }
            
       
//
    //    })
    class SegueContext:ISegueContext{
        init(){
            
        }
        func linkWith(_ viewController:UIViewController) {
            let userPreferencesViewController = viewController as! UserPreferencesViewController
            userPreferencesViewController.viewModel = UserPreferencesViewModel()
        }
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */


