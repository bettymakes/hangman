class Hangman
	LIST = ["canada", "england", "australia", "japan"]
  attr_accessor :word, :chances, :board, :list, :guesses, :answer

  def initialize()
		@chances = 8
		@guesses = []
		@word    = LIST.sample
		@board   = draw_board(@word)
  end
  
  # return @guesses as a string
  def guesses
		# @guesses.to_s  - this was wrong
    #@guesses is an array, we want to chaing it to a string .. in ruby 1.8 .to_s could've worked
    @guesses.join(" ")
  end
  
  # return a string of underscores equal to length of the given word
  def draw_board(word)
    "_" * word.length #cleaner code
		# @word.length.times {|letter| print " _ "}
  end

  # return true if word has letter
  def word_has?(letter)
		@word.include?(letter)
  end

  # replace indexes of @board with letter where the same indexes of @word are letter
  # in other words, if @board is _ _ _ _ _ _ and @word is canada
  # and the letter guessed is a
  # then @board should become _ a _ a _ a
  def put_letter_on_board(letter)
	# @board  @word letter  substitute?
		# puts @word.count(letter).times do    #counting how many times the letter appears in the word. loops that many times
		# index_position = @word.index(letter) #finds the index position of the letter in the word, only finds the first instance, that's why we use a loop
		# @board[index_position] = letter #equivalent to board[2]="p", replaces the board "_" in the specified index position with the new letter
		# @word[index_position] = "_" #replaces the original word with "_" so that the index method can find the next instance of the letter. remember, index only finds the first instance of the letter.
		# end

      @word.length.times do |x|
      @board[x] = letter if @word[x] == letter
      end

  end

  # decrement # of chances and add letter to guesses
  def wrong_letter(letter)
		@chances -= 1
		@guesses << letter
  end
  
  # if the word has the given letter, put it on the board, otherwise, it's a wrong guess
  def guess(letter)
	if word_has?(letter)
		put_letter_on_board(letter)
	else
	  wrong_letter(letter) if !@guesses.include? letter
	end
  end

  # return true if @board doesn't have a '_', otherwise return false
  def win?
  	!@board.include?("_")   #don't need the code at the bottom because it's redundant
  	#  true
  	# else
  	# 	false
  	# end
	
  end

  # return true if @chances is 0, otherwise return false
  def lost?
	  @chances == 0    #don't need code at the bottom, it's redundant. boolean statements will return true or false
	  # 	true
	  # else
	  # 	false
	  # end
  end
  
end