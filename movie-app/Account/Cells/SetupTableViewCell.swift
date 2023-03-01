//
//  SetupTableViewCell.swift
//  movie-app
//
//  Created by Duy Nguyễn on 01/03/2023.
//

import UIKit
import Then

class SetupTableViewCell: UITableViewCell {
    @IBOutlet weak var headerTitle: UILabel!
    
    @IBOutlet weak var themeView: UIView!
    @IBOutlet weak var themeTitle: UILabel!
    @IBOutlet weak var themeValue: UILabel!
    @IBOutlet weak var themeButton: UIButton!
    
    
    @IBOutlet weak var languageView: UIView!
    
    @IBOutlet weak var languageTitle: UILabel!
    
    @IBOutlet weak var languageValue: UILabel!
    @IBOutlet weak var languageButton: UIButton!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        configView()
    }
    
    private func  configView() {
        headerTitle.do {
            $0.font = .boldSystemFont(ofSize: 28)
            $0.text = "Setting"
        }
        
        themeView.do {
            $0.layer.cornerRadius = 12.0
            $0.backgroundColor = .lightGray
        }
        
        themeTitle.do {
            $0.font = .systemFont(ofSize: 16.0)
            $0.tintColor = .secondaryLabel
            $0.text = "Theme"
        }
        
        themeValue.do {
            $0.font = .systemFont(ofSize: 13.0)
            $0.tintColor = .secondaryLabel
            $0.text = "Light"
        }
        
        languageView.do {
            $0.layer.cornerRadius = 12.0
            $0.backgroundColor = .lightGray
        }
        
        languageTitle.do {
            $0.font = .systemFont(ofSize: 16.0)
            $0.tintColor = .secondaryLabel
            $0.text = "Language"
        }
        
        languageValue.do {
            $0.font = .systemFont(ofSize: 13.0)
            $0.tintColor = .secondaryLabel
            $0.text = "Vietnamese"
        }
    }
}
