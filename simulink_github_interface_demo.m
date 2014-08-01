%% Simulink for GitHub 
% This is an interface for GitHub through the menu: Tools in your Simulink model.  
%
% Justyna Zander 
% October 20, 2013 
% Inspired by Rob ABerg and Pieter J. Mosterman

% It is recommended that when customizing Simulink GUI for your project, you add
% the directory that contains the |sl_customization.m| file to the MATLAB
% path using the following command: 
%
% |addpath(dir,'-end');|
%
% where |dir| is the directory that constains the |sl_customization.m| file


%%  Adding GitHub Menu as a part of Simulink Tools Menu 
% In this section we show how you can customize Simulink menus. Let us look 
% at |sl_customization.m| file that brings about these changes.

copyfile('sl_github_menu.m', 'sl_customization.m','f');
%% This is not really required to be exposed to the user. 
%type sl_customization.m

%%
% Clicking on the *Tools* menu of your Simulink model shows a GitHub Menu. 
% There are new items on this menu that were defined in |sl_customization.m| file.
% If *Item One* menu item is clicked, it will execute the callback function and print 
% a message that identifies the callback for *Item One*. Since *Item Two* is made up of three 
% *Item One* sub-menu items, the callback that gets executed when any of these are 
% clicked is the exactly the same one that corresponds to *Item One*. Similar behavior 
% is obtained with *Item Three* menu item. 

open_system('DancingRobots');
sl_refresh_customizations;

%% 
% We can revert back to the original Simulink GUI settings by using the following
% commands:

closeDialog(myConfigObj);
delete('sl_customization.m');
sl_refresh_customizations;
bdclose(gcs)
