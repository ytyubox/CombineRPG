//
//  File.swift
//  
//
//  Created by 游宗諭 on 2020/10/20.
//

import Foundation

class FormThis {
    internal init(value: Int, valueChanged: @escaping (Int) -> Void) {
        self.value = value
        self.valueChanged = valueChanged
    }
    
    var value:Int {
        didSet {
            valueChanged(value)
        }
    }
    var valueChanged:(Int) -> Void
}
