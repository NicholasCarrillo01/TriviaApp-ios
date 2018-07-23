//
//  TriviaQuestion.swift
//  Trivia Game Ios
//
//  Created by Nichilas Carrillo on 7/23/18.
//  Copyright © 2018 Nichilas Carrillo. All rights reserved.
//

import Foundation

class TriviaQuestion {
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
    
    //computer Property
    var correctanswer: String {
        return answers[correctAnswerIndex]
    }
    
    init(question: String, answers: [String], correctAnswerIndex: Int) {
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
}
















