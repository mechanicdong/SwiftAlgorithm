//
//  main.swift
//  Boj2805
//
//  Created by 이동희 on 2022/08/05.
//
/*
 입력 -> map -> compactMap 변경
 */

import Foundation
let input = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
let M = input[1]
let input2 = readLine()!.split(separator: " ").compactMap { Int(String($0))! }

var start = 1
var end = input2.max()!

func getSum(_ mid: Int) -> Int {
    var sum = 0
    for tree in input2 where tree > mid {
        sum += tree - mid
    }
    return sum
}
while start <= end {
    let mid = (start + end) / 2
    if(getSum(mid) < M) {
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(start - 1)
