
uirestore; 
restoration_help = load('user.mat', 'sav');
git_user = restoration_help.sav.edit1.string;
github_user = restoration_help.sav.edit2.string;
github_repository = restoration_help.sav.edit3.string;

% Pull from external repository
%Think about it ... 

% [projectFolder, ~] = Simulink.ModelManagement.Project.projectDemoSetUp(('https://github.com/justynazander/GitZip/GitHubDemo.zip'),[], true, 'gendemo');
% simulinkproject(projectFolder);
% 
% cd(fullfile(projectFolder))


!git pull origin master 