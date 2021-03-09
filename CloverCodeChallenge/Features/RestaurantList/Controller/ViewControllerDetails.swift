//
//  ViewControllerDetails.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-03.
//

import Foundation
import UIKit

class ViewControllerDetails: BaseViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var selectedRestaurant: RestaurantResult?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurant = selectedRestaurant, let identifier = restaurant.identifier {
            categoryLabel.text = restaurant.category
            descriptionLabel.text = restaurant.description
            nameLabel.text = restaurant.name
            idLabel.text = "\(identifier)"
        }
    }
    
    // MARK: - Actions
    @IBAction func callRestaurant(_ sender: Any) {
        if let url = URL(string: "tel://555-5555"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
