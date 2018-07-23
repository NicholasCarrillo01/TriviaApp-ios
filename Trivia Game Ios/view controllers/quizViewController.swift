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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    let newQuestion = TriviaQuestion(question: "what color is the sky", answers: ["red", "mauve", "aubregine", "blue"],    correctAnswerIndex: 3)
    
        questionLabel.text = newQuestion.question
        answerButton1.setTitle(newQuestion.answers[0], for: .normal)
        answerButton2.setTitle(newQuestion.answers[1], for: .normal)
        answerButton3.setTitle(newQuestion.answers[2], for: .normal)
        answerButton4.setTitle(newQuestion.answers[3], for: .normal)
        
        print("The correct answer is: \(newQuestion.correctanswer)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

