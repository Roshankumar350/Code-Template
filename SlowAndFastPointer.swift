class Node {
    var next: Node?
    var value: Int
    
    init(next: Node? = nil, value: Int) {
        self.next = next
        self.value = value
    }
}

class LinkedList {
    var head: Node?
  
    // Supporting function to create LinkedList
    func createNode(for elements: [Int]) {
        guard !elements.isEmpty else { return }
        
        var tempNode: Node?
        for (index, element) in elements.enumerated() {
            let node = Node(value: element)
            if index == 0 {
                tempNode = node
                head = node
            } else {
                tempNode?.next = node
                tempNode = node
            }
        }
    }
  
    // Supporting function to print
    func printNode(from node: Node?) {
        var tempNode = node
        while tempNode != nil {
            print("\(tempNode?.value ?? -1)", terminator: " -> ")
            tempNode = tempNode?.next
        }
        print("")
    }
  
    // Slow and Fast Pointer
    func fastAndSlowPointer() -> Node? {
        var slow = head
        var fast = head
        
        while slow?.next != nil, fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}



let linkedList = LinkedList()
linkedList.createNode(for: (1...20).map { $0 } )
// Print Full List
linkedList.printNode(from: linkedList.head)

let slowPointer = linkedList.fastAndSlowPointer()
// Print half List
linkedList.printNode(from: slowPointer)
