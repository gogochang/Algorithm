import Foundation

// 문자열 입력 받기
let input = readLine()!

// 스택과 잘린 조각 수 초기화
var stack: [Character] = []
var preChar: Character?
var pieces = 0

// 문자열을 순회
for char in input {
    if char == "(" {
        // 여는 괄호는 스택에 추가
        stack.append(char)
    } else if char == ")" {
        // 닫는 괄호 처리
        if preChar == "(" {
            // 레이저를 만났을 때
            stack.removeLast() // 여는 괄호 제거
            pieces += stack.count // 현재 스택에 있는 조각 수 추가
        } else {
            // 조각의 끝을 만났을 때
            stack.removeLast() // 여는 괄호 제거
            pieces += 1 // 새로운 조각 추가
        }
    }
    
    preChar = char
}

// 결과 출력
print(pieces)
