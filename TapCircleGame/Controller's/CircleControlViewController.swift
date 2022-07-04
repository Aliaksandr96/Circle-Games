//
//  CircleControlViewController.swift
//  TapCircleGame
//
//  Created by Aliaksandr Hunko on 03/07/2022.
//

import UIKit

class CircleControlViewController: UIViewController {
    
    let areaBall = UIView()
    let ball = UIView ()
    
    let UpBtn = UIButton()
    let DownBtn = UIButton()
    let LeftBtn = UIButton()
    let RightBtn = UIButton()
    
    let widthBall = 80
    let heightBall = 80

    var xBall = 120
    var yBall = 120
    
    let step = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        title = "Circle Control"

        // CREATE AREA BALL
        
         areaBall.frame = CGRect(x: 20, y: 100, width: 380, height: 450)
         areaBall.backgroundColor = .systemGray3
         view.addSubview(areaBall)
        
        // CREATE BALL
        
        ball.frame = CGRect(x:xBall, y: yBall, width: widthBall, height: heightBall)
        ball.backgroundColor = .systemYellow
        ball.clipsToBounds = true
        ball.layer.cornerRadius = 40
        areaBall.addSubview(ball)
        
        // CREATE BUTTONS
        
        // UP Button and Swipe Gesture

        UpBtn.frame = CGRect(x: 120, y: 600, width: 80, height: 140)
        UpBtn.backgroundColor = .systemGray
        UpBtn.setTitle("Up", for: .normal)
        view.addSubview(UpBtn)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(moveUp))
        swipeUp.direction = .up
        UpBtn.addGestureRecognizer(swipeUp)
        
        // Down Button and Swipe Gesture
        
        DownBtn.frame = CGRect(x: 210, y: 600, width: 80, height: 140)
        DownBtn.backgroundColor = .systemGray
        DownBtn.setTitle("Down", for: .normal)
        view.addSubview(DownBtn)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(moveDown))
        swipeDown.direction = .down
        DownBtn.addGestureRecognizer(swipeDown)
        
        // Left Button and Swipe Gesture
        
        LeftBtn.frame = CGRect(x: 30, y: 600, width: 80, height: 140)
        LeftBtn.backgroundColor = .systemGray
        LeftBtn.setTitle("Left", for: .normal)
        view.addSubview(LeftBtn)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(moveLeft))
        swipeLeft.direction = .left
        LeftBtn.addGestureRecognizer(swipeLeft)
        
        // Right Button and Swipe Gesture
        
        RightBtn.frame = CGRect(x: 300, y: 600, width: 80, height: 140)
        RightBtn.backgroundColor = .systemGray
        RightBtn.setTitle("Right", for: .normal)
        view.addSubview(RightBtn)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(moveRight))
        swipeRight.direction = .right
        RightBtn.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func moveUp() {
        
        if yBall > Int(view.frame.minY)  {
            
            yBall -= step
            
        }

        ball.frame = CGRect(x:xBall, y: yBall, width: widthBall, height: heightBall)
        
    }
    
    @objc func moveDown() {
        
        if yBall < ((Int(areaBall.frame.maxY) - (heightBall * 2) - step)) {
            
            yBall += step
            
        }

    
        ball.frame = CGRect(x:xBall, y: yBall, width: widthBall, height: heightBall)
    
    }
    
    @objc func moveLeft() {
        
        if xBall > Int(areaBall.frame.minX) {
            
            xBall -= step
            
        }

        ball.frame = CGRect(x:xBall, y: yBall, width: widthBall, height: heightBall)
    
    }
    
    @objc func moveRight() {
        
        if xBall < ((Int(areaBall.frame.maxX) - heightBall) - step)  {
                            
            xBall += step
            
        }
        
            ball.frame = CGRect(x: xBall, y: yBall, width: widthBall, height: heightBall)
    
    }
}

