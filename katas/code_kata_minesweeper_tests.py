import pytest

def solve(board):
    for inner in board[0]:
        return board

def test_empty_grid():
    assert solve([[]]) == [[]]

def test_one_mine():
    assert solve([['*']]) == [['*']]

def test_no_mine():
    assert solve([['']]) == [['']]

def test_empty_cell_and_mine():
    assert solve([['', '*']]) == [['1', '*']]
