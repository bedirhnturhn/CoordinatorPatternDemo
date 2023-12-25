//
//  MainViewController.swift
//  CoordinatorDemo
//
//  Created by Bedirhan Turhan on 24.12.2023.
//

import UIKit

class MainViewController: UIViewController {

    var coordinator: MainCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapNavToRegister(_ sender: Any) {
        coordinator?.navigateToRegister()
    }
    
    @IBAction func didTapNavToSignIn(_ sender: Any) {
        coordinator?.navigateToSignIn()
    }
}

