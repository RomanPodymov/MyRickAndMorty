// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct Info: Codable {
    enum CodingKeys: String, CodingKey {
        case pages
        case count
        case next
    }

    let pages: Int?
    let count: Int?
    let next: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pages = try container.decodeIfPresent(Int.self, forKey: .pages)
        count = try container.decodeIfPresent(Int.self, forKey: .count)
        next = try container.decodeIfPresent(String.self, forKey: .next)
    }
}
