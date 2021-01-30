function data = simple_image_read(filePath)

    read_fileID = fopen(filePath,'r');
    dim_val = fread(read_fileID,[1,3],'int');
    disp(dimval(3));

    full_val = [];

    for i = [1:dim_val(3)]
        new_val = fread(read_fileID,[dim_val(1) dim_val(2)],'int16');
        full_val(:,:,i) = new_val;
    end

    dim_vox = fread(read_fileID,[1,2],'int');
    full_vox = fread(read_fileID,dim_vox,'float32');

    fclose(read_fileID);

    data.vol = full_val;
    data.voxdims = full_vox;

end