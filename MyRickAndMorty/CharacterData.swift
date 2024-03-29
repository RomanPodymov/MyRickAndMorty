//
//  CharacterData.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 25/01/2023.
//  Copyright © 2023 MyRickAndMorty. All rights reserved.
//

import Kingfisher
import SwiftUI

final class CharacterData: ObservableObject {
    let id: Int
    let image: KFImage
    let name: String
    let status: String
    let gender: String
    let species: String

    init(id: Int, image: KFImage, name: String, status: String, gender: String, species: String) {
        self.id = id
        self.image = image
        self.name = name
        self.status = status
        self.gender = gender
        self.species = species
    }
}

extension CharacterData: Identifiable {}
