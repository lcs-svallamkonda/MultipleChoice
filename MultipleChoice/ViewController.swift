//
//  ViewController.swift
//  MultipleChoice
//
//  Created by Vallamkonda, Sunaina on 2019-12-03.
//  Copyright © 2019 Vallamkonda, Sunaina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var numberOfQuestionsField: UITextField!
    @IBOutlet weak var studentAnswersField: UITextField!
    @IBOutlet weak var correctAnswersField: UITextField!
    @IBOutlet weak var displayedText: UITextView!
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //make this class be the delegate for the number of questions text field
        numberOfQuestionsField.delegate = self
        studentAnswersField.delegate = self
        correctAnswersField.delegate = self
        
        //Give the focus to the input text view when the program begins
        numberOfQuestionsField.text = ""
        studentAnswersField.text = ""
        correctAnswersField.text = ""
        displayedText.text = ""
        numberOfQuestionsField.becomeFirstResponder() //set the focus on input field
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
        
        
        //make sure the number of inputed student answers matches the number of questions on the test
        guard let studentAnswers = studentAnswersField.text, studentAnswers.count == numberOfQuestions else {
            displayedText.text  = "Please be sure you enter exactly \(numberOfQuestions) student answers"
            return
        }
        
        //make sure number of inputed correct answers matches the number of questions on the test
        guard let correctAnswers = correctAnswersField.text, correctAnswers.count == numberOfQuestions else {
            displayedText.text = "Please be sure you enter exactly \(numberOfQuestions) correct answers"
            return
        }
        
        //only allow ABCDE to be inputed into the student answer text field
        let allowedLetters = "ABCDE"
        for letter in studentAnswers {
            if allowedLetters.contains(letter) == false {
                displayedText.text = "Student answers contain invalid choices. Please ensure that only characters A,B,C,D or E are used."
                return
            }
            
            //only allow ABCDE to be inputed into the correct answer text field
            for answer in correctAnswers {
                if allowedLetters.contains(answer) == false {
                    displayedText.text = "Correct answers contain invalid choices. Please ensure that only characters A,B,C,D or E are used."
                    return
                }
                
                //create a string to represent the number of right answers the student has
                var rightAnswers = 0
                
                
                //actually calculate the number of answers the student got right
                for (position, answer) in studentAnswers.enumerated(){
                    //find the correct answer inputed in the same position as the student's answer
                    let teacherAnswerAsIndex = correctAnswers.index(correctAnswers.startIndex, offsetBy: position)
                    let TeacherAnswer = correctAnswers[teacherAnswerAsIndex]
                    //check if the student and teacher answers are the same, if they are, add one to "right answers" variables
                    if answer == TeacherAnswer {
                        rightAnswers += 1
                    }
                }
                
                //send the results to the view
                displayedText.text = "The student aswered \(rightAnswers) question(s) correctly"
                
                
            }
            //MARK: UITextFieldDelagates Methods
            //Called automatically when the contents of the text field are changed
            func textFieldDidBeginEditing(_ textField: UITextField) {
                
                //Reset output text view
                displayedText.text = ""
            }
        }
    }
}
