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
    
        By adopting the UITextFieldDelegate protocol, you tell the compiler that the ViewController class 
        can act as a valid text field delegate. This means you can implement the protocol’s methods to handle 
        text input, and you can assign instances of the ViewController class as the delegate of the text field.
 */

import UIKit

class ViewController:   UIViewController,
                        UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    // MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!      // is the delegating object
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
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
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Actions
    
        /*
            GESTURE RECOGNIZER are objects that you attach to a view that allow Gesture recognizers interpret touches
            to determine whether they correspond to a specific gesture, such as a swipe, pinch, or rotation. 
            You can write an action method that is called when a gesture recognizer recognizes its assigned gesture, 
            which is exactly what you need to do for the image view.
        */
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
            // Hide the keyboard so that if the user taps the image view while typing in the text field, 
            // the keyboard is dismissed properly.
        nameTextField.resignFirstResponder()
        
            // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
            // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
            // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)

    }
    
    
    
}













