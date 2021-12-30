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
    @EnvironmentObject var myRickAndMortyWebService: MyRickAndMortyWebService

    var body: some View {
        NavigationView {
            ScrollView {
                Text("Characters")
                    .font(.title)
                    .bold()

                VStack(alignment: .leading) {
                    ForEach(myRickAndMortyWebService.charactersData?.results ?? []) { data in
                        HStack(alignment: .top) {
                            KFImage(URL(string: data.image ?? "")!).resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(data.name ?? "").bold()
                                Text(data.status ?? "")

                                NavigationLink(destination: Text("Detail screen")) {
                                    Text("Detail screen")
                                }
                            }
                        }
                        .frame(width: 300, alignment: .leading)
                        .padding()
                        .background(Color(white: 0.5))
                        .cornerRadius(20)
                    }
                }
            }
            .padding(.vertical)
            .onAppear {
                myRickAndMortyWebService.loadCharactersData()
            }
        }
    }
}

extension Results: Identifiable {}
