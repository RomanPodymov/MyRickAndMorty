// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct CharactersData: Codable {
    enum CodingKeys: String, CodingKey {
        case results
        case info
    }

    let results: [Results]?
    let info: Info?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decodeIfPresent([Results].self, forKey: .results)
        info = try container.decodeIfPresent(Info.self, forKey: .info)
    }
}
