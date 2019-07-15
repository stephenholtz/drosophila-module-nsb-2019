%% Figures how-to!! Theme: Save my poor eyes

% instructors please do not inturrupt with confusing suggestions, the order
% is purposeful

% The "vanilla" matlab figure it is the canvas for all plotting and the
% element you will ultimately export to another program or print out :)
figure;










%% Documentation is quite helpful for figure making

% close just one figure
close

% `doc insert_frustrating_function_here` gives you a documentation window
doc figure

% or control+F1 inside the parens gives you a hint quickly


%% Let's spruce things up a bit by passing "name,value" pairs as `doc` suggested

% change the color
figure('Color',[0,0,0]);

%% add a "name" and make it bigger

from_left = 100;
from_bottom = 100;
width = 800;
height = 800;

% We can make this very readable by lining up the name-value pairs with
% linebreaks and some tabbing :) (My eyes!)
figure('Color',[0,0,0],...
       'Name', 'Axel-style',...
       'Position', [from_left from_bottom width height]);

%% close ALL the figures we made
close all

%% Let's plot data!

% make the background white (phew, my eyes!)
figure('Color',[1,1,1]);

% plot function
plot(1:10)

% plot something else on the same "axes"
hold on
plot(10:-1:1)

%% Lets do this with x vs y
% timebase or the "x" values on our plot
ts = -5:4;

% plot function
plot(ts,1:10)

% plot something else on the same "axes"
hold on
plot(ts,10:-1:1)

%% again let's go to the documentation
doc plot

%% "LineSpec" is the easy way to quickly change how your plot looks, but can get confusing
plot(1:10,'--r')

hold on
plot((1:10)/10,':ok')

% let's go in and look at the figure editor -- and discover what figure vs
% axes vs lines are

% and let's figure out a different "marker" and linewidth e.g. pentagram
% and File>Generate Code ... the syntax inside this we will cover later

%% Looked like we can also change color and "marker" using Name Value pairs
figure('Color',[1,1,1]);

% Start to see how to programatically change all the lines :)
line_width = 2;

plot(exp(1:10),'Color','magenta',...
          'LineStyle','-',...
          'Marker','o',...
          'LineWidth',line_width);
hold on
plot(exp(1:10)/10,'Color','black',...
               'LineStyle','-',...
               'Marker','x',...
               'LineWidth',line_width);

%% Let's add some labels now 
xlabel('Time (a.u.)')
ylabel('instantaneous sleep debt (a.u.)')
title('NS&B Student Tracking System Output')

%% This is SUPER HARD TO READ (again, help my poor my eyes)

% check out the documentation for each xlabel and ylabel -- this will
% overwrite the things we already have
font_size = 16;
xlabel('Time (a.u.)','FontSize',font_size)
ylabel('instantaneous sleep debt (a.u.)','FontSize',font_size)
title('NS&B Student Tracking System Output','FontSize',font_size)

%% Add a legend too (again, use doc legend to see how!)
legend('Fly Module','Striatum Module')

%% Things look funky... why are the axes so tiny? time to meet `gca`

% get current axes == gca, we can now access the "axes" that we have been
% plotting on, this `ax` variable here is referred to in matlab world as
% your axis "handle"
ax = gca;

% let's see what we can do to the axes by clicking on 'Show all properties'
ax

% while you're hacking on your figures you can also open up the figure
% editor to peek at the properties or use the `get` function to see which
% properties you can edit for these axes (same as clicking on Show all
% properties)
get(ax)

% wow there's a ton of junk there, but I see a fontsize Name listed
% we can use the "set" function to set the value
set(ax,'FontSize',font_size)

%% Okay let's get to more of the "good stuff" -- making all the "ink" valuable

% I see a "box" property... why is there a box? let's kill it
set(ax,'Box','off')

% this is such a common command that you can actually just use:
box off

% we can also turn a "grid" on in the same manner
grid on

% It's a little more work using set, because there are both x and y grids
set(ax,'XGrid','on','YGrid','on')

%% There is also a gcf function so we can figure out how to change the figure after the fact

% This is called the "figure handle"
fig = gcf;

% this is useful because we can use it for saving the figure, and
% manipulating it if we don't like how the export process worked out

% There are two ways to save figures, 
%  1) savefig : saves a *.fig file, which you can open later in matlab and continue editing etc.
%  2) saveas : saves some other format like *.pdf, *.png, *.tiff

filepath_to_save = '/Users/stephenholtz/Desktop';
fig_name = 'nsb_student_tracking_system';

eps_figure_path = fullfile(filepath_to_save,[fig_name '.eps']);
fig_figure_path = fullfile(filepath_to_save,[fig_name '.fig']);

% this results in the following:
% '/Users/stephenholtz/Desktop/nsb_student_tracking_system.pdf'

% savefig
savefig(fig, fig_figure_path)

% saveas, actually defaults to .fig if we don't have
saveas(fig, eps_figure_path)

% if you do not specify a figure handle it will just use whichever one is
% currently selected! this is not always what we want

