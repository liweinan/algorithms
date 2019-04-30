class BinaryNode:
    def __init__(self, data):
        self.left = None
        self.right = None
        self.data = data


class BinaryTree:
    ''' A Binary Tree class '''

    def __init__(self):
        self.root = None

    def insert(self, data):
        print("-> ", data)
        self.root = self.__insert(self.root, data)

    def __insert(self, node, data):
        if node is None:
            print("node is None")
            node = BinaryNode(data)  # No node exists so we create a new node
        elif data < node.data:
            print("data < node.data | ", data, "<", node.data)
            node.left = self.__insert(node.left, data)  # data is smaller than the current node so go to the left
        elif data > node.data:
            print("data > node.data | ", data, ">", node.data)
            node.right = self.__insert(node.right, data)
        return node

    def print_tree(self):
        self.__print_tree(self.root, 1)

    def __print_tree(self, node, depth):
        if node is None:
            return
        self.__print_tree(node.left, depth + 1)

        if self.root == node:
            print("*", node.data)
        else:
            print("  " * depth, node.data)

        self.__print_tree(node.right, depth + 1)

    def max_depth(self):
        return self.__max_depth(self.root)

    def __max_depth(self, node):
        if node is None:
            return 0
        return max(self.__max_depth(node.left), self.__max_depth(node.right)) + 1

    def exists(self, data):
        return self.__exists(self.root, data)

    def __exists(self, node, data):
        if node is None:
            return False
        print(node.data)
        if data < node.data:
            return self.__exists(node.left, data)
        elif data > node.data:
            return self.__exists(node.right, data)
        else:
            return True

    def leaf_count(self):
        return self.__leaf_count(self.root)

    def __leaf_count(self, node):
        if node is None:
            return 0
        if node.right is None and node.left is None:
            return 1
        else:
            return self.__leaf_count(node.left) + self.__leaf_count(node.right)

    def node_count(self, depth):
        return self.__node_count(self.root, depth)

    def __node_count(self, node, depth):
        if node is None:
            return 0
        if depth == 0:
            return 1  # trivial case with the root being the only node

        return self.__node_count(node.left, depth - 1) + self.__node_count(node.right, depth - 1)

    def right_side_view(self):
        print("*", self.root.data)

        foos = [self.root]
        bars = []
        foobars = [foos, bars]
        x = 0
        for n in foobars[x]:
            foobars[1 - x].append(n.left)


print("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n")

tree = BinaryTree()
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.print_tree()
print("depth: ", tree.max_depth())

print("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n")

tree2 = BinaryTree()
tree2.insert(1)
tree2.insert(2)
tree2.insert(3)
tree2.print_tree()
print("depth: ", tree2.max_depth())

print("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n")

tree3 = BinaryTree()
tree3.insert(9)
tree3.insert(4)
tree3.insert(12)
tree3.insert(6)
tree3.insert(3)
tree3.insert(7)
tree3.insert(5)
tree3.print_tree()

print("depth: ", tree3.max_depth())

tree3.right_side_view()

print("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n")
