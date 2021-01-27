clc;
close all;
clear;

% Test
file_loc = 'C:\Users\emret\Desktop\git\MPHY0030_coursework\data\example_image.mat';
data = load(file_loc);
simple_image_write('emre.sim',data);
emre_out = simple_image_read('emre.sim');

% Plotting at 3 different z-coordinates
figure(1)
contourf(emre_out.vol(:,:,1))
title('Plot with z=1');

figure(2)
contourf(emre_out.vol(:,:,5))
title('Plot with z=5');

figure(3)
contourf(emre_out.vol(:,:,10))
title('Plot with z=10');

function data = simple_image_read(filePath)

read_fileID = fopen(filePath,'r');
dimval = fread(read_fileID,[1,3],'int');
disp(dimval(3));

full_val = [];

for i = [1:dimval(3)]
    new_val = fread(read_fileID,[dimval(1) dimval(2)],'int16');
    full_val(:,:,i) = new_val;
end

dimvox = fread(read_fileID,[1,2],'int');
full_vox = fread(read_fileID,dimvox,'float32');

fclose(read_fileID);

data.vol = full_val;
data.voxdims = full_vox;

end


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



