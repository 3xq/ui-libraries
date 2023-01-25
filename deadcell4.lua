local module = {}

function module:window(configuration)
	local ScreenGui = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local border = Instance.new("Folder")
	local Frame_2 = Instance.new("Frame")
	local Frame_3 = Instance.new("Frame")
	local Frame_4 = Instance.new("Frame")
	local Frame_5 = Instance.new("Frame")
	local accents = Instance.new("Folder")
	local Frame_6 = Instance.new("Frame")
	local tabs_folder = Instance.new("Folder")
	
	local window = {}
	local tab_objects={}
	
	ScreenGui.Name = " "
	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = " "
	Main.Parent = ScreenGui
	Main.BackgroundColor3 = Color3.fromRGB(23, 23, 30)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.297619045, 0, 0.243209884, 0)
	Main.Size = UDim2.new(0, 612, 0, 416)
	
	local UserInputService = game:GetService("UserInputService")
	
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	Main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = Main.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	Main.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			if Main.Visible then
				update(input)
			end
		end
	end)

	border.Name = "border"
	border.Parent = Main

	Frame_2.Name = " "
	Frame_2.Parent = border
	Frame_2.BackgroundColor3 = Color3.fromRGB(62, 62, 72)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0, 1, 0, 1)
	Frame_2.Size = UDim2.new(1, -2, 1, -2)

	Frame_3.Name = " "
	Frame_3.Parent = border
	Frame_3.BackgroundColor3 = Color3.fromRGB(39, 39, 47)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0, 2, 0, 2)
	Frame_3.Size = UDim2.new(1, -4, 1, -4)

	Frame_4.Name = " "
	Frame_4.Parent = border
	Frame_4.BackgroundColor3 = Color3.fromRGB(62, 62, 72)
	Frame_4.BorderSizePixel = 0
	Frame_4.Position = UDim2.new(0, 6, 0, 6)
	Frame_4.Size = UDim2.new(1, -12, 1, -12)

	Frame_5.Name = " "
	Frame_5.Parent = border
	Frame_5.BackgroundColor3 = Color3.fromRGB(14, 14, 22)
	Frame_5.BorderSizePixel = 0
	Frame_5.Position = UDim2.new(0, 7, 0, 7)
	Frame_5.Size = UDim2.new(1, -14, 1, -14)

	accents.Name = "accents"
	accents.Parent = Main

	Frame_6.Name = " "
	Frame_6.Parent = accents
	Frame_6.BackgroundColor3 = configuration['theme'] or Color3.fromRGB(206, 115, 136)
	Frame_6.BorderSizePixel = 0
	Frame_6.Position = UDim2.new(0, 8, 0, 8)
	Frame_6.Size = UDim2.new(1, -16, 0, 2)

	tabs_folder.Name = "tabs"
	tabs_folder.Parent = Main
	
	local Frame_3 = Instance.new("Frame")
	
	Frame_3.Name = " "
	Frame_3.Parent = tabs_folder
	Frame_3.BackgroundColor3 = Color3.fromRGB(39, 39, 47)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0, 19, 0, 19)
	Frame_3.Size = UDim2.new(0, 574, 0, 24)
	Frame_3.ZIndex = 2
	
	function window:tab(title)
		local Frame = Instance.new("TextButton")
		local UIGradient = Instance.new("UIGradient")
		local TextLabel = Instance.new("TextLabel")
		local accents = Instance.new("Folder")
		local Frame_82 = Instance.new("Frame")

		local tab = {}
		
		Frame.Name = " "
		Frame.Parent = Frame_3
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0, 0, 0, 0)
		Frame.Size = UDim2.new(0, 574, 0, 24)
		Frame.ZIndex = 2
		Frame.Text = ''
		Frame.AutoButtonColor = false
		
		table.insert(tab_objects, Frame)
		
		for _,tab_obj in ipairs(tab_objects) do
			tab_obj.Size = UDim2.new((1/#tab_objects), 0, 1, 0)
			
			if _ >= 2 then
				tab_obj.Position = UDim2.new(0, (574/(#tab_objects))*(_-1), 0, 0)
			end
		end
		
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(55, 55, 64)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(37, 37, 45))}
		UIGradient.Rotation = 90
		UIGradient.Name = " "
		UIGradient.Parent = Frame

		TextLabel.Name = " "
		TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.SourceSansSemibold
		TextLabel.Text = title
		TextLabel.TextColor3 = Color3.fromRGB(205, 205, 205)
		TextLabel.TextSize = 14.000
		TextLabel.TextStrokeTransparency = 0.000

		accents.Name = "accents"
		accents.Parent = Frame

		Frame_82.Name = " "
		Frame_82.Parent = accents
		Frame_82.BackgroundColor3 = configuration['theme'] or Color3.fromRGB(206, 115, 136)
		Frame_82.BorderSizePixel = 0
		Frame_82.Position = UDim2.new(0, 0, 1, -1)
		Frame_82.Size = UDim2.new(1, 0, 0, 1)
		
		if #tab_objects >= 2 then
			Frame_82.Visible = false
			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(47, 47, 56)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(24, 24, 28))}
		end
		
		local Frame_ZZ = Instance.new("Frame")
		local windows = Instance.new("Folder")
		local Frame_2 = Instance.new("Frame")
		local sections = Instance.new("Folder")

		Frame_ZZ.Name = " "
		Frame_ZZ.Parent = Main
		Frame_ZZ.BackgroundColor3 = Color3.fromRGB(39, 39, 47)
		Frame_ZZ.BorderSizePixel = 0
		Frame_ZZ.Position = UDim2.new(0, 18, 0, 18)
		Frame_ZZ.Size = UDim2.new(0, 576, 0, 380)
		
		if #tab_objects >= 2 then
			Frame_ZZ.Visible = false
		end
		
		Frame.MouseButton1Click:Connect(function()
			for _, child in ipairs(Main:GetChildren()) do
				if not child:IsA('Folder') then
					child.Visible = false
				end
			end
			
			for _, child in ipairs(Frame_3:GetChildren()) do
				child.accents:FindFirstChildOfClass('Frame').Visible = false
				child:FindFirstChildOfClass('UIGradient').Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(47, 47, 56)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(24, 24, 28))}
			end
			
			Frame_82.Visible = true
			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(55, 55, 64)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(37, 37, 45))}
			Frame_ZZ.Visible = true
		end)

		windows.Name = "windows"
		windows.Parent = Frame_ZZ

		Frame_2.Name = " "
		Frame_2.Parent = windows
		Frame_2.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
		Frame_2.BorderSizePixel = 0
		Frame_2.Position = UDim2.new(0, 1, 0, 26)
		Frame_2.Size = UDim2.new(1, -2, 1, -27)

		sections.Name = "sections"
		sections.Parent = Frame_2
		
		function tab:section(title, side)
			local section = {}
			local section_tabs = {}
			
			local Frame = Instance.new("Frame")
			local ScrollingFrame = Instance.new("ScrollingFrame")
			local UIPadding = Instance.new("UIPadding")
			local tabs = Instance.new("Folder")
			
			Frame.Name = " "
			Frame.Parent = sections
			Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
			Frame.BorderColor3 = Color3.fromRGB(18, 18, 26)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0, 0, 0, 0)
			Frame.Size = UDim2.new(0, 262, 0, 331)
			
			ScrollingFrame.Name = " "
			ScrollingFrame.Parent = Frame
			ScrollingFrame.Active = true
			ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingFrame.BackgroundTransparency = 1.000
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Position = UDim2.new(0, 10, 0, 12)
			ScrollingFrame.Size = UDim2.new(0, 241, 1, -24)
			ScrollingFrame.ZIndex = 2
			ScrollingFrame.ScrollBarThickness = 0
			
			tabs.Name = "tabs"
			tabs.Parent = Frame
			
			local Frame_4 = Instance.new('Frame')
			
			Frame_4.Name = " "
			Frame_4.Parent = tabs
			Frame_4.BackgroundColor3 = Color3.fromRGB(39, 39, 47)
			Frame_4.BorderSizePixel = 0
			Frame_4.Position = UDim2.new(0, 10, 0, 12)
			Frame_4.Size = UDim2.new(0, 241, 0, 26)
			Frame_4.ZIndex = 4
			Frame_4.Visible = false
			
			if side == 'left' then
				Frame.Position = UDim2.new(0, 17, 0, 11)
				
				local border = Instance.new("Folder")
				local Frame_3 = Instance.new("Frame")
				local Frame_2 = Instance.new("Frame")
				local TextLabel = Instance.new("TextLabel")

				border.Name = "border"
				border.Parent = Frame

				Frame_3.Name = " "
				Frame_3.Parent = border
				Frame_3.BackgroundColor3 = Color3.fromRGB(51, 51, 58)
				Frame_3.BorderColor3 = Color3.fromRGB(18, 18, 26)
				Frame_3.BorderSizePixel = 0
				Frame_3.Position = UDim2.new(0, 1, 0, 1)
				Frame_3.Size = UDim2.new(1, -2, 1, -2)

				Frame_2.Name = " "
				Frame_2.Parent = border
				Frame_2.BackgroundColor3 = Color3.fromRGB(27, 27, 34)
				Frame_2.BorderColor3 = Color3.fromRGB(18, 18, 26)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0, 2, 0, 2)
				Frame_2.Size = UDim2.new(1, -4, 1, -4)
				Frame_2.ZIndex = 2

				TextLabel.Name = " "
				TextLabel.Parent = Frame_2
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.Position = UDim2.new(0, 16, 0, -7)
				TextLabel.Size = UDim2.new(0, 200, 0, 11)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.Text = title
				TextLabel.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextLabel.TextSize = 14.000
				TextLabel.TextStrokeTransparency = 0.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
			end
			
			if side == 'right' then
				Frame.Position = UDim2.new(0, 296, 0, 11)
				
				local border = Instance.new("Folder")
				local Frame_2 = Instance.new("Frame")
				local Frame_3 = Instance.new("Frame")
				local TextLabel = Instance.new("TextLabel")

				border.Name = "border"
				border.Parent = Frame

				Frame_2.Name = " "
				Frame_2.Parent = border
				Frame_2.BackgroundColor3 = Color3.fromRGB(51, 51, 58)
				Frame_2.BorderColor3 = Color3.fromRGB(18, 18, 26)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0, 1, 0, 1)
				Frame_2.Size = UDim2.new(1, -2, 1, -2)
				Frame_2.ZIndex = 3

				Frame_3.Name = " "
				Frame_3.Parent = border
				Frame_3.BackgroundColor3 = Color3.fromRGB(27, 27, 34)
				Frame_3.BorderColor3 = Color3.fromRGB(18, 18, 26)
				Frame_3.BorderSizePixel = 0
				Frame_3.Position = UDim2.new(0, 2, 0, 2)
				Frame_3.Size = UDim2.new(1, -4, 1, -4)
				Frame_3.ZIndex = 3

				TextLabel.Name = " "
				TextLabel.Parent = Frame_3
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.Position = UDim2.new(0, 16, 0, -7)
				TextLabel.Size = UDim2.new(0, 200, 0, 11)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.Text = title
				TextLabel.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextLabel.TextSize = 14.000
				TextLabel.TextStrokeTransparency = 0.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.ZIndex = 4
			end
			
			function section:tab(title)
				Frame_4.Visible = true
				ScrollingFrame:Remove()
				
				local section_tab = {}

				local ScrollingFrame = Instance.new("ScrollingFrame")
				local UIPadding = Instance.new("UIPadding")
				
				local Frame_3 = Instance.new("TextButton")
				local accents = Instance.new("Folder")
				local Frame_2 = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local TextLabel = Instance.new("TextLabel")
				
				local components = Instance.new("Folder")
				local UIListLayout = Instance.new("UIListLayout")
				local UIPadding = Instance.new("UIPadding")
				
				ScrollingFrame.Name = " "
				ScrollingFrame.Parent = Frame
				ScrollingFrame.Active = true
				ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingFrame.BackgroundTransparency = 1.000
				ScrollingFrame.BorderSizePixel = 0
				ScrollingFrame.Position = UDim2.new(0, 10, 0, 38)
				ScrollingFrame.Size = UDim2.new(0, 241, 1, -50)
				ScrollingFrame.ZIndex = 3
				ScrollingFrame.ScrollBarThickness = 0

				if #section_tabs >= 2 then
					ScrollingFrame.Visible = false
				end

				Frame_3.MouseButton1Click:Connect(function()
					for _, child in ipairs(Frame:GetChildren()) do
						if child:IsA('ScrollingFrame') then
							child.Visible = false
						end
					end

					for _, child in ipairs(section_tabs) do
						child.accents:FindFirstChildOfClass('Frame').Visible = false
						child:FindFirstChildOfClass('UIGradient').Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(47, 47, 56)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(24, 24, 28))}
					end

					Frame_2.Visible = true
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(55, 55, 64)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(37, 37, 45))}
					ScrollingFrame.Visible = true
				end)

				UIPadding.Name = " "
				UIPadding.Parent = ScrollingFrame
				UIPadding.PaddingTop = UDim.new(0, 8)
				
				Frame_3.Name = " "
				Frame_3.Parent = Frame_4
				Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame_3.BorderSizePixel = 0
				Frame_3.Position = UDim2.new(0,0,0,0)
				Frame_3.Size = UDim2.new(1, 0, 1, 0)
				Frame_3.ZIndex = 3
				Frame_3.Text = ''
				Frame_3.AutoButtonColor = false
				
				table.insert(section_tabs, Frame_3)
				
				for _,tab_obj in ipairs(section_tabs) do
					tab_obj.Size = UDim2.new((1/#section_tabs), 0, 1, 0)

					if _ >= 2 then
						tab_obj.Position = UDim2.new(0, (241/(#section_tabs))*(_-1), 0, 0)
					end
				end

				accents.Name = "accents"
				accents.Parent = Frame_3

				Frame_2.Name = " "
				Frame_2.Parent = accents
				Frame_2.BackgroundColor3 = configuration['theme'] or Color3.fromRGB(206, 115, 136)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0, 0, 1, -1)
				Frame_2.Size = UDim2.new(1, 0, 0, 1)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(55, 55, 64)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(37, 37, 45))}
				UIGradient.Rotation = 90
				UIGradient.Name = " "
				UIGradient.Parent = Frame_3

				TextLabel.Name = " "
				TextLabel.Parent = Frame_3
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.Size = UDim2.new(1, 0, 1, 0)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.Text = title
				TextLabel.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextLabel.TextSize = 14.000
				TextLabel.TextStrokeTransparency = 0.000

				components.Name = "components"
				components.Parent = ScrollingFrame

				UIListLayout.Name = " "
				UIListLayout.Parent = components
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

				UIPadding.Name = " "
				UIPadding.Parent = ScrollingFrame
				UIPadding.PaddingTop = UDim.new(0, 8)
				
				if #section_tabs >= 2 then
					Frame_2.Visible = false
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(47, 47, 56)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(24, 24, 28))}
				end
				
				function section_tab:toggle(name, default, callback)
					local return_toggle = {}
					
					local toggle = Instance.new("Frame")
					local Frame = Instance.new("Frame")
					local TextButton = Instance.new("TextButton")
					local TextButton_2 = Instance.new("TextButton")
					local UIGradient = Instance.new("UIGradient")
					local UIGradient_2 = Instance.new("UIGradient")

					toggle.Name = " "
					toggle.Parent = components
					toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					toggle.BackgroundTransparency = 1.000
					toggle.BorderSizePixel = 0
					toggle.Size = UDim2.new(1, 0, 0, 16)

					Frame.Name = " "
					Frame.Parent = toggle
					Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
					Frame.BorderSizePixel = 0
					Frame.Position = UDim2.new(0, 22, 0, 4)
					Frame.Size = UDim2.new(0, 8, 0, 8)

					TextButton.Name = " "
					TextButton.Parent = Frame
					TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.BorderSizePixel = 0
					TextButton.Position = UDim2.new(0, 1, 0, 1)
					TextButton.Size = UDim2.new(1, -2, 1, -2)
					TextButton.Font = Enum.Font.SourceSans
					TextButton.Text = ""
					TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
					TextButton.TextSize = 14.000
					TextButton.AutoButtonColor = false

					TextButton_2.Name = " "
					TextButton_2.Parent = toggle
					TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton_2.BackgroundTransparency = 1.000
					TextButton_2.Position = UDim2.new(0, 42, 0, 0)
					TextButton_2.Size = UDim2.new(1, -42, 0, 14)
					TextButton_2.Font = Enum.Font.SourceSans
					TextButton_2.Text = name
					TextButton_2.TextColor3 = Color3.fromRGB(205, 205, 205)
					TextButton_2.TextSize = 14.000
					TextButton_2.TextStrokeTransparency = 0.000
					TextButton_2.TextXAlignment = Enum.TextXAlignment.Left
					
					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(75, 75, 86)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(75, 75, 86))}
					UIGradient.Rotation = 90
					UIGradient.Name = " "
					UIGradient.Parent = TextButton
					UIGradient.Enabled = not default
					
					local h,s,v = configuration['theme']:ToHSV()
					local darker_theme = Color3.fromHSV(h,s,v-.2)
					
					UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, configuration['theme'] or Color3.fromRGB(201, 111, 131)), ColorSequenceKeypoint.new(1.00, darker_theme or Color3.fromRGB(165, 79, 95))}
					UIGradient_2.Rotation = 90
					UIGradient_2.Name = " "
					UIGradient_2.Parent = TextButton
					UIGradient_2.Enabled = default
					
					callback(default)
					
					TextButton.MouseButton1Click:Connect(function()
						UIGradient.Enabled = not UIGradient.Enabled
						UIGradient_2.Enabled = not UIGradient_2.Enabled
						callback(UIGradient_2.Enabled)
					end)
					
					TextButton_2.MouseButton1Click:Connect(function()
						UIGradient.Enabled = not UIGradient.Enabled
						UIGradient_2.Enabled = not UIGradient_2.Enabled
						callback(UIGradient_2.Enabled)
					end)
					
					function return_toggle:set_value(value)
						UIGradient.Enabled = not value
						UIGradient_2.Enabled = value
						callback(value)
					end
					
					return return_toggle
				end
				
				function section_tab:slider(title, minimum, maximum, default, callback, precise, percent, decimal)
					local return_slider = {}
					
					local slider = Instance.new("Frame")
					local TextLabel = Instance.new("TextLabel")
					local Frame = Instance.new("TextButton")
					local Frame_2 = Instance.new("Frame")
					local UIGradient = Instance.new("UIGradient")
					local UIPadding = Instance.new("UIPadding")
					local TextButton = Instance.new("TextButton")
					local UIGradient_2 = Instance.new("UIGradient")
					local TextLabel_2 = Instance.new("TextLabel")
					
					local holding = false
					local function round(number, place, add_percent, roundd)
						if not roundd then
							place = math.pow(10, 0)
						end
						
						place = math.pow(10, place or 0)
						number = number * place

						if number >= 0 then 
							number = math.floor(number + 0.5) 
						else 
							number = math.ceil(number - 0.5) 
						end
						
						if add_percent then
							return tostring(number / place) .. '%', number / place
						else
							return tostring(number/ place), number / place
						end
					end

					slider.Name = " "
					slider.Parent = components
					slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					slider.BackgroundTransparency = 1.000
					slider.BorderSizePixel = 0
					slider.Size = UDim2.new(1, 0, 0, 32)

					TextLabel.Name = " "
					TextLabel.Parent = slider
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDim2.new(0, 42, 0, 0)
					TextLabel.Size = UDim2.new(1, -42, 0, 14)
					TextLabel.Font = Enum.Font.SourceSans
					TextLabel.Text = title
					TextLabel.TextColor3 = Color3.fromRGB(205, 205, 205)
					TextLabel.TextSize = 14.000
					TextLabel.TextStrokeTransparency = 0.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left

					Frame.Name = " "
					Frame.Parent = slider
					Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
					Frame.BorderSizePixel = 0
					Frame.Position = UDim2.new(0, 42, 0, 17)
					Frame.Size = UDim2.new(1, -62, 0, 8)
					Frame.AutoButtonColor = false

					Frame_2.Name = " "
					Frame_2.Parent = Frame
					Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Frame_2.BorderSizePixel = 0
					Frame_2.Position = UDim2.new(0, 1, 0, 1)
					Frame_2.Size = UDim2.new(1, -2, 1, -2)

					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 48)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 53, 60))}
					UIGradient.Rotation = 90
					UIGradient.Name = " "
					UIGradient.Parent = Frame_2

					UIPadding.Name = " "
					UIPadding.Parent = slider
					UIPadding.PaddingTop = UDim.new(0, 3)
					
					TextButton.Name = " "
					TextButton.Parent = Frame
					TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextButton.BorderSizePixel = 0
					TextButton.Size = UDim2.new(default / maximum, 0, 1, -2)
					TextButton.Position = UDim2.new(0, 1, 0, 1)
					TextButton.Text = ' '
					TextButton.AutoButtonColor = false
					
					local h,s,v = configuration['theme']:ToHSV()
					local darker_theme = Color3.fromHSV(h,s,v-.2)
					
					UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, configuration['theme'] or Color3.fromRGB(201, 111, 131)), ColorSequenceKeypoint.new(1.00, darker_theme or Color3.fromRGB(165, 79, 95))}
					UIGradient_2.Rotation = 90
					UIGradient_2.Name = " "
					UIGradient_2.Parent = TextButton

					TextLabel_2.Name = " "
					TextLabel_2.Parent = TextButton
					TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_2.BackgroundTransparency = 1.000
					TextLabel_2.Position = UDim2.new(1, -5, 0, 3)
					TextLabel_2.Size = UDim2.new(0, 10, 0, 6)
					TextLabel_2.Font = Enum.Font.SourceSansSemibold
					TextLabel_2.TextColor3 = Color3.fromRGB(205, 205, 205)
					TextLabel_2.TextSize = 14.000
					TextLabel_2.TextStrokeTransparency = 0.000
					TextLabel_2.Text = round(TextButton.Size.X.Scale * maximum, decimal or 0, percent or false, precise or false)
					
					callback(default)
					
					TextButton.MouseButton1Down:Connect(function()
						holding = true
						
						TextButton.Size = UDim2.new(math.clamp((game.Players.LocalPlayer:GetMouse().X - TextButton.AbsolutePosition.X)/Frame.AbsoluteSize.X,0,1),-2,1,-2)
						TextLabel_2.Text = round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false)
						callback(round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false))
					end)
					
					Frame.MouseButton1Down:Connect(function()
						holding = true
						
						TextButton.Size = UDim2.new(math.clamp((game.Players.LocalPlayer:GetMouse().X - TextButton.AbsolutePosition.X)/Frame.AbsoluteSize.X,0,1),-2,1,-2)
						TextLabel_2.Text = round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false)
						callback(round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false))
					end)
					
					game.Players.LocalPlayer:GetMouse().Move:Connect(function()
						if holding then
							TextButton.Size = UDim2.new(math.clamp((game.Players.LocalPlayer:GetMouse().X - TextButton.AbsolutePosition.X)/Frame.AbsoluteSize.X,0,1),-2,1,-2)
							TextLabel_2.Text = round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false)
							callback(round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false))
						end
					end)
					
					game:GetService("UserInputService").InputEnded:Connect(function(input, gp)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							holding = false
						end
					end)
					
					function return_slider:set_value(value)
						TextButton.Size = UDim2.new(value / maximum, 0, 1, -2)
						TextLabel_2.Text = round(TextButton.Size.X.Scale * maximum, decimal or 0, percent or false, precise or false)
						callback(value)
					end
					
					return return_slider
				end
				
				function section_tab:dropdown(name, choices, default, callback)
					local return_dropdown = {}
					
					local dropdown = Instance.new("Frame")
					local TextLabel = Instance.new("TextLabel")
					local Frame = Instance.new("TextButton")
					local Frame_2 = Instance.new("Frame")
					local UIGradient = Instance.new("UIGradient")
					local TextLabel_2 = Instance.new("TextLabel")
					local UIPadding = Instance.new("UIPadding")
					local Frame_3 = Instance.new("Frame")
					local ScrollingFrame = Instance.new("ScrollingFrame")
					local UIListLayout = Instance.new("UIListLayout")
					local UIPadding_2 = Instance.new("UIPadding")

					dropdown.Name = " "
					dropdown.Parent = components
					dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					dropdown.BackgroundTransparency = 1.000
					dropdown.BorderSizePixel = 0
					dropdown.Size = UDim2.new(1, 0, 0, 48)
					dropdown.ZIndex = 2

					TextLabel.Name = " "
					TextLabel.Parent = dropdown
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDim2.new(0, 42, 0, 0)
					TextLabel.Size = UDim2.new(1, -42, 0, 14)
					TextLabel.Font = Enum.Font.SourceSans
					TextLabel.Text = name
					TextLabel.TextColor3 = Color3.fromRGB(205, 205, 205)
					TextLabel.TextSize = 14.000
					TextLabel.TextStrokeTransparency = 0.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left

					Frame.Name = " "
					Frame.Parent = dropdown
					Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
					Frame.BorderSizePixel = 0
					Frame.Position = UDim2.new(0, 42, 0, 17)
					Frame.Size = UDim2.new(1, -62, 0, 16)
					Frame.Text = " "

					Frame_2.Name = " "
					Frame_2.Parent = Frame
					Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Frame_2.BorderSizePixel = 0
					Frame_2.Position = UDim2.new(0, 1, 0, 1)
					Frame_2.Size = UDim2.new(1, -2, 1, -2)

					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 48)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 53, 60))}
					UIGradient.Rotation = 90
					UIGradient.Name = " "
					UIGradient.Parent = Frame_2

					TextLabel_2.Name = " "
					TextLabel_2.Parent = Frame
					TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel_2.BackgroundTransparency = 1.000
					TextLabel_2.Position = UDim2.new(0, 5, 0, -1)
					TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
					TextLabel_2.Font = Enum.Font.SourceSans
					TextLabel_2.Text = default
					TextLabel_2.TextColor3 = Color3.fromRGB(205, 205, 205)
					TextLabel_2.TextSize = 14.000
					TextLabel_2.TextStrokeTransparency = 0.000
					TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

					UIPadding.Name = " "
					UIPadding.Parent = dropdown
					UIPadding.PaddingTop = UDim.new(0, 3)

					Frame_3.Name = " "
					Frame_3.Parent = dropdown
					Frame_3.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
					Frame_3.BorderSizePixel = 0
					Frame_3.Position = UDim2.new(0, 42, 0, 35)
					Frame_3.Size = UDim2.new(1, -62, 0, 59)
					Frame_3.Visible = false

					ScrollingFrame.Name = ""
					ScrollingFrame.Parent = Frame_3
					ScrollingFrame.Active = true
					ScrollingFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
					ScrollingFrame.BorderSizePixel = 0
					ScrollingFrame.Position = UDim2.new(0, 1, 0, 1)
					ScrollingFrame.Size = UDim2.new(1, -2, 1, -2)
					ScrollingFrame.ScrollBarThickness = 0
					ScrollingFrame.ZIndex = 10

					UIListLayout.Name = ""
					UIListLayout.Parent = ScrollingFrame
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

					UIPadding_2.Name = ""
					UIPadding_2.Parent = ScrollingFrame
					UIPadding_2.PaddingLeft = UDim.new(0, 5)
					
					for _, choice in ipairs(choices) do
						pcall(function()
							local TextLabel_3 = Instance.new("TextButton")
							
							TextLabel_3.Name = " "
							TextLabel_3.Parent = ScrollingFrame
							TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							TextLabel_3.BackgroundTransparency = 1.000
							TextLabel_3.Position = UDim2.new(0, 5, 0, -1)
							TextLabel_3.Size = UDim2.new(0, 174, 0, 16)
							TextLabel_3.Font = Enum.Font.SourceSans
							TextLabel_3.Text = tostring(choice)
							TextLabel_3.TextColor3 = Color3.fromRGB(205, 205, 205)
							TextLabel_3.TextSize = 14.000
							TextLabel_3.TextStrokeTransparency = 0.000
							TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
							TextLabel_3.MouseButton1Click:Connect(function()
								TextLabel_2.Text = tostring(choice)
								callback(choice)
								Frame_3.Visible = not Frame_3.Visible
								for _, label in ipairs(ScrollingFrame:GetChildren()) do
									if label:IsA('TextButton') then
										label.TextColor3 = Color3.fromRGB(205, 205, 205)
									end
								end
								TextLabel_3.TextColor3 = configuration['theme'] or Color3.fromRGB(206, 115, 136)
							end)
							
							TextLabel_3.MouseEnter:Connect(function()
								TextLabel_3.TextColor3 = configuration['theme'] or Color3.fromRGB(206, 115, 136)
							end)
							
							TextLabel_3.MouseLeave:Connect(function()
								TextLabel_3.TextColor3 = Color3.fromRGB(205, 205, 205)
							end)
						end)
					end
					
					Frame.MouseButton1Click:Connect(function()
						Frame_3.Visible = not Frame_3.Visible
					end)
					
					callback(default)
					
					function return_dropdown:set_value(value)
						TextLabel_2.Text = value
						callback(value)
					end
					
					return return_dropdown
				end
				
				return section_tab
			end
			
			local ScrollingFrame
			local UIPadding
			local components
			local UIListLayout

			local function init()
				if ScrollingFrame == nil or UIPadding == nil or components == nil or UIListLayout == nil then
					ScrollingFrame = Instance.new("ScrollingFrame")
					UIPadding = Instance.new("UIPadding")
					components = Instance.new("Folder")
					UIListLayout = Instance.new("UIListLayout")

					ScrollingFrame.Name = " "
					ScrollingFrame.Parent = Frame
					ScrollingFrame.Active = true
					ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					ScrollingFrame.BackgroundTransparency = 1.000
					ScrollingFrame.BorderSizePixel = 0
					ScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
					ScrollingFrame.Size = UDim2.new(0, 241, 1, -50)
					ScrollingFrame.ZIndex = 3
					ScrollingFrame.ScrollBarThickness = 0

					UIPadding.Name = " "
					UIPadding.Parent = ScrollingFrame
					UIPadding.PaddingTop = UDim.new(0, 8)

					components.Name = "components"
					components.Parent = ScrollingFrame

					UIListLayout.Name = " "
					UIListLayout.Parent = components
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				end
			end
			
			function section:toggle(name, default, callback)
				init()
				
				local toggle = Instance.new("Frame")
				local Frame = Instance.new("Frame")
				local TextButton = Instance.new("TextButton")
				local TextButton_2 = Instance.new("TextButton")
				local UIGradient = Instance.new("UIGradient")
				local UIGradient_2 = Instance.new("UIGradient")

				toggle.Name = " "
				toggle.Parent = components
				toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				toggle.BackgroundTransparency = 1.000
				toggle.BorderSizePixel = 0
				toggle.Size = UDim2.new(1, 0, 0, 16)

				Frame.Name = " "
				Frame.Parent = toggle
				Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0, 22, 0, 4)
				Frame.Size = UDim2.new(0, 8, 0, 8)

				TextButton.Name = " "
				TextButton.Parent = Frame
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BorderSizePixel = 0
				TextButton.Position = UDim2.new(0, 1, 0, 1)
				TextButton.Size = UDim2.new(1, -2, 1, -2)
				TextButton.Font = Enum.Font.SourceSans
				TextButton.Text = ""
				TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton.TextSize = 14.000
				TextButton.AutoButtonColor = false

				TextButton_2.Name = " "
				TextButton_2.Parent = toggle
				TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_2.BackgroundTransparency = 1.000
				TextButton_2.Position = UDim2.new(0, 42, 0, 0)
				TextButton_2.Size = UDim2.new(1, -42, 0, 14)
				TextButton_2.Font = Enum.Font.SourceSans
				TextButton_2.Text = name
				TextButton_2.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextButton_2.TextSize = 14.000
				TextButton_2.TextStrokeTransparency = 0.000
				TextButton_2.TextXAlignment = Enum.TextXAlignment.Left

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(75, 75, 86)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(75, 75, 86))}
				UIGradient.Rotation = 90
				UIGradient.Name = " "
				UIGradient.Parent = TextButton
				UIGradient.Enabled = not default
				
				local h,s,v = configuration['theme']:ToHSV()
				local darker_theme = Color3.fromHSV(h,s,v-.2)

				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, configuration['theme'] or Color3.fromRGB(201, 111, 131)), ColorSequenceKeypoint.new(1.00, darker_theme or Color3.fromRGB(165, 79, 95))}
				UIGradient_2.Rotation = 90
				UIGradient_2.Name = " "
				UIGradient_2.Parent = TextButton
				UIGradient_2.Enabled = default

				callback(default)

				TextButton.MouseButton1Click:Connect(function()
					UIGradient.Enabled = not UIGradient.Enabled
					UIGradient_2.Enabled = not UIGradient_2.Enabled
					callback(UIGradient_2.Enabled)
				end)

				TextButton_2.MouseButton1Click:Connect(function()
					UIGradient.Enabled = not UIGradient.Enabled
					UIGradient_2.Enabled = not UIGradient_2.Enabled
					callback(UIGradient_2.Enabled)
				end)
			end

			function section:slider(title, minimum, maximum, default, callback, precise, percent, decimal)
				init()
				
				local slider = Instance.new("Frame")
				local TextLabel = Instance.new("TextLabel")
				local Frame = Instance.new("TextButton")
				local Frame_2 = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local UIPadding = Instance.new("UIPadding")
				local TextButton = Instance.new("TextButton")
				local UIGradient_2 = Instance.new("UIGradient")
				local TextLabel_2 = Instance.new("TextLabel")

				local holding = false
				local function round(number, place, add_percent, roundd)
					if not roundd then
						place = math.pow(10, 0)
					end

					place = math.pow(10, place or 0)
					number = number * place

					if number >= 0 then 
						number = math.floor(number + 0.5) 
					else 
						number = math.ceil(number - 0.5) 
					end

					if add_percent then
						return tostring(number / place) .. '%', number / place
					else
						return tostring(number/ place), number / place
					end
				end


				slider.Name = " "
				slider.Parent = components
				slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				slider.BackgroundTransparency = 1.000
				slider.BorderSizePixel = 0
				slider.Size = UDim2.new(1, 0, 0, 32)

				TextLabel.Name = " "
				TextLabel.Parent = slider
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.Position = UDim2.new(0, 42, 0, 0)
				TextLabel.Size = UDim2.new(1, -42, 0, 14)
				TextLabel.Font = Enum.Font.SourceSans
				TextLabel.Text = title
				TextLabel.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextLabel.TextSize = 14.000
				TextLabel.TextStrokeTransparency = 0.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				Frame.Name = " "
				Frame.Parent = slider
				Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0, 42, 0, 17)
				Frame.Size = UDim2.new(1, -62, 0, 8)
				Frame.AutoButtonColor = false

				Frame_2.Name = " "
				Frame_2.Parent = Frame
				Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0, 1, 0, 1)
				Frame_2.Size = UDim2.new(1, -2, 1, -2)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 48)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 53, 60))}
				UIGradient.Rotation = 90
				UIGradient.Name = " "
				UIGradient.Parent = Frame_2

				UIPadding.Name = " "
				UIPadding.Parent = slider
				UIPadding.PaddingTop = UDim.new(0, 3)

				TextButton.Name = " "
				TextButton.Parent = Frame
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BorderSizePixel = 0
				TextButton.Size = UDim2.new(default / maximum, 0, 1, -2)
				TextButton.Position = UDim2.new(0, 1, 0, 1)
				TextButton.Text = ' '
				TextButton.AutoButtonColor = false
				
				local h,s,v = configuration['theme']:ToHSV()
				local darker_theme = Color3.fromHSV(h,s,v-.2)
				
				UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, configuration['theme'] or Color3.fromRGB(201, 111, 131)), ColorSequenceKeypoint.new(1.00, darker_theme or Color3.fromRGB(165, 79, 95))}
				UIGradient_2.Rotation = 90
				UIGradient_2.Name = " "
				UIGradient_2.Parent = TextButton

				TextLabel_2.Name = " "
				TextLabel_2.Parent = TextButton
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.Position = UDim2.new(1, -5, 0, 3)
				TextLabel_2.Size = UDim2.new(0, 10, 0, 6)
				TextLabel_2.Font = Enum.Font.SourceSansSemibold
				TextLabel_2.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextLabel_2.TextSize = 14.000
				TextLabel_2.TextStrokeTransparency = 0.000
				TextLabel_2.Text = round(TextButton.Size.X.Scale * maximum, decimal or 0, percent or false, precise or false)

				callback(default)

				TextButton.MouseButton1Down:Connect(function()
					holding = true

					TextButton.Size = UDim2.new(math.clamp((game.Players.LocalPlayer:GetMouse().X - TextButton.AbsolutePosition.X)/Frame.AbsoluteSize.X,0,1),-2,1,-2)
					TextLabel_2.Text = round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false)
					callback(round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false))
				end)

				Frame.MouseButton1Down:Connect(function()
					holding = true

					TextButton.Size = UDim2.new(math.clamp((game.Players.LocalPlayer:GetMouse().X - TextButton.AbsolutePosition.X)/Frame.AbsoluteSize.X,0,1),-2,1,-2)
					TextLabel_2.Text = round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false)
					callback(round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false))
				end)

				game.Players.LocalPlayer:GetMouse().Move:Connect(function()
					if holding then
						TextButton.Size = UDim2.new(math.clamp((game.Players.LocalPlayer:GetMouse().X - TextButton.AbsolutePosition.X)/Frame.AbsoluteSize.X,0,1),-2,1,-2)
						TextLabel_2.Text = round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false)
						callback(round(((TextButton.Size.X.Scale * maximum) / maximum) * (maximum - minimum) + minimum, decimal or 0, percent or false, precise or false))
					end
				end)

				game:GetService("UserInputService").InputEnded:Connect(function(input, gp)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						holding = false
					end
				end)
			end

			function section:dropdown(name, choices, default, callback)
				init()
				
				local dropdown = Instance.new("Frame")
				local TextLabel = Instance.new("TextLabel")
				local Frame = Instance.new("TextButton")
				local Frame_2 = Instance.new("Frame")
				local UIGradient = Instance.new("UIGradient")
				local TextLabel_2 = Instance.new("TextLabel")
				local UIPadding = Instance.new("UIPadding")
				local Frame_3 = Instance.new("Frame")
				local ScrollingFrame = Instance.new("ScrollingFrame")
				local UIListLayout = Instance.new("UIListLayout")
				local UIPadding_2 = Instance.new("UIPadding")

				dropdown.Name = " "
				dropdown.Parent = components
				dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				dropdown.BackgroundTransparency = 1.000
				dropdown.BorderSizePixel = 0
				dropdown.Size = UDim2.new(1, 0, 0, 48)
				dropdown.ZIndex = 2

				TextLabel.Name = " "
				TextLabel.Parent = dropdown
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.Position = UDim2.new(0, 42, 0, 0)
				TextLabel.Size = UDim2.new(1, -42, 0, 14)
				TextLabel.Font = Enum.Font.SourceSans
				TextLabel.Text = name
				TextLabel.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextLabel.TextSize = 14.000
				TextLabel.TextStrokeTransparency = 0.000
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				Frame.Name = " "
				Frame.Parent = dropdown
				Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0, 42, 0, 17)
				Frame.Size = UDim2.new(1, -62, 0, 16)
				Frame.Text = " "

				Frame_2.Name = " "
				Frame_2.Parent = Frame
				Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0, 1, 0, 1)
				Frame_2.Size = UDim2.new(1, -2, 1, -2)

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 38, 48)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(53, 53, 60))}
				UIGradient.Rotation = 90
				UIGradient.Name = " "
				UIGradient.Parent = Frame_2

				TextLabel_2.Name = " "
				TextLabel_2.Parent = Frame
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.Position = UDim2.new(0, 5, 0, -1)
				TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
				TextLabel_2.Font = Enum.Font.SourceSans
				TextLabel_2.Text = default
				TextLabel_2.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextLabel_2.TextSize = 14.000
				TextLabel_2.TextStrokeTransparency = 0.000
				TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

				UIPadding.Name = " "
				UIPadding.Parent = dropdown
				UIPadding.PaddingTop = UDim.new(0, 3)

				Frame_3.Name = " "
				Frame_3.Parent = dropdown
				Frame_3.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
				Frame_3.BorderSizePixel = 0
				Frame_3.Position = UDim2.new(0, 42, 0, 35)
				Frame_3.Size = UDim2.new(1, -62, 0, 59)
				Frame_3.Visible = false

				ScrollingFrame.Name = ""
				ScrollingFrame.Parent = Frame_3
				ScrollingFrame.Active = true
				ScrollingFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
				ScrollingFrame.BorderSizePixel = 0
				ScrollingFrame.Position = UDim2.new(0, 1, 0, 1)
				ScrollingFrame.Size = UDim2.new(1, -2, 1, -2)
				ScrollingFrame.ScrollBarThickness = 0
				ScrollingFrame.ZIndex = 10

				UIListLayout.Name = ""
				UIListLayout.Parent = ScrollingFrame
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

				UIPadding_2.Name = ""
				UIPadding_2.Parent = ScrollingFrame
				UIPadding_2.PaddingLeft = UDim.new(0, 5)

				for _, choice in ipairs(choices) do
					pcall(function()
						local TextLabel_3 = Instance.new("TextButton")

						TextLabel_3.Name = " "
						TextLabel_3.Parent = ScrollingFrame
						TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel_3.BackgroundTransparency = 1.000
						TextLabel_3.Position = UDim2.new(0, 5, 0, -1)
						TextLabel_3.Size = UDim2.new(0, 174, 0, 16)
						TextLabel_3.Font = Enum.Font.SourceSans
						TextLabel_3.Text = tostring(choice)
						TextLabel_3.TextColor3 = Color3.fromRGB(205, 205, 205)
						TextLabel_3.TextSize = 14.000
						TextLabel_3.TextStrokeTransparency = 0.000
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
						TextLabel_3.MouseButton1Click:Connect(function()
							TextLabel_2.Text = tostring(choice)
							callback(choice)
							Frame_3.Visible = not Frame_3.Visible
							for _, label in ipairs(ScrollingFrame:GetChildren()) do
								if label:IsA('TextButton') then
									label.TextColor3 = Color3.fromRGB(205, 205, 205)
								end
							end
							TextLabel_3.TextColor3 = configuration['theme'] or Color3.fromRGB(206, 115, 136)
						end)

						TextLabel_3.MouseEnter:Connect(function()
							TextLabel_3.TextColor3 = configuration['theme'] or Color3.fromRGB(206, 115, 136)
						end)

						TextLabel_3.MouseLeave:Connect(function()
							TextLabel_3.TextColor3 = Color3.fromRGB(205, 205, 205)
						end)
					end)
				end

				Frame.MouseButton1Click:Connect(function()
					Frame_3.Visible = not Frame_3.Visible
				end)

				callback(default)
			end
			
			return section
		end
		
		return tab
	end
	
	function window:notification(text, buttons, callback)
		local Frame = Instance.new("Frame")
		local border = Instance.new("Folder")
		local Frame_2 = Instance.new("Frame")
		local Frame_3 = Instance.new("Frame")
		local Frame_4 = Instance.new("Frame")
		local Frame_5 = Instance.new("Frame")
		local accents = Instance.new("Folder")
		local Frame_6 = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		local Frame_7 = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")

		Frame.Name = " "
		Frame.Parent = Main
		Frame.BackgroundColor3 = Color3.fromRGB(23, 23, 30)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0, 160, 0, 163)
		Frame.Size = UDim2.new(0, 295, 0, 100)

		border.Name = "border"
		border.Parent = Frame

		Frame_2.Name = " "
		Frame_2.Parent = border
		Frame_2.BackgroundColor3 = Color3.fromRGB(62, 62, 72)
		Frame_2.BorderSizePixel = 0
		Frame_2.Position = UDim2.new(0, 1, 0, 1)
		Frame_2.Size = UDim2.new(1, -2, 1, -2)

		Frame_3.Name = " "
		Frame_3.Parent = border
		Frame_3.BackgroundColor3 = Color3.fromRGB(39, 39, 47)
		Frame_3.BorderSizePixel = 0
		Frame_3.Position = UDim2.new(0, 2, 0, 2)
		Frame_3.Size = UDim2.new(1, -4, 1, -4)

		Frame_4.Name = " "
		Frame_4.Parent = border
		Frame_4.BackgroundColor3 = Color3.fromRGB(62, 62, 72)
		Frame_4.BorderSizePixel = 0
		Frame_4.Position = UDim2.new(0, 6, 0, 6)
		Frame_4.Size = UDim2.new(1, -12, 1, -12)

		Frame_5.Name = " "
		Frame_5.Parent = border
		Frame_5.BackgroundColor3 = Color3.fromRGB(14, 14, 22)
		Frame_5.BorderSizePixel = 0
		Frame_5.Position = UDim2.new(0, 7, 0, 7)
		Frame_5.Size = UDim2.new(1, -14, 1, -14)

		accents.Name = "accents"
		accents.Parent = Frame

		Frame_6.Name = " "
		Frame_6.Parent = accents
		Frame_6.BackgroundColor3 = configuration['theme'] or Color3.fromRGB(206, 115, 136)
		Frame_6.BorderSizePixel = 0
		Frame_6.Position = UDim2.new(0, 8, 0, 8)
		Frame_6.Size = UDim2.new(1, -16, 0, 2)

		TextLabel.Name = " "
		TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0, 7, 0, 10)
		TextLabel.Size = UDim2.new(1, -14, 0.5, -7)
		TextLabel.Font = Enum.Font.SourceSansSemibold
		TextLabel.Text = text
		TextLabel.TextColor3 = Color3.fromRGB(205, 205, 205)
		TextLabel.TextSize = 14.000
		TextLabel.TextStrokeTransparency = 0.000
		TextLabel.TextWrapped = true

		Frame_7.Name = " "
		Frame_7.Parent = Frame
		Frame_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_7.BackgroundTransparency = 1.000
		Frame_7.BorderColor3 = Color3.fromRGB(18, 18, 24)
		Frame_7.BorderSizePixel = 0
		Frame_7.Position = UDim2.new(0, 13, 0, 58)
		Frame_7.Size = UDim2.new(0, 269, 0, 24)

		UIListLayout.Name = " "
		UIListLayout.Parent = Frame_7
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIListLayout.Padding = UDim.new(0, 13)
		
		for _, text in ipairs(buttons) do
			print(_+10)
			
			
			if _ <= 3 then
				local TextButton = Instance.new("TextButton")
				local TextLabel_2 = Instance.new("TextLabel")
				local UIGradient = Instance.new("UIGradient")
				
				TextButton.Name = " "
				TextButton.Parent = Frame_7
				TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextButton.BorderColor3 = Color3.fromRGB(18, 18, 24)
				TextButton.Size = UDim2.new(0, 60, 0, 24)
				TextButton.Font = Enum.Font.SourceSansSemibold
				TextButton.Text = ""
				TextButton.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextButton.TextSize = 14.000
				TextButton.TextStrokeTransparency = 0.000
				TextButton.MouseButton1Click:Connect(function()
					Frame:Destroy()
					callback(_)
				end)

				TextLabel_2.Name = " "
				TextLabel_2.Parent = TextButton
				TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel_2.BackgroundTransparency = 1.000
				TextLabel_2.Size = UDim2.new(1, 0, 1, 0)
				TextLabel_2.Font = Enum.Font.SourceSansSemibold
				TextLabel_2.Text = text
				TextLabel_2.TextColor3 = Color3.fromRGB(205, 205, 205)
				TextLabel_2.TextSize = 14.000
				TextLabel_2.TextStrokeTransparency = 0.000
				TextLabel_2.TextWrapped = true

				UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(46, 46, 54)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(36, 36, 43))}
				UIGradient.Rotation = 90
				UIGradient.Name = " "
				UIGradient.Parent = TextButton
			end
		end
	end
	
	return window
end

return module
