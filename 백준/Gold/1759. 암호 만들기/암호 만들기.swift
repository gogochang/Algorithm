let input = readLine()!.split(separator: " ").map { Int($0)! }
let L = input[0] // 암호의 개수 L
let C = input[1] // 주어진 알파벳의 개수
let Arr = readLine()!.split(separator: " ").map { String($0) }.sorted()
var stack = [String]()

func dfs(_ depth: Int, _ start: Int) {
    if depth == L {
        var vowelCount = 0
        for v in "aeiou" {
            if stack.contains(String(v)) {
                vowelCount += 1
            }
        }
        let consonantCount = L - vowelCount
        if vowelCount >= 1 && consonantCount >= 2 {
            print(stack.joined())
        }
        return
    }
    
    for i in start..<C {
            stack.append(Arr[i])
            dfs(depth + 1, i + 1)
            stack.removeLast()
    }
}

dfs(0, 0)
