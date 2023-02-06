//
//  MyRickAndMortyTests.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 02/02/2023.
//  Copyright © 2023 MyRickAndMorty. All rights reserved.
//

import Combine
import Kingfisher
@testable import MyRickAndMortyApp
import SwiftUI
import ViewInspector
import XCTest

class MyRickAndMortyTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []

    func testCharacterScreen() {
        let exp = expectation(description: "")
        MyRickAndMortyObservableObject.makeRequest().1.sink { _ in

        } receiveValue: { data in
            self.process(data: data)
            exp.fulfill()
        }.store(in: &cancellables)

        wait(for: [exp], timeout: 10)
    }

    private func process(data: CharactersData?) {
        XCTAssertNotNil(data)
        XCTAssertNotNil(data!.results)
        XCTAssert(!data!.results!.isEmpty)
        let character = data!.results![0]

        let characterScreen = CharacterScreen().environmentObject(
            CharacterData(
                id: character.id ?? 0,
                image: .init(.init(string: character.image ?? "")),
                name: character.name ?? "",
                status: character.status ?? "",
                gender: character.gender ?? "",
                species: character.species ?? ""
            )
        )

        let name = try? characterScreen.inspect().find(textWhere: { string, _ in
            string == character.name
        }).string()
        XCTAssertEqual(name, character.name)
        let status = try? characterScreen.inspect().find(textWhere: { string, _ in
            string == character.status
        }).string()
        XCTAssertEqual(status, character.status)
        let gender = try? characterScreen.inspect().find(textWhere: { string, _ in
            string == character.gender
        }).string()
        XCTAssertEqual(gender, character.gender)
        let species = try? characterScreen.inspect().find(textWhere: { string, _ in
            string == character.species
        }).string()
        XCTAssertEqual(species, character.species)
    }
}
