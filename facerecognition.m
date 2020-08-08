%% Initialization
clear all; close all; clc

% fprintf('Reading images');
% disp('');

mkdir('representativeImages');
for index=1:15
    Folder1='Dataset_Question1/';
    Folder2=int2str(index);
    Folder=strcat(Folder1,Folder2);
    file=dir(fullfile(Folder,'*.pgm'));
    % figure;
    for k=1:size(file,1)
        F=fullfile(Folder,file(k).name);
        I=imread(F);
        I=imresize(I,[100 100]);
        I=im2double(I);
%         subplot(ceil(sqrt(size(file,1))),ceil(sqrt(size(file,1))),k);
%         imshow(I);
        mat(k,:)=I(:);
    end
    
    %figure;
    for ii=1:size(mat,1)
        tempM=mean(mat(ii,:));
        tempS=std(mat(ii,:));
        A(ii,:)=(mat(ii,:)-tempM)/tempS;
%         subplot(ceil(sqrt(size(file,1))),ceil(sqrt(size(file,1))),ii);
        temp=vec2mat(A(ii,:),100);
        temp=temp';
%         imshow(temp);
    end
    
    % computing SVD
    [U, S, V]=svd(A);
    u1=U(:,1);
    v1T=V(:,1)';
    s1=S(1);
    representative=(s1*u1*v1T);
    representative_vector=representative(1,:);
    image_features(index,:)=representative_vector;
    representative_matrix=reshape(representative_vector,[100,100]);
    representative_image=mat2gray(representative_matrix);
    storefilename=sprintf('Image#%d.pgm',index);
    foldername=fullfile('representativeImages',storefilename);
    imwrite(representative_image,foldername);
end
% fprintf('Representative images stored');
% disp('');
% fprintf('Beginning test cases recognition');
% disp('');
for f=1:15 Folder1='Dataset_Question1/';
    Folder2=int2str(f);
    Folder=strcat(Folder1,Folder2);
    file=dir(fullfile(Folder,'*.pgm'));
    for k=1:size(file,1)
        F=fullfile(Folder,file(k).name);
        test=imread(F);
        test=imresize(test,[100 100]);
        test=im2double(test);
        testnew=reshape(test,[1,10000]);
        test_vect=(testnew-mean(testnew))/std(testnew);
        for i=1:15
            error(i)=sum(abs(test_vect-image_features(i,:)));
        end
        [M,index]=min(error);
        if index==f
            Index(f,k)=1;
        else
            Index(f,k)=0;
        end
    end
end
Index;
Accuracy=sum(sum(Index))*100/150
