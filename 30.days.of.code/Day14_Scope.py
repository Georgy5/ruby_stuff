class Difference:
	   def __init__(self, a):
        self.__elements = a

	# Add your code here
    def computeDifference(self):
        N = self.__elements        
        self.maximumDifference = max(N) - min(N)



# End of Difference class

_ = input()
a = [int(e) for e in input().split(' ')]

d = Difference(a)
d.computeDifference()

print(d.maximumDifference)