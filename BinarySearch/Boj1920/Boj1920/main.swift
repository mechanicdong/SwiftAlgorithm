//
//  main.swift
//  Boj1920
//
//  Created by 이동희 on 2022/08/03.
//

import Foundation

let n = Int(readLine()!)
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
arr.sort()
let m = Int(readLine()!)
var arr2 = readLine()!.split(separator: " ").map { Int(String($0))! }

var result = [Int]()

for i in 0..<(arr2.count) {
    result.append(binarySearch(arr, arr2[i]))
}

for i in 0..<(result.count) {
    print(result[i])
}

func binarySearch(_ parent: [Int], _ child: Int) -> Int {
    if child < parent[0] { return 0 }
    else if child > parent[arr.count - 1] { return 0 }
    else {
        var startNum = 0
        var endNum = arr.count - 1
        var midNum = (startNum + endNum) / 2
        while(endNum - startNum >= 0) {
            if(arr[midNum] == child) { return 1 }
            else if(arr[midNum] < child) {
                startNum = midNum + 1
            }
            else if(arr[midNum] > child) {
                endNum = midNum - 1
            }
            
            midNum = (startNum + endNum) / 2
        }
    }
    return 0
}
