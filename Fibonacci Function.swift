//
//  Fibonacci Function.swift
//  Post List
//
//  Created by apple on 6/23/23.
//

import Foundation

func Fibonacci(value: Int, number: Int) -> [Int] {
    var temp = 0
    var val1 = 0
    var val2 = 1
    var result : [Int] = []
    while(val1 < value){
        temp = val1
        val1 = val1+val2
        val2 = temp
    }
    if(val1 == value)
    {
        var num = number
        while(num > 0)
        {
            result.append(val1)
            temp = val1
            val1 = val1+val2
            val2 = temp
            num -= 1
        }
    }
    return result
}
