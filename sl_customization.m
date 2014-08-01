function sl_customization(cm)
%% Register custom menu function.
  cm.addCustomMenuFcn('Simulink:ToolsMenu', @getMyMenuItems);
end

%% Define the custom menu function.
 function schemaFcns = getMyMenuItems
  schemaFcns = {@getItem0,...
				}; 
 end

 %% Define the schema function for the menu items.
 
 function schema = getItem0(callbackInfo)
  schema = sl_container_schema;
  schema.label = 'Get social on GitHub...';
  schema.userdata = 'zero';	
  schema.childrenFcns = {@getItem2, @getItem1, @getItem100, @getItem10};
 end
 
 function schema = getItem1(callbackInfo)
  schema = sl_container_schema;
  schema.label = 'Local setup...';
  schema.userdata = 'one';	
  schema.childrenFcns = {@getItem04, @getItem05, @getItem5, @getItem6, @getItem61, @getItem21};
 end

 
 function schema = getItem100(callbackInfo)
  schema = sl_container_schema;
  schema.label = 'GitHub setup...';
  schema.userdata = 'one';	
  schema.childrenFcns = {@getItem3, @getItem31, @getItem4,};
 end

 
 function schema = getItem10(callbackInfo)
  schema = sl_container_schema;
  schema.label = 'Collaborate ...';
  schema.userdata = 'collaboration';	
  schema.childrenFcns = {@getItem10_1, @getItem212, @getItem211};
 end
 
function schema = getItem10_1(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Collaborate with friends...';
  schema.userdata = 'Socialize';
  schema.callback = @myCallback10_1; 
end 

function myCallback10_1(callbackInfo)  
git_collaborate;   
end
 
 
function schema = getItem05(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Initialize and configure git repository...';
  schema.userdata = 'Git initialization';
  schema.callback = @myCallback05; 
end 

function myCallback05(callbackInfo)  
  gui_user; 
  %git_init; 
  %disp('--- init ---'); 
end

 
function schema = getItem5(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Commit the model to git repository...';
  schema.userdata = 'Git commit';
  schema.callback = @myCallback5; 
end 

function myCallback5(callbackInfo)
%   git_save_help; 
%   disp('--- save help2 ---'); 
%   git_init; 
%   disp('--- init2 ---'); 
  git_commit; 
  disp(['Action: ' callbackInfo.userdata ' performed successfully.']);
end

function schema = getItem6(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Push the model to git repository';
  schema.userdata = 'Push';
  schema.callback = @myCallback6; 
end 

function myCallback6(callbackInfo)
  dos('git push -u origin master'); 
  disp(['Action: ' callbackInfo.userdata ' performed successfully.']);
end

function schema = getItem61(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Pull the model from git repository';
  schema.userdata = 'Pull';
  schema.callback = @myCallback61; 
end 

function myCallback61(callbackInfo)
  git_pull; 
  disp(['Action: ' callbackInfo.userdata ' performed successfully.']);
end
function schema = getItem2(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Install/Update GitHub Support Package...';
  % install (1) git, (2) Git for Windows, (3) Git credentials windows application 
  schema.userdata = 'Installed/Updated GitHub Support Package';
  schema.callback = @myCallback2; 
end 

function schema = getItem21(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'About git installation';
  schema.callback = @myCallback21; 
end

function myCallback21(callbackInfo)
  git_check_install();
end

%1. Make a Simulink project of my model before you push. 
%2. Share a model --> Push only a model.
%3. Share a model --> Push the entire folder in which model is included.


function schema = getItem211(callbackInfo)
  schema = sl_container_schema;
  schema.label = 'Share a model ...';
  schema.userdata = 'one';	
  schema.childrenFcns = {@getItem1001, @getItem1002, @getItem1003, @getItem1004};
end

function schema = getItem1001(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Make a Simulink project and share it';
  schema.callback = @myCallback1001; 
end

function myCallback1001(callbackInfo)
git_slproject_push();
end


function schema = getItem1002(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Share only a model';
  schema.callback = @myCallback1002; 
end

function myCallback1002(callbackInfo)
%git_push();
end


function schema = getItem1003(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Share the folder containing a model';
  schema.callback = @myCallback1003; 
end

function myCallback1003(callbackInfo)
git_push();
end

function schema = getItem1004(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Share the Simulink project containing a model';
  schema.callback = @myCallback1004; 
end

function myCallback1004(callbackInfo)
%git_slproject_push();
end


function schema = getItem212(callbackInfo)
  schema = sl_container_schema;
  schema.label = 'Get models ...';
  schema.userdata = 'one';	
  schema.childrenFcns = {@getItem2001, @getItem2002, @getItem2003, @getItem2004};
end

function schema = getItem2001(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Make a Simulink project and get the model to it';
  schema.callback = @myCallback2001; 
end

function myCallback2001(callbackInfo)
  git_pull();
end

function schema = getItem2002(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Get only a model';
  schema.callback = @myCallback2002; 
end

function myCallback2002(callbackInfo)
  git_pull();
end


function schema = getItem2003(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Get the model with its folder';
  schema.callback = @myCallback2003; 
end

function myCallback2003(callbackInfo)
  git_pull();
end

function schema = getItem2004(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Get the Simulink project containing a model';
  schema.callback = @myCallback2004; 
end

function myCallback2004(callbackInfo)
  git_slproject_pull();
end



function myCallback2(callbackInfo)
  folder_name = git_download_SupportPackage;
  disp(['Download to: ' folder_name ' performed successfully.']);
  git_supportpackage_install(folder_name); 
  %download git software for Windows from: http://git-scm.com/downloads/
  disp(['Action: ' callbackInfo.userdata ' performed successfully.']);
end
 
function schema = getItem3(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Create GitHub account...';  
  schema.userdata = 'one - two';
  schema.callback = @myCallback3; 
end

function myCallback3(callbackInfo)
  disp(['GitHub account created succesfully.']);
end

function schema = getItem31(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Sign in to GitHub account...';  
  schema.userdata = 'one - two';
  schema.callback = @myCallback31; 
end

function myCallback31(callbackInfo)
% open application from MATLAB; git Windows credentials.exe is required 
% It opens itself promtping the credentials if the support package is installed 
  git_credentials; 
  disp(['Signed in to GitHub.']);
end

function schema = getItem4(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Create GitHub repository...';  
  schema.userdata = 'one - three';
  schema.callback = @myCallback4; 
end

function myCallback4(callbackInfo)
  git_remote_repo();
  disp(['GitHub repository created.']);
end

function schema = getItem04(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Create a local git repository...';  
  schema.userdata = '04';
  schema.callback = @myCallback04; 
end

function myCallback04(callbackInfo)
  git_repo; 
  disp(['Git repository created.']);
end
