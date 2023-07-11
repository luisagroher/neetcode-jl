using Test

function maxArea(height::Vector{Int64})::Int64
    l, r = 1, length(height)
    res = 0
    while l < r
        res = max(res, min(height[l], height[r]) * (r - l))
        if height[l] < height[r]
            l += 1
        elseif height[r] <= height[l]
            r -= 1
        end
    end
    return res
end

@test maxArea([1,8,6,2,5,4,8,3,7]) == 49
@test maxArea([1,1]) == 1
@test maxArea([4,3,2,1,4]) == 16
@test maxArea([1,2,1]) == 2