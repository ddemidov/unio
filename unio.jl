using HDF5

function h5_load(fname)
    f = h5open(fname)
    for n in names(f)
        v = Symbol(n)
        @eval (($v) = read($f, $n))
    end
end
