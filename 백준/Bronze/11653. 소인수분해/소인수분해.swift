var input = Int(readLine()!)!
while input > 1 {
    for i in 2...input {
        if input % i == 0 {
            input = input/i
            print(i)
            break
        }
    }
}
