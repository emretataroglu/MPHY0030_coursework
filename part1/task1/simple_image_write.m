function simple_image_write(sim_fileName,data)

    val = data.vol;
    vox_dims = data.voxdims;

    write_fileID = fopen(sim_fileName,'w');
    size_val = size(val);
    size_vox = size(vox_dims);
    fwrite(write_fileID,size_val,'int');
    fwrite(write_fileID,val,'int16');
    fwrite(write_fileID,size_vox,'int');
    fwrite(write_fileID,vox_dims,'float32');
    fclose(write_fileID);

end

