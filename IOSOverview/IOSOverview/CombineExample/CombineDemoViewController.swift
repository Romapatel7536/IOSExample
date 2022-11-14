//
//  CombineDemoViewController.swift
//  IOSOverview
//
//  Created by Roma Patel on 09/11/22.
//

import Combine
import UIKit

struct User : Codable {
    let name: String
}
class CombineDemoViewController: UIViewController {
    private let baseURL = URL(string: "https://api.whatever.com/api/v2/")

    let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    var observar: AnyCancellable?
    private var users : [User] = []
    private var testArray = ["Hello1", "Hello2", "Hello3", "Hello4", "Hello5", "Hello6"]
    @IBOutlet weak var tableview: UITableView!
    private var cancellables : Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        observar = getUsers()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { users in
                self.users = users
            })

    }
    
    //MARK: Example of Just Publisher
    func getUsers() -> AnyPublisher<[User], Never> {
        guard let url = url else {
            return Just([]).eraseToAnyPublisher()
        }
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [User].self, decoder: JSONDecoder())
            .catch({ _ in
                Just([])
            })
                .eraseToAnyPublisher()


                    return publisher
    }

//    func subscriberExample() {
//        let passthroughObject = PassthroughSubject<String, Error>()
//        passthroughObject.send("Hello")
//        passthroughObject.send("World")
//        passthroughObject.sink { _ in
//            fatalError()
//        } receiveValue: { value in
//            print(value)
//        }
//
//    }
}

extension CombineDemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableview.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(details: users[indexPath.row].name)
        return cell
    }
}
