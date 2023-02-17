//
//  Movie.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import Foundation

struct Movie: Codable {
    var id: Int?
    var title: String?
    var poster: String?
    var releaseDate: String?
    
    var overview: String?
    var runtime: Int?
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case poster = "poster_path"
        case releaseDate = "release_date"
        
        case overview = "overview"
        case runtime = "runtime"
        case voteAverage = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
          
        id = try value.decodeIfPresent(Int.self, forKey: .id)
        title = try value.decodeIfPresent(String.self, forKey: .title)
        poster = try value.decodeIfPresent(String.self, forKey: .poster)
        releaseDate = try value.decodeIfPresent(String.self, forKey: .releaseDate)
        
        overview = try value.decodeIfPresent(String.self, forKey: .overview)
        runtime = try value.decodeIfPresent(Int.self, forKey: .runtime)
        voteAverage = try value.decodeIfPresent(Double.self, forKey: .voteAverage)
    }
}
