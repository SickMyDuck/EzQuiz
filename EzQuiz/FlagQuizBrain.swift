//
//  FlagQuizBrain.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 09.06.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class QuizBrain{
    
    var quiz = [SimpleFlagQuestions]()
    
    var questionNumber = 0
    var scoreNumber = 0
    
    
    func getProgress() -> Float{
        return Float(questionNumber)/Float(quiz.count)
    }
    
    func nextQuestion(){
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            scoreNumber = 0
        }
    }
    
    func getScore() -> Int{
        return scoreNumber
    }
    
    func addQuestion(flagURL: String, possibleAnswers: [String], correctAnswer: String) {
        quiz.append(SimpleFlagQuestions(flagURL: flagURL,
                                        correctAnswer: correctAnswer,
                                        possibleAnswers: possibleAnswers))
    }
    
    func initializeQuestions() {
        let url = "https://sickmyduck.ru/simpleFlagQuestions.json"
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (_, subJson):(String, JSON) in json["simpleQuizQuestions"] {

                    self.addQuestion(flagURL: subJson["flagURL"].stringValue,
                                     possibleAnswers: subJson["possibleAnswers"].arrayValue.map({$0.stringValue}),
                                     correctAnswer: subJson["correctAnswer"].stringValue)
                  
                }
            case .failure(let error):
                print(error)

            }
        }
    }
    
    func possibleAnswers() throws -> [String] {
        guard !quiz.isEmpty else {
            throw QuizBrainError.emptyQuestionsArray
        }
        
        return quiz[questionNumber].possibleAnswers
    }
    
    func flagURL() throws -> String {
        
        guard !quiz.isEmpty else {
            throw QuizBrainError.emptyQuestionsArray
        }
        
        return quiz[questionNumber].flagURL
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        if answer == quiz[questionNumber].correctAnswer{
            scoreNumber += 1
            return true
        } else {
            return false
        }
    }
    
}

