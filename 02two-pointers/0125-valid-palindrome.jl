using Test
using StrRegex


function isPalindrome(s::String)::Bool

    l, r = 1, length(s)
    while l < r
        while l < r && !occursin(r"^[a-zA-Z0-9]$", string(s[l]))
            l += 1
        end
        while l < r && !occursin(r"^[a-zA-Z0-9]$", string(s[r]))
            r -= 1
        end
        if lowercase(s[l]) != lowercase(s[r])
            return false
        end
        l += 1
        r -= 1
    end
    return true
end

@test isPalindrome("race a car") == false
@test isPalindrome(" ") == true
@test isPalindrome("A man a plan a canal: Panama") == true
