//
//  ViewController.swift
//  Foodtracker
//
//  Created by Kenneth Debruyn on 4/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

/*
    DELEGATION PATTERN
        - delegating object: nameTextField
                ->  keeps a reference to the other object, the delegate, and at the appropriate time,
                    the delegating object sends a message to the delegate.
                ->  it has a protocol UITextFieldDelegate
        - the message: 
                -> tells the delegate object about an event that the delegating object is about to handle or has just handled.
        - delegate object: ViewController
                -> it is very common to make a view controller the delegate for objects that it manages.
                -> it adopt the delegating object's protocol UITextFieldDelegate
    
    By adopting the UITextFieldDelegate protocol, you tell the compiler that the ViewController class can act as a valid text field delegate.
    This means you can implement the protocol’s methods to handle text input, and you can assign instances of the ViewController class as
    the delegate of the text field.
 */

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!      // is the delegating object
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        // ViewController sets itself as the delegate of its nameTextField property.
        nameTextField.delegate = self
    }
    
    
    //MARK: UITextFieldDelegate
        /*  
            The UITextFieldDelegate protocol defines eight optional methods.
            We will use textFieldShouldReturn, textFieldDidEndEditing
     
            You need to specify that the text field should resign its first-responder status 
            when the user taps a button to end editing in the text field.
            You do this in the textFieldShouldReturn(_:) method, which gets called 
            when the user taps Return (or in this case, Done) on the keyboard.
        */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
        /*
            Because you resign first responder status in textFieldShouldReturn,
            the system calls this method just after calling textFieldShouldReturn.
     
            This method gives you a chance to read the information entered into the text field 
            and do something with it. You’ll take the text that’s in the text field 
            and use it to change the value of your label.
        */
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    
    // MARK: - Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    
}



