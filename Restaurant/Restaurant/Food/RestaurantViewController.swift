//
//  RestaurantViewController.swift
//  Restaurant
//
//  Created by Oleh Hrechyn on 4/2/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    @IBOutlet weak private var restaurantNameLabel: UILabel!
    
    private var dish: Dish?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

//MARK: - IBActions
extension RestaurantViewController {
    @IBAction func doneButtonDidPress(_ sender: UIButton) {
        DispatchQueue.main.async { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
}

//MARK: - Public
extension RestaurantViewController {
    func configure(with dish: Dish) {
        self.dish = dish
    }
}

//MARK: - Private
private extension RestaurantViewController {
    func setup() {
        DispatchQueue.main.async { [weak self] in
            self?.restaurantNameLabel.text = self?.dish?.restaurant
        }
    }
}
