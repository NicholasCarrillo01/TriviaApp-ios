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
    private var currentQuestion: TriviaQuestion! {
        didSet {
            //When currentQuestion is set, update the UI with values from that question
            questionLabel.text = currentQuestion.question
            answerButton1.setTitle(currentQuestion.answers[0], for: .normal)
            answerButton2.setTitle(currentQuestion.answers[1], for: .normal)
            answerButton3.setTitle(currentQuestion.answers[2], for: .normal)
            answerButton4.setTitle(currentQuestion.answers[3], for: .normal)
        }
    }
    
    private var score = 0 {
        didSet {
            //update the scorelabels text whenever the score changes
            scoreLabel.text = "\(score)"
        }
    }
    //our array of questions
    var questions: [TriviaQuestion] = []
    
    //array to hold used questions
    var questionsPlaceholer: [TriviaQuestion] = []
    
    //Int to store the index of questions that is being answered
    var currentIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateQuestionsArray()
        getNewQuestion()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func populateQuestionsArray() {
        
        let question1 = TriviaQuestion(question: "what color is the sky", answers: ["red", "mauve", "aubregine", "blue"], correctAnswerIndex: 3)
        questions.append(question1)
        
        
        let question2 = TriviaQuestion(question: "what is 2+2?", answers: ["99", "4", "5", "10"], correctAnswerIndex: 1)
        
        
        let question3 = TriviaQuestion(question: "what is color is water", answers: ["green", "red", "clear", "yellow"], correctAnswerIndex: 2)
        
        let question4 = TriviaQuestion(question: "who is batman", answers: ["I'M BATMAN!!!", "Barry Allen", "Shroud", "pewdiepie"], correctAnswerIndex: 0)
        questions.append(question1)
        questions.append(question2)
        questions.append(question3)
        questions.append(question4)
        
    }
    
    func getNewQuestion() {
        //Select a random question from our questions array and set currentQuestion equal to it if there are questions remaining
        if questions.count > 0 {
            //Generate a random number between 0 and the number of items in the array
            currentIndex = Int(arc4random_uniform(UInt32(questions.count)))
            currentQuestion = questions[currentIndex]
        } else {
            //there are no questions left, so we need to show a game over alert
            showGameOverAlert()
        }
        
    }
    
    func resetGame() {
        score = 0
        
        //we need to check if any questions are remaining in our questions array so we can move those to the place holder array
        if questions.count != 0 {
            questionsPlaceholer.append(contentsOf: questions)
            questions.removeAll()
        }
        questions = questionsPlaceholer
        questionsPlaceholer.removeAll()
        getNewQuestion()
    }
    
    
    func showGameOverAlert() {
        let  AlertController = UIAlertController(title: "Game Over", message: "Your score was \(score).", preferredStyle: .alert)
        
        let resetAction = UIAlertAction(title: "Reset", style: .default) { action in
            
        }
        AlertController.addAction(resetAction)
        self.present(AlertController, animated: true, completion: nil)
          //reset the game
        self.resetGame()
    }
    
    
    
    func showCorrectAnswerAlert() {
        let alertController = UIAlertController(title: "Correct", message: "\(currentQuestion.correctanswer) is the correct answer. Good job", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Thank You!", style: .default) { action in
            
            self.questionsPlaceholer.append(self.questions[self.currentIndex])
            
            self.questions.remove(at: self.currentIndex)
            
            self.getNewQuestion()
            
        }
        
        
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showIncorrectAnswer() {
        //display an alert that the user got from the wrong answer. it should be titled "incorrect!" and the message should contain the correct answer for the question they got wrong there should also be a button/action to close the alert
        let alertController = UIAlertController(title: "wrong", message: "\(currentQuestion.correctanswer) is the correct Answer, try again", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Thank You", style: .default) { action in
            //store the current question the user is answering inside the questionsplaceholder array
            self.questionsPlaceholer.append(self.questions[self.currentIndex])
            
            self.questions.remove(at: self.currentIndex)
            
            self.getNewQuestion()
            
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
    @IBAction func resetButton(_ sender: Any) {
        resetGame()
    }
    
}

