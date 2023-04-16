import Foundation
var dotCount = 3
var result = 0

for i in 1...Int(readLine()!)! {
    result = Int(pow(Double(dotCount),2))
    dotCount = dotCount + Int(pow(2,Double(i)))
}

print(result)