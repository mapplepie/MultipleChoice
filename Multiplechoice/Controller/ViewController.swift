//
//  ViewController.swift
//  Multiplechoice
//
//  Created by Mai Uchida on 2021/11/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var chouice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func choiceSelected(_ sender: UIButton) {
        let title: String? = sender.currentTitle
        
        if let label = title{
            let userGotItRight = quizBrain.checkAnswer(userAnswer: label)
            
            if userGotItRight {
                sender.backgroundColor = .green
            }else{
                sender.backgroundColor = .red
            }
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        titleLabel.text = quizBrain.getQuestion()
        
        let answerChoice = quizBrain.getAnswer()
        choice1.setTitle(answerChoice[0], for: .normal)
        chouice2.setTitle(answerChoice[1], for: .normal)
        choice3.setTitle(answerChoice[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        
        choice1.backgroundColor = .white
        chouice2.backgroundColor = .white
        choice3.backgroundColor = .white
    }
    

}

