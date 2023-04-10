let count = Int(readLine()!)!
var result = ""
var space = ""
var star = "*"

for i in 1...count {
    space = ""
    for _ in 0..<count-i {
        space = space + " "
    }
    print(space + star)
    star = star + "*"
}