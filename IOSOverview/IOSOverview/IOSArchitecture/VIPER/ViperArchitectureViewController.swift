//
//  ViperArchitectureViewController.swift
//  IOSOverview
//
//  Created by Roma Patel on 24/06/22.
//

import UIKit

// MARK: - IViperView Protocol
protocol IViperView: AnyObject {
    
    var viperPresentor: IViperPresenter {get set}
    func onSuccess(resultData: UserResponse)
    func onFailure(error: String)
}

class ViperArchitectureViewController: UIViewController {

    // MARK: - Protocol Stubs Variables
    var viperPresentor: IViperPresenter = ViperPresenter()
    
    // MARK: - Variables
    var navCoordinator: Router?
    var usersData: UserResponse?
    public static let identifier = "ViperArchitecture"
    
    // MARK: - IBoutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Override Function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(
            UINib(nibName: "TableViewCell", bundle: nil),
            forCellReuseIdentifier: "userCell"
        )
        tableView.dataSource = self
        viperPresentor.view = self
        viperPresentor.getUserData()
    }
    
}

// MARK: - extension UITableViewDataSource
extension ViperArchitectureViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersData?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
        let model = usersData?.data[indexPath.row]
        cell.configureCell(user: model!)
        return cell
    }
    
}

// MARK: - extension IViperView
extension ViperArchitectureViewController: IViperView {
    
    func onSuccess(resultData: UserResponse) {
        usersData = resultData
        tableView.reloadData()
    }
    
    func onFailure(error: String) {
        print("Error: \(error)")
    }
}
