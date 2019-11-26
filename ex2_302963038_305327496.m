%% 
% HW_2 solution 
% Eden Golfarb 302963038
% Noa Nissani 305327496
 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% <short description of what your script is doing for 
% example: this script load experiments data and  
% analyzes it. The output is the statistics 
% calculations results. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Q1
% <Document the code: briefly describe the question and how you solved it>
disp('*** Question 1 ***');

disp('Input: Vector, matrix or multidimentional array is the input');
disp('Output: Sorted elements');

 % come back to this- there's a question also
 
%% Q2
% <Document the code: briefly describe the question and how you solved it>
disp('*** Question 2 ***');

load('data_hw2_2020a.mat');
 
 
%% Q3
% <Document the code: briefly describe the question and how you solved it>
disp('*** Question 3 ***');

concat_mat = [test1_scores, test2_scores, test3_scores, test4_scores];


%% Q4
% <Document the code: briefly describe the question and how you solved it>
disp('*** Question 4 ***');


mean_tests = mean(concat_mat);
median_tests = median(concat_mat);
max_tests = max(concat_mat);
min_tests = min(concat_mat);

fprintf('Test No. %d results: \nmedian: %d mean: %d max: %d min: %d \n',...
    1, median_tests(1), mean_tests(1), max_tests(1), min_tests(1));

fprintf('Test No. %d results: \nmedian: %d mean: %d max: %d min: %d \n',...
    2, median_tests(2), mean_tests(2), max_tests(2), min_tests(2));

fprintf('Test No. %d results: \nmedian: %d mean: %d max: %d min: %d \n',...
    3, median_tests(3), mean_tests(3), max_tests(3), min_tests(3));

fprintf('Test No. %d results: \nmedian: %d mean: %d max: %d min: %d \n',...
    4, median_tests(4), mean_tests(4), max_tests(4), min_tests(4));
 

%% Q5
% <Document the code: briefly describe the question and how you solved it>
disp('*** Question 5 ***');

max_median = max(median_tests);
min_median = min(median_tests);
mean_medians = mean(median_tests);

fprintf(['The highest median score is: %d\n', ...
    'The lowest median score is: %d\n', ...
    'The average score of all medians is: %d'], ...
 floor(max_median), floor(min_median), floor(mean_medians));
 
 
 %% Q6
% <Document the code: briefly describe the question and how you solved it>
disp('*** Question 6 ***');

weights = [0.25, 0.1, 0.5, 0.15];

new_mat = sum(concat_mat .* weights, 2);

fprintf(['The lowest weighted score is: %d\n', ...
    'The highest weighted score is: %d\n', ...
    'The average weighted score is: %d\n'], ...
    ceil(min(new_mat)), ceil(max(new_mat)), ceil(mean(new_mat)));

% How do the weights affect the experiment results?
% The minimal value was the one affected most. Before it was 24 and now,
% following the weighted average we get a minimum 50.


%% Q7
% <Document the code: briefly describe the question and how you solved it>
disp('*** Question 7 ***');

[ordered_score, ind_part] = sort(concat_mat(:,4), 'descend');
date = cellstr(Date);

fprintf('1. Participant no. %d %s %s %d\n', ...
    ind_part(1), date{ind_part(1)}, Gender(ind_part(1)), ordered_score(1))

fprintf('2. Participant no. %d %s %s %d\n', ...
    ind_part(2), date{ind_part(2)}, Gender(ind_part(2)), ordered_score(2))

fprintf('3. Participant no. %d %s %s %d\n', ...
    ind_part(3), date{ind_part(3)}, Gender(ind_part(3)), ordered_score(3))


%% Q8
% <Document the code: briefly describe the question and how you solved it>
disp('*** Question 8 ***');

[first_ordered_score, first_ind_part] = sort(concat_mat(:,1), 'descend');

ind_26 = find(first_ind_part == 26);
ind_28 = find(first_ind_part == 28);
ind_3 = find(first_ind_part == 3);

fprintf(['test4 top student #1 is in position %d in test1 scores\n', ...
    'test4 top student #2 is in position %d in test1 scores\n', ...
    'test4 top student #3 is in position %d in test1 scores\n'], ...
    ind_26, ind_28, ind_3)


%%
disp('*** Question 9 ***');
%count number of females in each date
females_date1=size(find(Gender(1:10,1)=='f'));
females_date2=size(find(Gender(11:20,1)=='f'));
females_date3=size(find(Gender(21:30,1)=='f'));
%print number of females
fprintf('%s number of females  %d\n',Date(1,1:8),females_date1(1,1));
fprintf('%s number of females  %d\n',Date(11,1:8),females_date2(1,1));
fprintf('%s number of females  %d\n',Date(21,1:8),females_date3(1,1));
disp('  ');


%%
disp('*** Question 10 ***');
data_filt_indx=find(Age<=66 & Age>=19);
data_filt=concat_mat(data_filt_indx,:);
% median,mean,max,min calculation across all tests
median_tests_filt=round(median(data_filt));
mean_tests_filt=round(mean(data_filt));
max_tests_filt=round(max(data_filt));
min_tests_filt=round(min(data_filt));
% prints results for each test
test_num=1;
fprintf('Test No.%d results:\n median: %d mean: %d max: %d min: %d\n',test_num,...
    median_tests_filt(test_num),mean_tests_filt(test_num),max_tests_filt(test_num)...
    ,min_tests_filt(test_num));

test_num=2;
fprintf('Test No.%d results:\n median: %d mean: %d max: %d min: %d\n',test_num,...
    median_tests_filt(test_num),mean_tests_filt(test_num),max_tests_filt(test_num)...
    ,min_tests_filt(test_num));

test_num=3;
fprintf('Test No.%d results:\n median: %d mean: %d max: %d min: %d\n',test_num,...
    median_tests_filt(test_num),mean_tests_filt(test_num),max_tests_filt(test_num)...
    ,min_tests_filt(test_num));
test_num=4;
fprintf('Test No.%d results:\n median: %d mean: %d max: %d min: %d\n',test_num,...
    median_tests_filt(test_num),mean_tests_filt(test_num),max_tests_filt(test_num)...
    ,min_tests_filt(test_num));

disp('  ');

%%
disp('*** Question 11 ***');
%replace scores below 55
less_than55=find(data_filt<55);
data_filt(less_than55)=65;
% calculates new mean for the changed data

mean_tests=round(mean(data_filt));

% print the new averages
test_num=1;
fprintf('Test No.%d new average is: %d \n',test_num,mean_tests(test_num));
test_num=2;
fprintf('Test No.%d new average is: %d \n',test_num,mean_tests(test_num));
test_num=3;
fprintf('Test No.%d new average is: %d \n',test_num,mean_tests(test_num));
test_num=4;
fprintf('Test No.%d new average is: %d \n',test_num,mean_tests(test_num));
disp('  ');

