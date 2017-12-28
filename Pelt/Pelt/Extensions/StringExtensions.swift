//
//  StringExtensions.swift
//  Pelt
//
//  Created by Brian Williams on 28/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation

extension String {
    
    func camelCaseToWords() -> String {
        
        return unicodeScalars.reduce("") {
            
            if CharacterSet.uppercaseLetters.contains($1) == true {
                
                return ($0 + " " + String($1))
            }
            else {
                
                return $0 + String($1)
            }
        }
    }
}
