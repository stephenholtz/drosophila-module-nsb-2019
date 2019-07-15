%% Subplots Subplots Subplots 
% we want to plot a bunch of things on the same figure for convenience

%% Start out boring, this is like you might find in some "quick-n-dirty" file somewhere

% Make a 2x1 grid of places you can plot something and put this plot in the
% *first* element of that grid
subplot(2,1,1);
plot(1:10)
box off     
hold on
plot(exp(1:10)/100,'--r')

% Make a 2x1 grid of places you can plot something and put this plot in the
% *second* element of that grid
subplot(2,1,2);
plot(1:10,'--k')
box off
hold on
plot(exp(1:10)/100,'--k')

%%
doc subplot

% Sweet! subplot returns an axes handle that we can update just like the
% one we got from get current axes (gca)

%% Let's make a pretty figure
close all

% Set line width for all plotting
line_width = 2;

% Configure figure settings
fig = figure();
fig.Color = [1 1 1];
fig.Name = 'NSB Student Tracking';
fig.Position =  [100 100 750 750];

% First subplot with sleep debt
ax = subplot(2,1,1);
plot(exp(1:10),'Color','magenta',...
          'LineStyle','-',...
          'Marker','o',...
          'LineWidth',line_width);
hold on
plot(exp(1:10)/10,'Color','black',...
               'LineStyle','-',...
               'Marker','x',...
               'LineWidth',line_width);
ax.FontSize = font_size;
ax.Box = 'off';
ax.XLabel.String = 'Time (a.u.)';
ax.YLabel.String = 'instantaneous sleep debt (a.u.)';
ax.Title.String = 'NS&B Student Tracking System Output';

% Add a legend!
lh = legend('Fly Module','Striatum Module');
lh.Box = 'off';

% Second subplot with noise
ax = subplot(2,1,2);
plot(rand(10,1)/100000,'Color','magenta',...
          'LineStyle','-',...
          'Marker','o',...
          'LineWidth',line_width);
hold on
plot(rand(10,1)/100000,'Color','black',...
               'LineStyle','-',...
               'Marker','x',...
               'LineWidth',line_width);
ax.FontSize = font_size;
ax.Box = 'off';
ax.XLabel.String = 'Time (a.u.)';
ax.YLabel.String = 'Swope Food Quality(Tuthill Units)';

% let's use an eps file, which matlab handles better by default
filepath_to_save = '/Users/stephenholtz/Desktop';
fig_name = 'nsb_student_tracking_system_subplot';

eps_figure_path = fullfile(filepath_to_save,[fig_name '.eps']);
saveas(fig, eps_figure_path)