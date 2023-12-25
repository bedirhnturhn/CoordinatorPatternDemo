//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Bedirhan Turhan on 24.12.2023.
//

import Foundation

protocol MainCoordinatorProtocol: AnyObject {
    func navigateToSignIn()
    func navigateToRegister()
    func navigateToHome(data: String)
}
