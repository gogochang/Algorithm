import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(_ index: Int, _ currentSum: Int) {
        if index == numbers.count {
            if currentSum == target {
                count += 1
                
            }
            return
        }
        
        // 현재 숫자를 더하거나 뺌
        dfs(index + 1, currentSum + numbers[index])
        dfs(index + 1, currentSum - numbers[index])
    }
    
    // dfs 탐색 시작
    dfs(0, 0)
    return count
}