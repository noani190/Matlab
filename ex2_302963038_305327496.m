%% 
% HW_2 solution 
% Eden Golfarb 302963038
% Noa Nissani 305327496
 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In this script we load the experiment data and do
% some analysis on it.
% The output is the statistics calculations results. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clc;
%% Q1
% What's the input and output for this function? Describe the case
% where there are two outputs
disp('*** Question 1 ***');

% Input: Vector, matrix or multidimentional array is the input
% Output: Sorted elements

% There are two outputs whenever we want to get both the sorted output
% and the sorted indices of the output.

disp('  ');
 
%% Q2
% Load the experiments' data to the workspace
disp('*** Question 2 ***');

load('data_hw2_2020a.mat');

disp('  ');
 
 
%% Q3
% Concatanate the four tests into a new matrix
disp('*** Question 3 ***');

concat_mat = [test1_scores, test2_scores, test3_scores, test4_scores];

disp('  ');

%% Q4
% Find the median, mean, max and minimum for the 4 tests
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
 
disp('  ');

%% Q5
% Find the participants’ median of the 4 tests. What are the highest and
% the lowest median scores? What is the average of the medians?
disp('*** Question 5 ***');

max_median = max(median_tests);
min_median = min(median_tests);
mean_medians = mean(median_tests);

fprintf(['The highest median score is: %d\n', ...
    'The lowest median score is: %d\n', ...
    'The average score of all medians is: %d'], ...
 floor(max_median), floor(min_median), floor(mean_medians));
 
disp('  ');
 
%% Q6
% We calculated the weighted average per participant of all the 4 tests
% using these weights:
% The first test weight is 25%, the second: 10%, the third: 50% and
% the fourth 15%.  
% How do the weights affect the experiment results? we looked at the
% outcome of this question and compared it to question 4s' output.
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

disp('  ');

%% Q7
% Find the 3 participants that got the highest scores
% in test number 4. We sorted the scores and also the indexes and used
% the correct indices to find the needed values in the arrays.
disp('*** Question 7 ***');

[ordered_score, ind_part] = sort(concat_mat(:,4), 'descend');
date = cellstr(Date);

fprintf('1. Participant no. %d %s %s %d\n', ...
    ind_part(1), date{ind_part(1)}, Gender(ind_part(1)), ordered_score(1))

fprintf('2. Participant no. %d %s %s %d\n', ...
    ind_part(2), date{ind_part(2)}, Gender(ind_part(2)), ordered_score(2))

fprintf('3. Participant no. %d %s %s %d\n', ...
    ind_part(3), date{ind_part(3)}, Gender(ind_part(3)), ordered_score(3))

disp('  ');

%% Q8
% Find out how well the top 3 participants in test4 did in test1
% (what is their rank in test1).
% To do that we sorted the data according to test1 scores
% in descending order. We Found the position of the top 3 from Q7 
% among the 30 participant’s test1 scores.
disp('*** Question 8 ***');

[first_ordered_score, first_ind_part] = sort(concat_mat(:,1), 'descend');

ind_26 = find(first_ind_part == 26);
ind_28 = find(first_ind_part == 28);
ind_3 = find(first_ind_part == 3);

fprintf(['test4 top student #1 is in position %d in test1 scores\n', ...
    'test4 top student #2 is in position %d in test1 scores\n', ...
    'test4 top student #3 is in position %d in test1 scores\n'], ...
    ind_26, ind_28, ind_3)

disp('  ');

%% Q9
% Calculate the number of females on each date
disp('*** Question 9 ***');

% Count number of females in each date
females_date1=size(find(Gender(1:10,1)=='f'));
females_date2=size(find(Gender(11:20,1)=='f'));
females_date3=size(find(Gender(21:30,1)=='f'));

% and print number of females
fprintf('%s number of females  %d\n',Date(1,1:8),females_date1(1,1));
fprintf('%s number of females  %d\n',Date(11,1:8),females_date2(1,1));
fprintf('%s number of females  %d\n',Date(21,1:8),females_date3(1,1));

disp('  ');

%% Q10
% Remove from the data all people aged over 66, and under 19 and 
% create a new matrix.
% How does that affect the experiment results?
% Find again the median, mean, max and minimum for the 4 tests. 
disp('*** Question 10 ***');

data_filt_indx=find(Age<=66 & Age>=19);
data_filt=concat_mat(data_filt_indx,:);

% Median,mean,max,min calculation across all tests:
median_tests_filt=round(median(data_filt));
mean_tests_filt=round(mean(data_filt));
max_tests_filt=round(max(data_filt));
min_tests_filt=round(min(data_filt));

% Print results for each test:
test_num=1;
fprintf('Test No.%d results:\n median: %d mean: %d max: %d min: %d\n', ...
    test_num, median_tests_filt(test_num), mean_tests_filt(test_num), ...
    max_tests_filt(test_num), min_tests_filt(test_num));

test_num=2;
fprintf('Test No.%d results:\n median: %d mean: %d max: %d min: %d\n', ...
    test_num, median_tests_filt(test_num), mean_tests_filt(test_num), ...
    max_tests_filt(test_num), min_tests_filt(test_num));

test_num=3;
fprintf('Test No.%d results:\n median: %d mean: %d max: %d min: %d\n', ...
    test_num, median_tests_filt(test_num), mean_tests_filt(test_num), ...
    max_tests_filt(test_num), min_tests_filt(test_num));

test_num=4;
fprintf('Test No.%d results:\n median: %d mean: %d max: %d min: %d\n', ...
    test_num, median_tests_filt(test_num), mean_tests_filt(test_num), ...
    max_tests_filt(test_num), min_tests_filt(test_num));

disp('  ');

%% Q11
% Find all the places where the score is below 55 and replace it with 60.
disp('*** Question 11 ***');

% replace scores below 55
less_than55=find(data_filt<55);
data_filt(less_than55)=65;

% calculate new mean for the changed data
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


%% Q12
% Create group 1 and group 2 of every third participant from the first
% or second participant until the last one (respectively)
disp('*** Question 12 ***');

new_age = Age(data_filt_indx);
group1_idx = 1:3:20;
group2_idx = 2:3:20;
group1 = data_filt(group1_idx,:);
group2 = data_filt(group2_idx,:);

mean_age_group1 = mean(new_age(group1_idx));
mean_age_group2 = mean(new_age(group2_idx));

fprintf('Group 1 age median is: %d\n', mean_age_group1);
fprintf('Group 2 age median is: %d\n', mean_age_group2);

disp('  ');
