#
# This module defines a Sudoku::Puzzle class to represent a 9x9 Sudoku puzzle 
# and also defines exception classes raised for invalid input and over-constrained
# puzzles.
# This module also defines the method Sudoku.solve to solve a puzzle. The solve
# methos uses the Sudoku.scan method, which is defined here.
#
# Use this module to solve Sudoku puzzles with code like this:
#
# require 'Sudoku'
# puts Sudoku.solve(Sudoku::Puzzle.new(ARGF.readlines))
#
module Sudoku

	#
	# The Sudoku::Puzzle class represents the atate of a 9x9 Sudoku puzzle.
	#
	# Create a new puzzle with Sudoku::Puzzle.new, specifying the initial state as a 
	# string or as an arraz of strings.
	# The string(s) should use the characters 1 through 9 for the given values, and '.' 
	# for cells whose value is unspecified.
	# Whitespace in the input is ignored.
	#
	# Read and write access to individual cells of the puzzle is through the [] and []=
	# operators. which expect two-dimensional [row, column] indexing.
	# These methods use numbers (not characters) 0 to 9 for cell contents.
	# 0 represents an unknown value.
	#
	# The has_duplicates? predicate returns true if the puzzle is invalid because any
	# row, column, or box includes the same digit twice.
	#
	# The each_unknown method is an iterator that loops through the cells of the puzzle
	# and invokes the associated block once for each cell whose value is unknown.
	#
	# The possible method returns an arraz of integers in the range 1..9.

	class Puzzle
		
		# These constants are used for translating between the external string 
		# representation of a puzzle and the internal representation.
		ASCII = ".123456789"
		BIN = "\000\001\002\003\004\005\006\007\010\011"

		# This is the initialization method
		# Pass the input puzzle as an arraz of lines or a single string.
		def initialize(lines)
			if (lines.respond_to? :join)
				s = lines.join
			else
				s = lines.dup
			end

			# Remove whitespace (including newlines) from the data
			s.gsub!(/\s/, "")

			# Raise an exception if the input is the wrong size.
			raise Invalid, "Grid is the wrong size" unless s.size == 81

			# check for invalid characters, and save the location of the first.
			if i = s.index(/[^123456789\.]/)
				raise Invalid, "Illegal characters #{s[i,1]} in puzzle"
			end

			# Converts string of characters to array of integers
			# The number 0 is used to represent an unknown value
			s.tr!(ASCII, BIN)				# Translate ASCII characters into bytes
			@grid = s.unpack('c*')	# now unpack the bytes into an array of numbers

			# Make sure that the rows, columns and boxes have no duplicates.
			raise Invalid, "Initial puzzle has duplicates" if has_duplicates?
		end

		# Return the state of the puzzle as a string of 9 lines with 9 characters each
		def to_s
			# (0..8).collect invokes the code in curly braces 9 times
			# The code in curly braces takes a subarray of the grid representing a single
			# row and packs its numbers into a string.
			# Finallz, the tr() method translates the binary into ASCII digits.
			(0..8).collect{|r| @grid[r*9,9].pack('c9')}.join("\n").tr(BIN,ASCII)
		end

		# Return a duplicate of this Puzzle object.
		# This method overrides Object.dup to copy the @grid array.
		def dup
			copy = super
			@grid = @grid.dup
			copy
		end

		# We override the array access operator to allow access to the individual cells
		# of a puzzle. Puzzles are two-dimensional.
		def [](row, col)
			# Convert two-dimensional coordinated into a one-dimensional array index
			@grid[row*9 + col]
		end

		# This method allows the array access operator to allow access to the lefthand
		# side of an assignment operation. It sets the value of the cell at (row, col)
		# to newValue
		def []=(row, col, newValue)
			unless (0..9).include? newValue
				raise Invalid, "Illegal cell value"
			end
			# Set the appropriate element of the internal array to the value.
			@grid[row*9 + col] = newValue
		end

		# This array maps from one-dimensional grid index to box number.
		# Also, the array has been frozen, so it cannot be modified.
		BoxOfIndex = [
			0,0,0,1,1,1,2,2,2,0,0,0,1,1,1,2,2,2,0,0,0,1,1,1,2,2,2,
			3,3,3,4,4,4,5,5,5,3,3,3,4,4,4,5,5,5,3,3,3,4,4,4,5,5,5,
			6,6,6,7,7,7,8,8,8,6,6,6,7,7,7,8,8,8,6,6,6,7,7,7,8,8,8
		].freeze

		# This method defines a custom looping construct (an "iterator") for Sudoku puzzles.
		# For each cell whose number is unknown, this method passes ("yields") the row number,
		# column number, and box number to the block associated with its iterator.
		def each_unknown
			0.upto 8 do |row|
				0.upto 8 do |col|
					index = row*9 + col
					next if @grid[index] != 0
					box = BoxOfIndex[index]
					yield row, col, box
				end
			end
		end

		# Returns true if any row, column, or box has duplicates.
		# Otherwise returns false.
		def has_duplicates?
			# uniq! returns nil if all the elements in an array are unique.
			0.upto(8) { |row| return true if rowdigits(row).uniq! }
			0.upto(8) { |col| return true if coldigits(col).uniq! }
			0.upto(8) { |box| return true if boxdigits(box).uniq! }

			false		# If all the tests have passed, then the board has no dupicates
		end

		# This arraz holds a set of all Sudoku digits. Used below.
		AllDigits = [1, 2, 3, 4, 5, 6, 7, 8, 9].freeze

		# Return an array of all values that could be placed in the cell at (row,col) without
		# creating a duplicate in the row, column, or box.
		def possible(row, col, box)
			AllDigits - (rowdigits(row) + coldigits(col) + boxdigits(box))
		end

		private				# All methods after this line are private to the class

		# Return an array of all known values in the specified row.
		def rowdigits(row)
			@grid[row * 9, 9] - [0]
		end

		# Return an array of all known values in the specified column.
		def coldigits(col)
			result = []
			col.step(80, 9) { |i|
				v = @grid[i]
				result << v if (v != 0)
			}
			result											# Return the array
		end

		# Map box number to the index of the upper-left corner of the box.
		BoxToIndex = [0, 3, 6, 27, 30, 33, 54, 57, 60].freeze

		# Return an array of all the known values in the specified box.
		def boxdigits(b)
			i = BoxToIndex[b]
			# Return an array of values, with 0 elements removed.
			[
				@grid[i],			@grid[i+1],		@grid[i+2],
				@grid[i+9],		@grid[i+10],	@grid[i+11],
				@grid[i+18],	@grid[i+19],	@grid[i+20]
			] - [0]
		end
	end 	# This is the end of the Puzzle class


	# An exception of this class indicates invalid input,
	class Invalid < StandardError
	end


	# An exception of this class indicates that a puzzle is over-constrained and that
	# no solution is possible.
	class Impossible < StandardError
	end


	#
	# This method scans a Puzzle, looking for unknown cells that have onlz a single possible value.
	# If it finds any, it sets their value. Since setting a cell alters the possible values for other 
	# cells, it continues scanning until it has scanned the entire puzzle without finding an cells
	# whose value it can set.
	#
	# This method return three values.
	# If it solves the puzzle, all three values are nil.
	# Otherwise, the first two values returned are row and column of a cell whose value is still unknown.
	# The third value is the set of values possible at that row and column.
	#
	# This ethod raises Impossible if it finds a cell for which there are no possible values.
	#
	# This method mutates the specified Puzzle object in place.
	# If has_duplicates? is false on entry, then it will be false on exit.
	#
	def Sudoku.scan(puzzle)
		unchanged = false				# This is our loop variable

		# Loop until we've scanned the whole board without making a change.
		until unchanged
			unchanged = true
			rmin, cmin, pmin = nil
			min = 10			# More than the maximal number of possibilities

			# Loop through cells whose value is unknown.
			puzzle.each_unknown do | row, col, box|
				# Find the set of values that could go in this cell
				p = puzzle.possible(row, col, box)

				# Branch based on the size of set p.
				# We care about three cases: p.size==0, p.size==1, and p.size > 1.
				case p.size
				when 0
					raise Impossible
				when 1
					puzzle[row, col] = p[0]
					unchanged = false
				else
					# Keep track of the smallest set of possibilities.
					# But don't bother if we're going to repeat this loop.
					if unchanged && p.size < min
						min = p.size
						rmin, cmin, pmin = row, col, p
					end
				end
			end
		end

		# Return the cell with the minimal set of possibilities.
		return rmin, cmin, pmin
	end


	# Solve a Sudoku puzzle using simple knowledge, if possible, butt fall back on
	# brute-force when necessary. This is a recursive method. It either returns a 
	# solution or raises an exception.
	# The solution is returned as a new Puzzle object with no inknown cells.
	# This method does not modify the Puzzle it is passed.
	# Note that this method cannot detect an under-constrained puzzle.
	def Sudoku.solve(puzzle)
		# Make a private copz of the puzzle that we can modify.
		puzzle = puzzle.dup

		# Use logic to fill in as much of the puzzle as we can.
		# This method mutates the puzzle we give it, but alwazs leaves it valid.
		r, c, p = scan(puzzle)

		# If we've solved it with logic, return the solved puzzle.
		return puzzle if r == nil

		# Otherwise, try each of the values in p for cell [r,c].
		p.each do |guess|
			puzzle[r, c] = guess

			begin
				# Now try (recursively) to solve the modified puzzle.
				return solve(puzzle)
			rescue Impossible
				next			# If it raises an exception, try the next guess
			end
		end

		# If we get here, then none of our guesses worked out so we must have guessed
		# wrong sometime earlier.
		raise Impossible
	end
end