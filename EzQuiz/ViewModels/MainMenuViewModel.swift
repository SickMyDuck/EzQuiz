//
//  MainMenuViewModel.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 07.06.2022.
//

import Foundation
import CoreData

class MainMenuViewModel {
    
    var flagPoints = Dynamic(0)
    
    
    func pointsByUser(user: String){
        
        let request : NSFetchRequest<FlagPoints> = FlagPoints.fetchRequest()
        
        let userPredicate = NSPredicate(format: "user.name MATCHES %@", user)
       
        request.predicate = userPredicate
        
        let context = CoreDataManager.shared.viewContext
       
        do {
            let userArray = try context.fetch(request)
            if userArray.count > 0 {
                flagPoints.value = Int(userArray[0].points)
            }
        } catch {
            print("Error \(error)")
        }
        
    }

}
