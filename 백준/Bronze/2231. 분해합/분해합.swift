let input = (readLine()!)

var m = 0
var result = 0
while m <= Int(input)! {
    m += 1
    let dividedNumber = String(m).compactMap { Int(String($0)) }
    if m + dividedNumber.reduce(0, {$0 + $1}) == Int(input)! {
        result = m
        break
    }
}

print(result)