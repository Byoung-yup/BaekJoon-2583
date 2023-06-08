//
//  main.swift
//  BaekJoon#2583
//
//  Created by 김병엽 on 2023/05/30.
//
// Refernce: https://icksw.tistory.com/136

import Foundation

func solution() {
    
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let m = input[0] // 세로
    let n = input[1] // 가로
    let k = input[2]
    
    var paper = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    var rectPoints = [[Int]]()
    
    for _ in 0..<k {
        rectPoints.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    // 직사각형 부분 채워주기
    for i in 0..<rectPoints.count {
        
        let leftPoint = (rectPoints[i][0], rectPoints[i][1])
        let rightPoint = (rectPoints[i][2], rectPoints[i][3])
        
        for x in leftPoint.0..<rightPoint.0 {
            for y in leftPoint.1..<rightPoint.1 {
                if paper[y][x] == 0 {
                    paper[y][x] = 1
                }
                else {
                    continue
                }
            }
        }
    }
    
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    var result = [Int]()
    var count = 0
    
    func dfs(_ x: Int, _ y: Int) {
        
        for i in 0..<4 {
          
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx > n - 1 || nx < 0 || ny > m - 1 || ny < 0 { continue }
            
            else {
                
                if paper[ny][nx] == 0 {
                    paper[ny][nx] = 1
                    count += 1
                    dfs(nx, ny)
                    
                } else { continue}
            }
            
        }
    }
    
    for x in 0..<n {
        for y in 0..<m {
            if paper[y][x] == 0 {
                paper[y][x] = 1
                count += 1
                dfs(x, y)
                result.append(count)
                count = 0
            }
        }
    }
    
    result.sort(by: <)
    
    print(result.count)
    print(result.map { String($0) }.joined(separator: " "))
    
}

solution()

