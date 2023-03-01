//
//  ProfileTableViewCell.swift
//  movie-app
//
//  Created by Duy Nguyễn on 18/02/2023.
//

import UIKit

final class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var headerProfile: UILabel!
    @IBOutlet weak var containerProfileView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var nameProfile: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        
        headerProfile.font = .boldSystemFont(ofSize: 28)
        headerProfile.text = "Profile"
        
        nameProfile.text = "Account"
        nameProfile.font = .systemFont(ofSize: 16)
        nameProfile.tintColor = .systemPink
        
        containerProfileView.layer.cornerRadius = 12
        containerProfileView.backgroundColor = .lightGray
    }
    
    @IBAction func signIn(_ sender: Any) {
        signInButton.tintColor = .green
    }
}
