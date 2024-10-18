var dwarfs = [Int]() // 난쟁이 9명
var fakeDwarfs: (Int, Int)? // 가짜 난쟁이를 담을 데이터

// 9명의 난쟁이의 키를 하나씩 입력받아 dwarfs에 저장
for _ in 0..<9 {
    dwarfs.append(Int(readLine()!)!)
}

let totalSum = dwarfs.reduce(0,+) // 난쟁이 9명의 키 합
// 난쟁이의 키의 합은 100이기 때문에 초과하는 키를 저장
let targetSum = totalSum - 100

// 난쟁이 두명의 합을 모두 확인하여 100에서 뺀 초과하는 키에 해당하는 가짜난쟁이 2명 추출
for i in 0..<dwarfs.count {
    for j in i+1..<dwarfs.count {
        if dwarfs[i] + dwarfs[j] == targetSum {
            fakeDwarfs = (i, j)
        }
    }
}

// 난쟁이 배열에서 가짜 난쟁이에 해당하는 위치의 키를 삭제
if let (firstDwarf, secondDwarf) = fakeDwarfs {
    dwarfs.remove(at: secondDwarf) // 위치가 변하기 때문에 뒤에부터 삭제
    dwarfs.remove(at: firstDwarf)
}

// 오름차순으로 정렬 후 차례대로 출력
dwarfs.sorted().forEach {
    print($0)
}
