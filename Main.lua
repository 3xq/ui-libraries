-- Module

local Library = {
	['Elements'] = {},
	['Amount'] = 0,
	['Current'] = 1,
	['Y_Padding'] = 0,
	['Callbacks'] = {},
	['Types'] = {}
}

-- Services

local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')

-- Variables

local To_Copy = {}

-- Globals

_G.Executed = false
_G.Execution_Time = tick()

-- Metatable Hook

getgenv().Drawing.custom = function(Object_Type, Functions)
    local Object = Drawing.new(Object_Type)
    
    if Functions then
        local Set_Metatable = setmetatable(
            {},
            {
                __index = function(self, Key)
                    return Functions[Key] or Object[Key]
                end,
                __newindex = function(self, Key, Value)
                    Object[Key] = Value
                end
            }
        )
        
        return Set_Metatable
    else
        return Object
    end
end

-- Module Functions

function Library:Tab(Text)
	local Square = Drawing.new('Square')
	local Title = Drawing.new('Text')

	local Functions = {}

	Square.Visible = true
	Square.Transparency = 1
	Square.ZIndex = 0

	Title.Visible = true
	Title.Transparency = 1
	Title.ZIndex = 1

	Title.Size = 13
	Title.Font = 2
	Title.Text = Text
	Title.Color = Color3.fromRGB(255, 255, 255)

	Square.Size = Vector2.new(Title.TextBounds.X + 4, Title.TextBounds.Y + 4)
	Square.Position = Vector2.new(100 - 18, 100 + Library['Y_Padding'])
	Square.Filled = true

	Title.Position = Vector2.new(Square.Position.X + 2, Square.Position.Y + 2)
	Library['Y_Padding'] = Library['Y_Padding'] + Square.Size.Y

	return Functions
end

function Library:Spacer()
	Library['Y_Padding'] = Library['Y_Padding'] + 20
end

