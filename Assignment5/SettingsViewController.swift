//
//  SettingsViewController.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    fileprivate let settingsView = SettingsView()
    fileprivate let breakoutViewController = BreakoutViewController()
    var noOfrows = 4
    var noOfColumns = 5
    var totalBalls = 1
    var elasticity: CGFloat = 1
    var isAnySpecialBrick = false
    
    //MARK: Lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge()
        addSettingsView()
        settingsView.attachAllViewsToSettingsView()
        settingsView.bricksGridSegmentControl.addTarget(self, action: #selector(changeNoOfBricksInGrid), for: .valueChanged)
        settingsView.ballBouncinessSegmentControl.addTarget(self, action: #selector(changeBallSpeed), for: .valueChanged)
        settingsView.noOfBouncingBallsSegmentControl.addTarget(self, action: #selector(changeNoOfBalls), for: .valueChanged)
        settingsView.specialBricksSegmentControl.addTarget(self, action: #selector(changeNoOfSpecialBricks), for: .valueChanged)
    }
    
    //MARK: Attaching settings view
    fileprivate func addSettingsView() {
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsView)
        view.addConstraint(NSLayoutConstraint(item: settingsView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: settingsView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: settingsView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        view.addConstraint(NSLayoutConstraint(item: settingsView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0))
    }
    
    //MARK: Segmented Control Action Methods
    func changeNoOfBricksInGrid(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            noOfrows = Int(sender.titleForSegment(at: 0)!.components(separatedBy: "X")[0])!
            noOfColumns = Int(sender.titleForSegment(at: 0)!.components(separatedBy: "X")[1])!
        case 1: print()
        noOfrows = Int(sender.titleForSegment(at: 1)!.components(separatedBy: "X")[0])!
        noOfColumns = Int(sender.titleForSegment(at: 1)!.components(separatedBy: "X")[1])!
        case 2:
            noOfrows = Int(sender.titleForSegment(at: 2)!.components(separatedBy: "X")[0])!
            noOfColumns = Int(sender.titleForSegment(at: 2)!.components(separatedBy: "X")[1])!
        case 3:
            noOfrows = Int(sender.titleForSegment(at: 3)!.components(separatedBy: "X")[0])!
            noOfColumns = Int(sender.titleForSegment(at: 3)!.components(separatedBy: "X")[1])!
        default:
            fatalError("Segmented control index out of rage")
        }
    }
    
    func changeBallSpeed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            elasticity = CGFloat(Float(sender.titleForSegment(at: 0)!)!)
        case 1:
            elasticity = CGFloat(Float(sender.titleForSegment(at: 1)!)!)
        case 2:
            elasticity = CGFloat(Float(sender.titleForSegment(at: 2)!)!)
        default: fatalError("Segmented control index out of rage")
        }
    }
    
    func changeNoOfBalls(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            totalBalls = Int(sender.titleForSegment(at: 0)!)!
        case 1:
            totalBalls = Int(sender.titleForSegment(at: 1)!)!
        case 2:
            totalBalls = Int(sender.titleForSegment(at: 2)!)!
        default: fatalError("Segmented control index out of rage")
        }
    }
    
    func changeNoOfSpecialBricks(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : isAnySpecialBrick = false
        case 1 : isAnySpecialBrick = true
        default : fatalError("Segmented control index out of rage")
        }
    }
}
