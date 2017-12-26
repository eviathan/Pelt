//
//  AbletonViewController.swift
//  Pelt
//
//  Created by Brian Williams on 12/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Cocoa

class ColorListViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource, DataModelDelegate {
    
    // Outlets
    @IBOutlet weak var colorListView: NSTableView!
    
    private let dataModel: Theme = Theme()
    private var selectedRow: Int = 0
    
//    override var representedObject: Any? {
//        didSet {
//            // Update the view, if already loaded.
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataModel.delegate = self
//        abletonView.dataSource = self
        colorListView.delegate = self
        colorListView.dataSource = self
    }
    
    // Actions
    @IBAction func colorDidChange(_ sender: NSColorWell) {
        let row = colorListView.row(for: sender as NSView)
        let colorKey = Array(App.instance.theme.colors.keys)[row]
        App.instance.theme.colors[colorKey] = sender.color
        colorListView.reloadData()
    }
    
    // DataModelDelegate Methods
    func didRecieveDataUpdate(theme: Theme) {
        // TODO: IMPLEMENT THIS!
    }
    
    // Color List Delegate & DataSource Methods
    func numberOfRows(in tableView: NSTableView) -> Int {
         return App.instance.theme.colors.count
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return CGFloat(50.0)
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if(tableColumn?.identifier.rawValue == "colorCell") {
            let result = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "colorCell"), owner: self) as! ColorPickerTableCellView
            let colorKey = Array(App.instance.theme.colors.keys)[row]
            let color = App.instance.theme.colors[colorKey]
            
            result.label.stringValue = colorKey
            result.color.color = color!
            
            return result
        }        
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        let tv = notification.object as! NSTableView
        let row = tv.selectedRow
        
        App.instance.theme.selectedKey = Array(App.instance.theme.colors.keys)[row]
        
        if NSColorPanel.sharedColorPanelExists {
            NSColorPanel.shared.close()
        }
        
        let colorPanel = NSColorPanel.shared
        NSColorPanel.shared.color = App.instance.theme.colors[App.instance.theme.selectedKey]!
        colorPanel.setTarget(self)
        colorPanel.setAction(#selector(colorPicked))
        colorPanel.makeKeyAndOrderFront(self)
        colorPanel.isContinuous = true
    }
    
    @objc func colorPicked(sender:NSColorPanel) {
        App.instance.theme.colors[App.instance.theme.selectedKey] = sender.color
        
        let rowToSelect = colorListView.selectedRowIndexes
        colorListView.reloadData(forRowIndexes: rowToSelect, columnIndexes: NSIndexSet(index: 0) as IndexSet)
        colorListView.selectRowIndexes(rowToSelect, byExtendingSelection: false)        
    }
    
    // Ableton View Delegate Methods
//    func loadTheme(data: [UInt8]) -> Theme {
//        return Theme()
//    }
//
//    func generateRandomTheme() -> Theme {
//        let t = Theme()
//
//        for (name, _) in dataModel.colors {
//            t.colors[name] = NSColor.blue
//        }
//
//        return t
//    }
//
//    func getColorsForKeys(keys: String...) -> [String : NSColor] {
//        return [String:NSColor]()
//    }
}
