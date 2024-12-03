let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 도감에 수록되어 있는 포켓몬의 개수 N
let m = input[1] // 내가 맞춰야 하는 문제의 개수 M

var pokemonDic: [String: Int] = [:]
var pokemonArr: [String] = []
pokemonArr.append("")

for i in 1...n {
    let pokemon = String(readLine()!)
    pokemonDic[pokemon, default:0] = i
    pokemonArr.append(pokemon)
}

for _ in 0..<m {
    let input = String(readLine()!)
    
    if let pokemon = pokemonDic[input] {
        print(pokemon)
    } else if let number = Int(input) {
        print(pokemonArr[number])
    }
}
