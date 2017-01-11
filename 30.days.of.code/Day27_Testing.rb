# simplest solution:

#puts <<EOT
#5
#4 3
#-2 0 1 2
#3 2
#-1 0 1
#5 3
#0 -10 5 15 85
#6 3
#-1 0 1 -1 1 0
#7 3
#-1 0 1 2 3 4 5
#EOT


# 
def create_testcases(t)
  numLectures = t
  prng = Random.new
  
  puts t
  
  t.times do
    # create number of students in class n  1..200
    n = prng.rand(1..200)
    # create cancellation threshhold k  1..n
    k = prng.rand(1..n)

    puts "#{n} #{k}"
    
    arr = (-15...n).to_a
    arr << 0
    arr = arr.shuffle.take(n)
    
    puts arr.join(' ')
  end
end

# Contstraints: t, the number of lectures, and thus the number of testcases, should be <= 5
create_testcases(5)