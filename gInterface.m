function gInterface

% Use standard UI fonts for each platform.
if ispc
	font = struct('FontName','Segoe UI','FontSize',9);
elseif ismac
	font = struct('FontName','Lucida Grande','FontSize',13);
end

% Create a figure and set default uicontrol font.
% figure (id:001)
fig = figure('Units','pixels',...
	'Position',[350 150 560 420],...
	'DefaultUIControlFontName',font.FontName,...
	'DefaultUIControlFontSize',font.FontSize,...
	'Resize','on');
movegui(gcf,'center') %Always moves the figure to the middle of the screen



% pushbutton (id:004)
uicontrol('Style','pushbutton',...
	'Units','pixels',...
	'Position',[25 330 120 30],...
	'String','Run and Plot!',...
    'Backgroundcolor',[1,0.1,0.2],...
	'Callback',@runProgram);

% Time for each step Edit Box
stepTime = uicontrol('Style','edit',...
	'Units','pixels',...
	'Position',[45 270 80 30],...
	'String','',...
	'HorizontalAlignment','center',...
	'BackgroundColor','w',...
	'Callback','');

%text for step time edit box
uicontrol('Style','text',...
	'Units','pixels',...
	'Position',[45 235 80 30],...
	'String','Time to take a step',...
	'HorizontalAlignment','center',...
	'BackgroundColor',fig.Color);


% histogram bins number parameter
histoBins = uicontrol('Style','edit',...
	'Units','pixels',...
	'Position',[45 170 80 30],...
	'String','',...
	'HorizontalAlignment','center',...
	'BackgroundColor','w',...
	'Callback','');

% text for the number of bins space
uicontrol('Style','text',...
	'Units','pixels',...
	'Position',[45 140 80 30],...
	'String','Histogram Bins #',...
	'HorizontalAlignment','center',...
	'BackgroundColor',fig.Color);


% text (id:006)
uicontrol('Style','text',...
	'Units','pixels',...
	'Position',[40 35 80 35],...
	'String','Number of trials ',...
	'HorizontalAlignment','center',...
	'BackgroundColor',fig.Color);

% text (id:007)
uicontrol('Style','text',...
	'Units','pixels',...
	'Position',[140 40 80 30],...
	'String','StepM',...
	'HorizontalAlignment','center',...
	'BackgroundColor',fig.Color);

% text (id:008)
uicontrol('Style','text',...
	'Units','pixels',...
	'Position',[240 40 80 30],...
	'String','Bias',...
	'HorizontalAlignment','center',...
	'BackgroundColor',fig.Color);

% text (id:009)
uicontrol('Style','text',...
	'Units','pixels',...
	'Position',[345 40 80 30],...
	'String','Tup',...
	'HorizontalAlignment','center',...
	'BackgroundColor',fig.Color);

% text (id:010)
uicontrol('Style','text',...
	'Units','pixels',...
	'Position',[450 40 80 30],...
	'String','Tdown',...
	'HorizontalAlignment','center',...
	'BackgroundColor',fig.Color);

% edit (id:011)
trialnum=uicontrol('Style','edit',...
	'Units','pixels',...
	'Position',[40 80 80 30],...
	'String','',...
	'HorizontalAlignment','center',...
	'BackgroundColor','w',...
	'Callback','');

% edit (id:012)
step=uicontrol('Style','edit',...
	'Units','pixels',...
	'Position',[145 80 80 30],...
	'String','',...
	'HorizontalAlignment','center',...
	'BackgroundColor','w',...
	'Callback','');

% edit (id:013)
bias_text=uicontrol('Style','edit',...
	'Units','pixels',...
	'Position',[245 80 80 30],...
	'String','',...
	'HorizontalAlignment','center',...
	'BackgroundColor','w',...
	'Callback','');

% edit (id:014)
Tmax=uicontrol('Style','edit',...
	'Units','pixels',...
	'Position',[345 80 80 30],...
	'String','',...
	'HorizontalAlignment','center',...
	'BackgroundColor','w',...
	'Callback','');

% edit (id:015)
Tmin=uicontrol('Style','edit',...
	'Units','pixels',...
	'Position',[450 80 80 30],...
	'String','',...
	'HorizontalAlignment','center',...
	'BackgroundColor','w',...
	'Callback','');

% axes (id:002)
axes('Units','pixels',...
	'Position',[210 180 335 200],...
	'Box','on');
 
    
  

% Put Callbacks here.
function runProgram(~,~)
        timePerStep = str2double(stepTime.String);
        hBins = str2double(histoBins.String);
        Tupp = str2double(Tmax.String);
        Tdownn = str2double(Tmin.String);
        Biass = str2double(bias_text.String);
        numberOfTrials=str2double(trialnum.String);
        stepAverage= str2double(step.String);

  randomwalkFinal(numberOfTrials, Biass, Tupp, Tdownn, stepAverage, hBins, timePerStep)
end 
end
