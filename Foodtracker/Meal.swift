//
//  Meal.swift
//  Foodtracker
//
//  Created by Kenneth Debruyn on 5/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//


import Foundation
import UIKit


class Meal {
    
    // MARK: - Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
//        // Initialization should fail if there is no name or if the rating is negative.
//        if name.isEmpty || rating < 0  {
//            return nil
//        }
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}













