
% Download Windows credentials authentication and sign in to GitHub once
% for the entire session. 

links = {'http://blob.andrewnurse.net/gitcredentialwinstore/git-credential-winstore.exe'};

% copy files to a local folder
n = numel(links);
for i = 1:n

    % local file
    linki = links{i};
    [pathstr, name, ext ] = fileparts(linki);
    fname = [tempdir name ext];

    disp(['Downloading git credentials sign-in facilitator: ' fname ]);
end 

% Run the application 

% This is where your application is set up: 
!git config --get --global credential.helper