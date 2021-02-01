clear;
% This code seperates the signal data from the dataset in the fashion that 
%each subject(out of 40) that performs an particular movement(out of 17) for an repetition (out of 6) a Features are extracted from that chunk of the signal.  
% the extracted features are then stored in a CSV for each repition each of
% each movement and each subejct. 


for dataset_loop = 1:40
    clearvars -except dataset_loop
    dataset_path = strcat('F:\Asad Data\DB2_all_files\S',num2str(dataset_loop),'_E1_A1.mat');
    load(dataset_path);


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

             int_mat_2(i,counter)=start;
             int_mat_2(i,counter+1)=end_1;
            counter=counter+2;

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
                if(L==1)
                    store_mat_2 = zeros(length(a_1(:,1)),length(a_1(1,:))*12);
                    counter_6 = length(a_1(1,:));
                end

                store_mat_2(:,counter_5:counter_6)= a_1;
                counter_5 = counter_5 + (length(a_1(1,:)));
                counter_6 = counter_6 + length(a_1(1,:));
           end % L ends here

           counter=counter+2;
           
           temp=store_mat_2;
            chunksize=length(temp(1,:))/12;
        start=1;
        end1=chunksize;
        mat=zeros(length(temp(:,1)),12*17);
        counter_1 = 1;
        for L=1:12
          
            temp2=temp(:,start:end1);
            for m=1:length(temp2(:,1))
                mat(m,counter_1)= meanabs(temp2(m,:));
                mat(m,counter_1+1)=var(temp2(m,:));
                mat(m,counter_1+2)=jZC(temp2(m,:),mean(temp2(m,:)));
                mat(m,counter_1+3)=jWL(temp2(m,:));
                mat(m,counter_1+4)=jSSC(temp2(m,:),mean(temp2(m,:)));
                mat(m,counter_1+5)=rms(temp2(m,:));
                mat(m,counter_1+6)=MAVS(temp2(m,:));
                mat(m,(counter_1+7):(counter_1+7+9))=hist(temp2(m,:));
            end
             counter_1 = counter_1+17;  
             
              start=chunksize+1;
            end1=end1+chunksize;
        end 
        path5=strcat(path4,'Subject_',int2str(i),'_Movement_',int2str(k),'_Repetition_',int2str(p),'.csv');
        csvwrite(path5,mat);
        
           
            
            

        end %repetitions
    end

end
