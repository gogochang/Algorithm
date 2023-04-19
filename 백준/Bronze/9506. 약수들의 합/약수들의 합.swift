import Foundation

while let input = Int(readLine()!), input != -1 {
    var result: [Int] = []
    
    for i in 1...Int(sqrt(Double(input))) {
        if input % i == 0 {
            result.append(i)
            result.append(input/i)
        }
    }
    result = Array(Set(result)).sorted(by: <)
    result.removeLast()

    if result.reduce(0, +) == input {
        print("\(input) = \(result.map { String($0) }.joined(separator: " + "))")
    } else {
        print("\(input) is NOT perfect.")
    }
}
