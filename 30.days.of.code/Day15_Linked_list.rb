class Node

    attr_accessor :data,:next

  def initialize data
        @data = data
        @next = nil
    end
end

class Solution 

    def insert(head,value)
      #Complete this method
      if head.nil?
        head = Node.new(value)
      else
        curNode = head
        while curNode.next
          curNode = curNode.next
        end
        curNode.next = Node.new(value)
      end
      head
    end

    def display(head)
       current = head
       while current 
          print current.data," "
          current = current.next
       end
   end
end
       
mylist= Solution.new
head=nil
T=gets.to_i
for i in 1..T
    data=gets.to_i
    head=mylist.insert(head,data)
end
mylist.display(head)