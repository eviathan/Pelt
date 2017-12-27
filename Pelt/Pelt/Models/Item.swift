//
//  Color.swift
//  Pelt
//
//  Created by Brian Williams on 17/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation

class Item {
    var value: Float = 0.0
    var multiplier: Float = 1.0
    var maxValue: Float = 1.0
    var type: ItemType = .Float
    
    init() { }
    
    init(_ value: Float) {
        self.value = value
    }
    
    init(multiplier: Float, maxValue: Float) {
        self.multiplier = multiplier
        self.maxValue = maxValue
    }
    
    func getStringValue() -> String {
        var output: String = ""
        switch type {
        case .Float:
            output =  String(value*multiplier)
            break
        case .Int:
            output = String(Int(value*multiplier))
            break
        }        
        return output
    }
}
