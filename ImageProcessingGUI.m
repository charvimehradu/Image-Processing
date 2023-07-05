classdef ImageProcessingGUI < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        IMAGEPROCESSINGPanel       matlab.ui.container.Panel
        EdgeDetectionButtonGroup   matlab.ui.container.ButtonGroup
        SobelButton                matlab.ui.control.Button
        CannyButton                matlab.ui.control.Button
        RobertsButton              matlab.ui.control.Button
        PrewittButton              matlab.ui.control.Button
        EquilizationButton         matlab.ui.control.Button
        ComplementButton           matlab.ui.control.Button
        Panel_3                    matlab.ui.container.Panel
        ORLabel                    matlab.ui.control.Label
        Button_3                   matlab.ui.control.Button
        EditField                  matlab.ui.control.NumericEditField
        Knob                       matlab.ui.control.Knob
        RotateButton               matlab.ui.control.Button
        Panel_2                    matlab.ui.container.Panel
        Slider                     matlab.ui.control.Slider
        RemoveBackgroundButton     matlab.ui.control.Button
        ResizeButton               matlab.ui.control.Button
        Histogram_GrayscaleButton  matlab.ui.control.Button
        VoiceRemovalButton         matlab.ui.control.Button
        FlipButton                 matlab.ui.control.Button
        Panel                      matlab.ui.container.Panel
        GrayImageButton            matlab.ui.control.Button
        ChannelButton              matlab.ui.control.Button
        ColorButton                matlab.ui.control.Button
        NoiseButton                matlab.ui.control.Button
        BlueChannelButton          matlab.ui.control.Button
        GreenChannelButton         matlab.ui.control.Button
        RedChannelButton           matlab.ui.control.Button
        BlueButton                 matlab.ui.control.Button
        GreenButton                matlab.ui.control.Button
        RedButton                  matlab.ui.control.Button
        GaussianButton             matlab.ui.control.Button
        SaltPepperButton           matlab.ui.control.Button
        ExitButton                 matlab.ui.control.Button
        ResetButton                matlab.ui.control.Button
        ImportButton               matlab.ui.control.Button
        UIAxes_2                   matlab.ui.control.UIAxes
        UIAxes                     matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ImportButton
        function ImportButtonPushed(app, event)
            global image;
            [filename, pathname] = uigetfile('*,*', 'Pick an image ');
            filename = strcat(pathname, filename);
            image = imread(filename);
            imshow(image, 'Parent', app.UIAxes);
        end

        % Button pushed function: SaltPepperButton
        function SaltPepperButtonPushed(app, event)
            global image;
            salt_pepper = image;
            salt_pepper = imnoise(salt_pepper, 'salt & pepper',0.4);
            imshow(salt_pepper, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: VoiceRemovalButton
        function VoiceRemovalButtonPushed(app, event)
            global image;
            Voice_removal = medfilt3(image, [5,5,3]);
            imshow(Voice_removal,'Parent', app.UIAxes_2);
        end

        % Button pushed function: GrayImageButton
        function GrayImageButtonPushed(app, event)
            global image;
            gray_image = rgb2gray(image);
            imshow(gray_image, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: RedChannelButton
        function RedChannelButtonPushed(app, event)
            global image;
            red_channel = image(:, :, 1);
            imshow(red_channel, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: GreenChannelButton
        function GreenChannelButtonPushed(app, event)
            global image;
            green_channel = image(:, :, 2);
            imshow(green_channel, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: BlueChannelButton
        function BlueChannelButtonPushed(app, event)
            global image;
            blue_channel = image(:, :, 3);
            imshow(blue_channel, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            global image;
            imshow(image, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: ExitButton
        function ExitButtonPushed(app, event)
            msgbox('thanks for using image processing tool')
            pause(4)
            close();
            close();
            delete(app.UIFigure);
        end

        % Callback function
        function Histo_for_rgbButtonPushed(app, event)
            global image;
            global input;
            input = rgb2gray(image);
            output = imhist(input);
            imshow(output, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: EquilizationButton
        function EquilizationButtonPushed(app, event)
            global image;
            eq = histeq(image);
            imshow(eq, 'Parent', app.UIAxes_2);
        end

        % Callback function
        function ComplementButtonPushed(app, event)
            global image;
            IM2=imcomplement(image);
            imshow(IM2, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: RedButton
        function RedButtonPushed(app, event)
            global image;
            red = image;
            red(:,:,2:3)=0;
            setappdata(0,'filename',red);
            setappdata(0,'imrotation',red);
            imshow(red, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: GreenButton
        function GreenButtonPushed(app, event)
            global image;
            green = image;
            green(:,:,1)=0;
            green(:,:,3)=0;
            setappdata(0,'filename',green);
            setappdata(0,'imrotation',green);
            imshow(green, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: BlueButton
        function BlueButtonPushed(app, event)
            global image;
            blue = image;
            blue(:,:,1)=0;
            green(:,:,2)=0;
            setappdata(0,'filename',blue);
            setappdata(0,'imrotation',blue);
            imshow(blue, 'Parent', app.UIAxes_2);
        end

        % Callback function
        function ButtonPushed(app, event)
            global image;
            rotate = imrotate(image,45);
            imshow(rotate, 'Parent', app.UIAxes_2);
        end

        % Callback function
        function Button_2Pushed(app, event)
            global image;
            rotate = imrotate(image,90);
            imshow(rotate, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: Button_3
        function Button_3Pushed(app, event)
            global image;
            rotate = imrotate(image,180);
            imshow(rotate, 'Parent', app.UIAxes_2);
        end

        % Callback function
        function ResizeButtonPushed(app, event)
            global image; 
            rz = imresize(image,0.5);
            imshow(rz, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: GaussianButton
        function GaussianButtonPushed(app, event)
            global image;
            noise = imnoise(image,'gaussian');
            imshow(noise, 'Parent', app.UIAxes_2);
        end

        % Callback function
        function AdjustImageIntensityButtonPushed(app, event)
           global image;
           adjust = imadjust(image);
           imshow(adjust, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: FlipButton
        function FlipButtonPushed(app, event)
            global image;
            i2 = flip(image,2);
            imshow(i2, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: ComplementButton
        function ComplementButtonPushed2(app, event)
            global image;
            IM2 = imcomplement(image);
            imshow(IM2, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: ResizeButton
        function ResizeButtonPushed2(app, event)
            global image;
            rz = imresize(image,0.5);
            imshow(rz, 'Parent', app.UIAxes_2);
        end

        % Callback function
        function PeriodicButtonPushed(app, event)
            global image;
            s = size(image);
            [x,y] = meshgrid(1:s(1),1:s(2));
            p = sin(x/3+y/5)+1;
            noise =(im2double(image)+p/2)/2;
            imshow(noise, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: Histogram_GrayscaleButton
        function Histogram_GrayscaleButtonPushed(app, event)
            global image;
            GrayScaleIm = rgb2gray(image);
            imhist(GrayScaleIm);
        end

        % Button pushed function: RemoveBackgroundButton
        function RemoveBackgroundButtonPushed(app, event)
            global image;
            global input;
            input = rgb2gray(image);
            xgray = input;
            [r,c] = size(xgray);
            alpha = ones(r,c);
            alpha(xgray>=220) = 0;
            
            % Get the background color of the GUI
            bgColor = get(app.UIFigure, 'Color');
            
            % Create a new image with the same size as the GUI background
            [bgHeight, bgWidth, ~] = size(image);
            background = uint8(zeros(bgHeight, bgWidth, 3));
            
            % Set the background color
            background(:, :, 1) = uint8(bgColor(1) * 255);
            background(:, :, 2) = uint8(bgColor(2) * 255);
            background(:, :, 3) = uint8(bgColor(3) * 255);
        
            % Overlay the foreground object on the background
            outputImage = uint8(double(image) .* alpha + double(background) .* (1 - alpha));
            
            % Save the image with transparency
            imwrite(outputImage, 'apple2.png', 'Alpha', alpha);
            
            % Display the output image in the UIAxes_2
            imshow(outputImage, 'Parent', app.UIAxes_2);
        end

        % Button down function: UIAxes
        function UIAxesButtonDown(app, event)
            
        end

        % Value changed function: Knob
        function KnobValueChanged(app, event)
            value = app.Knob.Value;
            global image;
            rotate = imrotate(image,value);
            imshow(rotate, 'Parent', app.UIAxes_2);
            app.EditField.Value = value;
        end

        % Value changed function: Slider
        function SliderValueChanged(app, event)
            value = app.Slider.Value;
            global image;
            rz = imresize(image,value);
            imshow(rz, 'Parent', app.UIAxes_2);
        end

        % Button down function: EdgeDetectionButtonGroup
        function EdgeDetectionButtonGroupButtonDown(app, event)
            
        end

        % Selection changed function: EdgeDetectionButtonGroup
        function EdgeDetectionButtonGroupSelectionChanged(app, event)
            %selectedButton = app.EdgeDetectionButtonGroup.SelectedObject;
            %global input;
            %edges_prewitt = edge(input, 'prewitt',selectedButton);
            %imshow(edges_prewitt, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: PrewittButton
        function PrewittButtonPushed(app, event)
            global image;
            gray_image = rgb2gray(image);
            edges_prewitt = edge(gray_image, 'prewitt');
            imshow(edges_prewitt, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: RobertsButton
        function RobertsButtonPushed(app, event)
            global image;
            gray_image = rgb2gray(image);
            edges_roberts = edge(gray_image, 'roberts');
            imshow(edges_roberts, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: SobelButton
        function SobelButtonPushed(app, event)
            global image;
            gray_image = rgb2gray(image);
            edges_sobel = edge(gray_image, 'sobel');
            imshow(edges_sobel, 'Parent', app.UIAxes_2);
        end

        % Button pushed function: CannyButton
        function CannyButtonPushed(app, event)
            global image;
            gray_image = rgb2gray(image);
            edges_canny = edge(gray_image, 'canny');
            imshow(edges_canny, 'Parent', app.UIAxes_2);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1426 607];
            app.UIFigure.Name = 'MATLAB App';

            % Create IMAGEPROCESSINGPanel
            app.IMAGEPROCESSINGPanel = uipanel(app.UIFigure);
            app.IMAGEPROCESSINGPanel.BorderColor = [0 0 0];
            app.IMAGEPROCESSINGPanel.ForegroundColor = [0.149 0.149 0.149];
            app.IMAGEPROCESSINGPanel.BorderWidth = 2;
            app.IMAGEPROCESSINGPanel.TitlePosition = 'centertop';
            app.IMAGEPROCESSINGPanel.Title = '⚜      IMAGE PROCESSING      ⚜';
            app.IMAGEPROCESSINGPanel.BackgroundColor = [0.7686 0.549 0.9098];
            app.IMAGEPROCESSINGPanel.FontName = 'Palatino';
            app.IMAGEPROCESSINGPanel.FontWeight = 'bold';
            app.IMAGEPROCESSINGPanel.FontSize = 25;
            app.IMAGEPROCESSINGPanel.Position = [48 53 1339 512];

            % Create UIAxes
            app.UIAxes = uiaxes(app.IMAGEPROCESSINGPanel);
            title(app.UIAxes, 'Original Image ')
            app.UIAxes.AmbientLightColor = [0.8902 0.8 0.9608];
            app.UIAxes.FontName = 'Liberation Sans';
            app.UIAxes.XTick = [];
            app.UIAxes.YTick = [];
            app.UIAxes.LineWidth = 1;
            app.UIAxes.Color = [0.8902 0.8 0.9608];
            app.UIAxes.Box = 'on';
            app.UIAxes.FontSize = 15;
            app.UIAxes.ButtonDownFcn = createCallbackFcn(app, @UIAxesButtonDown, true);
            colormap(app.UIAxes, 'hsv')
            app.UIAxes.Position = [35 225 409 222];

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.IMAGEPROCESSINGPanel);
            title(app.UIAxes_2, 'Output')
            app.UIAxes_2.AmbientLightColor = [0.8902 0.8 0.9608];
            app.UIAxes_2.FontName = 'Liberation Sans';
            app.UIAxes_2.XTick = [];
            app.UIAxes_2.YTick = [];
            app.UIAxes_2.LineWidth = 1;
            app.UIAxes_2.Color = [0.8902 0.8 0.9608];
            app.UIAxes_2.Box = 'on';
            app.UIAxes_2.FontSize = 15;
            app.UIAxes_2.Position = [470 225 374 222];

            % Create ImportButton
            app.ImportButton = uibutton(app.IMAGEPROCESSINGPanel, 'push');
            app.ImportButton.ButtonPushedFcn = createCallbackFcn(app, @ImportButtonPushed, true);
            app.ImportButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Import.png');
            app.ImportButton.BackgroundColor = [1 1 1];
            app.ImportButton.FontName = 'Bitstream Charter';
            app.ImportButton.FontSize = 18;
            app.ImportButton.Position = [919 386 152 47];
            app.ImportButton.Text = 'Import ';

            % Create ResetButton
            app.ResetButton = uibutton(app.IMAGEPROCESSINGPanel, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Reset.jpg');
            app.ResetButton.BackgroundColor = [1 1 1];
            app.ResetButton.FontName = 'Bitstream Charter';
            app.ResetButton.FontSize = 18;
            app.ResetButton.Position = [919 312 152 47];
            app.ResetButton.Text = 'Reset ';

            % Create ExitButton
            app.ExitButton = uibutton(app.IMAGEPROCESSINGPanel, 'push');
            app.ExitButton.ButtonPushedFcn = createCallbackFcn(app, @ExitButtonPushed, true);
            app.ExitButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Exit.jpeg');
            app.ExitButton.BackgroundColor = [1 1 1];
            app.ExitButton.FontName = 'Bitstream Charter';
            app.ExitButton.FontSize = 18;
            app.ExitButton.Position = [919 231 152 48];
            app.ExitButton.Text = 'Exit ';

            % Create Panel
            app.Panel = uipanel(app.IMAGEPROCESSINGPanel);
            app.Panel.BorderColor = [0 0 0];
            app.Panel.BorderWidth = 3;
            app.Panel.BackgroundColor = [0.7569 0.5373 0.9412];
            app.Panel.Position = [18 21 485 180];

            % Create SaltPepperButton
            app.SaltPepperButton = uibutton(app.Panel, 'push');
            app.SaltPepperButton.ButtonPushedFcn = createCallbackFcn(app, @SaltPepperButtonPushed, true);
            app.SaltPepperButton.BackgroundColor = [0.4941 0.1843 0.5569];
            app.SaltPepperButton.FontSize = 15;
            app.SaltPepperButton.FontColor = [1 1 1];
            app.SaltPepperButton.Position = [134 122 113 39];
            app.SaltPepperButton.Text = 'Salt & Pepper';

            % Create GaussianButton
            app.GaussianButton = uibutton(app.Panel, 'push');
            app.GaussianButton.ButtonPushedFcn = createCallbackFcn(app, @GaussianButtonPushed, true);
            app.GaussianButton.BackgroundColor = [0.4941 0.1843 0.5569];
            app.GaussianButton.FontSize = 15;
            app.GaussianButton.FontColor = [1 1 1];
            app.GaussianButton.Position = [256 122 96 40];
            app.GaussianButton.Text = 'Gaussian';

            % Create RedButton
            app.RedButton = uibutton(app.Panel, 'push');
            app.RedButton.ButtonPushedFcn = createCallbackFcn(app, @RedButtonPushed, true);
            app.RedButton.BackgroundColor = [0.4941 0.1843 0.5569];
            app.RedButton.FontSize = 15;
            app.RedButton.FontColor = [1 1 1];
            app.RedButton.Position = [152 67 81 38];
            app.RedButton.Text = 'Red';

            % Create GreenButton
            app.GreenButton = uibutton(app.Panel, 'push');
            app.GreenButton.ButtonPushedFcn = createCallbackFcn(app, @GreenButtonPushed, true);
            app.GreenButton.BackgroundColor = [0.4941 0.1843 0.5569];
            app.GreenButton.FontSize = 15;
            app.GreenButton.FontColor = [1 1 1];
            app.GreenButton.Position = [258 66 80 39];
            app.GreenButton.Text = 'Green';

            % Create BlueButton
            app.BlueButton = uibutton(app.Panel, 'push');
            app.BlueButton.ButtonPushedFcn = createCallbackFcn(app, @BlueButtonPushed, true);
            app.BlueButton.BackgroundColor = [0.4941 0.1843 0.5569];
            app.BlueButton.FontSize = 15;
            app.BlueButton.FontColor = [1 1 1];
            app.BlueButton.Position = [369 66 83 39];
            app.BlueButton.Text = 'Blue';

            % Create RedChannelButton
            app.RedChannelButton = uibutton(app.Panel, 'push');
            app.RedChannelButton.ButtonPushedFcn = createCallbackFcn(app, @RedChannelButtonPushed, true);
            app.RedChannelButton.BackgroundColor = [0.4941 0.1843 0.5569];
            app.RedChannelButton.FontSize = 13;
            app.RedChannelButton.FontColor = [1 1 1];
            app.RedChannelButton.Position = [143 17 94 34];
            app.RedChannelButton.Text = 'Red Channel';

            % Create GreenChannelButton
            app.GreenChannelButton = uibutton(app.Panel, 'push');
            app.GreenChannelButton.ButtonPushedFcn = createCallbackFcn(app, @GreenChannelButtonPushed, true);
            app.GreenChannelButton.BackgroundColor = [0.4941 0.1843 0.5569];
            app.GreenChannelButton.FontSize = 13;
            app.GreenChannelButton.FontColor = [1 1 1];
            app.GreenChannelButton.Position = [246 16 103 35];
            app.GreenChannelButton.Text = 'Green Channel';

            % Create BlueChannelButton
            app.BlueChannelButton = uibutton(app.Panel, 'push');
            app.BlueChannelButton.ButtonPushedFcn = createCallbackFcn(app, @BlueChannelButtonPushed, true);
            app.BlueChannelButton.BackgroundColor = [0.4941 0.1843 0.5569];
            app.BlueChannelButton.FontSize = 13;
            app.BlueChannelButton.FontColor = [1 1 1];
            app.BlueChannelButton.Position = [360 17 111 33];
            app.BlueChannelButton.Text = 'Blue Channel';

            % Create NoiseButton
            app.NoiseButton = uibutton(app.Panel, 'push');
            app.NoiseButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Noise.jpg');
            app.NoiseButton.FontSize = 15;
            app.NoiseButton.FontWeight = 'bold';
            app.NoiseButton.Position = [16 123 106 38];
            app.NoiseButton.Text = 'Noise :';

            % Create ColorButton
            app.ColorButton = uibutton(app.Panel, 'push');
            app.ColorButton.Icon = fullfile(pathToMLAPP, 'image_processing', 'Color.jpeg');
            app.ColorButton.FontSize = 15;
            app.ColorButton.FontWeight = 'bold';
            app.ColorButton.Position = [16 68 119 38];
            app.ColorButton.Text = 'Color :';

            % Create ChannelButton
            app.ChannelButton = uibutton(app.Panel, 'push');
            app.ChannelButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Channel.png');
            app.ChannelButton.FontSize = 15;
            app.ChannelButton.FontWeight = 'bold';
            app.ChannelButton.Position = [16 16 119 39];
            app.ChannelButton.Text = 'Channel:';

            % Create GrayImageButton
            app.GrayImageButton = uibutton(app.Panel, 'push');
            app.GrayImageButton.ButtonPushedFcn = createCallbackFcn(app, @GrayImageButtonPushed, true);
            app.GrayImageButton.BackgroundColor = [0.8902 0.8 0.9608];
            app.GrayImageButton.FontSize = 15;
            app.GrayImageButton.FontWeight = 'bold';
            app.GrayImageButton.Position = [360 122 111 40];
            app.GrayImageButton.Text = 'Gray Image ';

            % Create Panel_2
            app.Panel_2 = uipanel(app.IMAGEPROCESSINGPanel);
            app.Panel_2.BorderColor = [0 0 0];
            app.Panel_2.BorderWidth = 3;
            app.Panel_2.BackgroundColor = [0.851 0.6902 0.9804];
            app.Panel_2.Position = [512 20 389 181];

            % Create FlipButton
            app.FlipButton = uibutton(app.Panel_2, 'push');
            app.FlipButton.ButtonPushedFcn = createCallbackFcn(app, @FlipButtonPushed, true);
            app.FlipButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Flip.png');
            app.FlipButton.BackgroundColor = [1 1 1];
            app.FlipButton.FontSize = 15;
            app.FlipButton.FontWeight = 'bold';
            app.FlipButton.Position = [12 124 105 37];
            app.FlipButton.Text = 'Flip';

            % Create VoiceRemovalButton
            app.VoiceRemovalButton = uibutton(app.Panel_2, 'push');
            app.VoiceRemovalButton.ButtonPushedFcn = createCallbackFcn(app, @VoiceRemovalButtonPushed, true);
            app.VoiceRemovalButton.Icon = fullfile(pathToMLAPP, 'Icons', 'NoiseRemoval.jpg');
            app.VoiceRemovalButton.BackgroundColor = [1 1 1];
            app.VoiceRemovalButton.FontSize = 15;
            app.VoiceRemovalButton.FontWeight = 'bold';
            app.VoiceRemovalButton.Position = [187 69 147 36];
            app.VoiceRemovalButton.Text = 'Voice Removal ';

            % Create Histogram_GrayscaleButton
            app.Histogram_GrayscaleButton = uibutton(app.Panel_2, 'push');
            app.Histogram_GrayscaleButton.ButtonPushedFcn = createCallbackFcn(app, @Histogram_GrayscaleButtonPushed, true);
            app.Histogram_GrayscaleButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Histogram.png');
            app.Histogram_GrayscaleButton.BackgroundColor = [1 1 1];
            app.Histogram_GrayscaleButton.FontSize = 15;
            app.Histogram_GrayscaleButton.FontWeight = 'bold';
            app.Histogram_GrayscaleButton.Position = [137 121 214 42];
            app.Histogram_GrayscaleButton.Text = 'Histogram_Grayscale';

            % Create ResizeButton
            app.ResizeButton = uibutton(app.Panel_2, 'push');
            app.ResizeButton.ButtonPushedFcn = createCallbackFcn(app, @ResizeButtonPushed2, true);
            app.ResizeButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Resize.png');
            app.ResizeButton.BackgroundColor = [1 1 1];
            app.ResizeButton.FontSize = 15;
            app.ResizeButton.FontWeight = 'bold';
            app.ResizeButton.Position = [12 17 104 38];
            app.ResizeButton.Text = 'Resize';

            % Create RemoveBackgroundButton
            app.RemoveBackgroundButton = uibutton(app.Panel_2, 'push');
            app.RemoveBackgroundButton.ButtonPushedFcn = createCallbackFcn(app, @RemoveBackgroundButtonPushed, true);
            app.RemoveBackgroundButton.BackgroundColor = [1 1 1];
            app.RemoveBackgroundButton.FontSize = 15;
            app.RemoveBackgroundButton.FontWeight = 'bold';
            app.RemoveBackgroundButton.Position = [13 68 165 39];
            app.RemoveBackgroundButton.Text = 'Remove Background';

            % Create Slider
            app.Slider = uislider(app.Panel_2);
            app.Slider.Limits = [0 35];
            app.Slider.MajorTicks = [0 10 20 30 35];
            app.Slider.MajorTickLabels = {'0', '10', '20', '30', '40'};
            app.Slider.ValueChangedFcn = createCallbackFcn(app, @SliderValueChanged, true);
            app.Slider.MinorTicks = [0 2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40];
            app.Slider.FontWeight = 'bold';
            app.Slider.Position = [137 52 211 3];

            % Create Panel_3
            app.Panel_3 = uipanel(app.IMAGEPROCESSINGPanel);
            app.Panel_3.BorderColor = [0 0 0];
            app.Panel_3.BorderWidth = 3;
            app.Panel_3.BackgroundColor = [0.8549 0.6941 0.9804];
            app.Panel_3.Position = [1089 147 224 308];

            % Create RotateButton
            app.RotateButton = uibutton(app.Panel_3, 'push');
            app.RotateButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Rotate.png');
            app.RotateButton.BackgroundColor = [1 1 1];
            app.RotateButton.FontSize = 15;
            app.RotateButton.FontWeight = 'bold';
            app.RotateButton.Position = [27 68 165 38];
            app.RotateButton.Text = 'Rotate';

            % Create Knob
            app.Knob = uiknob(app.Panel_3, 'continuous');
            app.Knob.ValueChangedFcn = createCallbackFcn(app, @KnobValueChanged, true);
            app.Knob.FontWeight = 'bold';
            app.Knob.Position = [55 150 110 110];

            % Create EditField
            app.EditField = uieditfield(app.Panel_3, 'numeric');
            app.EditField.HorizontalAlignment = 'center';
            app.EditField.FontSize = 19;
            app.EditField.FontWeight = 'bold';
            app.EditField.FontColor = [1 1 1];
            app.EditField.BackgroundColor = [0.4902 0.1804 0.5608];
            app.EditField.Position = [27 16 47 36];

            % Create Button_3
            app.Button_3 = uibutton(app.Panel_3, 'push');
            app.Button_3.ButtonPushedFcn = createCallbackFcn(app, @Button_3Pushed, true);
            app.Button_3.BackgroundColor = [0.4902 0.1804 0.5608];
            app.Button_3.FontName = 'DejaVu Serif';
            app.Button_3.FontSize = 15;
            app.Button_3.FontColor = [1 1 1];
            app.Button_3.Position = [129 16 63 36];
            app.Button_3.Text = '180';

            % Create ORLabel
            app.ORLabel = uilabel(app.Panel_3);
            app.ORLabel.FontSize = 20;
            app.ORLabel.FontWeight = 'bold';
            app.ORLabel.Position = [73 22 46 26];
            app.ORLabel.Text = '  OR';

            % Create ComplementButton
            app.ComplementButton = uibutton(app.IMAGEPROCESSINGPanel, 'push');
            app.ComplementButton.ButtonPushedFcn = createCallbackFcn(app, @ComplementButtonPushed2, true);
            app.ComplementButton.Icon = fullfile(pathToMLAPP, 'Icons', 'Complement.png');
            app.ComplementButton.BackgroundColor = [1 1 1];
            app.ComplementButton.FontSize = 16;
            app.ComplementButton.FontWeight = 'bold';
            app.ComplementButton.Position = [1107 36 191 39];
            app.ComplementButton.Text = 'Complement';

            % Create EquilizationButton
            app.EquilizationButton = uibutton(app.IMAGEPROCESSINGPanel, 'push');
            app.EquilizationButton.ButtonPushedFcn = createCallbackFcn(app, @EquilizationButtonPushed, true);
            app.EquilizationButton.BackgroundColor = [1 1 1];
            app.EquilizationButton.FontSize = 17;
            app.EquilizationButton.FontWeight = 'bold';
            app.EquilizationButton.Position = [1107 91 178 36];
            app.EquilizationButton.Text = 'Equilization';

            % Create EdgeDetectionButtonGroup
            app.EdgeDetectionButtonGroup = uibuttongroup(app.IMAGEPROCESSINGPanel);
            app.EdgeDetectionButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @EdgeDetectionButtonGroupSelectionChanged, true);
            app.EdgeDetectionButtonGroup.BorderColor = [0 0 0];
            app.EdgeDetectionButtonGroup.BorderWidth = 2;
            app.EdgeDetectionButtonGroup.TitlePosition = 'centertop';
            app.EdgeDetectionButtonGroup.Title = 'Edge Detection ';
            app.EdgeDetectionButtonGroup.BackgroundColor = [0.851 0.6902 0.9804];
            app.EdgeDetectionButtonGroup.ButtonDownFcn = createCallbackFcn(app, @EdgeDetectionButtonGroupButtonDown, true);
            app.EdgeDetectionButtonGroup.FontSize = 16;
            app.EdgeDetectionButtonGroup.Position = [919 20 153 178];

            % Create PrewittButton
            app.PrewittButton = uibutton(app.EdgeDetectionButtonGroup, 'push');
            app.PrewittButton.ButtonPushedFcn = createCallbackFcn(app, @PrewittButtonPushed, true);
            app.PrewittButton.BackgroundColor = [0.4902 0.1804 0.5608];
            app.PrewittButton.FontSize = 15;
            app.PrewittButton.FontWeight = 'bold';
            app.PrewittButton.FontColor = [1 1 1];
            app.PrewittButton.Position = [19 106 111 29];
            app.PrewittButton.Text = 'Prewitt';

            % Create RobertsButton
            app.RobertsButton = uibutton(app.EdgeDetectionButtonGroup, 'push');
            app.RobertsButton.ButtonPushedFcn = createCallbackFcn(app, @RobertsButtonPushed, true);
            app.RobertsButton.BackgroundColor = [0.4902 0.1804 0.5608];
            app.RobertsButton.FontSize = 15;
            app.RobertsButton.FontWeight = 'bold';
            app.RobertsButton.FontColor = [1 1 1];
            app.RobertsButton.Position = [19 75 111 29];
            app.RobertsButton.Text = 'Roberts';

            % Create CannyButton
            app.CannyButton = uibutton(app.EdgeDetectionButtonGroup, 'push');
            app.CannyButton.ButtonPushedFcn = createCallbackFcn(app, @CannyButtonPushed, true);
            app.CannyButton.BackgroundColor = [0.4902 0.1804 0.5608];
            app.CannyButton.FontSize = 15;
            app.CannyButton.FontWeight = 'bold';
            app.CannyButton.FontColor = [1 1 1];
            app.CannyButton.Position = [19 13 111 29];
            app.CannyButton.Text = 'Canny';

            % Create SobelButton
            app.SobelButton = uibutton(app.EdgeDetectionButtonGroup, 'push');
            app.SobelButton.ButtonPushedFcn = createCallbackFcn(app, @SobelButtonPushed, true);
            app.SobelButton.BackgroundColor = [0.4902 0.1804 0.5608];
            app.SobelButton.FontSize = 15;
            app.SobelButton.FontWeight = 'bold';
            app.SobelButton.FontColor = [1 1 1];
            app.SobelButton.Position = [19 42 111 29];
            app.SobelButton.Text = 'Sobel';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = ImageProcessingGUI

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end