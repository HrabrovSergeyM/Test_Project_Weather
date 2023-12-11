//
//  Extensions.swift
//  Test_Project_Weather
//
//  Created by Sergey Hrabrov on 11.12.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
