//
//  GameViewController.swift
//  TapCircleGame
//
//  Created by Aliaksandr Hunko on 02/07/2022.
//

import UIKit

class GameViewController: UIViewController {
    
    private var viewArray: [UIView] = []
    
    let circleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        title = "Tap Circle Game"
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didtap))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        let circleView = UIView(frame: CGRect(x:50, y:50, width: 100, height: 100))
        viewArray.append(circleView)
        
    }
    
    @objc func didtap(_ gesture: UITapGestureRecognizer) {
        for(index, circle) in viewArray.enumerated() {
            let location = gesture.location(in: circle)
            
            if (location.x > 0 && location.x < 110) && (location.y > 0 && location.y < 110) {
                circle.removeFromSuperview()
                viewArray.remove(at: index)
                
                return
                
            }
        }
        
        let point = gesture.location(in: view)
        let circleView = UIView(frame: CGRect(x: point.x - 50 , y: point.y - 50, width: 100, height: 100))
        
        circleView.backgroundColor = .systemRed
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = circleView.bounds.width / 2
        
        viewArray.append(circleView)
        view.addSubview(circleView)
       
    }
}

