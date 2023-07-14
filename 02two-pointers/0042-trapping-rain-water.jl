using Test


function trap(height::Vector{Int})
  left = 1
  right = length(height)

  return trap(height, left, right)
end

function trap(height::Vector{Int}, left::Int, right::Int)
  result = 0

  while left < right
    if height[left] < height[right]
      result += process_left(height, left, right)
      left += 1
    else
      result += process_right(height, left, right)
      right -= 1
    end
  end

  return result
end

function process_left(height, left, right)
  left_max = maximum(height[1:left])
  return left_max - height[left]
end

function process_right(height, left, right)
  right_max = maximum(height[right:end])
  return right_max - height[right]
end



@test trap([0,1,0,2,1,0,1,3,2,1,2,1]) == 6
@test trap([4,2,0,3,2,5]) == 9
@test trap([4,2,3]) == 1
@test trap([4,2,3,1]) == 1