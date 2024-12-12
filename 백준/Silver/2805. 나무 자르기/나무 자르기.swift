let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var trees = readLine()!.split(separator: " ").map { Int($0)! }


var start = 0
var end = trees.max()!
var result = 0

while start <= end {
    var mid = (start + end) / 2
    var total = 0
    
    for tree in trees {
        if tree > mid {
            total += tree - mid
        }
    }
    
    if total >= m {
        result = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(result)
