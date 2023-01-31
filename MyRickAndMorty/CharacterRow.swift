//
//  CharacterRow.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 25/01/2023.
//  Copyright © 2023 MyRickAndMorty. All rights reserved.
//

import Kingfisher
import SwiftUI
import SwiftUI_CSS

struct CharacterRow: View {
    @EnvironmentObject var data: CharacterData

    var body: some View {
        HStack(alignment: .center) {
            data.image.resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .addClassName(Style.charactersScreenRowImage)
            VStack(alignment: .leading) {
                Text(data.name)
                    .addClassName(Style.charactersScreenRowTitle)
                Text(data.status)
                    .addClassName(Style.charactersScreenRowDescription)
            }
        }
        .addClassName(Style.charactersScreenRow)
    }
}
