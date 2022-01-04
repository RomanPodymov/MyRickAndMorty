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
                    ForEach(myRickAndMortyObservableObject.charactersData?.results ?? []) { data in
                        NavigationLink(
                            destination: KFImage(
                                URL(string: data.image ?? "")!
                            ).resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        ) {
                            HStack(alignment: .top) {
                                KFImage(URL(string: data.image ?? "")!).resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                VStack(alignment: .leading) {
                                    Text(data.name ?? "").font(.headline).foregroundColor(.black)
                                    Text(data.status ?? "").font(.body).foregroundColor(.black)
                                }
                            }
                            .frame(width: 300, alignment: .leading)
                            .padding()
                            .background(Color(white: 0.5))
                            .cornerRadius(20)
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
}

extension Results: Identifiable {}
