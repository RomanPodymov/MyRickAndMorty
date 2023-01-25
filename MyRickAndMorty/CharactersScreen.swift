//
//  CharactersScreen.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 30/12/2021.
//  Copyright © 2021 MyRickAndMorty. All rights reserved.
//

import Kingfisher
import SwiftUI

private struct CharacterData {
    let id: Int
    let image: KFImage
    let name: String
    let status: String
}

extension CharacterData: Identifiable {}

struct CharactersScreen: View {
    @EnvironmentObject var myRickAndMortyObservableObject: MyRickAndMortyObservableObject

    var body: some View {
        NavigationView {
            ScrollView {
                Text(L10n.CharactersScreen.title)
                    .font(.title)
                    .bold()

                VStack(alignment: .leading) {
                    ForEach(charactersData) { data in
                        NavigationLink(
                            destination: detailScreen(data: data)
                        ) {
                            row(data: data)
                        }
                    }
                }
            }
            .padding(.vertical)
            .onAppear {
                myRickAndMortyObservableObject.loadCharactersData()
            }
        }
    }

    private var charactersData: [CharacterData] {
        (myRickAndMortyObservableObject.charactersData?.results ?? []).compactMap { data in
            guard let url = URL(string: data.image ?? "") else {
                return nil
            }
            return .init(id: data.id ?? 0, image: KFImage(url), name: data.name ?? "", status: data.status ?? "")
        }
    }

    private func row(data: CharacterData) -> some View {
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

    private func detailScreen(data: CharacterData) -> some View {
        data.image.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
}
