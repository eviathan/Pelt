//
//  DataModelDelegate.swift
//  Pelt
//
//  Created by Brian Williams on 14/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation
import Cocoa

protocol DataModelDelegate: class {
    func didRecieveDataUpdate(data: [String : NSColor])
}
