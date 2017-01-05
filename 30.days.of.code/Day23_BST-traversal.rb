class Node
    attr_accessor :left,:right,:data
  def initialize data
      @left=@right=nil
      @data=data
    end
end
class Solution
    def insert (root,data)
        if root==nil
            return Node.new(data)
        else
            if data<=root.data
                cur=self.insert(root.left,data)
                root.left=cur
            else
                cur=self.insert(root.right,data)
                root.right=cur
            end
        end
        return root
    end

    def levelOrder(root)
      #Write your code here
      levelOrder = ''
      if root != nil
        @queue = []
        @queue[0] = root
        until @queue.empty?
          levelOrder += "#{@queue[0].data} "
          @queue << @queue[0].left if @queue[0].left
          @queue << @queue[0].right if @queue[0].right
          @queue.shift
        end
      end
      print levelOrder
    end
end



myTree=Solution.new
root=nil
T=gets.to_i
for i in 1..T
    data=gets.to_i
    root=myTree.insert(root,data)
end
myTree.levelOrder(root)