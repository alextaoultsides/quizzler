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
    let questionsList = QuestionBank().list
    var randNum: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer()
        nextQuestion()
    }
    
    func randomQuestion(){
        randNum = Int.random(in: 0...questionsList.count-1)
    }
    
    
    
    func updateUI() {
        randomQuestion()
        let question = questionsList[randNum]
        questionLabel.text = question.questionText
        
    }
    

    func nextQuestion() {
        updateUI()
    }
    
    
    func checkAnswer() {
        
    }
    
    
    func startOver() {
       
    }
    

    
}
