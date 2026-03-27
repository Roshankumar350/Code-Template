class Node {
    var left: Node?
    var right: Node?
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
}


// Preorder → process root first.
func preOrder(_ node: Node?)  {
    guard let node = node else {
        return
    }
    
    print(node.value)
    preOrder(node.left)
    preOrder(node.right)
}

// Inorder → process root between left and right.
func inOrder(_ node: Node?) {
    guard let node = node else {
        return
    }
    
    inOrder(node.left)
    print(node.value)
    inOrder(node.right)
}

// Postorder → process root last.
func postOrder(_ node: Node?) {
    guard let node = node else {
        return
    }
    postOrder(node.left)
    postOrder(node.right)
    print(node.value)
}


