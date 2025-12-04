func printingFixedLengthSubarrays(_ input: [Int], size k: Int) {
    guard k > 0, k <= input.count else {
        return
    }

    var left = 0

    for right in 0..<input.count {
        if (right - left + 1) == k {
            print(input[left...right])
            left += 1
        }
    }
}

func summationFixedLengthSubarrays(_ input: [Int], size k: Int) {
    guard k <= input.count else {
        print("Window size exceeds array length")
        return
    }

    var windowSum = 0
    for i in 0..<k {
        windowSum += input[i]
    }
    print("Window starting at index 0: sum = \(windowSum)")

    var leftIndex = 0
    for j in k..<input.count {
        windowSum += input[j]
        windowSum -= input[leftIndex]
        leftIndex += 1
        print("Window starting at index \(leftIndex): sum = \(windowSum)")
    }
}

// printingFixedLengthSubarrays((1...20).map {$0}, size: 2)

/* Further Reading:
 * https://leetcode.com/discuss/post/7392239/master-sliding-window-the-complete-patte-5o49/
 */
