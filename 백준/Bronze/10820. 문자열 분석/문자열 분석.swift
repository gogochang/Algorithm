while let S = readLine() {
  var result: [Int] = Array(repeating: 0, count: 4)
  for char in S {
    let ascii = Int(char.asciiValue!)
    if 65 <= ascii && 90 >= ascii {
      result[1] += 1
    } else if 97 <= ascii && 122 >= ascii {
      result[0] += 1
    } else if 48 <= ascii && 57 >= ascii {
      result[2] += 1
    } else {
      result[3] += 1
    }
  }
  print(result.map { String($0)}.joined(separator: " "))
}