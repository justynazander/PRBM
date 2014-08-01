uirestore; 
restoration = load('user.mat');
restoration_help = load('user.mat', 'sav');
git_user = restoration_help.sav.edit1.string;
github_user = restoration_help.sav.edit2.string;
github_repository = restoration_help.sav.edit3.string;
%web(['https://github.com/' github_user '/' github_repository], '-new', '-browser')
dos(['git config --global user.name "' git_user '"']); 
git_email = 'justyna.zander@gmail.com';
dos(['git config --global user.email ' git_email ]);
dos(['git remote set-url origin https://github.com/' github_user '/' github_repository '.git']);
dos(['git remote add upstream https://github.com/' github_user '/' github_repository '.git']);
dos('echo *.asv>> .git\info\exclude'); 

dos('git fetch --all'); 
dos('git add -A'); 
dos('git commit -m "Brand New Routine"'); 
dos('git push origin master');


dos('git config --global user.name "JZ"'); 
dos('git config --global user.email justyna.zander@gmail.com');
dos('git remote set-url origin https://github.com/justynazander/XYZ.git');
dos('git remote add upstream https://github.com/justynazander/XYZ.git');
dos('echo *.asv>> .git\info\exclude'); 

dos('git fetch --all'); 
dos('git add -A'); 
dos('git commit -m "Brand New Routine"'); 
dos('git push -u origin master');

!git remote show origin
!git remote -v
!git remote rm origin
