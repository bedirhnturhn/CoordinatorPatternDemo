//
//  HomeViewController.swift
//  CoordinatorDemo
//
//  Created by Bedirhan Turhan on 24.12.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    weak var coordinator: HomeCoordinatorProtocol?
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        coordinator?.navigateToNewVC()
    }
}
