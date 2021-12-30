// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct Results: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case image
        case location
        case gender
        case episode
        case created
        case species
        case url
        case status
        case origin
        case id
    }

    let name: String?
    let type: String?
    let image: String?
    let location: Location?
    let gender: String?
    let episode: [String]?
    let created: String?
    let species: String?
    let url: String?
    let status: String?
    let origin: Origin?
    let id: Int?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        location = try container.decodeIfPresent(Location.self, forKey: .location)
        gender = try container.decodeIfPresent(String.self, forKey: .gender)
        episode = try container.decodeIfPresent([String].self, forKey: .episode)
        created = try container.decodeIfPresent(String.self, forKey: .created)
        species = try container.decodeIfPresent(String.self, forKey: .species)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        origin = try container.decodeIfPresent(Origin.self, forKey: .origin)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
}
