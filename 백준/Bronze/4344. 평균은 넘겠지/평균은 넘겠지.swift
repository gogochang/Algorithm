import Foundation
let C = Int(readLine()!)!
for _ in 0..<C {
    let points = readLine()!.split(separator: " ").map{ Double($0)! }
    let average = points[1...points.count - 1].reduce(0, +) / points[0]
    let result = Double(points[1...points.count - 1].filter{ $0 > average }.count)
    print(String(format: "%.3f", result/points[0] * 100)+"%")
}