function git_menu_update()
copyfile('sl_github_menu.m', 'sl_customization.m','f');
sl_refresh_customizations;
end 