func countLengthOfNumbers(_ N: Int) -> Int {
    var length = 0  // 전체 자릿수 합을 저장하는 변수
    var start = 1   // 현재 자릿수 범위의 시작 숫자
    var digit = 1   // 현재 자릿수

    // 10^digit - 1 이 N보다 작을 때까지 반복
    while start <= N {
        // 현재 자릿수의 범위에서 숫자의 끝을 구함 (예: 1-9, 10-99)
        let end = min(N, start * 10 - 1)
        // 해당 범위에서 숫자의 개수를 계산한 후 자릿수로 곱해 더함
        length += (end - start + 1) * digit
        // 자릿수 범위를 10배로 늘리고, 자릿수를 1 증가시킴
        start *= 10
        digit += 1
    }

    return length
}

// 입력 받기
if let input = readLine(), let N = Int(input) {
    print(countLengthOfNumbers(N))
}