function Library:Button(Text, Callback)
	local Square = Drawing.new('Square')
	local Title = Drawing.new('Text')

	local Functions = {}

	Square.Visible = true
	Square.Transparency = 1
	Square.ZIndex = 0

	Title.Visible = true
	Title.Transparency = 1
	Title.ZIndex = 1

	Title.Size = 13
	Title.Font = 2
	Title.Text = Text

	if Library['Amount'] == 0 then
		Title.Color = Color3.fromRGB(255, 0, 255)
	else
		Title.Color = Color3.fromRGB(255, 255, 255)
	end

	Square.Size = Vector2.new(Title.TextBounds.X + 4, Title.TextBounds.Y + 4)
	Square.Position = Vector2.new(100, 100 + Library['Y_Padding'])
	Square.Filled = true

	Title.Position = Vector2.new(Square.Position.X + 2, Square.Position.Y + 2)

	Library['Elements'][#Library['Elements'] + 1] = Title
	Library['Callbacks'][#Library['Callbacks'] + 1] = Callback
	Library['Types'][#Library['Types'] + 1] = 'Button'
	Library['Amount'] = Library['Amount'] + 1
	Library['Y_Padding'] = Library['Y_Padding'] + Square.Size.Y

	return Functions
end

function Library:Number(Text, Default, Increment, Callback)
	local Square = Drawing.new('Square')
	local Title = Drawing.new('Text')

	local Functions = {}

	Square.Visible = true
	Square.Transparency = 1
	Square.ZIndex = 0
 
	Title.Visible = true
	Title.Transparency = 1
	Title.ZIndex = Increment

	Title.Size = 13
	Title.Font = 2
	Title.Text = string.format('%s [%s]', Text, Default)

	if Library['Amount'] == 0 then
		Title.Color = Color3.fromRGB(255, 0, 255)
	else
		Title.Color = Color3.fromRGB(255, 255, 255)
	end

	Square.Size = Vector2.new(Title.TextBounds.X + 4, Title.TextBounds.Y + 4)
	Square.Position = Vector2.new(100, 100 + Library['Y_Padding'])
	Square.Filled = true

	Title.Position = Vector2.new(Square.Position.X + 2, Square.Position.Y + 2)

	Library['Elements'][#Library['Elements'] + 1] = Title
	Library['Callbacks'][#Library['Callbacks'] + 1] = Callback
	Library['Types'][#Library['Types'] + 1] = 'Number'
	Library['Amount'] = Library['Amount'] + 1
	Library['Y_Padding'] = Library['Y_Padding'] + Square.Size.Y

	To_Copy[#To_Copy + 1] = {
		['Square'] = Square,
		['Title'] = Title
	}

	return Functions
end

function Library:Bool(Text, Default, Callback)
	local Square = Drawing.new('Square')
	local Title = Drawing.new('Text')

	local Functions = {}

	Square.Visible = true
	Square.Transparency = 1
	Square.ZIndex = 0
 
	Title.Visible = true
	Title.Transparency = 1
	Title.ZIndex = 1

	Title.Size = 13
	Title.Font = 2
	Title.Text = string.format('%s [%s]', Text, tostring(Default))

	if Library['Amount'] == 0 then
		Title.Color = Color3.fromRGB(255, 0, 255)
	else
		Title.Color = Color3.fromRGB(255, 255, 255)
	end

	Square.Size = Vector2.new(Title.TextBounds.X + 4, Title.TextBounds.Y + 4)
	Square.Position = Vector2.new(100, 100 + Library['Y_Padding'])
	Square.Filled = true

	Title.Position = Vector2.new(Square.Position.X + 2, Square.Position.Y + 2)

	Library['Elements'][#Library['Elements'] + 1] = Title
	Library['Callbacks'][#Library['Callbacks'] + 1] = Callback
	Library['Types'][#Library['Types'] + 1] = 'Bool'
	Library['Amount'] = Library['Amount'] + 1
	Library['Y_Padding'] = Library['Y_Padding'] + Square.Size.Y

	To_Copy[#To_Copy + 1] = {
		['Square'] = Square,
		['Title'] = Title
	}

	return Functions
end

function Library:String(Text, Default, Strings, Callback)
	Strings['Current'] = table.find(Strings, Default)

	local Square = Drawing.new('Square')
	local Title = Drawing.custom('Text', {
		['Strings'] = function()
			return Strings
		end,
	})

	local Functions = {}

	Square.Visible = true
	Square.Transparency = 1
	Square.ZIndex = 0
 
	Title.Visible = true
	Title.Transparency = 1
	Title.ZIndex = 1

	Title.Size = 13
	Title.Font = 2
	Title.Text = string.format('%s [%s]', Text, tostring(Default))

	if Library['Amount'] == 0 then
		Title.Color = Color3.fromRGB(255, 0, 255)
	else
		Title.Color = Color3.fromRGB(255, 255, 255)
	end

	Square.Size = Vector2.new(Title.TextBounds.X + 4, Title.TextBounds.Y + 4)
	Square.Position = Vector2.new(100, 100 + Library['Y_Padding'])
	Square.Filled = true

	Title.Position = Vector2.new(Square.Position.X + 2, Square.Position.Y + 2)

	Library['Elements'][#Library['Elements'] + 1] = Title
	Library['Callbacks'][#Library['Callbacks'] + 1] = Callback
	Library['Types'][#Library['Types'] + 1] = 'String'
	Library['Amount'] = Library['Amount'] + 1
	Library['Y_Padding'] = Library['Y_Padding'] + Square.Size.Y

	To_Copy[#To_Copy + 1] = {
		['Square'] = Square,
		['Title'] = Title
	}

	return Functions
end

-- Connections

UserInputService.InputBegan:Connect(function(Input, Processed)
	if Processed then
		return
	end

	if Input.KeyCode == Enum.KeyCode.RightBracket then
		if Library['Elements'][Library['Current'] + 1] then
			local Element = Library['Elements'][Library['Current']]
			local New_Element = Library['Elements'][Library['Current'] + 1]

			Library['Current'] = Library['Current'] + 1

			Element.Color = New_Element.Color
			New_Element.Color = Color3.fromRGB(255, 0, 255)
		else
			local Element = Library['Elements'][Library['Current']]
			local New_Element = Library['Elements'][1]

			Library['Current'] = 1

			Element.Color = New_Element.Color
			New_Element.Color = Color3.fromRGB(255, 0, 255)
		end
	elseif Input.KeyCode == Enum.KeyCode.LeftBracket then
		if Library['Elements'][Library['Current'] - 1] then
			local Element = Library['Elements'][Library['Current']]
			local New_Element = Library['Elements'][Library['Current'] - 1]

			Library['Current'] = Library['Current'] - 1

			Element.Color = New_Element.Color
			New_Element.Color = Color3.fromRGB(255, 0, 255)
		else
			local Element = Library['Elements'][Library['Current']]
			local New_Element = Library['Elements'][#Library['Elements']]

			Library['Current'] = #Library['Elements']

			Element.Color = New_Element.Color
			New_Element.Color = Color3.fromRGB(255, 0, 255)
		end
	elseif Input.KeyCode == Enum.KeyCode.Equals then
		if Library['Types'][Library['Current']] == 'Number' then
			local Value = tonumber(Library['Elements'][Library['Current']].Text:split('[')[2]:split(']')[1])
			local New_Value = (Value + Library['Elements'][Library['Current']].ZIndex)

			Library['Elements'][Library['Current']].Text = string.format('%s [%s]', Library['Elements'][Library['Current']].Text:split(' [')[1], New_Value)
			Library['Callbacks'][Library['Current']](New_Value)
		elseif Library['Types'][Library['Current']] == 'Bool' then
			local Value = loadstring(string.format('return %s;', Library['Elements'][Library['Current']].Text:split('[')[2]:split(']')[1]))()
			local New_Value = not Value

			Library['Elements'][Library['Current']].Text = string.format('%s [%s]', Library['Elements'][Library['Current']].Text:split(' [')[1], tostring(New_Value))
			Library['Callbacks'][Library['Current']](New_Value)
		elseif Library['Types'][Library['Current']] == 'String' then
			local Strings = Library['Elements'][Library['Current']]:Strings()
			local Value = Strings[Strings['Current']]

			if Strings[Strings['Current'] + 1] then
				local New_Value = Strings[Strings['Current'] + 1]

				Strings['Current'] = Strings['Current'] + 1

				Library['Elements'][Library['Current']].Text = string.format('%s [%s]', Library['Elements'][Library['Current']].Text:split(' [')[1], tostring(New_Value))
				Library['Callbacks'][Library['Current']](New_Value)
			else
				local New_Value = Strings[1]

				Strings['Current'] = 1

				Library['Elements'][Library['Current']].Text = string.format('%s [%s]', Library['Elements'][Library['Current']].Text:split(' [')[1], tostring(New_Value))
				Library['Callbacks'][Library['Current']](New_Value)
			end
		end
	elseif Input.KeyCode == Enum.KeyCode.Minus then
		if Library['Types'][Library['Current']] == 'Number' then
			local Value = tonumber(Library['Elements'][Library['Current']].Text:split('[')[2]:split(']')[1])
			local New_Value = (Value - Library['Elements'][Library['Current']].ZIndex)

			Library['Elements'][Library['Current']].Text = string.format('%s [%s]', Library['Elements'][Library['Current']].Text:split(' [')[1], New_Value)
			Library['Callbacks'][Library['Current']](New_Value)
		elseif Library['Types'][Library['Current']] == 'Bool' then
			local Value = loadstring(string.format('return %s;', Library['Elements'][Library['Current']].Text:split('[')[2]:split(']')[1]))()
			local New_Value = not Value

			Library['Elements'][Library['Current']].Text = string.format('%s [%s]', Library['Elements'][Library['Current']].Text:split(' [')[1], tostring(New_Value))
			Library['Callbacks'][Library['Current']](New_Value)
		elseif Library['Types'][Library['Current']] == 'String' then
			local Strings = Library['Elements'][Library['Current']]:Strings()
			local Value = Strings[Strings['Current']]

			if Strings[Strings['Current'] - 1] then
				local New_Value = Strings[Strings['Current'] - 1]

				Strings['Current'] = Strings['Current'] - 1

				Library['Elements'][Library['Current']].Text = string.format('%s [%s]', Library['Elements'][Library['Current']].Text:split(' [')[1], tostring(New_Value))
				Library['Callbacks'][Library['Current']](New_Value)
			else
				local New_Value = Strings[#Strings]

				Strings['Current'] = #Strings

				Library['Elements'][Library['Current']].Text = string.format('%s [%s]', Library['Elements'][Library['Current']].Text:split(' [')[1], tostring(New_Value))
				Library['Callbacks'][Library['Current']](New_Value)
			end
		end
	elseif Input.KeyCode == Enum.KeyCode.Return then
		if Library['Types'][Library['Current']] == 'Button' then
			if Library['Callbacks'][Library['Current']] then
				Library['Callbacks'][Library['Current']]()
			end
		end
	end
end)

RunService.Heartbeat:Connect(function()
	for _, Data in ipairs(To_Copy) do
		local Position = Data['Square'].Position
		Data['Square'].Size = Vector2.new(Data['Title'].TextBounds.X + 4, Data['Title'].TextBounds.Y + 4)
		Data['Square'].Position = Position
	end
end)

-- Setting Globals

_G.Execution_Time = tick() - _G.Execution_Time
_G.Execution_Time = string.format('%.'..(8)..'f', _G.Execution_Time)

-- Finish

return Library
