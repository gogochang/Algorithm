let S = Array(readLine()!)
var result: [String] = []

for i in 0..<S.count {
  var str = ""
  
  for j in i..<S.count {
    str += String(S[j])
  }
  result.append(str)
}

result.sorted().forEach {
  print($0)
}