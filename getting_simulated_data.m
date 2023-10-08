step1 = readmatrix('step 1.csv');
step2 = readmatrix('step 2.csv');
step3 = readmatrix('step 3.csv');
step4 = readmatrix('step 4.csv');
step5 = readmatrix('step 5.csv');

%Time(s),Input(v),Output(v),Output(m)

% finding delt t and delta y

delta_time = diff(step1(:,1));
delta_position = diff(step1(:,4));

velocities = [0; delta_position ./ delta_time];

%adding to main array
step1(:, 5) = velocities;


%isolatin the data we want
step1_correct_start = [];
time_start= 0;
for i = 1:length(velocities)
    if (velocities(i) > 0.5) && (time_start == 0)
        time_start =step1(i,1);        
       
    end 

    if velocities(i) > 0.5
       step1_correct_start = [step1_correct_start; step1(i:1)-time_start , velocities(i)]; 
    end  

end 

plot(step1_correct_start);



