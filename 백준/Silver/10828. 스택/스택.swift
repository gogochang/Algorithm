enum Action: String {
    case push // 정수 X을 스택에 넣는 연산이다.
    case pop  // 가장 위에 있는 정수를 가져오고, 없으면 -1을 출력
    case size // 스택에 들어있는 정수의 개수를 출력한다.
    case empty // 스택이 비어있으면 1, 아니면 0
    case top // 스택의 가장 위에 있는 정수를 출력, 없으면 -1을 출력
    
    func myFunc(X: Int?) -> Int? {
        switch self {
        case .push:
            guard let X = X else { return nil }
            results.append(X)
            return nil
        case .pop:
            return results.isEmpty ? -1 : results.removeLast()
        case .size:
            return results.count
        case .empty:
            return results.isEmpty ? 1 : 0
        case .top:
            return results.isEmpty ? -1 : results.last
        }
    }
}

let N = Int(readLine()!)!
var inputs: [(Action, Int?)] = []
var results:[Int] = []
(0..<N).forEach { _ in
    let input = readLine()!.split(separator: " ").map { String($0) }
    inputs.append((
        Action(rawValue: input[0])!,
        input.count > 1 ? Int(input[1]) : nil
    ))
}

inputs.forEach {
    guard let result = $0.0.myFunc(X: $0.1) else { return }
    print("\(result)")
}
