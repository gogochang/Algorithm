while let S = readLine() {
    var lower = 0
    var upper = 0
    var num = 0
    var space = 0
    
    for i in S {
        if i >= "a" && i <= "z" {
            lower += 1
        } else if i >= "A" && i <= "Z" {
            upper += 1
        } else if i == " " {
            space += 1
        } else {
            num += 1
        }
    }
    
    print("\(lower) \(upper) \(num) \(space)")
}
