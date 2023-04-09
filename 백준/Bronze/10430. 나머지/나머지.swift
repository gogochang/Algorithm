import Foundation

let line = readLine()!
let lineArr = line.components(separatedBy: " ")

let A = Int(lineArr[0])!
let B = Int(lineArr[1])!
let C = Int(lineArr[2])!
print( (A + B) % C )
print( ((A % C) + (B % C)) % C)
print( (A * B) % C )
print( ((A % C) * (B % C)) % C)