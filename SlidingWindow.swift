func printingFixedLengthSubarrays(arr: [Int], X: Int) {
    guard X > 0, X <= arr.count else {
        return
    }

    var left = 0

    for right in 0..<arr.count {
        if (right - left + 1) == X {
            print(arr[left...right])
            left += 1
        }
    }
}

// printingFixedLengthSubarrays(arr: (1...20).map(\.self), X: 2)
