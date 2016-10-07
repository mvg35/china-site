//
//  scoreTaker.swift
//  Press
//
//  Created by Miguel Valdez on 4/28/16.
//  Copyright © 2016 Miguel Valdez. All rights reserved.
//

import Foundation

class scoreTaker {
    
    var score = 0;
    
    
    
    
    func printScore() {
        print(score)
    }
    
    
    func addPoint() {
        score+=1
    }
    
    func resetScore() {
        score = 0
    }
    
}