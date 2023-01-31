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
import SwiftUI_CSS

struct CharacterScreen: View {
    @EnvironmentObject var data: CharacterData

    var body: some View {
        ZStack {
            Image(uiImage: RickAndMortyAssets.hero)
                .aspectRatio(contentMode: .fit)
            VStack {
                data.image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .addClassName(Style.characterScreenImage)
                Text(data.name)
                    .addClassName(Style.characterScreenLabel)
                Text(data.status)
                    .addClassName(Style.characterScreenLabel)
                Text(data.gender)
                    .addClassName(Style.characterScreenLabel)
                Text(data.species)
                    .addClassName(Style.characterScreenLabel)
            }
        }
    }
}
