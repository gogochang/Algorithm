let s = readLine()!

for char in s {
    let ascii = char.asciiValue!
    
    if ascii >= 65 && ascii <= 90 {
        let output = ((ascii + 13) - 65) % 26 + 65
        print(Character(UnicodeScalar(output)), terminator: "")
    } else if ascii >= 97 && ascii <= 122 {
        let output = ((ascii + 13) - 97) % 26 + 97
        print(Character(UnicodeScalar(output)), terminator: "")
    } else {
        print(char, terminator: "")
    }
}
