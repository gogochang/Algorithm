let input = readLine()!.split(separator: " ").map{ Int($0)!}
print(min(min(input[2] - input[0], input[0]),min(input[3] - input[1], input[1])))
