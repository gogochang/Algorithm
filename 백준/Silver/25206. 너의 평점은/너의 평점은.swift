import Foundation
var total = 0.0
var total2 = 0.0
let score: [String: Double] = ["A+":4.5,
                               "A0":4.0,
                               "B+":3.5,
                               "B0":3.0,
                               "C+":2.5,
                               "C0":2.0,
                               "D+":1.5,
                               "D0":1.0,
                               "F":0.0]

for _ in 0..<20 {
    let inputArr = readLine()!.split(separator: " ").map{$0}
    if inputArr[2] == "P" { continue }
    total = total + Double(inputArr[1])! * score[String(inputArr[2])]!
    total2 = total2 + Double(inputArr[1])!
}
print(String(format: "%.6f", total/total2))