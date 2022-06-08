//
//  MainMenuItems.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 07.06.2022.
//

import Foundation
import UIKit

class MainMenuItem {
    var title : String
    var image : UIImage
    var points : Int
    
    init (title: String, image: UIImage, points: Int){
        self.title = title
        self.image = image
        self.points = points
    }
    
    convenience init () {
        self.init(title: "Empty cell", image: UIImage(named: "redQuestionMark")!, points: 0)
    }
}
