//
//  ReusableView.swift
//  Restaurant
//
//  Created by Oleh Hrechyn on 4/2/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

protocol ReusableView {
    static var viewNib: UINib { get }
    static var viewName: String { get }
}

extension ReusableView where Self: UIView {
    static var viewNib: UINib {
        return UINib(nibName: viewName, bundle: .main)
    }
    
    static var viewName: String {
        return String(describing: self)
    }
}
