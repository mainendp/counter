//
//  ViewController.swift
//  counter+MVVM+RX
//
//  Created by 장창순 on 09/08/2020.
//  Copyright © 2020 mainednp. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CountViewController: UIViewController {
    
    private let viewModel = CounterViewModel()
    private var disposeBag = DisposeBag()
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    func bindUI() {
        viewModel.number
            .map { "\($0)" }
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.number
            .map { $0 >= 10 ? false : true }
            .bind(to: increaseButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.number
            .map { $0 <= 0 ? false : true }
            .bind(to: decreaseButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }

    @IBAction func decreaseButtonPressed(_ sender: Any) {
        viewModel.changeCount(-1)
    }
    
    @IBAction func increaseButtonPressed(_ sender: Any) {
        viewModel.changeCount(1)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        viewModel.resetCount()
    }
}

