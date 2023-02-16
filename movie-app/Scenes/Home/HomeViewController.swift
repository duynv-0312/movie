//
//  HomeViewController.swift
//  movie-app
//
//  Created by Duy Nguyễn on 15/02/2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var topRatedMovies: [Movie] = []
    var popularMovies: [Movie] = []
    var upComingMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        getMovies()
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "ListMovieTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ListMovieTableViewCell")
        tableView.register(UINib(nibName: "MovieHeader", bundle: nil),
                           forHeaderFooterViewReuseIdentifier: "MovieHeader")
    }
    
    func getMovies() {
        
        let topRatedURL = Urls.shared.getTopRatedUrl()
        
        APICaller.shared.getMovies(urlString: topRatedURL) { [weak self] movies in
            print("f1111ff\(movies)")
            DispatchQueue.main.async() {
                self?.topRatedMovies = movies
                self?.tableView.reloadData()
            }
        }
        
        let popularUrl = Urls.shared.getPopularUrl()
        APICaller.shared.getMovies(urlString: popularUrl) { [weak self] movies in
            DispatchQueue.main.async() {
                self?.popularMovies = movies
                self?.tableView.reloadData()
            }
        }
        
        let upComingUrl = Urls.shared.getUpComingUrl()
        APICaller.shared.getMovies(urlString: upComingUrl) { [weak self] movies in
            DispatchQueue.main.async() {
                self?.upComingMovies = movies
                self?.tableView.reloadData()
            }
        }
        
    }
    
    func toMovieDetail(movie: Movie) {
        let vc = MovieDetailViewController()
        vc.configController(movie: movie)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListMovieTableViewCell") as! ListMovieTableViewCell
        if indexPath.section == 0 {
            cell.configCell(movies: topRatedMovies)
        } else if indexPath.section == 1 {
            cell.configCell(movies: popularMovies)
        } else {
            cell.configCell(movies: upComingMovies)
        }
        
        cell.tappedMovie = { [weak self] movie in
            self?.toMovieDetail(movie: movie)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let movieHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MovieHeader") as! MovieHeader
        if section == 0 {
            movieHeader.configView(title: "Top Rated")
        }
        else if section == 1 {
            movieHeader.configView(title: "Popular")
        }
        else {
            movieHeader.configView(title: "Upcoming")
            
        }
        
        return movieHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
