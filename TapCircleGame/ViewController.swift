//
//  ViewController.swift
//  TapCircleGame
//
//  Created by Aliaksandr Hunko on 02/07/2022.
//

import UIKit

class ViewController: UIViewController {

    let tapScreenBtn = UIButton ()
    let moveCircleBtn = UIButton ()
    let circleControlBtn = UIButton ()

    
    let widthBtn = 150
    let heightBtn = 50
    
    let xBtn = 0
    let yBtn = 0
    
    func createNewBtn(xBtn: Int, yBtn: Int, backgroundColor: UIColor, titleName: String ) -> UIButton {
        let newBtn = UIButton()
        
        newBtn.frame = CGRect(x: xBtn, y: yBtn, width: widthBtn, height: heightBtn)
        newBtn.backgroundColor = backgroundColor
        newBtn.setTitle(titleName, for: .normal)
        newBtn.clipsToBounds = true
        newBtn.layer.cornerRadius = CGFloat(heightBtn / 2)
        
        return newBtn
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        let xNextScreenBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yNextScreenBtn = (Int(view.bounds.height) / 2)
        
        let tapCircleGameBtn = createNewBtn(xBtn: xNextScreenBtn, yBtn: yNextScreenBtn, backgroundColor: .systemYellow, titleName: "Tap Circle Game")
        tapCircleGameBtn.addTarget(self, action: #selector(showGameViewController), for: .touchUpInside)
        view.addSubview(tapCircleGameBtn)
        
        let xMoveCircle = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yMoveCircle = (Int(view.bounds.height) / 2) - (heightBtn * 2)
        
        let moveCircleBtn = createNewBtn(xBtn: xMoveCircle, yBtn: yMoveCircle, backgroundColor: .systemYellow, titleName: "Move Circle")
        moveCircleBtn.addTarget(self, action: #selector(showMoveCircleViewController), for: .touchUpInside)
        view.addSubview(moveCircleBtn)

        let xCircleControlBtn = (Int(view.bounds.width) / 2) - (widthBtn / 2)
        let yCircleControlBtn = (Int(view.bounds.height) / 2) + (heightBtn * 2)
        
        let circleControlBtn = createNewBtn(xBtn: xCircleControlBtn, yBtn: yCircleControlBtn, backgroundColor: .systemYellow, titleName: "Circle Control")
        circleControlBtn.addTarget(self, action: #selector(showCircleControlVIewController), for: .touchUpInside)
        view.addSubview(circleControlBtn)
        
        
    }
    
    @objc func showGameViewController() {
    
        let viewController = GameViewController()
        
        navigationController?.pushViewController(viewController, animated: true)

    }
    
    @objc func showMoveCircleViewController() {
        let viewController = MoveCircleViewController()
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func showCircleControlVIewController() {
        
        let viewController = CircleControlViewController()
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}

