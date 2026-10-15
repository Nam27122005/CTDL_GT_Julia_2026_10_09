function knapsack(orders, costs, budget)
    n = length(orders)
    # Bảng DP kích thước (n+1) x (budget+1). Chỉ số trong Julia bắt đầu từ 1.
    table = zeros(Int, n + 1, budget + 1)
    
    for i in 1:n
        cost_i = costs[orders[i].id]
        val_i = orders[i].benefit
        
        for b in 0:budget
            if cost_i > b
                table[i + 1, b + 1] = table[i, b + 1] # Không đủ ngân sách -> không lấy
            else
                # max(Không lấy đơn i, Lấy đơn i)
                table[i + 1, b + 1] = max(table[i, b + 1], val_i + table[i, b + 1 - cost_i])
            end
        end
    end
    
    # Truy vết tìm danh sách các ID được chọn
    ids = Int[]
    curr_b = budget
    for i in n:-1:1
        if table[i + 1, curr_b + 1] != table[i, curr_b + 1]
            push!(ids, orders[i].id)
            curr_b -= costs[orders[i].id]
        end
    end
    reverse!(ids) # Đảo lại để trả về danh sách có thứ tự
    
    total_value = table[n + 1, budget + 1]
    total_cost = budget - curr_b
    
    return (ids = ids, value = total_value, cost = total_cost, table = table)
end