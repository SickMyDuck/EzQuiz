//
//  ViewController.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 12.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel = LoginViewModel()
    
    var loggedIn = false
    
    @IBOutlet weak var nameField: UITextField!

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        viewModel.userButtonPressed(name: nameField.text ?? "")
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bindViewModel()
        
        initialState()
        
        viewModel.preloadItems()
        
        if loggedIn {
            self.performSegue(withIdentifier: "goToMenu", sender: self)
        }
        
    }
    
    func initialState() {
        label.text = ""
    }
    
    func bindViewModel() {
        viewModel.nameField.bind { nameFieldText in

            if !nameFieldText.isEmpty {
                self.loggedIn = true
                return
            }

        }
        
        
//        viewModel.statusText.bind { statusText in
//            DispatchQueue.main.async {
//                self.label.text = statusText
//            }
//        }
    }
    

}

