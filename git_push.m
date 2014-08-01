
%!git remote add origin https://github.com/justynazander/Test.git
% Creates a remote named "origin" pointing at your GitHub repository

uirestore; 
restoration_help = load('user.mat', 'sav');
git_user = restoration_help.sav.edit1.string;
github_user = restoration_help.sav.edit2.string;
github_repository = restoration_help.sav.edit3.string;

dos(['git config --global user.name "' git_user '"']); 
dos(['git remote set-url origin https://github.com/' github_user '/' github_repository '.git']);
dos(['git remote add upstream https://github.com/' github_user '/' github_repository '.git']);
dos('git init');
dos(['git remote add origin https://github.com/' github_user '/' github_repository]);
%dos('git push -u origin master'); 
dos('echo *.asv>> .git\info\exclude'); 

dos('git add -A'); 
dos('git commit -m "Brand New Push"'); 
dos('git push origin master');

web(['https://github.com/' github_user '/' github_repository], '-new', '-browser')

% Sends your commits in the "master" branch to GitHub
