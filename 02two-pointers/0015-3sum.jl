using Test

function ThreeSum(nums::Vector{Int})::Vector{Vector{Int}}
    nums = sort(nums)
    result = []
    for index in 1:length(nums)
        if nums[index] > 0
            break
        end
        if index > 1 && nums[index] == nums[index - 1]
            continue
        end
        left, right = index + 1, length(nums)
        while left < right
            if nums[left] + nums[right] < 0 - nums[index]
                left += 1
            elseif nums[left] + nums[right] > 0 - nums[index]
                right -= 1
            else
                push!(result, [nums[index], nums[left], nums[right]])
                left += 1
                right -= 1
                while nums[left] == nums[left - 1] && left < right
                    left += 1
                end
            end
        end
    end
    return result
end

@test ThreeSum([-1, 0, 1, 2, -1, -4]) == [[-1, -1, 2], [-1, 0, 1]]
@test ThreeSum([-1, 0, 1, 2, -1, -4, 0, 0, 0, 0]) == [[-1, -1, 2], [-1, 0, 1], [0, 0, 0]]
@test ThreeSum([-1, 0, 1, 2, -1, -4, 0, 0, 0, 0, 0]) == [[-1, -1, 2], [-1, 0, 1], [0, 0, 0]]
@test ThreeSum([-1, 0, 1, 2, -1, -4, 0, 0, 0, 0, 0, 0]) == [[-1, -1, 2], [-1, 0, 1], [0, 0, 0]]

