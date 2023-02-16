//
//  MovieHeader.swift
//  movie-app
//
//  Created by Duy Nguyễn on 16/02/2023.
//

import UIKit

class MovieHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var headerTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        headerTitle.font = .boldSystemFont(ofSize: 23)
 
    }
    
    func configView(title: String) {
        headerTitle.text = title
        
    }
 
}
