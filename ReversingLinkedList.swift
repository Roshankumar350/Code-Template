extension LinkedList {
    func reverseLinkedList() -> Node? {
        var curr = head
        var prev: Node?
        
        while curr != nil {
            let nextNode = curr?.next
            curr?.next = prev
            prev = curr
            curr = nextNode
        }
        
        return prev
    }
}


let linkedList = LinkedList()
linkedList.createNode(for: (1...20).map { $0 } )
// Print Full List
linkedList.printNode(from: linkedList.head)

let reversedNode = linkedList.reverseLinkedList()
// Print Reversed linked List
linkedList.printNode(from: reversedNode)
