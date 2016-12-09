load 'sudoku.rb'

#puts Sudoku.solve(Sudoku::Puzzle.new(ARGF.readlines))

puts Sudoku.solve(Sudoku::Puzzle.new("4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......"))