var num = Int(readLine()!)!
var result: String = ""

while num != 0 {
    var remainder = num % -2
    num = num / -2
    
    if remainder < 0 {
        num += 1
        remainder += 2
    }
    
    result = "\(remainder)" + result
}

print(result.isEmpty ? "0" : result)
