function DataCollection(varargin)
lib = lsl_loadlib();
result = {};
collecting = true;
hfig = figure('Name', 'DataCollection',...
    'Numbertitle', 'off',...
    'Position',[600 500 350 100],...
    'Menubar','none',...
    'Resize','off',...
    'CloseRequestFcn',@closeRequestFcn);

START = uicontrol(hfig, 'Style', 'PushButton',...
    'Position',[10 10 75 25],...
    'String','START',...
    'Callback',@startFcn);
STOP = uicontrol(hfig, 'Style', 'PushButton',...
    'Position',[180 10 75 25],...
    'String','STOP',...
    'Callback',@stopFcn);
    function startFcn(varargin)
        while isempty(result)
            result = lsl_resolve_byprop(lib,'type','EEG');end
        
        inlet = lsl_inlet(result{1});
        collecting = true;
        while collecting
            ves = inlet.pull_sample();
            fprintf('%.2f\n',ves);
            pause(0.0001);
        end
    end
        
    function stopFcn(varargin)
        collecting = false;
    end
    function closeRequestFcn(varargin)
        closereq;
    end

end

