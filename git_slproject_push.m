
%!git remote add origin https://github.com/justynazander/Test.git
% Creates a remote named "origin" pointing at your GitHub repository

uirestore; 
restoration_help = load('user.mat', 'sav');
git_user = restoration_help.sav.edit1.string;
github_user = restoration_help.sav.edit2.string;
github_repository = restoration_help.sav.edit3.string;

[projectFolder, ~] = Simulink.ModelManagement.Project.projectDemoSetUp(fullfile(matlabroot,'toolbox','simulink','simdemos',...
'collaboration','GitHubDemo.zip'),[], true, 'gendemo');
simulinkproject(projectFolder);

cd(fullfile(projectFolder))

% BUT ACTUALLY WHAT IS REQUIRED HERE: 
% 1. Create a SL project programatically for the current folder in current working directory; 
% 2. and append the contents of the folder where you have your model as Project Files. 
% 3. Zip it all 
% 4. Then follow the WORKFLOW specified above with some modifications. 
% ... hmh 
% n. Unpack the repository to your Simulink to a new folder: 
% [projectFolder, ~] = Simulink.ModelManagement.Project.projectDemoSetUp(fullfile(matlabroot,'a new folder',...
%     'CreatedRepository.zip'),[], true, 'gendemo')
% m. Open the project: 
% simulinkproject(projectFolder)


dos(['git config --global user.name "' git_user '"']); 
dos(['git remote set-url origin https://github.com/' github_user '/' github_repository '.git']);
dos(['git remote add upstream https://github.com/' github_user '/' github_repository '.git']);
dos('git init');
dos(['git remote add origin https://github.com/' github_user '/' github_repository]);
%dos('git push -u origin master'); 
dos('echo *.asv>> .git\info\exclude'); 

dos('git pull origin master'); 

dos('git add -A'); 
dos('git commit -m "Brand New Push"'); 
dos('git push origin master');

web(['https://github.com/' github_user '/' github_repository], '-new', '-browser')

% Sends your commits in the "master" branch to GitHub
