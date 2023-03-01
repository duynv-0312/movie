//
//  MovieDetailViewController.swift
//  movie-app
//
//  Created by Duy Nguyễn on 17/02/2023.
//

import UIKit
import SDWebImage

final class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterBackgroundView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieTime: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overviewHeader: UILabel!
    @IBOutlet weak var overviewDescription: UILabel!
    @IBOutlet weak var movieFavorite: UIButton!
    
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
        posterBackgroundView.layer.cornerRadius = 12
        posterBackgroundView.contentMode = .scaleToFill
        
        
        posterImageView.layer.cornerRadius = 12
        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleAspectFill
        
        movieName.font = .boldSystemFont(ofSize: 18)

        movieTime.font = .systemFont(ofSize: 15,weight: .light)
        movieTime.textColor = .secondaryLabel
        
        releaseDate.font = .systemFont(ofSize: 15, weight: .light)
        releaseDate.textColor = .secondaryLabel
        
        overviewHeader.font = .boldSystemFont(ofSize: 24)
        overviewHeader.text = "Overview"
        
        overviewDescription.textColor = .secondaryLabel
        overviewDescription.numberOfLines = 0
        movieFavorite.tintColor = .lightGray
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        movieFavorite.tintColor =  movieFavorite.tintColor == .systemPink ? .lightGray : .systemPink
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.title = movie.title
            
            let backDropImageString = Urls.shared.getImage(urlString: movie.backDropPath ?? "")
            let backDropUrl = URL(string: backDropImageString)
            self?.backDropImageView.sd_setImage(with: backDropUrl)
            
            let posterImageString = Urls.shared.getImage(urlString: movie.poster ?? "")
            let posterUrl = URL(string: posterImageString)
            self?.posterImageView.sd_setImage(with: posterUrl)
            
            self?.movieName.text = movie.title
            self?.movieTime.text = "Runtime: \(movie.runtime ?? 0)"
            self?.releaseDate.text = "Release Date: " + (movie.releaseDate ?? "")
            self?.overviewDescription.text = movie.overview
        }
    }
}
