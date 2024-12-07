let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

// 부모 노드 배열 초기화
var parent = Array(0...n)

// Find 함수 : 경로 압축 적용
func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x]) // 경로 압축
    }
    return parent[x]
}

// Union 함수 : 두 집합을 합침
func union(_ a: Int, _ b: Int) {
    let rootA = find(a)
    let rootB = find(b)
    
    if rootA != rootB {
        parent[rootB] = rootA // B의 root를 A의 root로 설정
    }
}

// 입력 처리
var result = ""
for _ in 0..<m {
    let query = readLine()!.split(separator: " ").map { Int($0)! }
    let operation = query[0]
    let a = query[1]
    let b = query[2]
    
    if operation == 0 {
        union(a,b)
    } else if operation == 1 {
        result += (find(a) == find(b) ? "YES\n" : "NO\n")
    }
}

print(result)
