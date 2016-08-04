//
//  BreakoutView.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import UIKit

protocol BreakoutViewDelegate: class {
    func displayWinAlert()
    func updateScore(_ score: String)
}

class BreakoutView: UIView, UICollisionBehaviorDelegate {
    
    //MARK: Animator properties
    let breakoutBehavior = BreakoutBehavior()
    fileprivate lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    var animating: Bool = false {
        didSet {
            if animating {
                animator.addBehavior(breakoutBehavior)
            } else {
                animator.removeBehavior(breakoutBehavior)
            }
        }
    }
    
    //MARK: Animating Elements & Properties
    fileprivate let paddle: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .blue
        return $0
    }(UIView())
    fileprivate var ballSize: CGSize {
        let width = 30
        let height = 30
        return CGSize(width: width, height: height)
    }
    fileprivate var paddleSize: CGSize {
        let width = 150
        let height = 30
        return CGSize(width: width, height: height)
    }
    fileprivate var bricks: [UIView] = []
    var bouncingBalls: [UIView] = []
    var anyBallInOuterSpace = false
    var bricksPerRow = 4
    var bricksPerColumn = 5
    var noOfBalls = 1
    var anySpecialBrick = false
    var score = 0 {
        didSet {
            dataSource?.updateScore(String(score))
        }
    }
    
    //MARK: datasource variable
    weak var dataSource: BreakoutViewDelegate?
    
    //MARK: Boundary for collision
    fileprivate func addBoundary(_ name: String, start: CGPoint, end: CGPoint) {
        breakoutBehavior.collider.addBoundary(withIdentifier: name as NSCopying, from: start, to: end)
    }
    
    fileprivate func removeBoundary(_ name: String) {
        breakoutBehavior.collider.removeBoundary(withIdentifier: name as NSCopying)
    }
    
    func addBarriersToBounds() {
        let leftStart = CGPoint(x: 0.0, y: 0.0)
        let leftEnd = CGPoint(x: 0.0, y: self.bounds.height)
        let rightStart = CGPoint(x: self.bounds.width, y: 0.0)
        let rightEnd = CGPoint(x: self.bounds.width, y: self.bounds.height)
        addBoundary("Left Boundary", start: leftStart, end: leftEnd)
        addBoundary("Right Boundary", start: rightStart, end: rightEnd)
        addBoundary("Upper Boundary", start: leftStart, end: rightStart)
    }
    
    //MARK: Animating elements functions
    func createBricks() {
        let gapInBricksWidth: CGFloat = 4
        let gapInBricksHeight: CGFloat = 4
        var heightOfViewWithoutBricks: CGFloat {
            if let height = self.superview?.frame.height {
                let heightOfViewWithoutBricks = height * 3 / 4 //we want total height of bricks to be one fourth of the height of the view.
                return heightOfViewWithoutBricks
            } else {
                return 0
            }
        }
        var specialBrickAtRow = Int.max
        var specialBrickAtColumn = Int.max
        if anySpecialBrick {
            specialBrickAtRow = Int(arc4random()) % bricksPerRow
            specialBrickAtColumn = Int(arc4random()) % bricksPerColumn
        }
        for row in 0..<bricksPerRow {
            for column in 0..<bricksPerColumn {
                let widthOfBrick = (self.superview!.bounds.width - (gapInBricksWidth * CGFloat(bricksPerColumn + 1))) / CGFloat(bricksPerColumn) // width of brick = (view's width - total gap) / no of bricks in a row
                let heightOfBrick = (self.superview!.bounds.height / 4 - (gapInBricksHeight * CGFloat(bricksPerRow + 1))) / CGFloat(bricksPerRow) // height of brick = (one fourth of view's height - total gap) / no of bricks in a column
                let brickSize = CGSize(width: widthOfBrick, height: heightOfBrick)
                let x: CGFloat = self.superview!.bounds.minX + (brickSize.width * CGFloat(column)) + (gapInBricksWidth * CGFloat(column + 1))
                let y: CGFloat = self.superview!.bounds.minY + (gapInBricksHeight * CGFloat(row + 1)) + (brickSize.height * CGFloat(row))
                let origin = CGPoint(x: x, y: y)
                let brick: UIView = {
                    if row == specialBrickAtRow && column == specialBrickAtColumn {
                        $0.backgroundColor = .green
                    } else {
                        $0.backgroundColor = .blue
                    }
                    $0.translatesAutoresizingMaskIntoConstraints = false
                    return $0
                }(UIView())
                brick.frame = CGRect(origin: origin, size: brickSize)
                self.addSubview(brick)
                bricks.append(brick)
                breakoutBehavior.addBrickBehavior(brick)
                breakoutBehavior.addCollision(brick)
            }
        }
    }
    
    func removeBricks() {
        for brick in bricks {
            breakoutBehavior.removeBehaviors(brick)
            brick.removeFromSuperview()
        }
        bricks.removeAll()
    }
    
    func createBalls() {
        for i in 0..<noOfBalls {
            let gap = 8
            let origin = CGPoint(x: self.superview!.bounds.midX - (ballSize.width * CGFloat(i)) - CGFloat(gap * i), y: self.superview!.bounds.midY)
            let frame = CGRect(origin: origin, size: ballSize)
            let ball: UIView = {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.backgroundColor = .red
                $0.frame = frame
                $0.layer.cornerRadius = ballSize.height / 2
                return $0
            }(UIView())
            self.addSubview(ball)
            bouncingBalls.append(ball)
            breakoutBehavior.addCollision(ball)
            breakoutBehavior.addBallBehavior(ball)
        }
    }
    
    func giveAPushToBalls() {
        for ball in bouncingBalls {
            breakoutBehavior.addPush(ball)
        }
    }
    
    func removeBalls() {
        for ball in bouncingBalls {
            breakoutBehavior.removeBehaviors(ball)
            ball.removeFromSuperview()
        }
        bouncingBalls.removeAll()
    }
    
    func createPaddle() {
        self.addSubview(paddle)
        self.addConstraint(NSLayoutConstraint(item: paddle, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: superview!.bounds.midX - (paddleSize.width / 2)))
        self.addConstraint(NSLayoutConstraint(item: paddle, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -8.0))
        self.addConstraint(NSLayoutConstraint(item: paddle, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: paddleSize.width))
        self.addConstraint(NSLayoutConstraint(item: paddle, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: paddleSize.height))
        paddle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(movePaddle)))
        let startPoint = CGPoint(x: superview!.bounds.midX - (paddleSize.width / 2), y: paddle.center.y - (paddleSize.height / 2))
        let endPoint = CGPoint(x: superview!.bounds.midX + (paddleSize.width / 2), y: paddle.center.y - (paddleSize.height / 2))
        addBoundary("paddle barrier", start: startPoint, end: endPoint)
    }
    
    func movePaddle(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        paddle.center.x = paddle.center.x + translation.x
        if paddle.center.x < self.superview!.bounds.minX + (paddleSize.width / 2) {
            paddle.center.x = self.superview!.bounds.minX + (paddleSize.width / 2)
        } else if paddle.center.x > self.superview!.bounds.maxX - (paddleSize.width / 2) {
            paddle.center.x = self.superview!.bounds.maxX - (paddleSize.width / 2)
        }
        sender.setTranslation(CGPoint.zero, in: self)
        let startPoint = CGPoint(x: paddle.center.x - (paddleSize.width / 2), y: paddle.center.y - (paddleSize.height / 2))
        let endPoint = CGPoint(x: paddle.center.x + (paddleSize.width / 2), y: paddle.center.y - (paddleSize.height / 2))
        removeBoundary("paddle barrier")
        addBoundary("paddle barrier", start: startPoint, end: endPoint)
    }
    
    //MARK: collision delegate method
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        var brick: UIView?
        if item1.bounds.width == bricks[0].frame.width {
            brick = item1 as? UIView
        } else if item2.bounds.width == bricks[0].frame.width {
            brick = item2 as? UIView
        }
        
        if let brick = brick {
            for (index, theBrick) in bricks.enumerated() {
                if brick == theBrick {
                    bricks.remove(at: index)
                }
            }
            if brick.backgroundColor == .green {
                score += 100
            } else if breakoutBehavior.ballBehavior.elasticity == 1 {
                score += 10
            } else if breakoutBehavior.ballBehavior.elasticity == 1.05 {
                score += 20
            } else {
                score += 30
            }
            self.breakoutBehavior.removeBehaviors(brick)
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                brick.flip()
                brick.alpha = 1.0
            }) { (finished) in
                brick.isHidden = true
            }
            if bricks.isEmpty {
                removeBalls()
                dataSource?.displayWinAlert()
            }
        }
    }
}
