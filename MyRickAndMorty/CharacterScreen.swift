//
//  CharacterScreen.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 25/01/2023.
//  Copyright © 2023 MyRickAndMorty. All rights reserved.
//

import Kingfisher
import SwiftUI

struct CharacterScreen: View {
    @EnvironmentObject var data: CharacterData

    var body: some View {
        data.image.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}
