//
//  EasyFlagQuestions.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 09.06.2022.
//

import Foundation

class BasicFlagQuestions {
    var flagURL : String
    var correctAnswer : String
    
    init(flagURL: String, correctAnswer: String) {
        self.flagURL = flagURL
        self.correctAnswer = correctAnswer
    }
}
