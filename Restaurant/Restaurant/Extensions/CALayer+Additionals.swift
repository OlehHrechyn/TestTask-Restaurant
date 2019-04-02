//
//  CALayer+Additionals.swift
//  Restaurant
//
//  Created by Oleh Hrechyn on 4/2/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

extension CALayer {
    func setShadow() {
        borderWidth = 1.0
        borderColor = UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 209.0 / 255.0, alpha: 1.0).cgColor
    }
}
