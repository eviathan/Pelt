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
    
    var isInsideColor: Bool = false
    var currentColorKey: String = ""
    var currentRedValue: CGFloat = 0.0
    var currentGreenValue: CGFloat = 0.0
    var currentBlueValue: CGFloat = 0.0
    var currentAlphaValue: CGFloat = 0.0
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        // Parse Colors
        if isInsideColor && App.instance.theme.colors[currentColorKey] != nil {
            isInsideColor = false
            App.instance.theme.colors[currentColorKey] = NSColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: currentAlphaValue)
        }
    }
    
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
        if App.instance.theme.colors[elementName] != nil {
            currentColorKey = elementName
            isInsideColor = true
        }
        
        // Parse Color Data
        if elementName == "R" {
            if let value = attributeDict["Value"] {
                currentRedValue = CGFloat(Float(value)!/255.0)
            }
        }
        if elementName == "G" {
            if let value = attributeDict["Value"] {
                currentGreenValue = CGFloat(Float(value)!/255.0)
            }
        }
        if elementName == "B" {
            if let value = attributeDict["Value"] {
                currentBlueValue = CGFloat(Float(value)!/255.0)
            }
        }
        if elementName == "Alpha" {
            if let value = attributeDict["Value"] {
                currentAlphaValue = CGFloat(Float(value)!/255.0)
            }
        }
    }
}
