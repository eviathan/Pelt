//
//  ColorWell.swift
//  Pelt
//
//  Created by Brian Williams on 28/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Cocoa

class ColorWell: NSColorWell {
    
    override func hitTest(_ point: NSPoint) -> NSView? {
        return superview?.hitTest(_:point)
    }    
}
