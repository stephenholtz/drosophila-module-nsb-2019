%% Better use for "handles" 

% we can actually capture all the handles at the time of figure and axes
% generation instead of having to call gcf and gca

% As a recap and a bit more
% These are all equivalent:

% 1) Going into the figure editor and manually changing
figure()

% 2) Set property here
figure('Color',[0,0,0],'Name','Simplest');

% 3) Update property with gcf and set
figure();
fig = gcf();
set(fig,'Color',[0,0,0],'Name','OldSchool Method');

% 4) even "cooler" we can use either "set" or "struct style" axes updating
fig = figure();
fig.Color = [0 0 0];
% The Nicest way to figure out what you can set, use tab completion on the
% figure handle, e.g. type fig.<tab> and the options will just pop up for
% you
fig.Name = 'Modern Nave-Value Method';

%% The same thing is true for our axes handles and others on the plot
% Close all the old figures
close all

% Start to see how to programatically change all the lines :)
line_width = 2;

% Configure figure settings
fig = figure();
fig.Color = [1 1 1];
fig.Name = '';

% timebase or the "x" values on our plot
ts = 1:10;

% Plot handle and do the same thing as before
ph = plot(ts, exp(1:10));
ph.Color = 'magenta';
ph.LineStyle='-';
ph.Marker='o';
ph.LineWidth = line_width;

hold on

ph = plot(ts, exp(1:10)/10);
ph.Color = 'black';
ph.LineStyle='-';
ph.Marker='x';
ph.LineWidth = line_width;

% Legend also has its own handle if you want to play around there too
lh = legend('Fly Module','Striatum Module');
% for example, let's ditch the box
lh.Box = 'off';

% Let's get ahold of the axes handle and fix up the rest of the figure
ax = gca();

% ax.<tab> is your new wonderland 
ax.FontSize = font_size;
ax.Box = 'off';
ax.XLabel.String = 'Time (a.u.)';
ax.YLabel.String = 'instantaneous sleep debt (a.u.)';
ax.Title.String = 'NS&B Student Tracking System Output';

% Now above is the format that the Generate Code would have given you, 
% hopefully you are dymystified(ish). Reread over it some time soon

% Let's save it again, but since it looked funky with a lot of white space,
% let's use an eps file, which matlab handles better by default
filepath_to_save = '/Users/stephenholtz/Desktop';
fig_name = 'nsb_student_tracking_system';

eps_figure_path = fullfile(filepath_to_save,[fig_name '.eps']);
saveas(fig, eps_figure_path)
