
public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    /// Adds a value at the front of the list
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// Adds a value at he end of the list
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        
        tail = tail!.next
    }
    
    /// Retrieve a node in the list
    public func node(at index: Int) -> Node<Value>? {
        guard let head = head else {
            return nil
        }
        var count = 0
        var currentNode: Node<Value>? = head
        while count < index {
            currentNode = currentNode?.next
            count += 1
        }
        return currentNode
    }
    
    /// Adds a value after a particular node of the list
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    /// Removes the value at the front of the list
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    /// Removes the lvalue a the end of the list
    @discardableResult
    public mutating func removeLast() -> Value? {
        guard !isEmpty else {
            return nil
        }
        defer {
            var currentNode = head
            while currentNode?.next !== tail {
                currentNode = currentNode?.next
            }
            currentNode?.next = nil
            tail = currentNode
        }
        return tail!.value
    }
    
    /// Remove a value anywhere in the list
    public mutating func remove(at index: Int) -> Value? {
        if isEmpty { return nil }
        var count = 0
        var currentNode = head
        while count < index-1, currentNode != nil {
            currentNode = currentNode?.next
            count += 1
        }
        let removeNode = currentNode?.next
        currentNode?.next = removeNode?.next
        removeNode?.next = nil
        return removeNode?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
