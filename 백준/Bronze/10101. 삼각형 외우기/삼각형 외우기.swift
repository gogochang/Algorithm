let a = Int(readLine()!)!
let b = Int(readLine()!)!
let c = Int(readLine()!)!

if a + b + c == 180 {
    if a == 60 && b == 60 && c == 60 {
        print("Equilateral")
    } else if a == b || a == c || b == c {
        print("Isosceles")
    } else {
        print("Scalene")
    }
} else {
    print("Error")
}
