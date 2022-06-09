//
//  SimpleFlagQuestions.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 09.06.2022.
//

import Foundation

class SimpleFlagQuestions: BasicFlagQuestions {
    var possibleAnswers :[String]
    
    init(flagURL: String, correctAnswer: String, possibleAnswers: [String]) {
        self.possibleAnswers = possibleAnswers
        super.init(flagURL: flagURL, correctAnswer: correctAnswer)
    }
    
}
