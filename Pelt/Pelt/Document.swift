 //
//  Document.swift
//  Pelt
//
//  Created by Brian Williams on 14/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Cocoa

class Document: NSPersistentDocument {

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
    }
    
    override func data(ofType typeName: String) throws -> Data {
        if let _ = self.windowControllers[0].contentViewController as? ColorListViewController {
            //Get the textView's String Value; or call a function that will create a string of what needs to be saved
            return App.instance.theme.serialise().data(using: .utf8)!
        }else {
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
    }

}
