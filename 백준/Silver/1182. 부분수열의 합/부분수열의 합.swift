let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let S = input[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var ans = 0

func dfs(_ start: Int, _ currentSum: Int) {
    if currentSum == S {
        ans += 1
    }

    for i in start..<N {
        dfs(i + 1, currentSum + arr[i])
    }
}

// DFS 시작
dfs(0, 0)

// 출력 (S가 0인 경우 빈 부분수열을 제외)
print(S == 0 ? ans - 1 : ans)
