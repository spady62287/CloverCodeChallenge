//
//  BaseViewController.swift
//  CloverCodeChallenge
//
//  Created by Daniel Spady on 2021-03-02.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, BaseNavigator {
    
    var restaurantList: [RestaurantResult]?
    
    lazy var loadingView: UIView = { [unowned self] in
        let view = UIView(frame: self.view.bounds)
        view.backgroundColor = UIColor.black
        view.alpha = 0
        
        view.addSubview(self.loadingSpinner)
        self.loadingSpinner.backgroundColor = UIColor.clear
        self.loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
        self.loadingSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.loadingSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.loadingSpinner.widthAnchor.constraint(equalToConstant: 60).isActive = true
        self.loadingSpinner.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.view.addSubview(view)
        return view
    }()
    
    lazy var loadingSpinner: AnimatedLoader = AnimatedLoader()
    
    func loadData(for tableView: UITableView) {
        showLoadingView()
        RestaurantUtillity.restaurantList() { response in
            if let result = response.result {
                self.restaurantList = result
                self.hideLoadingView()
                tableView.reloadData()
            } else if let error = response.error {
                dump(error)
            }
        }
    }
    
    func showLoadingView(animated: Bool = true, after delay: TimeInterval? = nil) {
        view.bringSubviewToFront(loadingView)
        loadingSpinner.start()
        UIView.animate(withDuration: animated ? 0.3 : 0.0, delay: delay ?? 0, options: [], animations: {
            self.loadingView.alpha = 1
        })
    }
    
    func hideLoadingView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.loadingView.alpha = 0
        }) { (completed) in
            self.loadingSpinner.stop()
        }
    }
}
