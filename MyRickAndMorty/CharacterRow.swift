//
//  CharacterRow.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 25/01/2023.
//  Copyright © 2023 MyRickAndMorty. All rights reserved.
//

import Kingfisher
import SwiftUI

struct CharacterRow: View {
    @EnvironmentObject var data: CharacterData

    var body: some View {
        HStack(alignment: .top) {
            data.image.resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(data.name).font(.headline).foregroundColor(.black)
                Text(data.status).font(.body).foregroundColor(.black)
            }
        }
        .frame(width: 300, alignment: .leading)
        .padding()
        .background(Color(white: 0.5))
        .cornerRadius(20)
    }
}
