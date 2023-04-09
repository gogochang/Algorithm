import Foundation

let line = readLine()!
let lineArr = line.components(separatedBy: " ")

// Float (4byte,32bit), Double(8byte,64bit)
let a = Double(lineArr[0])!
let b = Double(lineArr[1])!

print(a/b)