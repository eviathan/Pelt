 //
//  Document.swift
//  Pelt
//
//  Created by Brian Williams on 14/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Cocoa

class Document: NSDocument, XMLParserDelegate {

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return false
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
    }
    
    override func data(ofType typeName: String) throws -> Data {
        return App.instance.theme.serialise().data(using: .utf8)!
    }
    
    override func read(from data: Data, ofType typeName: String) throws {
        let parser = XMLParser(data: data)
        parser.delegate = self
        parser.parse()
    }
    
    // Parser Methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        // Parse Ableton atrtibute settings
        if elementName == "Ableton" {
            if let majorVersion = attributeDict["MajorVersion"] {
                App.instance.theme.majorVersion = Int(majorVersion)!;
            }
            if let minorVersion = attributeDict["MinorVersion"] {
                App.instance.theme.minorVersion = minorVersion;
            }
            if let schemaChangeCount = attributeDict["SchemaChangeCount"] {
                App.instance.theme.schemaChangeCount = Int(schemaChangeCount)!;
            }
            if let creator = attributeDict["Creator"] {
                App.instance.theme.creator = creator;
            }
            if let revision = attributeDict["Revision"] {
                App.instance.theme.revision = revision;
            }
        }
        
        // Parse Properties
        if App.instance.theme.properties[elementName] != nil {
            if let value = attributeDict["Value"] {
                 App.instance.theme.properties[elementName] = Float(value)!
            }
        }
        
        // Parse Colors
            
//            if let name = attributeDict["name"] {
//                tempTag.name = name;
//            }
//            if let c = attributeDict["count"] {
//                if let count = Int(c) {
//                    tempTag.count = count;
//                }
//            }
//            self.item.tag.append(tempTag);
        
    }
}
