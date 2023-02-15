//
//  APICaller.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import UIKit

class APICaller {
    static let shared = APICaller()
    
    init() { }
    
    
    // lấy dữ liệu từ 1 endpoint( popular ,upcoming.....) và trả về 1 mảng movies
    
    func getListMovie(urlString: String) -> [Movie] {
        if let url = URL(string: urlString) {
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                if let error = error {
                    print("Error: \(error)")
                }
                
                do {
                    let movieRes = try JSONDecoder().decode(MovieResponse.self, from: data)
                    print(movieRes)
                } catch let error {
                    print("Decode Error: \(error)")
                }
                
            }.resume()
            
        }
        
        return []
        
    }
    
}
