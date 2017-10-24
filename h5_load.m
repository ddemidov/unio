function unio(fname)
    info = h5info(fname);
    for i = 1:length(info.Datasets)
        v = info.Datasets(i).Name;
        assignin('base', v,  h5read(fname, ['/' v]))
    end
end
