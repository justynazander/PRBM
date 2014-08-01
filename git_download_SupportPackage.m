function folder_name = git_download_SupportPackage( varargin )
%DOWNLOADSUPPORTPACKAGE 

%% using dos to download just for variety to try it out 
% It works, but we stick with MATLAB native commands
% !@echo off
% !md c:\GitHubSupportPackage
% !call bitsadmin /transfer GH /download /priority normal http://github-windows.s3.amazonaws.com/GitHubSetup.exe c:\GitHubSupportPackage\GitHubSetup.exe

%% using MATLAB commands to download 
folder_name = uigetdir('C:\GitHubSupportPackage', 'GitHub support package folder')
mkdir(folder_name);
installation_path = folder_name;
% make installation_path an argument at some point
fullURL1 = ['https://msysgit.googlecode.com/files/Git-1.8.4-preview20130916.exe'];
filename1 = [installation_path '\Git-1.8.4-preview20130916.exe'];
urlwrite(fullURL1,filename1);

%% TODO - requires another download as .exe is not available on this site
fullURL2 = ['http://gitcredentialstore.codeplex.com/downloads/get/640464'];
filename2 = [installation_path '\git-credential-winstore.exe'];
urlwrite(fullURL2,filename2);

fullURL3 = ['http://github-windows.s3.amazonaws.com/GitHubSetup.exe'];
filename3 = [installation_path '\GitHubSetup'];
urlwrite(fullURL3,filename3);

%% todo 
% http://msdn.microsoft.com/en-us/library/windows/desktop/ee663885(v=vs.85).aspx

%% yet something else but does not work well yet

links = {'https://msysgit.googlecode.com/files/Git-1.8.4-preview20130916.exe', 'http://github-windows.s3.amazonaws.com/GitHubSetup.exe', 'http://gitcredentialstore.codeplex.com/downloads/get/640464'};

% copy files to a local folder
n = numel(links);
for i = 1:n

    % local file
    linki = links{i};
    [pathstr, name, ext ] = fileparts(linki);
    fname = [tempdir name ext];

    disp(['Downloading git installation: ' fname ]);

    % open local file
    fh = fopen(fname, 'wb');

    if fh == -1
        msg = 'Unable to open file %s';
        msg = sprintf(msg, fname);
        error(msg);
    end

    fh = fclose(fh);
    if fh == -1
        msg = 'Unable to close file %s';
        msg = sprintf(msg, fname);
        error(msg);
    end

end

disp('Done') 

end

