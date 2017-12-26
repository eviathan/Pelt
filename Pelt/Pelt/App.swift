//
//  App.swift
//  Pelt
//
//  Created by Brian Williams on 14/12/2017.
//  Copyright © 2017 Brian Williams. All rights reserved.
//

import Foundation

class App {
    static let instance = App()
    
    let theme: Theme = Theme()
    
    private init() { }
    func poke() {
        print("Starting App...")
    }
}
