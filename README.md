# Automated-facial-recognition

# Problem

Grayscale images of 15 subjects under 10 different conditions were obtained and are given in the file Dataset_Question1. Due to storage limitations, only one representative image can be stored for each subject in the database for future automated facial recognition purposes. we have to Perform SVD on all the images for a subject to identify characteristic features that will be stored for each subject. Only this information should be used in the future automated facial recognition tasks. In the report, please show the representative images of all the subjects. Given an image, the facial recognition method is based on the smallest norm between the image and the representative images in the database. Determine the number of images out of 150 that you are able to correctly identify based on this approach in terms of accuracy. MATLAB image processing functions or python image processing libraries are not to be used for this assignment.


# Solution

Given dataset includes 15 subjects with 10 pictures each.
__Steps :__
__*Data Preprocessing*__
1. The images of the subject were read and transformed into a 100 by 100-pixel intensity matrix each.
2. This intensity matrix was then converted to a vector of length 10000 and stored as a row in another
matrix ‘mat’.
3. Each row in the matrix mat indicates the features of one picture of the subject, hence the size of the
matrix mat is 10 x 10000.
4. Each of the rows of the matrix mat is then normalized.
__Computing svd__
5. The normalized matrix is then decomposed using svd to identify and obtain characteristic features for
each subject. Singular value decomposition factorizes a matrix into U, S, and V . We take the first
eigenvalue (largest) from S, and the first columns of U and V to obtain a rank-one matrix ‘representative’
= U(:,1)S(1)V(:,1) T . The first row of this matrix is taken as the representative feature vector of the
subject.(since all the other rows are the multiples of this row)
All the steps are repeated for each subject to obtain a representative feature vector.
6. These feature vectors are stored in a matrix ‘image_features’ (15 x 10000), where each row indicates the
features of one subject.
7. These characteristic features are then used to get representative images by transforming each subject
vector (1 x 10000) into a 100 x 100 matrix and then printing this matrix in an image form in the folder
‘representative images’.
Testing Accuracy
8. To test the algorithm’s performance, all the 150 pictures of the subjects are taken again as test cases.
9. Each image is pre-processed as stated in data preprocessing to obtain a normalized feature vector.
10. This vector is compared to the stored representative features of each subject and the norms are
obtained. The subject which gives the minimum value of norm is stored to be the subject in the test case
image.

__Output__
An accuracy of 99.3333% is obtained with the used algorithm to identify 150 test case images.
The representative images of all the subjects are given below


<img src="https://user-images.githubusercontent.com/55409875/89708562-f1e6a300-d995-11ea-8239-617b36775088.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708563-f317d000-d995-11ea-913e-b863cff9bf4e.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708564-f3b06680-d995-11ea-8f49-45cd32252561.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708565-f448fd00-d995-11ea-92dc-9df27d2973b0.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708566-f57a2a00-d995-11ea-957b-1953341135b7.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708567-f612c080-d995-11ea-84a2-84ff064d79b5.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708568-f6ab5700-d995-11ea-8eef-543dd24b7535.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708569-f7dc8400-d995-11ea-8b73-75bb499b6ed1.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708572-f90db100-d995-11ea-8050-a1269f120e87.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708573-f9a64780-d995-11ea-8ed4-e1878bb3cef3.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708574-fad77480-d995-11ea-849a-30fc8e5cdbf0.jpg" width="15%"></img> <img src="https://user-images.githubusercontent.com/55409875/89708575-fb700b00-d995-11ea-89ae-548c5ba0f020.jpg" width="15%"></img> 



