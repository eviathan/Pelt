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
    
    private let dataModel: Theme = Theme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataModel.delegate = self
        
        abletonView.dataSource = self
        
        colorListView.delegate = self
        colorListView.dataSource = self
    }
    
    // Actions
    @IBAction func createRandomTheme(_ sender: NSButton?) {
    }
    
    @IBAction func openDocument(_ sender: Any?) {
    }
    
    // Ableton View Delegate Methods
    func loadTheme(data: [UInt8]) -> Theme {
        return Theme()
    }
    
    func generateRandomTheme() -> Theme {
        let t = Theme()
        
        for (name, _) in dataModel.colors {
            t.colors[name] = NSColor.blue
        }
        
        return t
    }
    
    func getColorsForKeys(keys: String...) -> [String : NSColor] {
        return [String:NSColor]()
    }
}
