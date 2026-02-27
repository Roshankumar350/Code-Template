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

// Interview Question asked [kaiser permanente]
func mergeTwoInput(_ input1: [Int], _ input2: [Int]) -> [Int] {
    var expected = [Int]()
    var i1s = 0
    let i1e = input1.endIndex
    
    var i2s = 0
    let i2e = input2.endIndex
    //  Mistake: I enumerated till `i1e - 1` `i2e - 1` 
    //  Learning: When doing Adjacent Comparison we use `i < count - 1` to	prevents array[i + 1] from crashing at the end. 
    while ((i1s < i1e ) && (i2s < i2e)) {
        let input1Element = input1[i1s]
        let input2Element = input2[i2s]
        if input1Element < input2Element {
            expected.append(input1Element)
            i1s += 1
        } else if input1Element > input2Element {
            expected.append(input2Element)
            i2s += 1
        } else {
            expected.append(input1Element)
            expected.append(input2Element)
            i1s += 1
            i2s += 1
        }
    }
    
    if i1s < i1e {
        expected.append(contentsOf: input1[i1s..<i1e])
    }
    
    if i2s < i2e {
        expected.append(contentsOf: input2[i2s..<i2e])
    }
    
    return expected
}
// Some cases
let input2 = mergeTwoInput([1, 2, 3], [10, 20, 30, 40, 50])
print(input2 == [1, 2, 3, 10, 20, 30, 40, 50])

let input3 = mergeTwoInput([1, 5, 10], [5, 8, 10])
print(input3 == [1, 5, 5, 8, 10, 10])

let input4 = mergeTwoInput([], [1, 2, 3])
print(input4 == [1, 2, 3])

let input5 = mergeTwoInput([10], [5])
print(input5 == [5, 10])
