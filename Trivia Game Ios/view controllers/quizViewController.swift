//
//  QuizViewController.swift
//  Trivia Game Ios
//
//  Created by Nichilas Carrillo on 7/20/18.
//  Copyright © 2018 Nichilas Carrillo. All rights reserved.
//

import UIKit

class quizViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    //Property observers
    var currentQuestion: TriviaQuestion! {
        didSet {
            //When currentQuestion is set, update the UI with values from that question
            questionLabel.text = currentQuestion.question
            answerButton1.setTitle(currentQuestion.answers[0], for: .normal)
            answerButton2.setTitle(currentQuestion.answers[1], for: .normal)
            answerButton3.setTitle(currentQuestion.answers[2], for: .normal)
            answerButton4.setTitle(currentQuestion.answers[3], for: .normal)
        }
    }
    
    var score = 0 {
        didSet {
            //update the scorelabels text whenever the score changes
            scoreLabel.text = "\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let newQuestion = TriviaQuestion(question: "what color is the sky", answers: ["red", "mauve", "aubregine", "blue"], correctAnswerIndex: 3)
        
        currentQuestion = newQuestion
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showCorrectAnswerAlert() {
        let alertController = UIAlertController(title: "Correct", message: "\(currentQuestion.correctanswer) is the correct answer. Good job", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Thank You!", style: .default) { action in
            print("The alert action button was tapped")
            
        }
        
        
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showIncorrectAnswer() {
        //display an alert that the user got from the wrong answer. it should be titled "incorrect!" and the message should contain the correct answer for the question they got wrong there should also be a button/action to close the alert
        let alertController = UIAlertController(title: "wrong", message: "\(currentQuestion.correctanswer) is the correct Answer, try again", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Thank You", style: .default) { action in
            print("the alert button was tapped")
        }
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    func checkAnswer(selectedButtonTag: Int) {
        if selectedButtonTag == currentQuestion.correctAnswerIndex {
            //they got it right
            showCorrectAnswerAlert()
            score += 1
        } else {
            showIncorrectAnswer()
        }
        
    }
    
    @IBAction func answerButton1(_ sender: UIButton) {
        checkAnswer(selectedButtonTag: sender.tag)
    }
    
}

