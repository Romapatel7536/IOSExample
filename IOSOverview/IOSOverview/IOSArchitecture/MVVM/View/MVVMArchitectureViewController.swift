//
//  MVVMArchitectureViewController.swift
//  IOSOverview
//
//  Created by Roma Patel on 23/06/22.
//

import UIKit

class MVVMArchitectureViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = UsersViewModel.instance
    var userArray = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(
            UINib(nibName: "TableViewCell", bundle: nil),
            forCellReuseIdentifier: "userCell"
        )
        viewModel.bindViewModelToController = { users in
            self.userArray = users
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MVVMArchitectureViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
        cell.configureCell(user: userArray[indexPath.row])
        return cell
    }
}
