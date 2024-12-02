struct MinHeap {
    private var heap: [Int] = []
    
    init() {
        heap.append(0) // 0번째 인덱스는 사용하지 않음
    }
    
    var isEmpty: Bool {
        return heap.count == 1
    }
    
    mutating func insert(_ value: Int) {
        heap.append(value)
        var index = heap.count - 1 // insert는 힙의 가장 마지막 위치
        
        while index > 1 && heap[index] < heap[index / 2] {
            heap.swapAt(index, index / 2)
            index = index / 2
        }
    }
    
    mutating func remove() -> Int {
        if isEmpty {
            return 0
        }
        
        let minValue = heap[1]
        heap[1] = heap[heap.count - 1]
        heap.removeLast()
        
        var index = 1
        while index * 2 < heap.count { // 자식노드가 있냐 없냐 확인
            var childIndex = index * 2
            
            if childIndex + 1 < heap.count && heap[childIndex + 1] < heap[childIndex] {
                childIndex += 1
            }
            
            if heap[index] <= heap[childIndex] {
                break
            }
            
            heap.swapAt(index, childIndex)
            index = childIndex
        }
        
        return minValue
    }
}

let n = Int(readLine()!)!
var minHeap = MinHeap()

for _ in 0..<n {
    let x = Int(readLine()!)!
    
    if x == 0 {
        print(minHeap.remove())
    } else {
        minHeap.insert(x)
    }
}
