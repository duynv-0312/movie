//
//  Urls.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import Foundation

struct Urls {
    
    static let shared = Urls()
    
    let baseUrl = "https://api.themoviedb.org/3"
    let key: String = "95d6a6ef93001af6e75d828b5716d601"
    enum Path: String {
        case topRated = "/movie/top_rated"
        case popular = "/movie/popular"
        case upComing = "/movie/upcoming"
    }
    
    func getTopRatedUrl() -> String {
        return baseUrl + Path.topRated.rawValue + "?api_key=\(key)"
    }
    
    func getPopularUrl() -> String {
        return baseUrl + Path.popular.rawValue + "?api_key=\(key)"
    }
    
    func getUpComingUrl() -> String {
        return baseUrl + Path.upComing.rawValue + "?api_key=\(key)"
    }
    
    func getImage(urlString: String) -> String {
        let urlString = "https://image.tmdb.org/t/p/w500/\(urlString)?api_key=\(key)"
        return urlString
    }
}
