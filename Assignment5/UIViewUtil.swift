//
//  UIViewUtil.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func flip() {
        transform = CGAffineTransform(scaleX: -transform.a, y: transform.d)
    }
}
