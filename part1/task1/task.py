import scipy.io
from scipy import misc
import imageio

img = scipy.io.loadmat('data/example_image.mat')

def img_load(file_path):

    img = scipy.io.loadmat(file_path)

    print(img)

    # return img,vol,voxdims

# def simple_image_write(img):

#     scipy.io.savemat('data/image.sim', img)


# def simple_image_read():

#     img = imageio.imread('data/image.sim')

#     print(img)
    
# simple_image_write(img)
# simple_image_write(img_load('data/example_image.mat')[0])    
# simple_image_read()
print(img)