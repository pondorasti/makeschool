//
//  ViewController.swift
//  Examples
//
//  Created by mitchell hudson on 1/25/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // makeGradient()
        // makeCheckBoard()
        // makeCounter()
        // makeRectangles()
        makeGrad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeGrad() {
        let g = GradView(frame: view.bounds)
        view.addSubview(g)
    }
    
    
    func makeRectangles() {
        //
        let r = RectangleView(frame: view.bounds.insetBy(dx: 20, dy: 20))
        view.addSubview(r)
    }
    
    
    func makeCheckBoard() {
        let w = view.bounds.width - 40
        let r = CGRect(x: 20, y: 200, width: w, height: w)
        let board = CheckerBoard(frame: r)
        view.addSubview(board)
    }
    
    func makeCounter() {
        let w = view.bounds.width - 40
        let r = CGRect(x: 20, y: 200, width: w, height: w)
        let counter = CounterWidget(frame: r)
        view.addSubview(counter)

    }
    
    func makeGradient() {
        let gradient = GradientView(frame: view.bounds)
        view.addSubview(gradient)
            
    }


}

