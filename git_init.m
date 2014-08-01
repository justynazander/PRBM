
function git_init()
                                                                                                
%status = dos('git ... ')
%save('config.mat');
%%
%save('config.mat','ans.User','-mat');
%git_save_help; 
%save('config.mat')

uirestore; 
restoration = load('user.mat');
restoration_help = load('user.mat', 'sav');
git_user = restoration_help.sav.edit1.string;
github_user = restoration_help.sav.edit2.string;
github_repository = restoration_help.sav.edit3.string;
%disp(['------' github_user])

%configuration = load('config.mat');

local_repository_path = uigetdir('C:\GitHubSupportPackage', 'GitHub local repository path')
mkdir(local_repository_path);
% 
% git_user = configuration.User;
% github_user = configuration.GHuser;
% github_repository = [configuration.Repository '.git'];

web(['https://github.com/' github_user '/' github_repository], '-new', '-browser')

dos(['git config --global user.name "' git_user '"']); 
git_email = 'justyna.zander@gmail.com';
dos(['git config --global user.email ' git_email ]);
%!git clone https://github.com/justynazander/GitHubInterface
dos(['git remote set-url origin https://github.com/' github_user '/' github_repository '.git']);
dos(['git remote add upstream https://github.com/' github_user '/' github_repository '.git']);
%dos('git init');
%dos([git remote add origin https://github.com/' github_user '/' github_repository]);
%dos('git push -u origin master');
dos('echo *.asv>> .git\info\exclude'); 

end
%%Do not use: 
%!git config remote.origin.url https://you:password@github.com/justynaznader/Test.git
%It is breaking the credentials. 

%% Old code 
% !git config --global user.email justyna.zander@gmail.com
% %!git clone https://github.com/justynazander/Test
% !git remote set-url origin https://github.com/justynazander/NewTestRepository.git
% !git remote add upstream https://github.com/justynazander/NewTestRepository.git
% !echo *.asv>> .git\info\exclude

