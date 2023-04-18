var input = readLine()!.split(separator: " ").map{ Int($0)!}
let A = input[0], B = input[1], V = input[2]
let Q = (V-A) / (A-B), R = (V-A) % (A-B)

print(R == 0 ?  Q + 1 : Q + 2)
