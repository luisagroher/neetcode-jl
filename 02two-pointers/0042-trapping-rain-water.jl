using Test

function trap(height::Vector{Int})::Int
    l, r = 1, length(height)
    leftMax, rightMax = height[l], height[r]
    res = 0
    while l < r
        if leftMax < rightMax
            l += 1
            leftMax = max(leftMax, height[l])
            res += leftMax - height[l]
        else
            r -= 1
            rightMax = max(rightMax, height[r])
            res += rightMax - height[r]
        end
    end
    return res
end

@test trap([0,1,0,2,1,0,1,3,2,1,2,1]) == 6
@test trap([4,2,0,3,2,5]) == 9
@test trap([4,2,3]) == 1
@test trap([4,2,3,1]) == 1