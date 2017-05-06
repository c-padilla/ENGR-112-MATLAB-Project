% By submitting this assignment, I agree to the following:
%  “Aggies do not lie, cheat, or steal, or tolerate those who do”
%  “I have not given or received any unauthorized aid on this assignment”
% 
% Name: CHRISTOPHER PADILLA
% Section: 530
% Team:	13
% Assignment: MATLAB ENGR 112 PROJECT 
% Date:	19 APR. 2017

clear, clc;
% First things first, instantiating every global variable we need
username = 'Set Username';
inputFile = ''; iif = ''; % input file ID
% output file ID's 
outputFile = ''; of = ''; outputFileName = ''; 
% User's determination of whether data is normally distributed or not
normDist = '';
% global probability variable
prob = 0; 
% array in which we will store all data
data = []; 
% stores number of columns in the file (user input)
nColumns = 3; 
% input file status 
loaded = false; 

% The menu is always up
while (true)  
    choice = menu('Menu', username, 'Load Data File', ...
        'Clear Data from Memory','Set Output Filename', ...
        'Plot Histogram','Plot Histogram Fit','Plot Probability Plots', ...
        'Regression of y on x', 'Find Probability Given x or z', ...
        'Find x or z Given Probability','Exit');
    switch (choice)
        case 1 
            % Ask user to input username.
            u = inputdlg('Enter your username');
            user = char(u);
            username = strcat('Welcome,  ', user, '!');
            if (isequal(user, 'sam'))
                fprintf('Welcome back, boss.\n');
            else
                fprintf('Hello, %s!\n', user);
            end
        case 2            
            iif = inputdlg('Enter input file name');
            try
                inputFile = load(char(iif));
                loaded = true;
                nColumns = 3;
                nColumns = char(nColumns);
                while (~isequal(nColumns, '1') && ~isequal(nColumns, '2'))
                    nColumns = inputdlg('Is this data set distributed over 1 or 2 columns?');
                    nColumns = char(nColumns);
                end
                if (isequal(nColumns, '1'))
                    data = inputFile(:,1);
                else
                    data = horzcat(inputFile(:,1), inputFile(:,2));
                end
                fprintf('Data loaded. Ready to perform menu''s functions. %s\n', ...
                    'Reset Memory before loading another input file');
                if(~isempty(outputFile))
                    fprintf('Both files loaded. Outputting results to %s\n', outputFileName);
                    [Mean, Median, Mode, Var, Std, Min, Max, Count] = mystat(data);
                    % This goes to the output file
                    fprintf(outputFile, ... 
                        'Mean   = %8.2f\nMedian = %8.2f\nMode   = %8.2f\nVar    = %8.2f\nStdev  = %8.2f\t%s\nMin    = %8.2f\nMax    = %8.2f\nCount  = %8.2f', ...
                        Mean, Median, Mode, Var, Std, Min, Max, Count);
                end                
            catch
                loaded = false;
                inputFile = '';
                fprintf('Failed to load file. Please verify your file name%s\n',...
                    'and ensure number of columns is correct');
            end
        case 3
            % Clears memory (resets all variables)
            clc;
            fprintf('Memory reset.\n');
            username = 'Set Username';
            inputFile = ''; iif = '';
            outputFile = ''; of = ''; outputFileName = '';
            normDist = ''; 
            prob = 0; 
            data = []; 
            nColumns = 3; 
            loaded = false;  
        case 4
            % Sets output file
            of = inputdlg('Enter Output Filename: '); 
            % converts from cell to string type
            outputFileName = char(of); 
            try
                outputFile = fopen(outputFileName, 'w');
                fprintf('All output will go to %s\n', outputFileName);
                fprintf('Note before coninuing: if file exists, all data will be overridden.\n');
                if(~isempty(iif))
                    fprintf('Both files loaded. Outputting results to %s\n', outputFileName);
                    [Mean, Median, Mode, Var, Std, Min, Max, Count] = mystat(data);
                    fprintf(outputFile, ...
                        'Mean   = %8.2f\nMedian = %8.2f\nMode   = %8.2f\nVar    = %8.2f\n', ...
                        Mean, Median, Mode, Var);
                    fprintf('Stdev  = %8.2f\nMin    = %8.2f\nMax    = %8.2f\nCount  = %8.2f',... 
                        Std, Min, Max, Count);
                end
            catch
                outputFile = '';
                fprintf('Failed to open file\n');
            end
            
        case 5 
            % Plot Histogram of data
            % We need input data for this option
            if (loaded == false) 
                fprintf('Set your input file first!!\n');
            else
                histogram(data);
                normDist = '';
                while (~isequal(normDist, 'yes') && ~isequal(normDist, 'no'))
                    normDist = char(inputdlg('Does this data appear normally distributed? (yes or no)'));
                end
            end       
        case 6
            % Plot Histogram Fit of Data
            if (loaded == false)
                fprintf('Set your input file first!!\n');
            else
                histfit(data);
            end
        case 7 
            % Plot Probability Plots
            if (loaded == false)
                fprintf('Set your input file first!!\n');
            else
                probplot(data);
            end            
            
        case 8 
            fprintf('Don''t gotta do this thanks to Dr. Lara\n');
            fprintf('err... i mean this functionality is coming soon!\n');
        case 9 
            % Finds probability given x or z
            if (loaded == false || isempty(outputFile) || ~isequal(normDist, 'yes'))
                fprintf('Set your input file and output files first, and be sure you''ve %s\n', ...
                    'set your data to be normally distributed using the HISTOGRAM plot!');
                continue;
            end      
            xOrZ = 'w';
            while (~isequal(xOrZ, 'x') && ~isequal(xOrZ, 'z'))
                xOrZ = char(inputdlg('Will you be inputting an x or z value?'));
            end
            if (isequal(xOrZ, 'x'))
                inputedValue = inputdlg('Input your x value');
                % cell types are no bueno
                x = str2double(char(inputedValue)); 
                prob = normpdf(x, Mean, Std);
                fprintf('\n\nProbability = %8.2f\n', prob);
                fprintf(outputFile, '\n\nProbability = %8.2f\n', prob);
            else
                inputedValue = inputdlg('Input your z value');
                % calculate x value using inputed z value
                x = str2double(char(inputedValue))*Std+Mean;
                prob = normpdf(x, Mean, Std);
                fprintf('\n\nProbability = %8.2f\n', prob);
                fprintf(outputFile, '\n\nProbability = %8.2f\n', prob);
            end
            
        case 10
            % Finds x or z given probability
            if (loaded == false || ~isequal(normDist, 'yes') || isequal(outputFile, ''))
                fprintf('Set your input file and output files first, and be sure you''ve %s\n', ...
                    'set your data to be normally distributed using the histogram plot!');
                continue;
            end
            
            try
                prob = str2double(char(inputdlg('Please input your probability')));
            catch
                fprintf('Failed accept valid probability. Please ensure numeracy.\n');
                continue;
            end
            
            x = norminv(prob, Mean, Std);
            z = (x - Mean) / Std;
            xOrZ = '';
            fprintf(outputFile, 'Values where Probability = %8.2f: \n', prob);
            
            while (~isequal(xOrZ, 'x') && ~isequal(xOrZ, 'z') && ~isequal(xOrZ, 'both'))
                xOrZ = char(inputdlg('Would you like x, z, or both?'));
            end
            
            if (isequal(xOrZ, 'z'))
                fprintf(outputFile, 'Z Value given probability: %8.2f\n', z);
                fprintf('Result outputed to file\n');
            elseif (isequal(xOrZ, 'x')) 
                fprintf(outputFile, 'X Value given probability: %8.2f\n', x);
                fprintf('Result outputed to file\n');
            else
                fprintf(outputFile, 'X Value given probability: %8.2f\n', x);
                fprintf(outputFile, 'Z Value given probability: %8.2f\n', z);
                fprintf('Results outputed to file\n');
            end
            
        case 11
            fprintf('Thank you for using!\n');
            break;
        otherwise
            fprintf('Exiting abnormally\n');
            break;                
    end
end

