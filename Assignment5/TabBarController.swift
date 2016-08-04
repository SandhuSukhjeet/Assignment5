//
//  TabBarController.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    fileprivate let breakoutViewController = BreakoutViewController()
    fileprivate let settingsViewController = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [breakoutViewController, settingsViewController]
        breakoutViewController.tabBarItem = UITabBarItem(title: "Breakout", image: nil, tag: 0)
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 1)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            breakoutViewController.breakoutView.breakoutBehavior.ballBehavior.elasticity = settingsViewController.elasticity
            
            if breakoutViewController.breakoutView.bricksPerRow != settingsViewController.noOfrows || breakoutViewController.breakoutView.bricksPerColumn != settingsViewController.noOfColumns || breakoutViewController.breakoutView.noOfBalls != settingsViewController.totalBalls ||
                breakoutViewController.breakoutView.anySpecialBrick != settingsViewController.isAnySpecialBrick {
                
                // removing bricks and balls
                breakoutViewController.breakoutView.removeBricks()
                breakoutViewController.breakoutView.removeBalls()
                
                // setting the properties
                breakoutViewController.breakoutView.bricksPerRow = settingsViewController.noOfrows
                breakoutViewController.breakoutView.bricksPerColumn = settingsViewController.noOfColumns
                breakoutViewController.breakoutView.noOfBalls = settingsViewController.totalBalls
                breakoutViewController.breakoutView.anySpecialBrick = settingsViewController.isAnySpecialBrick
                breakoutViewController.breakoutView.score = 0
                
                // recreating bricks and balls
                breakoutViewController.breakoutView.createBricks()
                breakoutViewController.breakoutView.createBalls()
            }
        } else {
            breakoutViewController.breakoutView.animating = false
        }
    }
}
