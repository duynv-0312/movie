//
//  MovieDetailViewController.swift
//  movie-app
//
//  Created by Duy Nguyễn on 17/02/2023.
//

import UIKit

final class MovieDetailViewController: UIViewController {

    var movie: Movie? {
        didSet {
            guard let movieDetail = movie else { return }
            updateUI(movie: movieDetail)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        
    }
    
    func loadData(movie: Movie) {
        guard let id = movie.id else { return }
        getDetail(id: id)
    }
    
    private func getDetail(id: Int) {
        APICaller.shared.getMovieDetail(id: id) { [weak self] movieDetail in
            self?.movie = movieDetail
        }
    }
    
    private func updateUI(movie: Movie) {
        // Update UI man hinh
        DispatchQueue.main.async { [weak self] in
            self?.title = movie.title
        }
    }
}
