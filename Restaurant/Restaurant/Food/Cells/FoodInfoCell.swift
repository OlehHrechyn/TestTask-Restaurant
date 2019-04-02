//
//  FoodInfoCell.swift
//  Restaurant
//
//  Created by Oleh Hrechyn on 4/2/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit
import SDWebImage

class FoodInfoCell: UITableViewCell, ReusableView {
    @IBOutlet weak private var mainView: UIView!
    @IBOutlet weak private var foodImageView: UIImageView!
    @IBOutlet weak private var restaurantNameLabel: UILabel!
    @IBOutlet weak private var foodNameLabel: UILabel!
    @IBOutlet weak private var foodPriceLabel: UILabel!
    @IBOutlet weak private var activityView: UIActivityIndicatorView!
}

//MARK: - Public
extension FoodInfoCell {
    func configure(with dish: Dish) {
        DispatchQueue.main.async { [weak self] in
            self?.activityView.startAnimating()
            self?.foodImageView?.sd_setImage(with: dish.imageURL, placeholderImage: nil, options: .highPriority, completed: { [weak self] (image, error, type, url) in
                self?.foodImageView?.image = image
                self?.activityView.stopAnimating()
            })
            self?.restaurantNameLabel.text = dish.restaurant
            self?.foodNameLabel.text = dish.foodName
            self?.foodPriceLabel.text = String(format: "$%.2f", dish.price)
            self?.mainView.layer.setShadow()
        }
    }
}
