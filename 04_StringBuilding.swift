let parts = (1...100).map { "Line \($0)" }
let result = parts.joined(separator: " ")
print(result)


struct Writer: TextOutputStream {
    var storage: String = ""
    
    mutating func write(_ string: String) {
        self.storage.append(string)
    }
}

var writer = Writer()
for i in 1...100 {
    print("Line \(i) ", to: &writer)
}

let result1 = writer.storage
print(result1)
