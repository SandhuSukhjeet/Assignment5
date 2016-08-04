//
//  BreakoutViewController.swift
//  Assignment5
//
//  Created by sukhjeet singh sandhu on 04/08/16.
//  Copyright © 2016 sukhjeet singh sandhu. All rights reserved.
//

import UIKit

class BreakoutViewController: UIViewController {

    fileprivate let scoreLabel: UILabel = {
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
        self.edgesForExtendedLayout = UIRectEdge()
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        breakoutView.animating = true
    }
    
    //MARK: Setting constraints
    
    fileprivate func addScoreLabel() {
        view.addSubview(scoreLabel)
        
        view.addConstraint(NSLayoutConstraint(item: scoreLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: UIApplication.shared.statusBarFrame.size.height))
        
        view.addConstraint(NSLayoutConstraint(item: scoreLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0))
    }
    
    fileprivate func addBreakoutView() {
        view.addSubview(breakoutView)
        
        view.addConstraint(NSLayoutConstraint(item: breakoutView, attribute: .top, relatedBy: .equal, toItem: scoreLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: breakoutView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: breakoutView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: breakoutView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0))
    }
    
    //MARK: Collider action
    fileprivate func addActionToCollider() {
        breakoutView.breakoutBehavior.collider.action = { [unowned self] in
            for ball in self.breakoutView.bouncingBalls {
                if !ball.frame.intersects(self.breakoutView.frame) && (self.breakoutView.anyBallInOuterSpace == false) {
                    self.breakoutView.removeBalls()
                    self.breakoutView.removeBricks()
                    self.displayLoseAlert()
                    self.breakoutView.anyBallInOuterSpace = true
                }
            }
        }
    }
    
    //MARK: Alert method
    fileprivate func displayLoseAlert() {
        let title = "You Lost"
        let message = " Your Score is " + "\(breakoutView.score)" + "\n Press OK to play again"
        let okText = "ok"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.default) { (okButton) in
            self.breakoutView.score = 0
            self.breakoutView.createBricks()
            self.breakoutView.createBalls()
            self.addActionToCollider()
            self.breakoutView.anyBallInOuterSpace = false
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: Extension
extension BreakoutViewController: BreakoutViewDelegate {
    func displayWinAlert() {
        let title = "You Won"
        let message = "Congratulations you won the game. Your Score is " + "\(breakoutView.score)" + "\n Press OK to play again"
        let okText = "ok"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okButton = UIAlertAction(title: okText, style: UIAlertActionStyle.default) { (okButton) in
            self.breakoutView.score = 0
            self.breakoutView.createBricks()
            self.breakoutView.createBalls()
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateScore(_ score: String) {
        scoreLabel.text = "Score : " + score
    }
}
