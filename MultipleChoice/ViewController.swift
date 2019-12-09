//
//  ViewController.swift
//  MultipleChoice
//
//  Created by Vallamkonda, Sunaina on 2019-12-03.
//  Copyright © 2019 Vallamkonda, Sunaina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var numberOfQuestionsField: UITextField!
    @IBOutlet weak var studentAnswersField: UITextField!
    @IBOutlet weak var correctAnswersField: UITextField!
    @IBOutlet weak var displayedText: UITextView!
   
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: Actions
    @IBAction func checkAnswers(_ sender: Any) {
        //reset displayed text everytime button is pressed
        displayedText.text = ""
        
        //guard against no input in the 'number of questions' text field
//        guard let numberOfQuestions = Int(numberOfQuestionsField.text!), numberOfQuestions > 0 else {
//            displayedText.text = "Please enter an integer greater than 0"
//            return
//        }
        guard let numberOfQuestionsAsString = numberOfQuestionsField.text, let numberOfQuestions = Int(numberOfQuestionsAsString), numberOfQuestions > 0 else {
            displayedText.text = "Please enter an integer greater than 0"
            return
        }
        
        
        //make sure the number of inputted answers matches the number of questions on the test
        guard let studentAnswersAsString = studentAnswersField.text, let studentAnswers = Int(studentAnswersAsString), studentAnswers.count == numberOfQuestions else {
            displayedText.text  = "Please be sure you enter exactly \(numberOfQuestions) student answers"
        }
    }
}

