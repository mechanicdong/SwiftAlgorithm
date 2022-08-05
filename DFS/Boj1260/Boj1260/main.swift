//
//  main.swift
//  Boj1260
//
//  Created by 이동희 on 2022/08/05.
//

import Foundation
let inputArr = readLine()!.split(separator: " ").compactMap{ Int(String($0))! }
let N = inputArr[0]
let M = inputArr[1]
let V = inputArr[2]

var visited = Array(repeating: false, count: N+1)
var map = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)

//노드의 연결상태 map 그리기
for _ in 0..<M {
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    map[nums[0]][nums[1]] = 1
    map[nums[1]][nums[0]] = 1
}

func dfs(_ start: Int) {
    visited[start] = true
    print(start, terminator: " ")
    for i in 1..<N+1 {
        if((visited[i] == false) && (map[start][i] == 1)) {
            dfs(i)
        }
    }
}

func bfs(_ start: Int) {
    var q = [Int]()
    //dfs 실행 시 true로 바뀐 상태 그대로 사용
    visited[start] = false
    q.append(start)
    
    while !q.isEmpty {
        let newNode = q.removeFirst()
        print(newNode, terminator: " ")
        
        for i in 1..<N+1 {
            if ((visited[i] == true) && map[newNode][i] == 1) {
                q.append(i)
                visited[i] = false
            }
        }
    }
}

dfs(V)
print("")
bfs(V)
