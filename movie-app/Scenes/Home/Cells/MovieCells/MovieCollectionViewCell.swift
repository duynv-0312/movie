//
//  MovieCollectionViewCell.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func  configView() {
        posterImage.image = UIImage(named: "anhapp")
        posterImage.contentMode = .scaleAspectFill
        posterImage.layer.cornerRadius = 12
        
        movieName.font = .systemFont(ofSize: 18, weight: .bold)
        
        releaseDate.font = .systemFont(ofSize: 12, weight: .light)
        releaseDate.textColor = .secondaryLabel
    }
    
}
