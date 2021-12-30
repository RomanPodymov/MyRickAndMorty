// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct Origin: Codable {
    enum CodingKeys: String, CodingKey {
        case url
        case name
    }

    let url: String?
    let name: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
