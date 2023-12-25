//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Bedirhan Turhan on 24.12.2023.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, MainCoordinatorProtocol {
    var window: UIWindow
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var rootViewController: UIViewController?

    init(_ window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
        super.init()
        self.navigationController.delegate = self
        self.window.rootViewController = self.navigationController
    }

    func start() {
        let vc: MainViewController = MainViewController.instantiate(appStoryboard: .main)
        vc.coordinator = self
        rootViewController = vc
        navigationController.pushViewController(vc, animated:true)
        window.makeKeyAndVisible()
    }
    
    func navigateToSignIn() {
        let vc: SignInViewController = SignInViewController.instantiate(appStoryboard: .main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated:true)
    }
    
    func navigateToRegister() {
        let vc: RegisterViewController = RegisterViewController.instantiate(appStoryboard: .main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated:true)
    }
    
    func navigateToHome(data: String) {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start(data: data)
    }
}

// MARK: - UINavigationControllerDelegate

extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller.
        // If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
        checkIfChildFinish(fromViewController)
    }
}
