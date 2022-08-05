//
//  main.swift
//  Boj1654
//
//  Created by 이동희 on 2022/08/03.
//

import Foundation

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let K = arr[0]
let N = arr[1]
var arr2 = [Int]()
for _ in 0..<K {
    arr2.append(Int(String(readLine()!))!)
}

var start = 1
var end = arr2.max()!

while start <= end {
    let mid = (start + end) / 2
    var cnt = 0
    for i in 0..<K {
        cnt += (arr2[i] / mid)
    }
    if cnt < N {
        end = mid - 1
    } else {
        start = mid + 1
    }
}
print(start-1)

