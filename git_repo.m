local_repository_path = uigetdir('C:\GitHubSupportPackage', 'GitHub local repository path')
mkdir([local_repository_path])
%'\Repository']);

!git init 

%!git clone https://github.com/justynazander/Test.git NewTestRepository