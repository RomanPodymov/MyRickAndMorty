//
//  MyRickAndMortyApp.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 30/12/2021.
//  Copyright © 2021 MyRickAndMorty. All rights reserved.
//

import SwiftUI

@main
struct MyRickAndMortyApp: App {
    var myRickAndMortyWebService = MyRickAndMortyWebService()

    var body: some Scene {
        WindowGroup {
            CharactersScreen().environmentObject(myRickAndMortyWebService)
        }
    }
}
