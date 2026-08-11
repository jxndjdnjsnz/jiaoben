local Players = game:GetService("Players")
local UserInputService = game:GetService("TweenService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
task.wait(0.3)
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CobaltStyleUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local MainWindow = Instance.new("Frame")
MainWindow.Size = UDim2.new(0, 720, 0, 480)
MainWindow.Position = UDim2.new(0.12,0,0.12,0)
MainWindow.BackgroundColor3 = Color3.fromRGB(22,22,26)
MainWindow.BorderSizePixel = 0
MainWindow.CornerRadius = UDim.new(0,10)
MainWindow.ClipsDescendants = true
MainWindow.Parent = ScreenGui

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1,0,0,36)
TitleBar.BackgroundColor3 = Color3.fromRGB(30,30,36)
TitleBar.CornerRadius = UDim.new(0,10)
TitleBar.ZIndex = 10
TitleBar.Parent = MainWindow

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1,-130,1,0)
TitleLabel.Position = UDim2.new(0,12,0,0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Cobalt Devtool"
TitleLabel.TextColor3 = Color3.new(1,1,1)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0,28,0,28)
MinBtn.Position = UDim2.new(1,-68,0,4)
MinBtn.BackgroundColor3 = Color3.fromRGB(44,44,50)
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.new(1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 17
MinBtn.CornerRadius = UDim.new(0,6)
MinBtn.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0,28,0,28)
CloseBtn.Position = UDim2.new(1,-44,0,4)
CloseBtn.BackgroundColor3 = Color3.fromRGB(160,52,52)
CloseBtn.Text = "×"
MinBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 17
CloseBtn.CornerRadius = UDim.new(0,6)
CloseBtn.Parent = TitleBar

local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(1,-24,0,42)
TabContainer.Position = UDim2.new(0,12,0,42)
TabContainer.BackgroundTransparency = 1
TabContainer.Parent = MainWindow

local OutgoingTab = Instance.new("TextButton")
OutgoingTab.Size = UDim2.new(0,110,0,36)
OutgoingTab.Position = UDim2.new(0,0,0,0)
OutgoingTab.BackgroundColor3 = Color3.fromRGB(42,42,50)
OutgoingTab.Text = "Outgoing"
OutgoingTab.TextColor3 = Color3.new(1,1,1)
OutgoingTab.Font = Enum.Font.Gotham
OutgoingTab.TextSize =14
OutgoingTab.CornerRadius = UDim.new(0,7)
OutgoingTab.Parent = TabContainer

local IncomingTab = Instance.new("TextButton")
IncomingTab.Size = UDim2.new(0,110,0,36)
IncomingTab.Position = UDim2.new(0,120,0,0)
IncomingTab.BackgroundColor3 = Color3.fromRGB(30,30,36)
IncomingTab.Text = "Incoming"
IncomingTab.TextColor3 = Color3.fromRGB(160,160,170)
IncomingTab.Font = Enum.Font.Gotham
IncomingTab.TextSize =14
IncomingTab.CornerRadius = UDim.new(0,7)
IncomingTab.Parent = TabContainer

local SplitLine = Instance.new("Frame")
SplitLine.Size = UDim2.new(0,1,1,-102)
SplitLine.Position = UDim2.new(0,320,0,90)
SplitLine.BackgroundColor3 = Color3.fromRGB(44,44,52)
SplitLine.Parent = MainWindow

local LeftPanel = Instance.new("ScrollingFrame")
LeftPanel.Size = UDim2.new(0,308,1,-102)
LeftPanel.Position = UDim2.new(0,12,0,90)
LeftPanel.BackgroundColor3 = Color3.fromRGB(18,18,22)
LeftPanel.BorderSizePixel =0
LeftPanel.ScrollBarThickness =4
LeftPanel.CanvasSize = UDim2.new(0,0,2,0)
LeftPanel.ScrollBarBackgroundColor = Color3.fromRGB(30,30,36)
LeftPanel.ScrollBarImageColor3 = Color3.fromRGB(70,70,80)
LeftPanel.Parent = MainWindow

local RightPanel = Instance.new("ScrollingFrame")
RightPanel.Size = UDim2.new(1,-344,1,-102)
RightPanel.Position = UDim2.new(0,332,0,90)
RightPanel.BackgroundColor3 = Color3.fromRGB(18,18,22)
RightPanel.BorderSizePixel =0
RightPanel.ScrollBarThickness =4
RightPanel.CanvasSize = UDim2.new(0,0,2,0)
RightPanel.ScrollBarBackgroundColor = Color3.fromRGB(30,30,36)
RightPanel.ScrollBarImageColor3 = Color3.fromRGB(70,70,80)
RightPanel.Parent = MainWindow

local function WindButton(Y, Text, Color)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(0,284,0,40)
	Button.Position = UDim2.new(0,12,1,-52)
	Button.BackgroundColor3 = Color
	Button.Text = Text
	Button.TextColor3 = Color3.new(1,1,1)
	Button.Font = Enum.Font.Gotham
	Button.TextSize =14
	Button.BorderSizePixel =0
	Button.CornerRadius = UDim.new(0,6)
	Button.Parent = MainWindow

	Button.MouseEnter:Connect(function()
		TweenService:Create(Button,TweenInfo.new(0.18),{BackgroundColor3 = Color:Lerp(Color3.new(1,1,1),Color,0.75)}):Play()
	end)
	Button.MouseLeave:Connect(function()
		TweenService:Create(Button,TweenInfo.new(0.18),{BackgroundColor3 = Color}):Play()
	end)
	return Button
end
local SpawnCarBtn = WindButton(0, "TIV 2 2009", Color3.fromRGB(34,78,76))
 SpawnCarBtn.MouseButton1Click:Connect(function()
 -- This code was generated by Cobalt
 -- https://gitlab.com/upio/cobalt
 local Event = game:GetService("ReplicatedStorage").SpawnCar
 pcall(function()
 Event:FireServer("TIV 2 2009")
 end)
 print("已发送载具生成请求")
 end)
 local Minimized = false
 local BaseHeight = 480
 local MiniHeight = 36
 MinBtn.MouseButton1Click:Connect(function()
 	Minimized = not Minimized
 	local targetH = Minimized and MiniHeight or BaseHeight
 	MinBtn.Text = Minimized and "□" or "−"
 	TweenService:Create(MainWindow,TweenInfo.new(0.22),{Size=UDim2.new(0,720,0,targetH)}):Play()
 end)
 CloseBtn.MouseButton1Click:Connect(function()
 	ScreenGui:Destroy()
 end)
 local dragging = false
 local StartInputPos
 local StartUIPos
 TitleBar.InputBegan:Connect(function(input)
 	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
 		dragging = true
 		StartInputPos = input.Position
 		StartUIPos = MainWindow.Position
 	end
 end)
 UserInputService.InputChanged:Connect(function(input)
 	if not dragging then return end
 	if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end
 	local delta = input.Position - StartInputPos
 	MainWindow.Position = UDim2.new(
 		StartUIPos.X.Scale, StartUIPos.X.Offset + delta.X,
 		StartUIPos.Y.Scale, StartUIPos.Y.Offset + delta.Y
 	)
 end)
 UserInputService.InputEnded:Connect(function(input)
 	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
 		dragging = false
 	end
 end)
 print("Cobalt风格UI加载完成，左右面板支持滑动滚动")