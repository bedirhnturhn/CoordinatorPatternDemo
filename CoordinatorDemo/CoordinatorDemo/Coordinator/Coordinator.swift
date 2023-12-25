//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Bedirhan Turhan on 24.12.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var rootViewController: UIViewController? { get set }

    func start()
}


extension Coordinator {
    func checkIfChildFinish(_ fromViewController: UIViewController) {
        childCoordinators.forEach { coordinator in
            if coordinator.childCoordinators.isEmpty {
                if coordinator.rootViewController == fromViewController {
                    if childDidFinish(coordinator) {
                        return
                    }
                }
            } else {
                coordinator.checkIfChildFinish(fromViewController)
            }
        }
    }
    
    private func childDidFinish(_ child: Coordinator?) -> Bool {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            return true
        }
        return false
    }
}
