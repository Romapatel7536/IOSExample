//
//  Router.swift
//  IOSOverview
//
//  Created by Roma Patel on 24/06/22.
//

import UIKit

// MARK: - IViperRouter Protocol
protocol IViperRouter {
    
    var navController: UINavigationController {get set}
    func start()
    
}

// MARK: - Router Class
class Router: IViperRouter {

    // MARK: - Variables
    var navController: UINavigationController
    
    // MARK: - Init Function
    init(_ navigationController: UINavigationController) {
        navController = navigationController
    }
    
    // MARK: - Protocol Stubs Function
    func start() {
        let storyboard = UIStoryboard(name: "ViperArchitecture", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: ViperArchitectureViewController.identifier)
        navController.pushViewController(vc, animated: true)
    }
}

