
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FunctionMenuUI"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainWindow"
MainFrame.Size = UDim2.new(0, 320, 0, 320)
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.new(0.12, 0.12, 0.15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.new(0.35, 0.35, 0.45)
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui


local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 32)
TitleBar.BackgroundColor3 = Color3.new(0.22, 0.22, 0.32)
TitleBar.Parent = MainFrame

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -40, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "功能控制面板"
TitleText.TextColor3 = Color3.new(1,1,1)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar


local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseButton"
CloseBtn.Size = UDim2.new(0,30,0,24)
CloseBtn.Position = UDim2.new(1, -35, 0,4)
CloseBtn.BackgroundColor3 = Color3.new(0.6,0.15,0.15)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = TitleBar

local buttonYStart = 45 
local buttonSpacing = 55 -


local Button1 = Instance.new("TextButton")
Button1.Size = UDim2.new(0.8, 0, 0, 45)
Button1.Position = UDim2.new(0.1, 0, 0, buttonYStart)
Button1.BackgroundColor3 = Color3.new(0.18, 0.35, 0.6)
Button1.Text = "功能一"
Button1.TextColor3 = Color3.new(1,1,1)
Button1.Font = Enum.Font.Gotham
Button1.TextSize = 15
Button1.BorderSizePixel = 1
Button1.BorderColor3 = Color3.new(0.5,0.5,0.5)
Button1.Parent = MainFrame


local Button2 = Instance.new("TextButton")
Button2.Size = UDim2.new(0.8, 0, 0, 45)
Button2.Position = UDim2.new(0.1, 0, 0, buttonYStart + buttonSpacing)
Button2.BackgroundColor3 = Color3.new(0.2, 0.45, 0.25)
Button2.Text = "功能二"
Button2.TextColor3 = Color3.new(1,1,1)
Button2.Font = Enum.Font.Gotham
Button2.TextSize = 15
Button2.BorderSizePixel = 1
Button2.BorderColor3 = Color3.new(0.5,0.5,0.5)
Button2.Parent = MainFrame


local Button3 = Instance.new("TextButton")
Button3.Size = UDim2.new(0.8, 0, 0, 45)
Button3.Position = UDim2.new(0.1, 0, 0, buttonYStart + buttonSpacing*2)
Button3.BackgroundColor3 = Color3.new(0.55, 0.3, 0.15)
Button3.Text = "功能三"
Button3.TextColor3 = Color3.new(1,1,1)
Button3.Font = Enum.Font.Gotham
Button3.TextSize = 15
Button3.BorderSizePixel = 1
Button3.BorderColor3 = Color3.new(0.5,0.5,0.5)
Button3.Parent = MainFrame


Button1.MouseButton1Click:Connect(function()
    print("已召唤TIV2")
    local Event = game:GetService("ReplicatedStorage").SpawnCar
    Event:FireServer(
    "TIV 2"
)
end)

Button2.MouseButton1Click:Connect(function()
    print("✅ 你点击了【功能二】")
    
end)

Button3.MouseButton1Click:Connect(function()
    print("✅ 你点击了【功能三】")
    
end)

local dragging = false
local dragStart
local startPos

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)


CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

print("✅ 带功能按钮UI加载完成！")
