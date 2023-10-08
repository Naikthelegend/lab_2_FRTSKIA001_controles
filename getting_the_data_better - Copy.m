
steps = cell(3, 1);  % Create a cell array to store the data for each step

 A_prime = []; 

for step_number = 1:3
    % Read the data for the current step
    step_data = readmatrix(['step ', num2str(step_number), '.csv']);
    
    % Finding delta t and delta y
    delta_time = diff(step_data(:, 1));
    delta_position = diff(step_data(:, 4));
    
    velocities = [0; delta_position ./ delta_time];
    
    % Adding velocities to the main array
    step_data(:, 5) = velocities;
    
    % Isolating the data we want
    
    step1_correct_start = [];
    time_start = 0;
    
    for i = 1:length(velocities)
        if (velocities(i) > 0.5) && (time_start == 0)
            time_start = step_data(i, 1);
        end
        
        if velocities(i) > 0.5
            step1_correct_start = [step1_correct_start; step_data(i, 1) - time_start, velocities(i)];
        end
    end
    
    % Store the corrected data for the current step in the cell array
    steps{step_number} = step1_correct_start;
    
    % Plot the data for the current step
    figure;
    plot(steps{step_number}(:, 1), steps{step_number}(:, 2));
    title(['Step ', num2str(step_number)]);
    
    A_prime = [A_prime; 1,max(steps{step_number}(:, 2))];
    A_prime_ave= mean(A_prime(:,2));
    
end










