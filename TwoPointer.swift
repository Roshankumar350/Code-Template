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

// Two pointers: two inputs, exhaust both
func twoPointer(_ input1Array: [Int], _ input2Array: [Int]) {
    let input1ArraySize = input1Array.count
    var input1ArrayLeftElement = 0
    let input2ArraySize = input2Array.count
    var input2ArrayLeftElement = 0
    
    while (input1ArrayLeftElement < input1ArraySize) && (input2ArrayLeftElement < input2ArraySize) { 
        print("input1Array input2Array", input1Array[input1ArrayLeftElement], input2Array[input2ArrayLeftElement])
        input1ArrayLeftElement += 1
        input2ArrayLeftElement += 1
    }
    
    while (input1ArrayLeftElement < input1ArraySize) {
        print("input1Array", input1Array[input1ArrayLeftElement])
        input1ArrayLeftElement += 1
    }
    
    while (input2ArrayLeftElement < input2ArraySize) {
        print("input2Array", input2Array[input2ArrayLeftElement])
        input2ArrayLeftElement += 1
    }
}
