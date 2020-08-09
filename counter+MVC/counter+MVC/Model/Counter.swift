//
//  Counter.swift
//  counter+MVC
//
//  Created by 장창순 on 09/08/2020.
//  Copyright © 2020 mainednp. All rights reserved.
//

import Foundation

@objcMembers class Counter: NSObject {
    
    dynamic var count = 0
    
    func operate(_ num: Int) {
        count += num
    }
    
    func reset(){
        count = 0
    }
}
