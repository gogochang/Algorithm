let S = readLine()!
var result: String = ""
var temp: String = ""
var isStart: Bool = false

S.forEach {
  if $0 == "<" {
    if !temp.isEmpty {
      result.append(String(temp.reversed()))
      temp = ""
    }
    isStart = true
  }
  
  if isStart {
    result.append($0)
    if $0 == ">" {
      isStart = false
    }
  } else {
    if $0 == " " {
      result.append(String(temp.reversed()) + " ")
      temp = ""
    } else {
      temp.append($0)
    }
  }
}

print(result + String(temp.reversed()))
