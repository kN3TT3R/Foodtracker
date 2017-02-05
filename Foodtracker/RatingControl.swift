//
//  RatingControl.swift
//  Foodtracker
//
//  Created by Kenneth Debruyn on 5/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

/*
        To be able to rate a meal, users need a control that lets them select the number of stars they want to assign to the meal. 
        You’ll create a stack view subclass that manages a row of buttons representing the stars. 
        You’ll define your custom control entirely in code, and then add it to your storyboard.
 
        When a user taps a star, that star and the stars preceding it are filled in. If the user taps the rightmost filled in star (the star associated with the current rating), the rating is cleared and all stars are displayed as empty.
 
        You typically create a view in one of two ways: by programatically initializing the view, or by allowing the view to be loaded by the storyboard.
        There’s a corresponding initializer for each approach: 
            - init(frame:) for programatically initializing the view and 
            - init?(coder:) for loading the view from the storyboard.
 
        Recall that an initializer is a method that prepares an instance of a class for use, which involves setting an initial value for each property and performing any other setup.
 
        You will need to implement both of these methods in your custom control. While designing the app, Interface Builder programatically instantiates the view when you add it to the canvas. At runtime, your app loads the view from the storyboard.
    
        Swift handles initializers differently than other methods. If you don’t provide any initializers, Swift classes automatically inherit all of their super class’s designated initializers. If you implement any initializers, you not longer inherit any of the superclasses initializers; however, the superclass can mark one or more of its initializers as required. The subclass must implement (or automatically inherit) all of the required initializers. Furthermore, the subclass must mark their initializers as required, indicating that their subclasses must also implement the initializers.
 */

import UIKit


class RatingControl: UIStackView {

    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}











