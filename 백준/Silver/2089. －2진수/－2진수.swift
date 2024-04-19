func minusTwoBinary(_ n: Int) -> String {
    if n == 0 {
        return "0"
    }

    var number = n
    var result = ""

    while number != 0 {
        var remainder = number % -2
        number /= -2

        if remainder < 0 {
            remainder += 2
            number += 1
        }

        result = "\(remainder)" + result
    }

    return result
}

print(minusTwoBinary(Int(readLine()!)!))
