//
//  ViewController.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-02.
//

import UIKit

class ViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    
    // MARK: - Properties
    var selectedRestaurant: RestaurantResult?
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData(for: self.tableView, errorView: errorView)
    }

    // MARK: - Tableview Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let restaurants = restaurantList {
            return restaurants.count
        }
        return 0
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: AppConstants.CharacterCell)
        
        if let restaurants = restaurantList {
            let restaurant = restaurants[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = restaurant.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let restaurants = restaurantList {
            self.selectedRestaurant = restaurants[(indexPath as NSIndexPath).row]
        }
        
        RestaurauntNavigator.shared().restaurauntDetailsViewController(viewController: self)
    }
    
    // MARK: - Base Navigator Delegate
    func navigatorWillTransitionToViewController(destinationViewController: UIViewController) {
        if destinationViewController.isKind(of: ViewControllerDetails.self) {
            (destinationViewController as? ViewControllerDetails)?.selectedRestaurant = self.selectedRestaurant
        }
    }
}
