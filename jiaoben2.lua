
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local localPlayer = Players.LocalPlayer
local PlayerGui = localPlayer:WaitForChild("PlayerGui")


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FuncUI"
ScreenGui.Parent = PlayerGui
ScreenGui.IgnoreGuiInset = true


local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 390)
MainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.new(0.12, 0.12, 0.15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.new(0.35, 0.35, 0.45)
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui


local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 32)
TitleBar.BackgroundColor3 = Color3.new(0.22, 0.22, 0.32)
TitleBar.Parent = MainFrame

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -70, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "twisted X"
TitleText.TextColor3 = Color3.new(1,1,1)
TitleText.Font = Enum.Font.GothamBold
TitleText.TextSize = 14
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar


local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0,26,0,24)
MinBtn.Position = UDim2.new(1, -68, 0,4)
MinBtn.BackgroundColor3 = Color3.new(0.2,0.4,0.7)
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
MinBtn.Parent = TitleBar


local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0,26,0,24)
CloseBtn.Position = UDim2.new(1, -34, 0,4)
CloseBtn.BackgroundColor3 = Color3.new(0.6,0.15,0.15)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = TitleBar


local function createButton(yPos, name, baseColor)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0.8, 0, 0, 45)
	btn.Position = UDim2.new(0.1, 0, 0, yPos)
	btn.BackgroundColor3 = baseColor
	btn.Text = name
	btn.TextColor3 = Color3.new(1,1,1)
	btn.Font = Enum.Font.Gotham
	btn.TextSize = 15
	btn.BorderSizePixel = 1
	btn.BorderColor3 = Color3.new(0.5,0.5,0.5)
	btn.AutoLocalize = false
	btn.Parent = MainFrame

	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = baseColor * 1.2}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = baseColor}):Play()
	end)
	return btn
end

local Button1 = createButton(45, "功能一", Color3.new(0.18, 0.35, 0.6))
local Button2 = createButton(105, "功能二", Color3.new(0.2, 0.45, 0.25))
local Button3 = createButton(165, "功能三", Color3.new(0.55, 0.3, 0.15))

local SpawnCarBtn = createButton(225, "生成载具 TIV 2 2009", Color3.new(0.15,0.38,0.36))
local SpawnCarBtn = createButton(225, "生成载具MDS", Color3.new(0.90,0.38,0.36))

Button1.MouseButton1Click:Connect(function()
	print("【触发】功能一")
end)
Button2.MouseButton1Click:Connect(function()
	print("【触发】功能二")
end)
Button3.MouseButton1Click:Connect(function()
	print("【触发】功能三")
end)


SpawnCarBtn.MouseButton1Click:Connect(function()
local Event = game:GetService("ReplicatedStorage").SpawnCar
Event:FireServer(
    "TIV 2 2009"
)
	print("已发送生成载具请求：TIV 2 2009")
end)
local Verified = false

local isMinimized = false
local originalFrameHeight = 390
local minimizedHeight = 32

SpawnCarBtn.MouseButton1Click:Connect(function()
local Event = game:GetService("ReplicatedStorage").SpawnCar
Event:FireServer(
    "MDS"
)
	print("已发送生成载具请求：MDS")
end)
local Verified = false
local isMinimized = false
local originalFrameHeight = 390
local minimizedHeight = 32


MinBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	local targetHeight = isMinimized and minimizedHeight or originalFrameHeight
	MinBtn.Text = isMinimized and "□" or "_"
	TweenService:Create(MainFrame, TweenInfo.new(0.2), {Size = UDim2.new(0,320,0,targetHeight)}):Play()
end)

CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

local dragging = false
local startPosUI
local startInputPos

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		startInputPos = input.Position
		startPosUI = MainFrame.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if not dragging then return end
	if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end

	local delta = input.Position - startInputPos
	MainFrame.Position = UDim2.new(
		startPosUI.X.Scale, startPosUI.X.Offset + delta.X,
		startPosUI.Y.Scale, startPosUI.Y.Offset + delta.Y
	)
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
 	end
 end)
local KeyContainer = Instance.new("Frame")
KeyContainer.Size = UDim2.new(0.9,0,0,90)
KeyContainer.Position = UDim2.new(0.05,0,0,20)
KeyContainer.BackgroundColor3 = Color3.fromRGB(40,40,50)
KeyContainer.Parent = ScrollingFrame

local KeyLabel = Instance.new("TextLabel")
KeyLabel.Size = UDim2.new(1,0,0,24)
KeyLabel.Position = UDim2.new(0,0,0,5)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Text = "请输入卡密:"
KeyLabel.TextColor3 = Color3.new(1,1,1)
KeyLabel.Font = Enum.Font.Gotham
KeyLabel.TextSize = 13
KeyLabel.Parent = KeyContainer

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.9,0,0,28)
KeyBox.Position = UDim2.new(0.05,0,0,30)
KeyBox.BackgroundColor3 = Color3.fromRGB(22,22,28)
KeyBox.PlaceholderText = "在此输入密钥"
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 13
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = KeyContainer

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.6,0,0,30)
SubmitBtn.Position = UDim2.new(0.2,0,0,65)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(50,120,220)
SubmitBtn.Text = "验证卡密"
SubmitBtn.TextColor3 = Color3.new(1,1,1)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 13
SubmitBtn.Parent = KeyContainer

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(0.9,0,0,22)
StatusText.Position = UDim2.new(0.05,0,0,110)
StatusText.BackgroundTransparency = 1
StatusText.Text = "等待验证..."
StatusText.TextColor3 = Color3.fromRGB(180,180,180)
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 12
StatusText.Parent = ScrollingFrame

local Separator = Instance.new("Frame")
Separator.Size = UDim2.new(0.9,0,0,2)
Separator.Position = UDim2.new(0.05,0,0,140)
Separator.BackgroundColor3 = Color3.fromRGB(60,60,70)
Separator.Parent = ScrollingFrame

SubmitBtn.MouseButton1Click:Connect(function()
	local inputKey = KeyBox.Text
	if inputKey == CORRECT_KEY then
		StatusText.Text = "验证成功！功能已解锁"
		StatusText.TextColor3 = Color3.fromRGB(80,220,120)
		Verified = true
		SpawnMDS.Visible = true
		SpawnTIV2.Visible = true
	else
		StatusText.Text = "卡密错误，请重试"
		StatusText.TextColor3 = Color3.fromRGB(220,80,80)
	end
end)

 print("✅ UI加载完成 | 电脑/手机触屏均可拖拽顶部标题栏")