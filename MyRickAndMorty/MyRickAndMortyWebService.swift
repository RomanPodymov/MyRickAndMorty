//
//  MyRickAndMortyWebService.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 30/12/2021.
//  Copyright © 2021 MyRickAndMorty. All rights reserved.
//

import Combine
import Foundation

final class MyRickAndMortyWebService: ObservableObject {
    @Published var charactersData: CharactersData?

    private var cancellableSet = Set<AnyCancellable>()

    func loadCharactersData() {
        let request = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character")!)
        URLSession.shared.dataTaskPublisher(
            for: request
        ).tryMap { responseAndData -> Data in
            guard let httpResponse = responseAndData.response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else {
                throw URLError(.badServerResponse)
            }
            return responseAndData.data
        }
        .decode(
            type: CharactersData.self, decoder: JSONDecoder()
        ).sink(
            receiveCompletion: { _ in

            },
            receiveValue: { [weak self] value in
                DispatchQueue.main.async {
                    self?.charactersData = value
                }
            }
        ).store(in: &cancellableSet)
    }
}
