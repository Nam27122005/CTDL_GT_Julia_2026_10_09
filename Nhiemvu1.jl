function merge_sort(a::AbstractVector, before::Function)
    # Điều kiện dừng: Dãy rỗng hoặc có 1 phần tử thì đã có thứ tự
    if length(a) <= 1
        return copy(a)
    end
    
    mid = length(a) ÷ 2
    left = merge_sort(a[1:mid], before)
    right = merge_sort(a[mid+1:end], before)
    
    res = similar(a, 0)
    sizehint!(res, length(a))
    
    i = 1
    j = 1
    # Trộn hai mảng con đã sắp xếp
    while i <= length(left) && j <= length(right)
        # Lấy phần tử bên phải nếu nó thực sự nhỏ hơn theo hàm before (giữ tính ổn định)
        if before(right[j], left[i])
            push!(res, right[j])
            j += 1
        else
            push!(res, left[i])
            i += 1
        end
    end
    
    # Chép phần còn lại
    while i <= length(left)
        push!(res, left[i])
        i += 1
    end
    while j <= length(right)
        push!(res, right[j])
        j += 1
    end
    
    return res
end