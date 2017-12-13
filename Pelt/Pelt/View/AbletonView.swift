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
        
        if let theme = dataSource?.theme {
            self.layer?.sublayers = nil
            self.layer?.addSublayer(drawTheme(theme))
        }
    }
    
    private func drawTheme(_ theme: Theme) -> CALayer {
        let layer = CALayer()
        
        layer.addSublayer(drawFrame(theme))
        layer.addSublayer(drawArrangementView(theme))
        
        return layer
    }
    
    private func drawFrame(_ theme: Theme) -> CALayer {
        return CALayer()
    }
    
    private func drawArrangementView(_ theme: Theme) -> CALayer {
        return CALayer()
    }
}
