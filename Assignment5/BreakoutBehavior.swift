//
//  BreakoutBehavior.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import UIKit

class BreakoutBehavior: UIDynamicBehavior {

    let collider = UICollisionBehavior()
    let gravity = UIGravityBehavior()
    var count = 1 // To count for which ball we are creating the push behavior
    
    lazy var ballBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedBallBehavior = UIDynamicItemBehavior()
        lazilyCreatedBallBehavior.friction = 0
        lazilyCreatedBallBehavior.allowsRotation = false
        lazilyCreatedBallBehavior.resistance = 0
        lazilyCreatedBallBehavior.elasticity = 1
        return lazilyCreatedBallBehavior
    }()
    
    lazy var brickBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedBallBehavior = UIDynamicItemBehavior()
        lazilyCreatedBallBehavior.allowsRotation = false
        lazilyCreatedBallBehavior.density = 1000
        return lazilyCreatedBallBehavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(collider)
        addChildBehavior(gravity)
        addChildBehavior(ballBehavior)
        addChildBehavior(brickBehavior)
    }
    
    func addCollision(_ item: UIDynamicItem) {
        collider.addItem(item)
    }
    
    func addPush(_ item: UIDynamicItem) {
        let push = UIPushBehavior(items: [item], mode: .instantaneous)
        
        // we are setting different push angles for different balls
        var angle: CGFloat = -45
        if count > 3 {
            count = 1
        }
        if count == 2 {
            angle = 45
        } else if count == 3 {
            angle = 180
        }
        push.setAngle(angle, magnitude: 0.2)
        addChildBehavior(push)
        push.action = { [unowned self] in
            push.removeItem(item)
            self.removeChildBehavior(push)
        }
        count += 1
    }
    
    func addBallBehavior(_ item: UIDynamicItem) {
        ballBehavior.addItem(item)
    }
    
    func addBrickBehavior(_ item: UIDynamicItem) {
        brickBehavior.addItem(item)
    }
    
    func removeBehaviors(_ item: UIDynamicItem) {
        collider.removeItem(item)
        brickBehavior.removeItem(item)
        ballBehavior.removeItem(item)
    }
}
