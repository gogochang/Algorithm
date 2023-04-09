import Foundation

let firstLine = Int(readLine()!)!
let secondLine = Int(readLine()!)!

for i in Array(String(secondLine)).reversed() {
    let num = Int(String(i))!
    print(firstLine * num)
}
print(firstLine * secondLine)