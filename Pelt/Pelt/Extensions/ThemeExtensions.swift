//
//  ThemeExtensions.swift
//  Pelt
//
//  Created by Brian Williams on 14/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation

// TECHDEBT! - LATE STUPID LAZY CODE!!! PLEASE IGNORE!
// NOTE: This whole file is completely stupid. Refactor to use a library. Its such a small task though I was too lazy to find one.
extension CGFloat {
    func convert() -> Int{
        return Int(self * 256)
    }
}

extension Theme {
    func serialise() -> String {
        return "<test></test>"
        let props: String = self.properties.map { key, value in "<\(key) Value\"\(value)\">" }.joined()
        
        let colors: String = self.colors.map { key, value in "<\(key)><R Value=\"\(value.redComponent.convert())\" /><G Value=\"\(value.greenComponent.convert())\" /><B Value=\"\(value.blueComponent.convert())\" /><Alpha Value=\"\(value.alphaComponent.convert())\" /></\(key)>" }.joined()
        
        return "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Ableton MajorVersion=\"\(self.majorVersion)\" MinorVersion=\"\(self.minorVersion)\" SchemaChangeCount=\"\(self.schemaChangeCount)\" Creator=\"\(self.creator)\" Revision=\"\(self.revision)\"><SkinManager>\(props)\(colors)</SkinManager></Ableton>"
    }
}
extension String {
    func deserialise() -> Theme{
        return Theme()
    }
}
