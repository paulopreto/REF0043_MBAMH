% OPENC3D - Opens a C3D file, which is chosen through a file dialog box
%
% Jasper Menger, November 2005

[filename, pathname] = uigetfile('*.c3d', 'Pick a C3D data file');

if numel(filename)
    % Call the loadc3d script
    FullFileName = [pathname, filename];
    [Markers, VideoFrameRate, AnalogSignals, AnalogFrameRate, Event, ParameterGroup, CameraInfo, ResidualError] = loadc3d(FullFileName);
end

clear filename pathname;  