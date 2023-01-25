//
//  CharactersScreen.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 30/12/2021.
//  Copyright © 2021 MyRickAndMorty. All rights reserved.
//

import Kingfisher
import SwiftUI

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
                            destination: CharacterScreen().environmentObject(data)
                        ) {
                            CharacterRow().environmentObject(data)
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
}
