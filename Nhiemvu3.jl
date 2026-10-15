function bfs_routes(graph, source=1)
    V = length(graph)
    distance = fill(-1, V)
    parent = fill(0, V)
    
    queue = [source]
    distance[source] = 0
    
    # Duyệt BFS
    while !isempty(queue)
        u = popfirst!(queue)
        for v in graph[u]
            if distance[v] == -1
                distance[v] = distance[u] + 1
                parent[v] = u
                push!(queue, v)
            end
        end
    end
    
    # Dựng lại đường đi (routes)
    routes = Vector{Vector{Int}}(undef, V)
    for i in 1:V
        if distance[i] == -1
            routes[i] = Int[] # Đỉnh không tới được
        else
            path = Int[]
            curr = i
            while curr != 0
                push!(path, curr)
                curr = parent[curr]
            end
            reverse!(path)
            routes[i] = path
        end
    end
    
    return (distance = distance, parent = parent, routes = routes)
end