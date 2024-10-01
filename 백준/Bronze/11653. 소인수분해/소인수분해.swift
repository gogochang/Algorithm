import Foundation

var N = Int(readLine()!)!
if N > 1 {
    for i in 2...N {
        if N <= 1 {break}
        if i * i > N {
            print(N)
            break
        }
        while(N % i == 0) {
            print(i)
            N /= i
        }
    }
}
