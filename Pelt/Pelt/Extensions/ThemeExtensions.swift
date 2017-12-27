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
        return Int(self * 255)
    }
}

extension Theme {
    func serialise() -> String {
        
        let props: String = self.properties.map { key, value in "<\(key) Value=\"\(value)\" />\n" }.joined()
        
        let colors: String = self.colors.map { key, value in "<\(key)>\n<R Value=\"\(value.redComponent.convert())\" />\n<G Value=\"\(value.greenComponent.convert())\" />\n<B Value=\"\(value.blueComponent.convert())\" />\n<Alpha Value=\"\(value.alphaComponent.convert())\" />\n</\(key)>\n" }.joined()
        
        return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Ableton MajorVersion=\"\(self.majorVersion)\" MinorVersion=\"\(self.minorVersion)\" SchemaChangeCount=\"\(self.schemaChangeCount)\" Creator=\"\(self.creator)\" Revision=\"\(self.revision)\">\n<SkinManager>\n\(props)\(colors)</SkinManager>\n</Ableton>"
    }
}
