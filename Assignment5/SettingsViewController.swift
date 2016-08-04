//
//  SettingsViewController.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    private let settingsView = SettingsView()
    private let breakoutViewController = BreakoutViewController()
    var noOfrows = 4
    var noOfColumns = 5
    var totalBalls = 1
    var elasticity: CGFloat = 1
    var isAnySpecialBrick = false
    
    //MARK: Lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        addSettingsView()
        settingsView.attachAllViewsToSettingsView()
        settingsView.bricksGridSegmentControl.addTarget(self, action: #selector(changeNoOfBricksInGrid), forControlEvents: .ValueChanged)
        settingsView.ballBouncinessSegmentControl.addTarget(self, action: #selector(changeBallSpeed), forControlEvents: .ValueChanged)
        settingsView.noOfBouncingBallsSegmentControl.addTarget(self, action: #selector(changeNoOfBalls), forControlEvents: .ValueChanged)
        settingsView.specialBricksSegmentControl.addTarget(self, action: #selector(changeNoOfSpecialBricks), forControlEvents: .ValueChanged)
    }
    
    //MARK: Attaching settings view
    private func addSettingsView() {
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsView)
        view.addConstraint(NSLayoutConstraint(item: settingsView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: settingsView, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: settingsView, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: settingsView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
    }
    
    //MARK: Segmented Control Action Methods
    func changeNoOfBricksInGrid(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            noOfrows = Int(sender.titleForSegmentAtIndex(0)!.componentsSeparatedByString("X")[0])!
            noOfColumns = Int(sender.titleForSegmentAtIndex(0)!.componentsSeparatedByString("X")[1])!
        case 1: print()
        noOfrows = Int(sender.titleForSegmentAtIndex(1)!.componentsSeparatedByString("X")[0])!
        noOfColumns = Int(sender.titleForSegmentAtIndex(1)!.componentsSeparatedByString("X")[1])!
        case 2:
            noOfrows = Int(sender.titleForSegmentAtIndex(2)!.componentsSeparatedByString("X")[0])!
            noOfColumns = Int(sender.titleForSegmentAtIndex(2)!.componentsSeparatedByString("X")[1])!
        case 3:
            noOfrows = Int(sender.titleForSegmentAtIndex(3)!.componentsSeparatedByString("X")[0])!
            noOfColumns = Int(sender.titleForSegmentAtIndex(3)!.componentsSeparatedByString("X")[1])!
        default:
            fatalError("Segmented control index out of rage")
        }
    }
    
    func changeBallSpeed(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            elasticity = CGFloat(Float(sender.titleForSegmentAtIndex(0)!)!)
        case 1:
            elasticity = CGFloat(Float(sender.titleForSegmentAtIndex(1)!)!)
        case 2:
            elasticity = CGFloat(Float(sender.titleForSegmentAtIndex(2)!)!)
        default: fatalError("Segmented control index out of rage")
        }
    }
    
    func changeNoOfBalls(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            totalBalls = Int(sender.titleForSegmentAtIndex(0)!)!
        case 1:
            totalBalls = Int(sender.titleForSegmentAtIndex(1)!)!
        case 2:
            totalBalls = Int(sender.titleForSegmentAtIndex(2)!)!
        default: fatalError("Segmented control index out of rage")
        }
    }
    
    func changeNoOfSpecialBricks(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : isAnySpecialBrick = false
        case 1 : isAnySpecialBrick = true
        default : fatalError("Segmented control index out of rage")
        }
    }
}
