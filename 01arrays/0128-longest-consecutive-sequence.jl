using Test
function longestConsecutive(nums::Vector{Int})::Int
    numSet = Set(nums)
    longest = 0

    for n in nums
        # check if its the start of a sequence
        if (n - 1) ∉ numSet
            length = 1
            while (n + length) ∈ numSet
                length += 1
            end
            longest = max(length, longest)
        end
    end
    return longest
end

@test longestConsecutive([100, 4, 200, 1, 3, 2]) == 4
@test longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]) == 9
@test longestConsecutive([1, 2, 0, 1]) == 3
