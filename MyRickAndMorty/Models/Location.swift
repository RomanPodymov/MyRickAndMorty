// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct Location: Codable {
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }

    let name: String?
    let url: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
