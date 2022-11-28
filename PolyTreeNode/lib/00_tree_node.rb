class PolyTreeNode

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent
        @parent # maybe dupe, unsure for now
    end

    def children
        @children.dup #this way we cannot modify the array
    end

    def value
        @value
    end

    def parent=(parent)
        @parent = parent
        @parent.add_child(self)
    end

    def add_child(child)
        @children << child
    end

end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2