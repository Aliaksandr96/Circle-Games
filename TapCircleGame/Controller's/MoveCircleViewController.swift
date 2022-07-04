//
//  MoveCircleViewController.swift
//  TapCircleGame
//
//  Created by Aliaksandr Hunko on 03/07/2022.
//

import UIKit

class MoveCircleViewController: UIViewController {
   
    let circleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        title = "Move Circle"
        
        let widthCircle = Int(view.bounds.width) / 5
        let heightCircle = Int(view.bounds.width) / 5
        let xCircle = (Int(view.bounds.width) / 2) - (widthCircle / 2)
        let yCircle = (Int(view.bounds.height) / 2) - heightCircle
        
        // Crete Circle 
        
        circleView.frame = CGRect(x: CGFloat(xCircle), y: CGFloat(yCircle), width: CGFloat(widthCircle), height: CGFloat(heightCircle))
        circleView.backgroundColor = .systemYellow
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = view.bounds.width / 10
        view.addSubview(circleView)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target:self, action: #selector(moveCircleView))
        circleView.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    @objc func moveCircleView(recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == .began {
            
        } else if recognizer.state == .changed {
            
            let translation = recognizer.translation(in: self.view)
            
            let xNew = circleView.center.x + translation.x
            let yNew = circleView.center.y  + translation.y
            
            circleView.center = CGPoint(x: xNew, y: yNew )
            recognizer.setTranslation(CGPoint.zero, in: self.view)
             
        } else if recognizer.state == .ended {
            
        }
    }
    
}

