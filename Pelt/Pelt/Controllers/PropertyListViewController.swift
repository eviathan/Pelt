//
//  PropertyListViewController.swift
//  Pelt
//
//  Created by Brian Williams on 26/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation
import Cocoa

class PropertyListViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {   
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 0
    }
    
//    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
//        return CGFloat(50.0)
//    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//        if(tableColumn?.identifier.rawValue == "colorCell") {
//            let result = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "colorCell"), owner: self) as! ColorPickerTableCellView
//            let colorKey = Array(App.instance.theme.colors.keys)[row]
//            let color = App.instance.theme.colors[colorKey]
//
//            result.label.stringValue = colorKey
//            result.color.color = color!
//
//            return result
//        }
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
    }
}
