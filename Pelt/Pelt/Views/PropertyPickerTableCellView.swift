//
//  ColourPickerTableCellView.swift
//  Pelt
//
//  Created by Brian Williams on 24/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation
import Cocoa

@IBDesignable
class ColorPickerTableCellView: NSTableCellView {
    @IBOutlet weak var color: NSColorWell!    
    @IBOutlet weak var label: NSTextField!
}
