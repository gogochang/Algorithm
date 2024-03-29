var count = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map({Int(String($0))!})
var stack = [[0, nums[0]]]
var answer = Array(repeating: "-1", count: count)

for i in 1..<nums.count {
    while !stack.isEmpty && nums[i] > stack.last![1] {
        answer[stack.removeLast()[0]] = "\(nums[i])"
    }
    stack.append([i, nums[i]])
}

print(answer.joined(separator: " "))