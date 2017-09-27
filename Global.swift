//
//  Global.swift
//  Waves
//
//  Created by James Arnold on 3/6/17.
//  Copyright © 2017 James Arnold. All rights reserved.
//

import Foundation
//All the global variables
class Global {
    
    var frequency: Double
    var note: String
    
    
    init(frequency: Double, note: String) {
        self.frequency = frequency
        self.note = note
    }
    
   
    
}
var global = Global(frequency:0.0, note: "C")
