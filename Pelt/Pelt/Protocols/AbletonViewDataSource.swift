//
//  AbletonViewDelagate.swift
//  Pelt
//
//  Created by Brian Williams on 12/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation
import Cocoa

protocol AbletonViewDataSource: class {
    func loadTheme(data: [UInt8]) -> Theme
    func generateRandomTheme() -> Theme
    
    func getColorsForKeys(keys: String...) -> [String : NSColor]
}
