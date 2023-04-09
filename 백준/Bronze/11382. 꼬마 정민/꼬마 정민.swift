import Foundation

let line = readLine()!
let lineArr = line.description.components(separatedBy: " ")


print( Int(lineArr[0])! + Int(lineArr[1])! + Int(lineArr[2])! )