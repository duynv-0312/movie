//
//  MovieResponse.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import Foundation

struct MoviesResponse: Codable {
    var results: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        results = try value.decodeIfPresent([Movie].self, forKey: .results)
    }
}

