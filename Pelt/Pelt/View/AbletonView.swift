//
//  AbletonView.swift
//  Pelt
//
//  Created by Brian Williams on 12/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Cocoa

class AbletonView: NSView {

    weak var dataSource: AbletonViewDataSource?
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        self.layer?.sublayers = nil
        self.layer?.addSublayer(drawTheme())
    }
    
    private func drawTheme() -> CALayer {
        let layer = CALayer()
        
        layer.addSublayer(drawFrame(dataSource?.getColorsForKeys(keys: "Thingy")))
        layer.addSublayer(drawArrangementView(dataSource?.getColorsForKeys(keys: "Thingy")))
        
        return layer
    }
    
    private func drawFrame(_ colors: [String : NSColor]) -> CALayer {
        return CALayer()
    }
    
    private func drawArrangementView(_ colors: [String : NSColor]) -> CALayer {
        return CALayer()
    }
}
