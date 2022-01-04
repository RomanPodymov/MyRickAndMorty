//
//  MyRickAndMortyWebService.swift
//  MyRickAndMorty
//
//  Created by Roman Podymov on 30/12/2021.
//  Copyright © 2021 MyRickAndMorty. All rights reserved.
//

import Combine
import Foundation
import Moya

enum MyRickAndMortyWebService {
    case characters
}

extension MyRickAndMortyWebService: TargetType {
    var baseURL: URL { URL(string: "https://rickandmortyapi.com/api")! }

    var path: String {
        switch self {
        case .characters:
            return "character"
        }
    }

    var method: Moya.Method {
        switch self {
        case .characters:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .characters:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        nil
    }
}
