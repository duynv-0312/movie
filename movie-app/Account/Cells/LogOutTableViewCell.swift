//
//  LogOutTableViewCell.swift
//  movie-app
//
//  Created by Duy Nguyễn on 01/03/2023.
//

import UIKit

final class LogOutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func  configView() {
        logoutButton.do {
            $0.setTitle("Log out", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 28)
            $0.tintColor = .secondaryLabel
            $0.layer.cornerRadius = 20
        }
        
        containerView.do {
            $0.backgroundColor = .red
        }
        
    }
}
