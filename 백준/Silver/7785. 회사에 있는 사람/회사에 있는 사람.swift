let n = Int(readLine()!)!
var members: [String: Bool] = [:]
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let name = input[0]
    let status = input[1]
    
    
    if status == "enter" {
        members[name, default: false] = true
    } else if status == "leave" {
        members[name, default: false] = false
    }
}

let result: [String] = members.filter { $0.value == true }.keys.map { String($0) }.sorted().reversed()

print(result.joined(separator: "\n"))
