//
//  LoadingScreenViewController.swift
//  EzQuiz
//
//  Created by Ruslan Sadritdinov on 09.06.2022.
//

import UIKit

class LoadingScreenViewController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    let quizBrain = QuizBrain()
    
    typealias CompletionHandler = (_ success:Bool) -> Void
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spinner.startAnimating()
        
        initializeQuestions { success in
            if success {
                performSegue(withIdentifier: "goToSimpleFlagQuiz", sender: self)
            } else {
                fatalError("Error downloading data!")
            }
                
        }
        
    }

    func initializeQuestions(completionHandler: CompletionHandler) {
        quizBrain.initializeQuestions()
        
        let flag = true
        
        completionHandler(flag)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! SimpleFlagQuizViewController
        controller.quizBrain = quizBrain
    }

}
