//
//  ViewModel.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 07.06.2022.
//

import Foundation
import CoreData

class LoginViewModel: ObservableObject {
    var statusText = Dynamic("")
    var nameField = Dynamic("")
    
    func userButtonPressed(name: String) -> Users? {
        var user = Users()
        if name.isEmpty {
            statusText.value = "Enter your name!"
        } else {
            statusText.value = "Success!"
            user = addUser(name: name)!
        }
        return user
    }
    
    func addUser(name: String) -> Users? {
        let user = Users(context: CoreDataManager.shared.viewContext)
        user.name = name
        user.loggedIn = true
        
        CoreDataManager.shared.save()
        
        return user
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
