//
//  MainSplitView.swift
//  Pelt
//
//  Created by Brian Williams on 27/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation
import Cocoa

class MainSplitView: NSSplitView {
    override func viewWillDraw() {
        setPosition(CGFloat(294), ofDividerAt: 0)
    }
    override func drawDivider(in rect: NSRect) {
        
    }
    override var dividerThickness: CGFloat {
        get {
            return 0.0
        }
    }
}
