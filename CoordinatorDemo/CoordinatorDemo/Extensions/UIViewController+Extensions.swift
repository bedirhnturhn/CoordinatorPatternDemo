//
//  UIViewController+Extensions.swift
//  CoordinatorDemo
//
//  Created by Bedirhan Turhan on 24.12.2023.
//

import UIKit

enum AppStoryboard: String {
   case main = "Main"
}

extension UIViewController {

    class func instantiate<T: UIViewController>(appStoryboard: AppStoryboard) -> T {
        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
