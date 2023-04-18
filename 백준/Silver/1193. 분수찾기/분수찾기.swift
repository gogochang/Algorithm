var input = Int(readLine()!)!
var n = 1
var i = 2
while true {
    if input == 1 {
        print("1/1")
        break
    }
    if input <= n + i {
        let x = input - n
        let y = ( n + i ) - input + 1
        if i % 2 == 0 {
            print("\(x)/\(y)")
        } else {
            print("\(y)/\(x)")
        }
        break
    } else {
        n += i;
        i += 1;
    }
}
