//
//  FoodListViewController.swift
//  Restaurant
//
//  Created by Oleh Hrechyn on 4/2/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

class FoodListViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    private var food = Food()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

//MARK: - Private
private extension FoodListViewController {
    func setup() {
        setupTableView()
        getFood()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FoodInfoCell.viewNib, forCellReuseIdentifier: FoodInfoCell.viewName)
        tableView.tableFooterView = UIView()
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func getFood() {
        APIManager.getFood(successCompletion: { [weak self] (food) in
            self?.food = food
            self?.reloadTableView()
        }, failCompletion: { (error) in
            //TODO: show error alert
        })
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension FoodListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FoodInfoCell.viewName) as? FoodInfoCell else {
            return UITableViewCell()
        }
        cell.configure(with: food[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurantVC = RestaurantViewController()
        restaurantVC.configure(with: food[indexPath.row])
        DispatchQueue.main.async { [weak self] in
            self?.present(restaurantVC, animated: true, completion: nil)
        }
    }
}
