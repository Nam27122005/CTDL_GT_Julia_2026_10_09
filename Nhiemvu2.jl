function binary_search(a::Vector, id::Int)
    left = 1
    right = length(a)
    
    while left <= right
        mid = left + (right - left) ÷ 2
        
        if a[mid].id == id
            return a[mid]
        elseif a[mid].id < id
            left = mid + 1
        else
            right = mid - 1
        end
    end
    
    return nothing # Trả về nothing nếu không tìm thấy
end