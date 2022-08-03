//
//  main.swift
//  Boj10816
//
//  Created by 이동희 on 2022/08/03.
//

import Foundation
let N = Int(readLine()!)
var firstArr = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = Int(readLine()!)
let secArr = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = [Int]()
var dics = [Int:Int]()
firstArr.sort()

for i in firstArr {
    if dics.keys.contains(i) {
        dics[i]! += 1
    } else {
        dics[i] = 1
    }
}

for j in secArr {
    if dics.keys.contains(j) {
        result.append(dics[j]!)
    } else {
        result.append(0)
    }
}

print(result.map{String($0)}.joined(separator: " "))


