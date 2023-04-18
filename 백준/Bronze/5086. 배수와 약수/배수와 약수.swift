var result: [String] = []
while true {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    if (input[0] == 0) && (input[1] == 0) {
        for i in result {
            print(i)
        }
        break
    } else if input[1]%input[0] == 0 {
        result.append("factor")
    } else if input[0]%input[1] == 0{
        result.append("multiple")
    } else {
        result.append("neither")
    }
}