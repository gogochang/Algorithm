var input = readLine()!.split(separator: " ").map{Int($0)!}
var result = ""

while input[0] != 0 {
    let remainder = input[0] % input[1]
    result.append(String(UnicodeScalar(remainder + (remainder >= 10 ? 55 : 48))!))
    input[0] = input[0]/input[1]
}
print(String(result.reversed()))