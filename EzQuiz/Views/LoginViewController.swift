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
    
    var user = Users()
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var nameField: UITextField!

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let user = viewModel.userButtonPressed(name: nameField.text ?? "") {
            self.user = user
            goToMenu()
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        bindViewModel()
        
        initialState()
        
        viewModel.preloadItems()
        
        if loggedIn {
            self.goToMenu()
        }
        
    }
    
    func initialState() {
        label.text = ""
        
        enterButton.layer.cornerRadius = 10.0
    }
    
    func bindViewModel() {
        viewModel.nameField.bind { nameFieldText in

            if !nameFieldText.isEmpty {
                self.loggedIn = true
                return
            }

        }
        
        
        viewModel.statusText.bind { statusText in
            DispatchQueue.main.async {
                self.label.text = statusText
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MainMenuViewController
        controller.loggedUser = user
    }

    func goToMenu() {
        performSegue(withIdentifier: "goToMenu", sender: self)
    }
}

