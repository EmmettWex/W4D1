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

    def parent=(par=nil)
        # if par.nil
        #     return 
        # end1
        if @parent != nil
            self.parent.remove_child(self) 
            @parent = par
            @parent.add_child(self)
        else
            @parent = par
            @parent.add_child(self)
        end

    end

    def add_child(child)
        if child != nil
            @children << child
        end
    end

    def remove_child(child)
        @children.delete(child)
    end
end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2