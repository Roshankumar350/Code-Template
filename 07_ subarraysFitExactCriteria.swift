func countSubarraysWithSumN3(_ nums: [Int], target: Int) -> Int {
    var subArray = [[Int]]()
    
    for pIndex in 0..<nums.count {
        for cIndex in pIndex..<nums.count {
            subArray.append(Array(nums[pIndex...cIndex]))
        }
    }
    
    let countArray = subArray.map { $0.reduce(0) { $0 + $1 }}
     
    return countArray.filter {$0 == target}.count
}

print(countSubarraysWithSumN3([1,2,3], target: 3)) // Output: 2

func countSubarraysWithSumN2(_ nums: [Int], target: Int) -> Int {
    var expectation = 0
    
    for i in 0..<nums.count {
        var sum = 0
        for j in i..<nums.count {
            sum = sum + nums[j]
            if sum == target {
                expectation += 1
            }
        }
    }
    return expectation
}

print(countSubarraysWithSumN2([1,2,3], target: 3)) // Output: 2

// https://www.youtube.com/shorts/RFKzZTxQ7aQ
func countSubarraysWithSumN(_ nums: [Int], target: Int) -> Int {
    var hashMap = [Int: Int]()
    hashMap[0] = 1
    var runningSum = 0
    var outputCount = 0

    for each in nums {
        runningSum += each
        if let count = hashMap[runningSum - target] {
            outputCount += count
        }

        hashMap[runningSum, default: 0] +=  1
    }

    return outputCount
}

print(countSubarraysWithSumN([1,2,3], target: 3)) // Output: 2
