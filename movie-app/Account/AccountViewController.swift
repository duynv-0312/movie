//
//  AccountViewController.swift
//  movie-app
//
//  Created by Duy Nguyễn on 18/02/2023.
//

import UIKit

final class AccountViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        configView()
    }
    
    private func configView() {
        title = "Information"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        UITableView.appearance().tintColor = .clear
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.register(UINib(nibName: "SetupTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "SetupTableViewCell")
        tableView.register(UINib(nibName: "LogOutTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "LogOutTableViewCell")
    }
 
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            cell.selectionStyle = .none
            return cell
        } else if  indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SetupTableViewCell", for: indexPath) as! SetupTableViewCell
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogOutTableViewCell", for: indexPath) as! LogOutTableViewCell
            cell.selectionStyle = .none
            return cell
        }
    }
}
