function uiremember(varargin)

def.figure = {'position'};
def.uicontrol.checkbox = {'value'};
def.uicontrol.edit={'string'};

h=gcbo; %default object handle
mem_file='user.mat';  %Default memory file name
prop=[];

%override the default values by the user opions values.
if exist('opts','var')
    if isfield(opts,'filename'), mem_file=opts.filename;    end
    if isfield(opts,'prop'),     prop = opts.prop; end
end
%

for i=1:length(h)
    tag=get(h(i),'tag');
    if isempty(prop)%in case there are no user properties input, use the fefaults.
        
        type = get(h(i),'type');
        if strcmp(type,'uicontrol')
            style=get(h(i),'style');
            if isfield(def,'uicontrol')&& isfield(def.uicontrol,style)
                prop=def.uicontrol.(style);
            else
                warning('No default values for the %s object. Please use OPTS.', tag);
                continue;
            end
        else
            if isfield(def,type)
                prop=def.(type);
            else
                warning('No default values for the %s object. Please use OPTS.', tag);
                continue;
            end
        end
        
    end
    
    
    %
    if ~iscell(prop), prop=cell(prop); end
    %
    
    for k=1:length(prop)
        val=get(h(i),prop{k});
        s.(prop{k})=val;
    end
    %
    if exist(mem_file,'file')
        tmp=load(mem_file);
        sav=tmp.sav;
    end
    
    sav.(tag)=s;
    save(mem_file,'sav','-mat');
    %disp(mem_file); 
    
 end