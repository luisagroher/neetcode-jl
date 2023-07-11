using Test

function twoSum(nums::Vector{Int}, target::Int)
    prevMap = Dict{Int, Int}()  # val -> index

    for (i, n) in enumerate(nums)
        diff = target - n
        if haskey(prevMap, diff)
            return [prevMap[diff], i]
        end
        prevMap[n] = i
    end
end

@test twoSum([2, 7, 11, 15], 9) == [1, 2]
@test twoSum([3, 2, 4], 6) == [2, 3]
@test twoSum([3, 3], 6) == [1, 2]

