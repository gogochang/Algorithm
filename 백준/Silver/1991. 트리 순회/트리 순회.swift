import Foundation

// Node 정의
class Node {
    let value: Character
    var left: Node?
    var right: Node?

    init(value: Character) {
        self.value = value
    }
}

// 트리 클래스 정의
class BinaryTree {
    private var nodes: [Character: Node] = [:]

    // 노드 생성 또는 반환
    func getNode(_ value: Character) -> Node {
        if let node = nodes[value] {
            return node
        } else {
            let newNode = Node(value: value)
            nodes[value] = newNode
            return newNode
        }
    }

    // 트리에 연결 추가
    func addEdge(parent: Character, left: Character, right: Character) {
        let parentNode = getNode(parent)
        if left != "." {
            parentNode.left = getNode(left)
        }
        if right != "." {
            parentNode.right = getNode(right)
        }
    }

    // 전위 순회
    func preorder(_ node: Node?, _ result: inout String) {
        guard let node = node else { return }
        result.append(node.value)
        preorder(node.left, &result)
        preorder(node.right, &result)
    }

    // 중위 순회
    func inorder(_ node: Node?, _ result: inout String) {
        guard let node = node else { return }
        inorder(node.left, &result)
        result.append(node.value)
        inorder(node.right, &result)
    }

    // 후위 순회
    func postorder(_ node: Node?, _ result: inout String) {
        guard let node = node else { return }
        postorder(node.left, &result)
        postorder(node.right, &result)
        result.append(node.value)
    }

    // 순회 실행 및 결과 반환
    func traverse(root: Character) -> (String, String, String) {
        let rootNode = nodes[root]
        var pre = "", ino = "", post = ""
        preorder(rootNode, &pre)
        inorder(rootNode, &ino)
        postorder(rootNode, &post)
        return (pre, ino, post)
    }
}

// 입력 처리
let n = Int(readLine()!)!
let tree = BinaryTree()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Character(String($0)) }
    tree.addEdge(parent: input[0], left: input[1], right: input[2])
}

// 결과 출력
let root = tree.traverse(root: "A")
print(root.0)  // 전위 순회
print(root.1)  // 중위 순회
print(root.2)  // 후위 순회
