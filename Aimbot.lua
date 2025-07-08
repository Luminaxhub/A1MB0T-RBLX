local pastebinURL = "https://workink.net/21py/0hr1khso"
local yourKey = "FREEKEY_cxdvFn3pcM0ZaNFcdY12"

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
gui.Name = "GetKeyGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 350, 0, 250)
frame.Position = UDim2.new(0.5, -175, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
frame.Active = true
frame.Draggable = true

-- Title Bar
local titleBar = Instance.new("Frame", frame)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1, -60, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.Text = "🔐 LuminaHub System"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Size = UDim2.new(0, 30, 1, 0)
minimizeBtn.Position = UDim2.new(1, -60, 0, 0)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.SourceSansBold
minimizeBtn.TextSize = 18
minimizeBtn.TextColor3 = Color3.new(1, 1, 1)
minimizeBtn.BackgroundTransparency = 1

local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0, 30, 1, 0)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundTransparency = 1

-- User Input Area
local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(1, -40, 0, 40)
input.Position = UDim2.new(0, 20, 0, 50)
input.PlaceholderText = "Enter your key..."
input.Font = Enum.Font.SourceSans
input.TextSize = 18
input.TextColor3 = Color3.new(1, 1, 1)
input.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
input.ClearTextOnFocus = false

local verifyBtn = Instance.new("TextButton", frame)
verifyBtn.Size = UDim2.new(1, -40, 0, 40)
verifyBtn.Position = UDim2.new(0, 20, 0, 100)
verifyBtn.Text = "Verify"
verifyBtn.Font = Enum.Font.SourceSansSemibold
verifyBtn.TextSize = 18
verifyBtn.TextColor3 = Color3.new(1, 1, 1)
verifyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

local errorLabel = Instance.new("TextLabel", frame)
errorLabel.Size = UDim2.new(1, -40, 0, 20)
errorLabel.Position = UDim2.new(0, 20, 0, 150)
errorLabel.Text = ""
errorLabel.Font = Enum.Font.SourceSans
errorLabel.TextSize = 16
errorLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
errorLabel.BackgroundTransparency = 1
errorLabel.TextXAlignment = Enum.TextXAlignment.Center

local getKeyBtn = Instance.new("TextButton", frame)
getKeyBtn.Size = UDim2.new(1, -40, 0, 30)
getKeyBtn.Position = UDim2.new(0, 20, 0, 180)
getKeyBtn.Text = "📋 Get Key"
getKeyBtn.Font = Enum.Font.SourceSans
getKeyBtn.TextSize = 16
getKeyBtn.TextColor3 = Color3.new(1, 1, 1)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

getKeyBtn.MouseButton1Click:Connect(function()
	setclipboard(pastebinURL)
	errorLabel.Text = "📋 Link copied! Paste in browser to get the key."
end)

verifyBtn.MouseButton1Click:Connect(function()
	local userKey = input.Text:upper():gsub("%s+", "")
	if userKey == yourKey then
		gui:Destroy()
		pcall(function()
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "Enjoy the script! 🥀",
				Text = "LuminaHub",
				Button1 = "Yes",
				Button2 = "Cancel",
				Duration = 30
			})
		end)
		loadstring(game:HttpGet("https://pastebin.com/raw/L8dAacWM", true))()
	else
		errorLabel.Text = "❌ Invalid key. Try again."
	end
end)

minimizeBtn.MouseButton1Click:Connect(function()
	local collapsed = input.Visible
	input.Visible = not collapsed
	verifyBtn.Visible = not collapsed
	getKeyBtn.Visible = not collapsed
	errorLabel.Visible = not collapsed
	frame.Size = collapsed and UDim2.new(0, 350, 0, 30) or UDim2.new(0, 350, 0, 250)
end)

closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
