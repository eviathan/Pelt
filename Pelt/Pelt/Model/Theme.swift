//
//  Theme.swift
//  Pelt
//
//  Created by Brian Williams on 12/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation
import Cocoa

class Theme {
    
    let majorVersion: Int = 5
    let minorVersion: String = "10.0_370"
    let schemaChangeCount: Int = 1
    let creator: String = "Pelt 1.0"
    let revision: String = "b8761d5b3a670e00b16e716b603a7c9f50dcfcb0" // NOTE: This needs to be changed
    
    var skinManager: [String : NSColor] = [
        "controlForeground" : NSColor.gray,
        "textDisabled" : NSColor.gray,
        "controlDisabled" : NSColor.gray,
        "meterBackground" : NSColor.gray,
        "inactiveSessionArrangerSelector" : NSColor.gray,
        "surfaceHighlight" : NSColor.gray,
        "surfaceArea" : NSColor.gray,
        "desktop" : NSColor.gray,
        "viewCheckControlEnabledOn" : NSColor.gray,
        "externalScrollBar" : NSColor.gray,
        "internalScrollBar" : NSColor.gray,
        "detailViewBackground" : NSColor.gray,
        "preferencesTab" : NSColor.gray
    ]
    
    weak var delegate: DataModelDelegate?
    
    func requestData(){
        let data: [String : NSColor] = [String : NSColor]()

        if let d = delegate {
            d.didRecieveDataUpdate(data: data)
        }
    }
}
