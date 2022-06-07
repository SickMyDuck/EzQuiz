//
//  ViewModel.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 07.06.2022.
//

import Foundation
import CoreData
import UIKit

class LoginViewModel: ObservableObject {
    var statusText = Dynamic("")
    var nameField = Dynamic("")
    
    func userButtonPressed(name: String) {
        if name.isEmpty {
            statusText.value = "Enter your name!"
        } else {
            statusText.value = "Success!"
            addUser(name: name)
        }
    }
    
    func addUser(name: String) {
        let user = Users(context: CoreDataManager.shared.viewContext)
        user.name = name
        user.loggedIn = true
        
        CoreDataManager.shared.save()
    }
    
    
    func preloadItems(with request: NSFetchRequest<Users> = Users.fetchRequest()) {

        let loggedInPredicate = NSPredicate(format: "loggedIn == YES")
        
        request.predicate = loggedInPredicate
        
        let context = CoreDataManager.shared.viewContext
       
        do {
            let loggedIn = try context.fetch(request)
            if loggedIn.count > 0 {
                nameField.value = loggedIn[0].name!
            }
        } catch {
            print("Error \(error)")
        }
    }
}
