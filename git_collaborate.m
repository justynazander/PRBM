

uirestore; 
restoration_help = load('user.mat', 'sav');
git_user = restoration_help.sav.edit1.string;
github_user = restoration_help.sav.edit2.string;
github_repository = restoration_help.sav.edit3.string;

web(['https://github.com/' github_user '/' github_repository '/settings/collaboration'], '-new', '-browser')

%web('https://help.github.com/articles/be-social#step-1-pick-a-friend', '-new', '-browser'); 
