//
//  HomeCoordinator.swift
//  CoordinatorDemo
//
//  Created by Bedirhan Turhan on 24.12.2023.
//

import UIKit

final class HomeCoordinator: Coordinator, HomeCoordinatorProtocol {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var rootViewController: UIViewController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() { }
    
    func start(data: String) {
        let vc: HomeViewController = .instantiate(appStoryboard: .main)
        vc.coordinator = self
        vc.data = data
        rootViewController = vc
        navigationController.pushViewController(vc, animated:true)
    }
    
    func navigateToNewVC() {
        let vc = UIViewController()
        vc.view.backgroundColor = .purple
        navigationController.pushViewController(vc, animated:true)
    }
}
