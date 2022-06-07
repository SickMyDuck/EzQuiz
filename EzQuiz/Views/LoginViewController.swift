//
//  ViewController.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 12.04.2022.
//

import UIKit

class LoginViewController: UIViewController {

    var viewModel = LoginViewModel()
    
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
        
    }
    
    func initialState() {
        label.text = ""
    }
    
    func bindViewModel() {
        viewModel.statusText.bind { statusText in
            DispatchQueue.main.async {
                self.label.text = statusText
            }
        }
        viewModel.nameField.bind { nameFieldText in

                self.nameField.text = nameFieldText

        }
    }
    

}

