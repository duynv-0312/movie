//
//  APICaller.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import UIKit

class APICaller {
    
    static let shared = APICaller()
    
    private init() { }
    
    func getMovies(urlString: String, completion: @escaping (([Movie]) -> Void)) {
        guard let url = URL(string: urlString) else  {
            return
        }
        
        URLSession.shared.dataTask(with: url) {data,_,error in
            let decoder = JSONDecoder()
            do {
                guard let data = data else { return }
                let moviesResponse = try decoder.decode(MoviesResponse.self, from: data)
                let listMovie: [Movie] = moviesResponse.results ?? []
                completion(listMovie)
            } catch let error {
                print("Error:\(error)")
            }
        }.resume()
    }
    
    func getMovieDetail(id: Int, completion: @escaping ((Movie) -> Void)) {
        
        let urlString = Urls.shared.getMovieDetailUrl(id: id)
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            let decoder = JSONDecoder()
            
            do {
                guard let data = data else { return }
                let movieDetail = try decoder.decode(Movie.self, from: data)
                completion(movieDetail)
            } catch let error {
                print("Error:\(error)")
            }
        }.resume()
    }
}
