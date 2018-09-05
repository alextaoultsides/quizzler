//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class QuizzlerViewController: UIViewController {
    
    //Place your instance variables here
    var questionsList = QuestionBank().list
    var pickedAnswer: Bool = false
    var correctAnswers: Int = 0
    var randNum: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "0"
        progressLabel.text = "0"
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        checkAnswer()
        nextQuestion()
    }
    
    func randomQuestion(){
        if questionsList.count > 1 {
            randNum = Int.random(in: 0 ... questionsList.count-1)
        } else {
            randNum = 0
        }
    }
    
    
    func updateUI() {
        
        randomQuestion()
        let question = questionsList[randNum]
        questionLabel.text = question.questionText
        
    }
    

    func nextQuestion() {
        if questionsList.count == 1 {
            let alert = UIAlertController(title: "End of Quiz", message: "Would you like to play again?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                self.startOver()
            }))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            questionsList.remove(at: randNum)
            updateUI()
        }
    }
    
    
    func checkAnswer() {
        if pickedAnswer == questionsList[randNum].answer {
            correctAnswers += 1
            scoreLabel.text = "\(correctAnswers)"
        }
        
    }
    
    
    func startOver() {
        progressLabel.text = "0"
        scoreLabel.text = "0"
        correctAnswers = 0
        questionsList = QuestionBank().list
        updateUI()
    }
    

    
}
