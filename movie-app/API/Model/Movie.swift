//
//  Movie.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import Foundation

struct Movie: Codable {
    var title: String?
    var poster: String?
    var releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case poster = "poster_path"
        case releaseDate = "release_date"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try value.decodeIfPresent(String.self, forKey: .title)
        poster = try value.decodeIfPresent(String.self, forKey: .poster)
        releaseDate = try value.decodeIfPresent(String.self, forKey: .releaseDate)
    }
}
