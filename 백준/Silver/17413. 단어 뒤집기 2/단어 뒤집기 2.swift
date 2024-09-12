var input = readLine()!.map { String($0) }
var tag = ""
var word = ""
var isTag: Bool = false
var answer = ""

for char in input {
    switch char {
    case "<":
        if word != "" {
            answer.append(String(word.reversed()))
            word = ""
        }
        tag.append(char)
        isTag = true
    case ">":
        tag.append(char)
        answer.append(tag)
        tag = ""
        isTag = false
    case " ":
        if isTag {
            tag.append(char)
        } else {
            answer.append(String(word.reversed() + " "))
            word = ""
        }
    default:
        if isTag {
            tag.append(char)
        } else {
            word.append(char)
        }
    }
}

print(answer + word.reversed())
