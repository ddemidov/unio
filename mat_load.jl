using MAT

function dict_to_workspace(dict::Dict)
    keys    = Array(dict.keys)
    returns = Array{Any}(0)
    for i in range(1,length(keys))
        try
            varname = Symbol(keys[i])
            @eval ($(varname)=$(dict[keys[i]]))
            push!(returns, varname)
        catch ex
            if isa(ex, UndefRefError)
            else
                throw(ex)
            end
        end
    end
    return returns
end

function mat_load(filename::String)
    vars = matread(filename)
    ws_sym_vars = dict_to_workspace(vars)
end


