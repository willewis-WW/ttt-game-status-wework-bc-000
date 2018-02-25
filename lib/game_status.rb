# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],  # top row
  [3,4,5],  # middle row
  [6,7,8],  # bottom row
  [0,3,6],  # left column
  [1,4,7],  # center column
  [2,5,8],  # right column
  [0,4,8],  # up-down diagonal
  [2,4,6],  # down-up diagonal
  ]


=begin
def won?(board)
  
  if board.all?{|position| position == ' '}
    return false
  elsif board.all?{|position| position != ' '}
    return false
  else
  WIN_COMBINATIONS.each do |combo|
    first_position = board[combo[0]]
    second_position = board[combo[1]]
    third_position = board[combo[2]]
    
    if first_position == second_position && second_position == third_position
      return combo
    end
  end
  end
end
=end



def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end


def full?(board)
  board.all?{|position| position == 'X' || position == 'O'}
end


def draw?(board)
  full?(board) && won?(board) == false
end

