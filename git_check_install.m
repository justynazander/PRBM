function git_check_install( varargin )
%GIT_CHECK_INSTALL 

% Test to see if git is installed
[status,~] = system('git --version');
% if git is in the path this will return a status of 0
% it will return a 1 only if the command is not found

    if (status==1)
        % If GIT Is NOT installed, then this should end the function.
        fprintf('git is not installed\n%s\n',...
               'Download it at http://git-scm.com/download');
    else
 if status ==0 
            %disp(status); 
            disp('Git is installed on your machine.');  
        end 
    end

end

