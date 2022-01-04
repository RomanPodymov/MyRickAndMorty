//
//  MyRickAndMortyObservableObject.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 04/01/2022.
//  Copyright © 2022 MyRickAndMorty. All rights reserved.
//

import Combine
import CombineMoya
import Foundation
import Moya

final class MyRickAndMortyObservableObject: ObservableObject {
    @Published var charactersData: CharactersData?

    private var cancellableSet = Set<AnyCancellable>()

    func loadCharactersData() {
        let provider = MoyaProvider<MyRickAndMortyWebService>()
        provider.requestPublisher(.characters)
            .tryMap { responseAndData -> Data in
                guard let httpResponse = responseAndData.response,
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
                    self?.charactersData = value
                }
            ).store(in: &cancellableSet)
    }
}
