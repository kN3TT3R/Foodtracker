//
//  ViewController.swift
//  Foodtracker
//
//  Created by Kenneth Debruyn on 4/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

import UIKit

/*
    By adopting the UITextFieldDelegate protocol, you tell the compiler that the ViewController class can act as a valid text field delegate. This means you can implement the protocol’s methods to handle text input, and you can assign instances of the ViewController class as the delegate of the text field.
*/
class ViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        // It sets itself as the delegate of its nameTextField property.
        nameTextField.delegate = self
    }
    
    
    //MARK: UITextFieldDelegate
        /*
            You need to specify that the text field should resign its first-responder status when the user taps a button to end editing in the text field. You do this in the textFieldShouldReturn(_:) method, which gets called when the user taps Return (or in this case, Done) on the keyboard.
        */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
        /*
            Because you resign first responder status in textFieldShouldReturn, the system calls this method just after calling textFieldShouldReturn.
        */
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    
    // MARK: - Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
}


