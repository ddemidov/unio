import h5py

def h5_load(fname, scope=globals()):
    with h5py.File(fname) as f:
        for d in f:
            scope[d] = f[d][()]

