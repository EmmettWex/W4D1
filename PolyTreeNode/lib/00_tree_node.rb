require 'debug'
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
        if par.nil?
            @parent = nil
        else
            if @parent != nil
                self.parent.remove_child(self) 
                @parent = par
                @parent.add_child(self)
            else
                @parent = par
                @parent.add_child(self)
            end
        end
    end

    def add_child(child)
        if !@children.include?(child)
            @children << child

        end

        if child.parent != self
            child.parent = self
        end
    end

    def remove_child(child)
        raise "This is not a child" if child.parent == nil

        @children.delete(child)

        if child.parent == self
            child.parent = nil
        end
    end

    def dfs(target)
        if self.value == target
            return self 
        else
            @children.each do |child| 
                if child.dfs(target) == target
                    return child
                end
            end
        end

        return nil

        
    end
end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2