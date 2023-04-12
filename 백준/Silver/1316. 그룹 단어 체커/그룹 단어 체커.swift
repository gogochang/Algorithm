var result = 0

for _ in 0..<Int(readLine()!)! {
    let input = Array(readLine()!)
    var isGroupWord = true
    for i in Set(input) {
        let duplicate = input.enumerated().filter{ $0.element == i}.map{ $0.offset}
        if duplicate.count > 1 {
            for j in 0..<duplicate.count - 1 {
                if duplicate[j+1] - duplicate[j] > 1 {
                    isGroupWord = false
                }
            }
        }
    }
    if isGroupWord {
        result += 1
    }

}
print(result)
