//
//  SettingsView.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    fileprivate let bricksGridLabel: UILabel = {
        $0.text = "Bricks Grid"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    fileprivate let ballBouncinessLabel: UILabel = {
        $0.text = "Ball Speed"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    fileprivate let noOfBouncingBallsLabel: UILabel = {
        $0.text = "Bouncing Balls"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    fileprivate let specialBricksLabel: UILabel = {
        $0.text = "Special Bricks"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    var bricksGridSegmentControl: UISegmentedControl!
    var ballBouncinessSegmentControl: UISegmentedControl!
    var noOfBouncingBallsSegmentControl: UISegmentedControl!
    var specialBricksSegmentControl: UISegmentedControl!
    
    fileprivate func addBricksGridLabel() {
        self.addSubview(bricksGridLabel)
        self.addConstraint(NSLayoutConstraint(item: bricksGridLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 110.0))
        self.addConstraint(NSLayoutConstraint(item: bricksGridLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8.0))
    }
    
    fileprivate func addBricksGridSegmentControl() {
        bricksGridSegmentControl = {
            $0.selectedSegmentIndex = 0
            $0.setContentHuggingPriority(249, for: .horizontal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UISegmentedControl(items: ["4X5", "5X5", "6X5", "6X6"]))
        self.addSubview(bricksGridSegmentControl)
        self.addConstraint(NSLayoutConstraint(item: bricksGridSegmentControl, attribute: .centerY, relatedBy: .equal, toItem: bricksGridLabel, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: bricksGridSegmentControl, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: bricksGridSegmentControl, attribute: .leading, relatedBy: .equal, toItem: bricksGridLabel, attribute: .trailing, multiplier: 1.0, constant: 8.0))
    }
    
    fileprivate func addBallBouncinessLabel() {
        self.addSubview(ballBouncinessLabel)
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessLabel, attribute: .top, relatedBy: .equal, toItem: bricksGridLabel, attribute: .bottom, multiplier: 1.0, constant: 110.0))
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8.0))
    }
    
    fileprivate func addBallBouncinessSegmentControl() {
        ballBouncinessSegmentControl = {
            $0.selectedSegmentIndex = 1
            $0.setContentHuggingPriority(249, for: .horizontal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UISegmentedControl(items: ["1", "1.05", "1.1"]))
        ballBouncinessSegmentControl.selectedSegmentIndex = 0
        ballBouncinessSegmentControl.setContentHuggingPriority(249, for: .horizontal)
        ballBouncinessSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(ballBouncinessSegmentControl)
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessSegmentControl, attribute: .centerY, relatedBy: .equal, toItem: ballBouncinessLabel, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessSegmentControl, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessSegmentControl, attribute: .leading, relatedBy: .equal, toItem: ballBouncinessLabel, attribute: .trailing, multiplier: 1.0, constant: 8.0))
    }
    
    fileprivate func addNoOfBouncingBallsLabel() {
        self.addSubview(noOfBouncingBallsLabel)
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsLabel, attribute: .top, relatedBy: .equal, toItem: ballBouncinessLabel, attribute: .bottom, multiplier: 1.0, constant: 110.0))
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8.0))
    }
    
    fileprivate func addNoOfBouncingBallsSegmentControl() {
        noOfBouncingBallsSegmentControl = {
            $0.selectedSegmentIndex = 0
            $0.setContentHuggingPriority(249, for: .horizontal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UISegmentedControl(items: ["1", "2", "3"]))
        self.addSubview(noOfBouncingBallsSegmentControl)
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsSegmentControl, attribute: .centerY, relatedBy: .equal, toItem: noOfBouncingBallsLabel, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsSegmentControl, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsSegmentControl, attribute: .leading, relatedBy: .equal, toItem: noOfBouncingBallsLabel, attribute: .trailing, multiplier: 1.0, constant: 8.0))
    }
    
    fileprivate func addSpecialBricksLabel() {
        self.addSubview(specialBricksLabel)
        self.addConstraint(NSLayoutConstraint(item: specialBricksLabel, attribute: .top, relatedBy: .equal, toItem: noOfBouncingBallsLabel, attribute: .bottom, multiplier: 1.0, constant: 110.0))
        self.addConstraint(NSLayoutConstraint(item: specialBricksLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8.0))
    }
    
    fileprivate func addSpecialBricksSegmentControl() {
        specialBricksSegmentControl = {
            $0.selectedSegmentIndex = 0
            $0.setContentHuggingPriority(249, for: .horizontal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UISegmentedControl(items: ["No", "Yes"]))
        self.addSubview(specialBricksSegmentControl)
        self.addConstraint(NSLayoutConstraint(item: specialBricksSegmentControl, attribute: .centerY, relatedBy: .equal, toItem: specialBricksLabel, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: specialBricksSegmentControl, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: specialBricksSegmentControl, attribute: .leading, relatedBy: .equal, toItem: specialBricksLabel, attribute: .trailing, multiplier: 1.0, constant: 8.0))
    }
    
    func attachAllViewsToSettingsView() {
        addBricksGridLabel()
        addBricksGridSegmentControl()
        addBallBouncinessLabel()
        addBallBouncinessSegmentControl()
        addNoOfBouncingBallsLabel()
        addNoOfBouncingBallsSegmentControl()
        addSpecialBricksLabel()
        addSpecialBricksSegmentControl()
    }
}
