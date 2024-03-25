import Foundation

let T = Int(readLine()!)!
var arr: [String] = []

(0..<T).forEach { _ in
    arr.append(readLine()!)
}

arr.forEach {
    var testCase = $0
    while true {
        testCase = testCase.replacingOccurrences(of: "()", with: "x")
        
        if testCase.contains("x") {
            testCase = testCase.replacingOccurrences(of: "x", with: "")
        } else {
            print(testCase.isEmpty ? "YES" : "NO")
            break
        }
    }
}
