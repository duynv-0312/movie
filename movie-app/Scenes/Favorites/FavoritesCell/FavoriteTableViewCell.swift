//
//  FavoriteTableViewCell.swift
//  movie-app
//
//  Created by Duy Nguyễn on 07/03/2023.
//

import UIKit

final class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.layer.cornerRadius = 12
        
        movieNameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        releaseDate.font = .systemFont(ofSize: 12, weight: .light)
        releaseDate.textColor = .secondaryLabel
    }
    
    func configCell(movie: Movie) {
        movieNameLabel.text = movie.title
        releaseDate.text = movie.releaseDate
        movieImageView.layer.cornerRadius = 12
        let movieImageString = Urls.shared.getImage(urlString: movie.poster ?? "")
        let movieUrl = URL(string: movieImageString)
        movieImageView.sd_setImage(with: movieUrl)
    }
}
