var octomal = readLine()!.map { Int(String($0))! }

private func convertBinary(_ num: Int) -> String {
    return "\(num/4)\((num%4)/2)\((num%4)%2)"
}

var result = ""
for num in octomal {
    result += convertBinary(num)
}

if let firstOneIndex = result.firstIndex(of: "1") {
    result = String(result[firstOneIndex...])
} else {
    result = "0"
}

print(result)
