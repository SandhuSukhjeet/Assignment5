//
//  SettingsView.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import UIKit

class SettingsView: UIView {

    private let bricksGridLabel: UILabel = {
        $0.text = "Bricks Grid"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let ballBouncinessLabel: UILabel = {
        $0.text = "Ball Speed"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let noOfBouncingBallsLabel: UILabel = {
        $0.text = "Bouncing Balls"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let specialBricksLabel: UILabel = {
        $0.text = "Special Bricks"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    var bricksGridSegmentControl: UISegmentedControl!
    var ballBouncinessSegmentControl: UISegmentedControl!
    var noOfBouncingBallsSegmentControl: UISegmentedControl!
    var specialBricksSegmentControl: UISegmentedControl!
    
    private func addBricksGridLabel() {
        self.addSubview(bricksGridLabel)
        self.addConstraint(NSLayoutConstraint(item: bricksGridLabel, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 110.0))
        self.addConstraint(NSLayoutConstraint(item: bricksGridLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 8.0))
    }
    
    private func addBricksGridSegmentControl() {
        bricksGridSegmentControl = {
            $0.selectedSegmentIndex = 0
            $0.setContentHuggingPriority(249, forAxis: .Horizontal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UISegmentedControl(items: ["4X5", "5X5", "6X5", "6X6"]))
        self.addSubview(bricksGridSegmentControl)
        self.addConstraint(NSLayoutConstraint(item: bricksGridSegmentControl, attribute: .CenterY, relatedBy: .Equal, toItem: bricksGridLabel, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: bricksGridSegmentControl, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: bricksGridSegmentControl, attribute: .Leading, relatedBy: .Equal, toItem: bricksGridLabel, attribute: .Trailing, multiplier: 1.0, constant: 8.0))
    }
    
    private func addBallBouncinessLabel() {
        self.addSubview(ballBouncinessLabel)
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessLabel, attribute: .Top, relatedBy: .Equal, toItem: bricksGridLabel, attribute: .Bottom, multiplier: 1.0, constant: 110.0))
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 8.0))
    }
    
    private func addBallBouncinessSegmentControl() {
        ballBouncinessSegmentControl = {
            $0.selectedSegmentIndex = 1
            $0.setContentHuggingPriority(249, forAxis: .Horizontal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UISegmentedControl(items: ["1", "1.05", "1.1"]))
        ballBouncinessSegmentControl.selectedSegmentIndex = 0
        ballBouncinessSegmentControl.setContentHuggingPriority(249, forAxis: .Horizontal)
        ballBouncinessSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(ballBouncinessSegmentControl)
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessSegmentControl, attribute: .CenterY, relatedBy: .Equal, toItem: ballBouncinessLabel, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessSegmentControl, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: ballBouncinessSegmentControl, attribute: .Leading, relatedBy: .Equal, toItem: ballBouncinessLabel, attribute: .Trailing, multiplier: 1.0, constant: 8.0))
    }
    
    private func addNoOfBouncingBallsLabel() {
        self.addSubview(noOfBouncingBallsLabel)
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsLabel, attribute: .Top, relatedBy: .Equal, toItem: ballBouncinessLabel, attribute: .Bottom, multiplier: 1.0, constant: 110.0))
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 8.0))
    }
    
    private func addNoOfBouncingBallsSegmentControl() {
        noOfBouncingBallsSegmentControl = {
            $0.selectedSegmentIndex = 0
            $0.setContentHuggingPriority(249, forAxis: .Horizontal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UISegmentedControl(items: ["1", "2", "3"]))
        self.addSubview(noOfBouncingBallsSegmentControl)
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsSegmentControl, attribute: .CenterY, relatedBy: .Equal, toItem: noOfBouncingBallsLabel, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsSegmentControl, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: noOfBouncingBallsSegmentControl, attribute: .Leading, relatedBy: .Equal, toItem: noOfBouncingBallsLabel, attribute: .Trailing, multiplier: 1.0, constant: 8.0))
    }
    
    private func addSpecialBricksLabel() {
        self.addSubview(specialBricksLabel)
        self.addConstraint(NSLayoutConstraint(item: specialBricksLabel, attribute: .Top, relatedBy: .Equal, toItem: noOfBouncingBallsLabel, attribute: .Bottom, multiplier: 1.0, constant: 110.0))
        self.addConstraint(NSLayoutConstraint(item: specialBricksLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 8.0))
    }
    
    private func addSpecialBricksSegmentControl() {
        specialBricksSegmentControl = {
            $0.selectedSegmentIndex = 0
            $0.setContentHuggingPriority(249, forAxis: .Horizontal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UISegmentedControl(items: ["No", "Yes"]))
        self.addSubview(specialBricksSegmentControl)
        self.addConstraint(NSLayoutConstraint(item: specialBricksSegmentControl, attribute: .CenterY, relatedBy: .Equal, toItem: specialBricksLabel, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: specialBricksSegmentControl, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: specialBricksSegmentControl, attribute: .Leading, relatedBy: .Equal, toItem: specialBricksLabel, attribute: .Trailing, multiplier: 1.0, constant: 8.0))
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
