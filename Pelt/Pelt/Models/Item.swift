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
    var maxValue: Float = 1.0
    var type: ItemType = .Float
    
    init() { }
    
    init(_ value: Float) {
        self.value = value
    }
    
    init(maxValue: Float, type: ItemType) {
        self.maxValue = maxValue
        self.type = type
    }
    
    func getStringValue() -> String {
        var output: String = ""
        switch type {
        case .Float:
            output =  String(value)
            break
        case .Int:
            output = String(Int(value))
            break
        }        
        return output
    }
}
