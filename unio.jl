using JLD
using HDF5

function h5_load(fname)
    f = h5open(fname)
    for n in names(f)
        if n[1] != '_'
            v = Symbol(n)
            @eval (($v) = read($f, $n))
        end
    end
end

function load_inputs()
    files = readdir("in")

    for f in readdir("in")
        h5_load(joinpath("in", f))
    end

    return files[1]
end
