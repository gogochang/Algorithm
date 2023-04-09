import Foundation

let line = readLine()!
let lineArr = line.components(separatedBy: " ")

let A = Int(lineArr[0])!
let B = Int(lineArr[1])!

if A > B {
    print(">")
} else if A < B {
    print("<")
} else if A == B {
    print("==")
}
