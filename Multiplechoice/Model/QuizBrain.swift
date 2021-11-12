//
//  QuizBrain.swift
//  Multiplechoice
//
//  Created by Mai Uchida on 2021/11/12.
//

import Foundation

struct QuizBrain{
    
    var questionNumber = 0
    
    
    let quiz = [Question(q: "Who is Steve jobs?", a: ["Apple Founder", "Facebook Founder", "Amazon Founder"], correct: "Apple Founder"),
                Question(q: "The Hottest country in the world", a: ["Kenya","Mali","Senegal"], correct: "Mali"),
                Question(q: "The longest Bridge in the world", a: ["the Danyang–Kunshan Grand Bridge in China", "the Changhua-Kaohsiung Viaduct in Taiwan", "Cangde Grand Bridge, China"], correct: "the Danyang–Kunshan Grand Bridge in China"),
                Question(q: "5+5 =?", a: ["15","20","10"], correct: "10"),
                Question(q: "100 x 100 =?", a: ["200","1200","10000"], correct: "10000")
               ]
    
    func getProgress() -> Float{
        return Float(questionNumber)/Float(quiz.count)
    }
    func getQuestion() -> String{
        return quiz[questionNumber].text
    }
    
    func getAnswer()-> [String]{
        return quiz[questionNumber].answer
    }
    
    mutating func nextQuestion(){
        
        if questionNumber + 1 < quiz.count{
            questionNumber += 1
        }else{
            questionNumber = 0
        }
            
        
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool{
        if userAnswer == quiz[questionNumber].rightAnswer{
            return true
        }else{
            return false
        }
    }
    
    
    
    
}
