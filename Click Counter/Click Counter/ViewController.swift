//
//  ViewController.swift
//  Click Counter
//
//  Created by Daniyar Agaltsov on 6/17/20.
//  Copyright © 2020 Agaltsov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    var label: UILabel!
    let defaults = UserDefaults.standard
    
//    var label2: UILabel!
    var isWhite = false
//    var decrement: UILabel!
    
    override func viewDidLoad() {
        
        defaults.set(count, forKey: "count")
        super.viewDidLoad()
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height
        view.backgroundColor = UIColor.white
        
        //label
        let label = UILabel()
        label.frame = CGRect(x: w/2, y: 100, width: 200, height: 150)
        label.center = CGPoint(x: w/2, y: 100)
       label.font = UIFont(name: label.font.fontName, size: 100)
        label.textColor = UIColor.black
        if let count = count{
          label.text="\(count)"
        }
        else{
            count = 0
            label.text="\(count ?? 0)"
        }
        
        
        view.addSubview(label)
        self.label = label
        label.textAlignment = .center
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 3.0
        
//        //label2
//        let label2 = UILabel()
//        label2.frame = CGRect(x: 350, y: 150, width: 60, height: 60)
//        label2.text="0"
//        view.addSubview(label2)
//        self.label2=label2
        

        
        
        // increment button
        let button = UIButton()
        
        button.frame=CGRect(x: w/2, y: 250, width: 250, height: 120)
        button.setTitle("Increment", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.blue
        view.addSubview(button)
        button.center = CGPoint(x: w/2, y: h/2-100)
        button.titleLabel?.font = UIFont(name: label.font.fontName, size: 50)
        
        
        button.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControl.Event.touchUpInside)
        
//        decrement button
        let dButton = UIButton()
        dButton.frame = CGRect(x: w/2, y: 350, width: 250, height: 120)

        dButton.setTitle("Decrement ", for: .normal)

        dButton.setTitleColor(UIColor.black, for: .normal)
        dButton.backgroundColor=UIColor.red
        dButton.center = CGPoint(x: w / 2, y: h/2+100)
        dButton.titleLabel?.font = UIFont(name: label.font.fontName, size: 50)
        view.addSubview(dButton)

        dButton.addTarget(self, action: #selector(ViewController.decrementCount), for: .touchUpInside)
        //color change button
//        let colorButton = UIButton()
//        colorButton.frame = CGRect(x: w/2, y: 450, width: 250, height: 60)
//        colorButton.setTitle("Click to change Color", for: .normal)
//        colorButton.setTitleColor(UIColor.black, for: .normal)
//        colorButton.backgroundColor = UIColor.purple
//        colorButton.center = CGPoint(x: w/2, y: 450)
//
//        view.addSubview(colorButton)
//
//        colorButton.addTarget(self, action: #selector(ViewController.changeColor), for: .touchUpInside)
        
        //reset button
        
        let resetButton = UIButton()
        resetButton.frame = CGRect(x: w/2, y: h-100, width: 300, height: 80)
        resetButton.titleLabel?.font = UIFont(name: label.font.fontName, size: 50)
        resetButton.setTitle("reset", for: .normal)
        resetButton.setTitleColor(UIColor.black, for: .normal)
        resetButton.backgroundColor = UIColor.orange
        view.addSubview(resetButton)
        resetButton.center = CGPoint(x: w / 2, y: h-100)
        
        resetButton.addTarget(self, action: #selector(ViewController.reset), for: .touchUpInside)
        
        
    }
    @objc func incrementCount(){
        
        self.count!+=1
        self.label.text = "\(self.count!)"
 
    }
    
    @objc func decrementCount(){
        self.count!-=1
        self.label.text="\(self.count!)"
        
    }
    @objc func changeColor(){
        if(isWhite){
            view.backgroundColor = UIColor.lightGray
            isWhite=false
        }
        else{
            view.backgroundColor = UIColor.white
            isWhite=true
        }

        
        
    }
    @objc func reset(){
        self.count=0
        self.label.text="\(self.count!)"
    }
    


}

