//
//  Counter.swift
//  counter+MVVM+RX
//
//  Created by 장창순 on 09/08/2020.
//  Copyright © 2020 mainednp. All rights reserved.
//

import Foundation

struct Counter {
    
    private var count = 0
    
    var getCount: Int {
        return count
    }
    
    mutating func operate(_ num: Int) -> Int {
        count += num
        return count
    }
    
    mutating func reset() -> Int {
        count = 0
        return count
    }
}
