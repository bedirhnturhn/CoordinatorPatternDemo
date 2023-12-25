//
//  SignInViewController.swift
//  CoordinatorDemo
//
//  Created by Bedirhan Turhan on 24.12.2023.
//

import UIKit

class SignInViewController: UIViewController {

    weak var coordinator: MainCoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapNavigateToHome(_ sender: Any) {
        coordinator?.navigateToHome(data: "Selam")
    }
}

