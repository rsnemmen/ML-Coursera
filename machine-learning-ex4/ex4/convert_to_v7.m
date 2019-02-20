% Convert octave files to MATLAB's v7 format, such that I can open
% them in python with scipy.io.loadmat. Otherwise, scipy.io gives 
% me the error messages 
%               ValueError: Unknown mat file type, version 35, 32


maxiter=50;  % max number of iterations
for i=1:maxiter,
	% loads new version
	fname=["weights" int2str(i) ".mat"];
	load(fname);

	% saves to matlab's format
	save("-v7", [fname ".v7"], "weights_arr");

	fprintf('Saved %s\n', [fname ".v7"]);
end;