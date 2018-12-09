 //
//  Document.swift
//  Pelt
//
//  Created by Brian Williams on 14/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Cocoa
import SWXMLHash

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
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
    }
    
    override func data(ofType typeName: String) throws -> Data {
        return App.instance.theme.serialise().data(using: .utf8)!
    }
    
    override func read(from url: URL, ofType typeName: String) throws {
        
        let dataString = try String(contentsOf: url, encoding: .utf8)
        let xml = SWXMLHash.parse(dataString)
        let ableton = xml["Ableton"]
        let skinManager = ableton["SkinManager"]
        
        
        // Ableton Attributes
        if let majorVersion = ableton.element?.attribute(by: "MajorVersion")?.text {
            App.instance.theme.majorVersion = Int(majorVersion)!
        }
        if let minorVersion = ableton.element?.attribute(by: "MinorVersion")?.text {
            App.instance.theme.minorVersion = minorVersion
        }
        if let schemaChangeCount = ableton.element?.attribute(by: "SchemaChangeCount")?.text {
            App.instance.theme.schemaChangeCount = Int(schemaChangeCount)!
        }
        if let creator = ableton.element?.attribute(by: "Creator")?.text {
            App.instance.theme.creator = creator
        }
        if let revision = ableton.element?.attribute(by: "Revision")?.text {
            App.instance.theme.revision = revision
        }
    
        // Skin Manager
       _ = skinManager.children.map({ elm in
            if let element = elm.element {
                if App.instance.theme.colors[element.name] != nil {
                    setColor(elm)
                }
                if App.instance.theme.properties[element.name] != nil {
                    setProperty(elm)
                }
            }
        })
    }
    
    private func setColor(_ indexer: XMLIndexer) {
        let red: CGFloat = CGFloat(Float(indexer["R"].element!.attribute(by: "Value")!.text)!/255.0)
        let green: CGFloat = CGFloat(Float(indexer["G"].element!.attribute(by: "Value")!.text)!/255.0)
        let blue: CGFloat = CGFloat(Float(indexer["B"].element!.attribute(by: "Value")!.text)!/255.0)
        let alpha: CGFloat = CGFloat(Float(indexer["Alpha"].element!.attribute(by: "Value")!.text)!/255.0)
        App.instance.theme.colors[(indexer.element?.name)!] = NSColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    private func setProperty(_ indexer: XMLIndexer) {
        if let item = App.instance.theme.properties[(indexer.element?.name)!] {
            let stringValue = indexer.element!.attribute(by: "Value")!.text
            item.value = Float(stringValue)!        
            App.instance.theme.properties[(indexer.element?.name)!] = item
        }
    }
}
