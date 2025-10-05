// Two pointers: one input, opposite ends
func twoPointer(_ inputArray: [Int]) {
    guard !inputArray.isEmpty else {
        return 
    }
    var firstIndex = 0
    var lastIndex = inputArray.count - 1
    
    while firstIndex <= lastIndex {
    
        if firstIndex == lastIndex {
            print("Middle Element:", inputArray[firstIndex])
        } else {
            print("LeftSide Element:", inputArray[firstIndex])
            print("rightSide Element:", inputArray[lastIndex])
        }
        firstIndex += 1
        lastIndex -= 1 
    }
}
