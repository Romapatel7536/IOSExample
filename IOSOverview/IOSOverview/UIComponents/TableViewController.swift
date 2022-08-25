//
//  TableViewController.swift
//  IOSOverview
//
//  Created by Roma Patel on 20/04/22.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    var filteredData: [String] = []
    var filteredImage: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.tintColor = .black
        self.tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        filteredData = namesArray
        filteredImage = imagesArray
        searchBar.delegate = self
    }
    
    @objc func refreshData() {
        refreshControl.endRefreshing()
        namesArray.shuffle()
        imagesArray.shuffle()
        tableView.reloadData()
    }
    
    @IBAction func onClickOfBtn(_ sender: UIButton) {
        if let collectionVC = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewController") as? CollectionViewController {
            self.navigationController?.pushViewController(collectionVC, animated: true)
        }
    }
}

extension TableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you Tapped ")
    }
}

extension TableViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell else {
            return UITableViewCell()
        } 
        cell.lblDetail.text = filteredData[indexPath.row]
        setImageFromUrl(image: cell.imgImage, url: filteredImage?[indexPath.row] ?? "")
        return cell
    }
}

extension TableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        filteredImage = []
        if (searchText.count == 0) {
            filteredData = namesArray
            filteredImage = imagesArray
        } else {
            for person in 0...namesArray.count-1 {
                if (namesArray[person].lowercased().contains(searchText.lowercased())) {
                    filteredData.append(namesArray[person])
                    filteredImage?.append(imagesArray[person])
                }
            }
        }
        self.tableView.reloadData()
    }
}
