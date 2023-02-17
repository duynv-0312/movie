//
//  ListMovieTableViewCell.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import UIKit

class ListMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie] = []
    
    var tappedMovie : ((Movie) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 290)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieCollectionViewCell",
                                      bundle: .main),
                                forCellWithReuseIdentifier: "MovieCollectionViewCell")
    }
    
    func configCell(movies: [Movie ]) {
        self.movies = movies
        self.collectionView.reloadData()
    }
    
}

extension ListMovieTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell",
                                                      for: indexPath) as! MovieCollectionViewCell
        cell.configCell(movies: movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        tappedMovie?(movies[indexPath.row])
    }
}
