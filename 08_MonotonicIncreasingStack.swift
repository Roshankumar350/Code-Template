func monotonicStack(_ inputs: [Int]) -> [Int] {
    var stack = [Int]()
    
    for input in inputs {
        while let lastElement = stack.last, lastElement > input {
            stack.removeLast()
        }
        
        stack.append(input)
    } 
    return stack
}

print(monotonicStack([2, 1, 4, 3]))
