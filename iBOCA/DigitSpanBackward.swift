//
//  DigitSpanBackward.swift
//  iBOCA
//
//  Created by saman on 6/11/17.
//  Copyright © 2017 sunspot. All rights reserved.
//

import Foundation

import UIKit

class DigitSpanBackward:DigitBothDirection {
    
    override func ProcesString(val: String) -> String {
        return String(val.characters.reversed())
    }
    
    override func TestInitialize() {
        testName =  "Backward Digit Span Test"
        testStatus = TestBackwardsDigitSpan
    }
    
    override func LevelStart() -> Int {
        return 3
    }
    
    override func LevelEnd() -> Int {
        return 8
    }
}

