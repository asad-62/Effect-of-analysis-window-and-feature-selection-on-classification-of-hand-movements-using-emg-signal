% This Code is appends the output of each Repetition and then shuffles the
% Repetitions in in test train split.

clear 
path1='R:\Imdad\EMG\data after windows for all papers\my data reduced\single rep\config_7\';

int_mat=zeros(1000,12*5);

counter2=482;
arr=zeros(40,1);
arr_train=zeros(40,1);

tic
for i=1:40
    counter1_train=0;
    counter1=0;
    for j=1:17
        for k=1:6
            if(k~=1&&k~=3&&k~=4&&k~=6)
                path=strcat(path1,'Subject_',int2str(i),'_Movement_',int2str(j),'_','Repetition_',int2str(k),'.csv');
                temp= csvread(path);
                [i j k i j k]
                counter1 = counter1 + length(temp(:,1));
            end
            if(k~=2&&k~=5)
                path=strcat(path1,'Subject_',int2str(i),'_Movement_',int2str(j),'_','Repetition_',int2str(k),'.csv');
                temp= csvread(path);
                counter1_train = counter1_train + length(temp(:,1));
            end
        end
    end
       arr(i,1)=counter1;
       arr_train(i,1)=counter1_train;
% end
% toc
end

%%
path1='R:\Imdad\EMG\data after windows for all papers\my data reduced\single rep\config_7\';
% path2='R:\Imdad\EMG\data after windows for all papers\features_for_2017_paper\classifier folder for 2017\testing\';
path13='R:\Imdad\EMG\appended\my_paper\configurations\C7\';
for i=1:40
    counter1=1;
    counter2=0;  
    
    counter1_train=1;
    counter2_train=0; 
    int_mat=zeros(arr(i,1),12*5);
    int_mat2=cell(arr(i,1),1);
    
    int_mat_train=zeros(arr_train(i,1),12*5);
    int_mat2_train=cell(arr_train(i,1),1);
    for j=1:17
        for k=1:6
            [i j k]
            if(k~=1&&k~=3&&k~=4&&k~=6)
 
              path=strcat(path1,'Subject_',int2str(i),'_Movement_',int2str(j),'_','Repetition_',int2str(k),'.csv');
             temp= csvread(path);
             
             counter1=counter2+1;
             counter2=counter2+length(temp(:,1));
             int_mat(counter1:counter2,1:12*5)=temp;
%              int_mat2(counter1:counter2,1)={strcat('output_',int2str(j))};
             if(j==1)
                 value = 'one';
             elseif(j==2)
                 value = 'two';
             elseif(j==3)
                 value = 'three';
                 elseif(j==4)
                 value = 'four';
                 elseif(j==5)
                 value = 'five';
                 elseif(j==6)
                 value = 'six';
                 elseif(j==7)
                 value = 'seven';
                 elseif(j==8)
                 value = 'eight';
                 elseif(j==9)
                 value = 'nine';
                 elseif(j==10)
                 value = 'ten';
                 elseif(j==11)
                 value = 'eleven';
                 elseif(j==12)
                 value = 'twelve';
                 elseif(j==13)
                 value = 'thirteen';
                 elseif(j==14)
                 value = 'fourteen';
                 elseif(j==15)
                 value = 'fifteen';
                 elseif(j==16)
                 value = 'sixteen';
                 elseif(j==17)
                 value = 'seventeen';
             end
             int_mat2(counter1:counter2,1)={value};
 
            end
            
            if(k~=2&&k~=5)

              path=strcat(path1,'Subject_',int2str(i),'_Movement_',int2str(j),'_','Repetition_',int2str(k),'.csv');
             temp= csvread(path);
             counter1_train=counter2_train+1;
             counter2_train=counter2_train+length(temp(:,1));
             int_mat_train(counter1_train:counter2_train,1:12*5)=temp;
%              int_mat2(counter1:counter2,1)={strcat('output_',int2str(j))};
            if(j==1)
                 value = 'one';
             elseif(j==2)
                 value = 'two';
             elseif(j==3)
                 value = 'three';
                 elseif(j==4)
                 value = 'four';
                 elseif(j==5)
                 value = 'five';
                 elseif(j==6)
                 value = 'six';
                 elseif(j==7)
                 value = 'seven';
                 elseif(j==8)
                 value = 'eight';
                 elseif(j==9)
                 value = 'nine';
                 elseif(j==10)
                 value = 'ten';
                 elseif(j==11)
                 value = 'eleven';
                 elseif(j==12)
                 value = 'twelve';
                 elseif(j==13)
                 value = 'thirteen';
                 elseif(j==14)
                 value = 'fourteen';
                 elseif(j==15)
                 value = 'fifteen';
                 elseif(j==16)
                 value = 'sixteen';
                 elseif(j==17)
                 value = 'seventeen';
             end
             int_mat2_train(counter1_train:counter2_train,1)={value};
 
            end
            
        end

        
    end

    train_normalized = (int_mat_train);
    test_normalized = (int_mat);
    
     percentage_split = ((length(train_normalized(:,1)))/...
        ((length(train_normalized(:,1)))+ length(test_normalized(:,1))))*100;
    
    row_length = (length(train_normalized(:,1))+length(test_normalized(:,1)));
    final_mat = zeros(row_length,12*5);
    final_mat(1:length(train_normalized(:,1)),:) = train_normalized;
    final_mat(length(train_normalized(:,1))+1:end,:) = test_normalized;
    
    final_mat_out = cell(row_length,1);
    final_mat_out(1:length(train_normalized(:,1)),1) = int_mat2_train;
    final_mat_out(length(train_normalized(:,1))+1:end,1) = int_mat2;
    
    train_final = table(final_mat,final_mat_out);

   
    path14=strcat(path13,int2str(i),'single_rep_Train_percentage_.csv')
  writetable(train_final,path14);
    

end
toc
             
