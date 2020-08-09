//
//  CounterViewModel.swift
//  counter+MVVM+RX
//
//  Created by 장창순 on 09/08/2020.
//  Copyright © 2020 mainednp. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CounterViewModel {
    
    private var counter = Counter()
    lazy var number = BehaviorRelay<Int>(value: counter.getCount)
    
    func changeCount(_ num: Int) {
        number.accept(counter.operate(num))
    }
    
    func resetCount() {
        number.accept(counter.reset())
    }
}
