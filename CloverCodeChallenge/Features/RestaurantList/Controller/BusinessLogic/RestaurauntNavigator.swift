//
//  RestaurauntNavigator.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-03.
//

import Foundation
import UIKit

class RestaurauntNavigator: BaseNavigator {
    
    // MARK: - Properties
    private static var sharedRestaurauntNavigator: RestaurauntNavigator = {
        let restaurauntNavigator = RestaurauntNavigator()

        return restaurauntNavigator
    }()

    // MARK: - Accessors
    class func shared() -> RestaurauntNavigator {
        return sharedRestaurauntNavigator
    }
    
    // MARK: - Screens To Navigate to
    func restaurauntDetailsViewController(viewController: UIViewController) {
        self.navigateToFeature(feature: AppConstants.mainStoryboard,
                               identifier: AppConstants.details,
                               fromViewController: viewController,
                               transitionType: .baseNavigationTransitionTypeModal)
    }
}
