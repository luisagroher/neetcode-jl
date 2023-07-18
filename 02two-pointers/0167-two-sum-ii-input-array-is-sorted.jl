using Test

function twoSum(numbers::Vector{Int}, target::Int)::Vector{Int}
    l, r = 1, length(numbers)

    while l < r
        curSum = numbers[l] + numbers[r]

        if curSum > target
            r -= 1
        elseif curSum < target
            l += 1
        else
            return [l, r]
        end
    end
end

@test twoSum([2, 7, 11, 15], 9) == [1, 2]
@test twoSum([2, 3, 4], 6) == [1, 3]
@test twoSum([-1, 0], -1) == [1, 2]
