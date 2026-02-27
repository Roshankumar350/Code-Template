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
    // [1,2,3,4]
    //  head(0x12)
    //  tempNode(0x12) (At the begining but will move ahead with `tempNode = node`)
    // [ 1 | 0x24 ] -> [ 2 |  0x32 ] ->  [ 3 |  0x46 ]  ->  [ 4 | NULL ]
    //    0x12           0x24                0x32             0x46
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

        func createCyclicNode(for elements: [Int], cycleAt index: Int) {
        guard !elements.isEmpty, index >= 0, index < elements.count else { return }
        
        var tempNode: Node?
        var cycleStartNode: Node?
        
        for (i, element) in elements.enumerated() {
            let node = Node(value: element)
            if i == 0 {
                head = node
                tempNode = node
            } else {
                tempNode?.next = node
                tempNode = node
            }
            
            if i == index {
                cycleStartNode = node
            }
        }
        
        // Create the cycle
        tempNode?.next = cycleStartNode
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

    func findCyclicPoint(from List: Node?) -> Node? {
        
        var isCyclic = false
        
        var slow = head
        var fast = head
        
        
        while slow?.next != nil, fast?.next?.next != nil {
            
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                isCyclic = true
                break
            }
        }
        
        guard isCyclic else {
            return nil
        }
        
        // reset slow to head
        slow = head
        
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        
        return slow
    }

    func hasCycle() -> Bool {
        var isCycleDected = false
        
        var slow = head
        var fast = head
        
        while slow?.next != nil, fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                isCycleDected = true
                return isCycleDected
            }
        }
        
        return isCycleDected
    }
}



let linkedList = LinkedList()
linkedList.createNode(for: (1...20).map { $0 } )
// Print Full List
linkedList.printNode(from: linkedList.head)

let slowPointer = linkedList.fastAndSlowPointer()
// Print half List
linkedList.printNode(from: slowPointer)

var cycledLinkedList = LinkedList()
cycledLinkedList.createCyclicNode(for: (1...20).map { $0 }, cycleAt: 5)
print(cycledLinkedList.hasCycle())

let cyclicPoint = cycledLinkedList.findCyclicPoint(from: cycledLinkedList.head)
print("cyclicPoint?.value: \(String(describing: cyclicPoint?.value))")
