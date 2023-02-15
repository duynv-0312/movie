//
//  HomeViewController.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        let popularUrlString = "https://api.themoviedb.org/3/movie/popular?api_key=0be3b2bb50dd9c07fdf0e4ae5ee23b4e&language=en-US&page=1"
        
        let upcomingUrlString = "https://api.themoviedb.org/3/movie/upcoming?api_key=0be3b2bb50dd9c07fdf0e4ae5ee23b4e&language=en-US&page=1"
        let topRatedUrlString =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=https%3A%2F%2Fapi.themoviedb.org%2F3%2Fmovie%2Fupcoming%3Fapi_key%3D0be3b2bb50dd9c07fdf0e4ae5ee23b4e%26language%3Den-US%26page%3D1&language=en-US&page=1"
        APICaller.shared.getListMovie(urlString: popularUrlString)
        APICaller.shared.getListMovie(urlString: upcomingUrlString)
        APICaller.shared.getListMovie(urlString: topRatedUrlString)
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListMovieTableViewCell", bundle: nil), forCellReuseIdentifier: "ListMovieTableViewCell")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovieTableViewCell") as! ListMovieTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}
