clear;

% int_mat = csvread('int_mat.csv');
% int_mat_2 = csvread('int_mat_2.csv');
for dataset_loop = 2:11
    clearvars -except dataset_loop
    dataset_path = strcat('R:\Pasha\Asad\Asad Data\DB2_all_files\DB2_all_files\Amptues\amputes refined data\S',num2str(dataset_loop),'_E1_A1.mat');
    load(dataset_path);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    output = restimulus;

    repetition = rerepetition;


    %%
    int_mat = zeros(17,12);
    counter_1 = 0;

    start_ind = 1;
    for output_ind = 1:length(unique(output))
        output_ind;
        end_ind = 1;

        for rep_ind = 2:length(unique(repetition))
            rep_ind;
           temp =  rep_ind-1;
           while temp==rep_ind-1
               counter_1 = counter_1 +1;
               temp = repetition(counter_1,1);
           end
           int_mat(output_ind,end_ind)= start_ind;
           int_mat(output_ind,end_ind+1)= counter_1-1;

           start_ind = counter_1;
           end_ind = end_ind+2;
        end

    end
    %%
    int_mat_2=zeros(18,12);
    for i=1:length(int_mat(:,1))-1
        i;
        counter=1;
    %     start=1;end_1=1;
    temp_5=0;
        for j=1:length(int_mat(1,:))/2
            j;
            temp=int_mat(i,counter);
            temp_2=int_mat(i,counter+1);
            temp_6 = temp:temp_2;
            temp_3=restimulus(temp:temp_2);
            temp_4=find(temp_3~=0);
            temp_7 = temp_6(temp_4);
            start=temp_7(1);
            end_1=temp_7(end);

    %         temp_3(temp4)=[];
    %         end_1 =length(temp_3)+start-1;
             int_mat_2(i,counter)=start;
             int_mat_2(i,counter+1)=end_1;
            counter=counter+2;
    %         temp_5 = end_1;
    %         start=end_1+1;
    %         end_1=start;
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%
    L=1;
    for i=1:length(int_mat_2(:,1))-1 %row
        counter=1;

        for j=1:length(int_mat_2(1,:))/2 % column
            [dataset_loop i j L counter counter+1]
           start_1= int_mat_2(i,counter);
           end_1= int_mat_2(i,counter+1);
           counter_5 = 1;
           counter_6 = 1;
           for L = 1:12
               a_1=emg(start_1:end_1,L);

               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                new_var= a_1;
                temp1=length(new_var);
                temp2=temp1.*256;
                temp3=floor(temp2/5000);
                temp4=temp1.*10;
                temp5=floor(temp4/5000);
                temp6=floor((temp1-temp3)/temp5)+ 1 ;

                chunk_size =temp3;
                chunk = temp6;

                z = zeros(chunk,chunk_size);
                counter_3=1;
                counter_2 = chunk_size;
                for k=1:chunk
                    k;
                    z(k,:) = new_var(counter_3:counter_2,1);
                    counter_3 = counter_3+temp5;
                    counter_2 = counter_2+temp5;
                end
               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                if(L==1)
                    store_mat_2 = zeros(length(z(:,1)),length(z(1,:))*12);
                    counter_6 = length(z(1,:));
                end

                store_mat_2(:,counter_5:counter_6)= z;
                counter_5 = counter_5+ (length(z(1,:)));
                counter_6 = counter_6 + length(z(1,:));
           end % L ends here
    %        if(j==1)
    %            store_mat = zeros(length(z(:,1)),length(z(:,1)));
    %        end
           counter=counter+2;
           path = strcat('R:\Pasha\Asad\Asad Data\DB2_all_files\DB2_all_files\refined data\Subject_',num2str(dataset_loop),'_Movement_',int2str(i),'_Repetition_',int2str(j),'.csv');
           dlmwrite(path,store_mat_2);
        end
    end

end