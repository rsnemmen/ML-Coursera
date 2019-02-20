% Convert octave files to MATLAB's v7 format, such that I can open
% them in python with scipy.io.loadmat. Otherwise, scipy.io gives 
% me the error messages 
%               ValueError: Unknown mat file type, version 35, 32


maxiter=50;  % max number of iterations
for i=1:maxiter,
	