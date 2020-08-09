//
//  ViewController.swift
//  counter+MVC
//
//  Created by 장창순 on 09/08/2020.
//  Copyright © 2020 mainednp. All rights reserved.
//

import UIKit

class CountViewController: UIViewController {
    
    private var counter = Counter()
    private var observation = [NSKeyValueObservation]()
    
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet private weak var increaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialButtonFlag()
        setupObservation()
    }
    
    func setupInitialButtonFlag() {
        decreaseButton.isEnabled = false
        increaseButton.isEnabled = true
    }
    
    func setupObservation() {
        let countObservation = counter.observe(\.count, options: .new) { (number, change) in
            
            self.countLabel.text = "\(number.count)"
            
            switch number.count {
            case 0 :
                self.decreaseButton.isEnabled = false
            case 10:
                self.increaseButton.isEnabled = false
            default :
                self.increaseButton.isEnabled = true
                self.decreaseButton.isEnabled = true
            }
        }
        observation.append(countObservation)
    }
    
    deinit{
        observation.removeAll()
    }
    
    @IBAction func decreaseButtonPressed(_ sender: Any) {
        counter.operate(-1)
    }
    
    @IBAction func increaseButtonPressed(_ sender: Any) {
        counter.operate(1)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        counter.reset()
        setupInitialButtonFlag()
    }
}

