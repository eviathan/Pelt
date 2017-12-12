//
//  AbletonViewController.swift
//  Pelt
//
//  Created by Brian Williams on 12/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Cocoa

class AbletonViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource, AbletonViewDelegate {
    func convertToTheme() -> [UInt8] {
        return [UInt8]()
    }
    

    @IBOutlet weak var abletonView: AbletonView!
    @IBOutlet weak var colorListView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }    
}
