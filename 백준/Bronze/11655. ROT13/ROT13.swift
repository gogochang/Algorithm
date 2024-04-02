let S = readLine()!
var result: [Character] = []
for char in S {
  var ascii = Int(char.asciiValue!)
  if (65 <= ascii && 90 >= ascii) {
    ascii += 13
    ascii = (ascii > 90) ? 65+(ascii-91) : ascii
  } else if (97 <= ascii && 122 >= ascii) {
    ascii += 13
    ascii = (ascii > 122) ? 97+(ascii-123) : ascii
    
  }
  result.append(Character(UnicodeScalar(ascii)!))
}

print(result.map { String($0)}.joined(separator:""))
