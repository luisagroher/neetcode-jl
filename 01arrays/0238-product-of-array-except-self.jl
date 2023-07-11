using Test
function productExceptSelf(nums::Vector{Int})::Vector{Int}
    res = fill(1, length(nums))
    prefix = 1
    for i in 1:length(nums)
        res[i] = prefix
        prefix *= nums[i]
    end
    postfix = 1
    for i in length(nums):-1:1
        res[i] *= postfix
        postfix *= nums[i]
    end
    return res
end


@test productExceptSelf([1, 2, 3, 4]) == [24, 12, 8, 6]
@test productExceptSelf([1, 2, 3, 4, 5]) == [120, 60, 40, 30, 24]
@test productExceptSelf([1, 2, 3, 4, 5, 6]) == [720, 360, 240, 180, 144, 120]
@test productExceptSelf([1, 2, 0, 20, 40]) == [0, 0, 1600, 0, 0]
@test productExceptSelf([1, 2, 3, 4, 5, 6, 7]) == [5040, 2520, 1680, 1260, 1008, 840, 720]
