//
//  AbletonViewController.swift
//  Pelt
//
//  Created by Brian Williams on 12/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Cocoa

class AbletonViewController: NSViewController,
                             NSTableViewDelegate,
                             NSTableViewDataSource,
                             AbletonViewDataSource {
    // Outlets
    @IBOutlet weak var abletonView: AbletonView!
    @IBOutlet weak var colorListView: NSTableView!
    
    var theme: Theme = Theme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        abletonView.dataSource = self
        
        colorListView.delegate = self
        colorListView.dataSource = self
        
        // Do view setup here.
        //theme = generateRandomTheme()
    }
    
    // Actions
    @IBAction func createRandomTheme(_ sender: NSButton?) {
        theme = generateRandomTheme()
    }
    
    @IBAction func openDocument(_ sender: Any?) {
        theme = generateRandomTheme()
    }
    
    // Ableton View Delegate Methods
    func loadTheme(data: [UInt8]) -> Theme {
        return Theme()
    }
    
    func generateRandomTheme() -> Theme {
        let t = Theme()
        
        for (name, _) in theme.colors {
            t.colors[name] = NSColor.blue
        }
        
        return t
    }
    
    func getColorsForKeys(keys: String...) -> [String : NSColor] {
        return [String:NSColor]()
    }
}
