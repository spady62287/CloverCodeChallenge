//
//  BaseNavigator.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-03.
//

import Foundation
import UIKit

// MARK: - Base Navigator protocol
@objc protocol BaseNavigator {
    @objc optional func navigatorWillTransitionToViewController(destinationViewController: UIViewController)
}

// MARK: - Navigation Type
enum BaseNavigationTransitionType {
    case BaseNavigationTransitionTypeModal
}

// MARK: - Navigation to Features
extension BaseNavigator {
    
    func navigateToFeature(feature: String, identifier: String, fromViewController: UIViewController, transitionType: BaseNavigationTransitionType) {
        
        let targetStoryboard = UIStoryboard.init(name: feature, bundle: nil)
        let targetVC = targetStoryboard.instantiateViewController(withIdentifier: identifier)
        
        if let delegate = fromViewController as? BaseNavigator {
            delegate.navigatorWillTransitionToViewController!(destinationViewController: targetVC)
        }
        
        switch transitionType {
            case .BaseNavigationTransitionTypeModal:
                fromViewController.present(targetVC, animated: true)
        }
    }
}
