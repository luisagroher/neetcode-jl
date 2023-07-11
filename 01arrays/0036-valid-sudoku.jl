using Test

function isValidSudoku(board::Vector{Vector{Char}})
    rows = Dict{Int, Set{Char}}()
    cols = Dict{Int, Set{Char}}()
    squares = Dict{Tuple{Int, Int}, Set{Char}}()

    for r in 1:9, c in 1:9
        if board[r][c] == '.'
            continue
        end

        # Check row validity
        if haskey(rows, r) && board[r][c] in rows[r]
            return false
        end
        if !haskey(rows, r)
            rows[r] = Set{Char}()
        end
        push!(rows[r], board[r][c])

        # Check col validity
        if haskey(cols, c) && board[r][c] in cols[c]
            return false
        end
        if !haskey(cols, c)
            cols[c] = Set{Char}()
        end
        push!(cols[c], board[r][c])

        # Check square validity
        square_row = (r - 1) ÷ 3 + 1
        square_col = (c - 1) ÷ 3 + 1

        if haskey(squares, (square_row, square_col)) && board[r][c] in squares[(square_row, square_col)]
            return false
        end
        if !haskey(squares, (square_row, square_col))
            squares[(square_row, square_col)] = Set{Char}()
        end
        push!(squares[(square_row, square_col)], board[r][c])
    end

    # If all checks pass, board is valid
    return true
end

board = board = [
    ['5', '3', '.', '.', '7', '.', '.', '.', '.'],
    ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
    ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
    ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
    ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
    ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
    ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
    ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
    ['.', '.', '.', '.', '8', '.', '.', '7', '9']
]
@test isValidSudoku(board) == true

board = [
    ['8', '3', '.', '.', '7', '.', '.', '.', '.'],
    ['6', '.', '.', '1', '9', '5', '.', '.', '.'],
    ['.', '9', '8', '.', '.', '.', '.', '6', '.'],
    ['8', '.', '.', '.', '6', '.', '.', '.', '3'],
    ['4', '.', '.', '8', '.', '3', '.', '.', '1'],
    ['7', '.', '.', '.', '2', '.', '.', '.', '6'],
    ['.', '6', '.', '.', '.', '.', '2', '8', '.'],
    ['.', '.', '.', '4', '1', '9', '.', '.', '5'],
    ['.', '.', '.', '.', '8', '.', '.', '7', '9']
]
@test isValidSudoku(board) == false