//
//  main.swift
//  Boj2178
//
//  Created by 이동희 on 2022/08/05.
//

import Foundation

let inputArr = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
let N = inputArr[0]
let M = inputArr[1]

///BFS
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var map = Array(repeating: Array(repeating: 0, count: M), count: N)
var distance = Array(repeating: Array(repeating: 0, count: M), count: N)

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

for i in 0..<N {
    map[i] = readLine()!.compactMap { Int(String($0))! }
}

func bfs() {
    var q = Array<(Int,Int)>()
    visited[0][0] = true
    distance[0][0] = 1
    q.append((0,0))
    
    while !q.isEmpty {
        let newNode = q.removeFirst()
        let x = newNode.0
        let y = newNode.1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if(nx < 0 || ny < 0 || nx >= N || ny >= M || visited[nx][ny] || map[nx][ny] == 0) {
                continue
            } else {
                distance[nx][ny] = distance[x][y] + 1
                visited[nx][ny] = true
                q.append((nx,ny))
            }
        }
    }
}
bfs()
print(distance[N-1][M-1])


