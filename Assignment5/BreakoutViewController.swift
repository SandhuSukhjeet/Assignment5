//
//  BreakoutViewController.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import UIKit

class BreakoutViewController: UIViewController {

    private let scoreLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Score : 0"
        return $0
    }(UILabel())

    let breakoutView: BreakoutView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(BreakoutView())
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .None
        addScoreLabel()
        addBreakoutView()
        breakoutView.dataSource = self
        breakoutView.createBricks()
        breakoutView.createPaddle()
        breakoutView.createBalls()
        breakoutView.breakoutBehavior.collider.collisionDelegate = breakoutView
        breakoutView.addGestureRecognizer(UITapGestureRecognizer(target: breakoutView, action: #selector(breakoutView.giveAPushToBalls)))
        addActionToCollider()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        breakoutView.addBarriersToBounds()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        breakoutView.animating = true
    }
    
    //MARK: Setting constraints
    
    private func addScoreLabel() {
        view.addSubview(scoreLabel)
        
        view.addConstraint(NSLayoutConstraint(item: scoreLabel, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: UIApplication.sharedApplication().statusBarFrame.size.height))
        
        view.addConstraint(NSLayoutConstraint(item: scoreLabel, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0))
    }
    
    private func addBreakoutView() {
        view.addSubview(breakoutView)
        
        view.addConstraint(NSLayoutConstraint(item: breakoutView, attribute: .Top, relatedBy: .Equal, toItem: scoreLabel, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: breakoutView, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: breakoutView, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: breakoutView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
    }
    
    //MARK: Collider action
    private func addActionToCollider() {
        breakoutView.breakoutBehavior.collider.action = { [unowned self] in
            for ball in self.breakoutView.bouncingBalls {
                if !CGRectIntersectsRect(ball.frame, self.breakoutView.frame) && (self.breakoutView.anyBallInOuterSpace == false) {
                    self.breakoutView.removeBalls()
                    self.breakoutView.removeBricks()
                    self.displayLoseAlert()
                    self.breakoutView.anyBallInOuterSpace = true
                }
            }
        }
    }
    
    //MARK: Alert method
    private func displayLoseAlert() {
        let title = "You Lost"
        let message = " Your Score is " + "\(breakoutView.score)" + "\n Press OK to play again"
        let okText = "ok"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Default) { (okButton) in
            self.breakoutView.score = 0
            self.breakoutView.createBricks()
            self.breakoutView.createBalls()
            self.addActionToCollider()
            self.breakoutView.anyBallInOuterSpace = false
        }
        alert.addAction(okButton)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

//MARK: Extension
extension BreakoutViewController: BreakoutViewDelegate {
    func displayWinAlert() {
        let title = "You Won"
        let message = "Congratulations you won the game. Your Score is " + "\(breakoutView.score)" + "\n Press OK to play again"
        let okText = "ok"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.Default) { (okButton) in
            self.breakoutView.score = 0
            self.breakoutView.createBricks()
            self.breakoutView.createBalls()
        }
        alert.addAction(okButton)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func updateScore(score: String) {
        scoreLabel.text = "Score : " + score
    }
}
