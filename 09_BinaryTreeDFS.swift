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


// MARK: Iterative

func preOrderIterative(_ node: Node?) {
    guard let tempNode = node else { return }
    var stack = [Node]()
    stack.append(tempNode)
    
    while !stack.isEmpty {
        let poped = stack.removeLast()
        print(poped.value)
        
        if let rightE = poped.right {
            stack.append(rightE)
        }
        
        if let leftE = poped.left {
            stack.append(leftE)
        }
    }
}


func iterativePostOrder(_ node: Node?) {
    guard let node  else { return }
    var stack1 = [Node]()
    stack1.append(node)
    var stack2 = [Node]()
    
    while !stack1.isEmpty {
        let nodeOfStack1 = stack1.removeLast()
        stack2.append(nodeOfStack1)
        
        if let leftNode = nodeOfStack1.left {
            stack1.append(leftNode)
        }
        
        if let rightNode = nodeOfStack1.right {
            stack1.append(rightNode)
        }
    }
    
    while !stack2.isEmpty {
        let node = stack2.removeLast()
        print(node.value)
    }
}

func iterativeInOrder(_ root: Node?) {
    var stack = [Node]()
    var current = root
    
    while current != nil || !stack.isEmpty {
        // Go left as far as possible
        while let node = current {
            stack.append(node)
            current = node.left
        }
        
        // Pop from stack and process
        let popped = stack.removeLast()
        print(popped.value)
        
        // Move to right subtree
        current = popped.right
    }
}



