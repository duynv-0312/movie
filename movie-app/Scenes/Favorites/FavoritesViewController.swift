//
//  FavoritesViewController.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import UIKit

final class FavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var favoriteMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        fetchData()
        
    }
    
    private func configView() {
        title = " Favorites "
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "FavoriteTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "FavoriteTableViewCell")
    }
    
    private func fetchData() {
        LocalData.shared.fetchFavoriteMovies { [weak self] movies, error in
            guard error == nil else {
                print("Fetch movie from coredata error: \(error!)")
                return
            }
            self?.favoriteMovies = movies
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell",
                                                 for: indexPath) as! FavoriteTableViewCell
        cell.configCell(movie: favoriteMovies[indexPath.row])
       return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
