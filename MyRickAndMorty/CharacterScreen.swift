//
//  CharacterScreen.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 25/01/2023.
//  Copyright © 2023 MyRickAndMorty. All rights reserved.
//

import Kingfisher
import RickAndMorty
import SwiftUI

struct CharacterScreen: View {
    @EnvironmentObject var data: CharacterData

    var body: some View {
        ZStack {
            Image(uiImage: RickAndMortyAssets.hero)
                .aspectRatio(contentMode: .fit)
            VStack {
                data.image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                Text(data.name)
            }
        }
    }
}
