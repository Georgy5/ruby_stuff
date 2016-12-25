input = gets.split()
firstName = input[0]
lastName = input[1]
id = input[2].to_i
numScores = gets.to_i
scores = gets.strip().split().map!(&:to_i)
s = Student.new(firstName, lastName, id, scores)
s.printPerson
print("\nGrade: " + s.calculate)


class Person
  def initialize(firstName, lastName, id)
    @firstName = firstName
    @lastName = lastName
    @id = id
  end
  def printedPerson()
    print("Name: ", @lastName, ", " + @firstName, "\nID: ", @id)
  end
end

class Student < Person
  @@numScores = 0
  def initialize(firstName, lastName, id, scores)
    super(firstName, lastName, id)
    @scores = scores
  end
  
  def calculate
    sum = 0
    0.upto(@scores.size - 1) do |i|
      sum += @scores[i].to_i
    end
    res = sum / @scores.size
    
    case
    when res.between?(90, 100)
      "O"
    when res.between?(80, 90)
      "E"
    when res.between?(70, 80)
      "A"
    when res.between?(55, 70)
      "P"
    when res.between?(40, 55)
      "D"
    else
      "T"
    end
  end
end