//
//  ASKStoreType.swift
//  Pelt
//
//  Created by Brian Williams on 15/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation
import CoreData

class ASKAtomicStore: NSAtomicStore {
    
    override func load() throws {
        
    }
    
    override func newCacheNode(for managedObject: NSManagedObject) -> NSAtomicStoreCacheNode {
        return NSAtomicStoreCacheNode()
    }
    
    override func newReferenceObject(for managedObject: NSManagedObject) -> Any {
        return String()
    }
    
    override func save() throws {
        
    }
    
    override func updateCacheNode(_ node: NSAtomicStoreCacheNode, from managedObject: NSManagedObject) {
        
    }
}
