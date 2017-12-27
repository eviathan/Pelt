//
//  PropertyListViewController.swift
//  Pelt
//
//  Created by Brian Williams on 26/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation
import Cocoa

class PropertyListViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource, DataModelDelegate {
    
    // Outlets
    @IBOutlet weak var propertyListView: NSTableView!
    
    private var dataModel: Theme = Theme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        propertyListView.delegate = self
        propertyListView.dataSource = self
    }
    
    // DataModelDelegate Methods
    func didRecieveDataUpdate(theme: Theme) {
        // TODO: Implement this properly
    }
    
    // Properties List Methods
    func numberOfRows(in tableView: NSTableView) -> Int {
        return App.instance.theme.properties.count
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return CGFloat(58.0)
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let propertyCellId = "propertyCell"
        if(tableColumn?.identifier.rawValue == propertyCellId) {
            let result = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: propertyCellId), owner: self) as! PropertyPickerTableCellView
            
            let propertyKey = Array(App.instance.theme.properties.keys)[row]
            let propertyValue = App.instance.theme.properties[propertyKey]

            result.label.stringValue = propertyKey
            
            result.propertySlider.maxValue = Double((propertyValue?.maxValue)!)
            result.propertySlider.floatValue = (propertyValue?.value)!

            return result
        }
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
    }
}
