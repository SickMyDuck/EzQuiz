//
//  QuizViewController.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 07.06.2022.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

class SimpleFlagQuizViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var flagImage: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!

    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        showImageAndAnswers()
        
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let answerIsCorrect = quizBrain.checkAnswer(userAnswer!)
        
        
        sender.backgroundColor =  answerIsCorrect ? UIColor.green : UIColor.red
        
        let seconds = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            updateUICall()
        }
       
        func updateUICall(){
            updateUI()
        }

    }
    
    
    func addPossibleAnswersToButtons(_ answers: [String]) {
        firstButton.setTitle(answers[0], for: .normal)
        secondButton.setTitle(answers[1], for: .normal)
    }
    
    func showImageAndAnswers() {
        
        do {
            try self.addPossibleAnswersToButtons(self.quizBrain.possibleAnswers())
            let url = try URL(string: quizBrain.flagURL())
            flagImage.kf.setImage(with: url)
        } catch QuizBrainError.emptyQuestionsArray {
            print ("No questions!")
        } catch {
            print ("error: \(error)")
        }

    }
    
    func updateUI(){
        quizBrain.nextQuestion()
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        showImageAndAnswers()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }

}
