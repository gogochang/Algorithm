let K = Int(readLine()!)!
let signs = readLine()!.split(separator: " ").map { String($0) }

var maxResult = ""
var minResult = ""
var visited = Array(repeating: false, count: 10)

func isValid(_ a: Int, _ b: Int, _ sign: String) -> Bool {
    if sign == "<" {
        return a < b
    } else {
        return a > b
    }
}

func dfs(_ depth: Int, _ numStr: String) {
    if depth == K + 1 {
        if minResult.isEmpty || numStr < minResult {
            minResult = numStr
        }
        
        if maxResult.isEmpty || numStr > maxResult {
            maxResult = numStr
        }
        return
    }
    
    for i in 0...9 {
        if !visited[i] {
            if depth == 0 || isValid(Int(String(numStr.last!))!, i, signs[depth - 1]) {
                visited[i] = true
                dfs(depth + 1, numStr + "\(i)")
                visited[i] = false
            }
        }
    }
}

dfs(0, "")
print(maxResult)
print(minResult)
