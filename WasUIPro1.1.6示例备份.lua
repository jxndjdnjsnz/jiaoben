local WasUIPro = loadstring(game:HttpGet("https://github.com/WasKKal/WasUI-For-Roblox/raw/refs/heads/main/WasUIPro.lua"))()
local VirtualUserService = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUserService:CaptureMouse()
    VirtualUserService:Click2(Vector2.new())
    WasUIPro:Notify({ Title = "防挂机", Content = "已开启防挂机", Duration = 20 })
end)
local Uis = game:GetService("UserInputService")
local Players = game:GetService("Players")

WasUIPro:SetDefaultTheme("Dark")
WasUIPro:SetDefaultRainbowMode("流动")
WasUIPro:SetLanguage("中文") 

local mainWindow = WasUIPro:CreateWindow({
    Title = "WasUIPro JB",
    WelcomeText = "展示所有控件及动态功能",
    MinimizedText = "JB",
    Theme = "Dark",
    RainbowMode = "流动",
    DialogTitle = "确认关闭窗口",
    GroupText = "加入交流群",
    GroupCopy = "1070641947", 
    SnowEnabled = true,
    Background = "rbxassetid://1234567890",
    Folder = "WasUIPro_JB",
    TitleTag = {
        { text = "Demo", backgroundColor = Color3.fromRGB(0,152,211), textColor = Color3.fromRGB(255,255,255) },
        { text = "NEW", backgroundColor = Color3.fromRGB(255,80,80), textColor = Color3.fromRGB(255,255,255) }
    },
    FrameColor = nil,
--[[
    {
    Color3.fromRGB(255, 100, 100),
    Color3.fromRGB(100, 255, 100),
    Color3.fromRGB(100, 100, 255)
    },
    ]]
    FeatureNameColor = {Color3.fromRGB(255, 100, 200), Color3.fromRGB(255, 150, 50)}
})

task.spawn(function()
    task.wait(0.5)
    WasUIPro:Popup({
        title = "欢迎使用 JB",
        titleIcon = "sparkles",
        content = "完整控件演示，配置文件自动保存",
        confirmText = "开始体验",
        onConfirm = function()
             WasUIPro:Notify({ Title = "JB", Content = "欢迎使用", Duration = 20 })
             WasUIPro:Notify({ Title = "脚本", Content = "开始使用", Duration = 20 })
             WasUIPro:Notify({ Title = "作者", Content = "jxndjdnjsnz", Duration = 20 })
        end
    })
end)

local basicTab = mainWindow:Tab({ Title = "基础控件" })
local basicCategory = basicTab:Category({ Title = "常用控件", IconName = "layout-grid" })

basicCategory:Button({
    Text = "RAXPOL",
    Icon = "car",
    Tooltip = "已召唤RAXPOL",
    Callback = function()
        local function GetNil(Name, DebugId)
	for _, Object in getnilinstances() do
		if Object.Name == Name and Object:GetDebugId() == DebugId then
			return Object
		end
	end
end
    local Event = game:GetService("ReplicatedStorage").DeleteCar
        Event:FireServer(
        GetNil("PlayersCar", "1_6090979")
)
    local Event = game:GetService("ReplicatedStorage").SpawnCar
        Event:FireServer(
             "raxpol"
)
        WasUIPro:Notify({ Title = "召唤", Content = "已召唤RAXPOL", Duration = 2 })
        end
})

basicCategory:Button({
    Text = "召唤TIV2 2009",
    Icon = "car",
    Tooltip = "已召唤TIV2",
    Callback = function()
        local function GetNil(Name, DebugId)
	for _, Object in getnilinstances() do
		if Object.Name == Name and Object:GetDebugId() == DebugId then
			return Object
		end
	end
end
    local Event = game:GetService("ReplicatedStorage").DeleteCar
        Event:FireServer(
        GetNil("PlayersCar", "1_6090979")
)
    local Event = game:GetService("ReplicatedStorage").SpawnCar
        Event:FireServer(
             "TIV 2 2009"
)
        WasUIPro:Notify({ Title = "按钮", Content = "你召唤了TIV2 2009", Duration = 2 })
    end
})
basicCategory:Button({
    Text = "召唤MDS",
    Icon = "car",
    Tooltip = "已召唤MDS",
    Callback = function()
        local function GetNil(Name, DebugId)
	for _, Object in getnilinstances() do
		if Object.Name == Name and Object:GetDebugId() == DebugId then
			return Object
		end
	end
end
    local Event = game:GetService("ReplicatedStorage").DeleteCar
        Event:FireServer(
        GetNil("PlayersCar", "1_6090979")
)
        local Event = game:GetService("ReplicatedStorage").SpawnCar
        Event:FireServer(
              "MDS"
)
        WasUIPro:Notify({ Title = "按钮", Content = "你召唤了MDS", Duration = 2 })
    end
})
basicCategory:Button({
    Text = "待更新",
    Icon = "car",
    Tooltip = "还不知道做啥",
    Callback = function()
        
    end
})
basicCategory:Button({
    Text = "待更新",
    Icon = "car",
    Tooltip = "还不知道做啥",
    Callback = function()
        
    end
})
basicCategory:Button({
    Text = "待更新",
    Icon = "car",
    Tooltip = "还不知道做啥",
    Callback = function()
        
    end
})

basicCategory:Button({
    Text = "待更新",
    Icon = "car",
    Tooltip = "还不知道做啥",
    Callback = function()
        
    end
})

basicCategory:Button({
    Text = "待更新",
    Icon = "car",
    Tooltip = "还不知道做啥",
    Callback = function()
        
    end
})

local expBar = basicCategory:ProgressBar({
    Title = "经验值",
    Min = 0,
    Max = 1000,
    Default = 250,
})

task.spawn(function()
    while true do
        task.wait(3)
        local newValue = expBar:GetValue() + 50
        if newValue > 1000 then newValue = 0 end
        expBar:SetValue(newValue)
    end
end)

basicTab:Paragraph({
    Title = "关于 WasUIPro",
    Desc = "轻量级 UI 库，支持主题切换、动画效果、配置保存、快捷键",
    Icon = "info"
})

local advancedTab = mainWindow:Tab({ Title = "高级控件" })

local advancedCategory = advancedTab:Category({ Title = "高级功能", IconName = "sliders-horizontal" })

advancedCategory:ColorPickerButton({
    Title = "主题颜色选择",
    Default = Color3.fromRGB(153, 51, 255),
    ConfigKey = "theme_color",
    Callback = function(color, alpha)
        WasUIPro:Notify({ Title = "颜色", Content = string.format("RGB: %s", color:ToHex()), Duration = 2 })
    end
})

advancedCategory:Toggle({
    Title = "彩虹文字特效",
    Value = false,
    FeatureName = "RainbowEffect",
    ConfigKey = "rainbow_effect",
    Callback = function(state)
        WasUIPro:Notify({ Title = "彩虹", Content = state and "特效已开启" or "特效已关闭", Duration = 1 })
    end
})

advancedCategory:Button({
    Text = "危险操作",
    Icon = "alert-triangle",
    Callback = function()
        WasUIPro:ShowConfirmDialog({
            title = "危险操作确认",
            description = "此操作不可逆，是否继续",
            confirmText = "确定",
            cancelText = "取消",
            onConfirm = function()
                WasUIPro:Notify({ Title = "执行", Content = "危险操作已执行", Duration = 2 })
            end
        })
    end
})
advancedCategory:Button({
    Text = "显示自定义弹窗",
    Icon = "message-circle",
    Callback = function()
        WasUIPro:ShowPopup({
            title = "自定义弹窗",
            titleIcon = "smile",
            content = "这是一个完全自定义的弹窗，可以包含图标和多个按钮",
            confirmText = "确认",
            cancelText = "取消",
            onConfirm = function()
                WasUIPro:Notify({ Title = "弹窗", Content = "点击了确认", Duration = 1 })
            end
        })
    end
})

local demoSliderTab = mainWindow:Tab({ Title = "滑块联动" })

local sliderCategory = demoSliderTab:Category({ Title = "进度条与滑块联动", IconName = "activity" })

local sliderA = sliderCategory:Slider({
    Title = "控制进度A",
    Min = 0,
    Max = 100,
    Default = 30,
    Step = 0.5
})
local sliderB = sliderCategory:Slider({
    Title = "控制进度B",
    Min = 0,
    Max = 100,
    Default = 60,
    Step = 1
})

local progressDemo = sliderCategory:ProgressBar({
    Title = "总进度平均值",
    Min = 0,
    Max = 100,
    Default = 0,
})

local function updateTotal()
    local avg = (sliderA.Value + sliderB.Value) / 2
    progressDemo:SetValue(avg)
end
sliderA.Callback = updateTotal
sliderB.Callback = updateTotal
updateTotal()

sliderCategory:Button({
    Text = "重置全部",
    Icon = "refresh-cw",
    Callback = function()
        sliderA:SetValue(50)
        sliderB:SetValue(50)
        WasUIPro:Notify({ Title = "重置", Content = "已重置", Duration = 1 })
    end
})

local dynamicTab = mainWindow:Tab({ Title = "动态演示" })

local dynamicCategory = dynamicTab:Category({ Title = "玩家列表与动态信息", IconName = "users" })

local playerDropdown = nil

dynamicCategory:Button({
    Text = "刷新玩家列表",
    Icon = "refresh-cw",
    Tooltip = "从服务器获取当前在线玩家",
    Callback = function()
        local playerList = Players:GetPlayers()
        local playerNames = {}
        for _, plr in ipairs(playerList) do
            table.insert(playerNames, plr.Name)
        end
        if #playerNames == 0 then
            WasUIPro:Notify({ Title = "提示", Content = "当前没有玩家", Duration = 2 })
            return
        end
        if playerDropdown then
            local current = playerDropdown.SelectedValue
            local newDefault = nil
            for _, name in ipairs(playerNames) do
                if name == current then
                    newDefault = current
                    break
                end
            end
            if not newDefault and #playerNames > 0 then
                newDefault = playerNames[1]
            end
            playerDropdown:UpdateOptions(playerNames, newDefault)
        end
        WasUIPro:Notify({ Title = "刷新成功", Content = "共 " .. #playerNames .. " 名玩家", Duration = 2 })
    end
})

playerDropdown = dynamicCategory:Dropdown({
    Title = "选择玩家",
    Values = {},
    Value = "无",
    Multi = false,
    Callback = function(selected)
        if selected and selected ~= "无" then
            local player = Players:FindFirstChild(selected)
            if player then
                local char = player.Character
                local pos = char and char:GetPivot() or Vector3.zero
                local info = string.format("坐标: X=%.1f Y=%.1f Z=%.1f", pos.X, pos.Y, pos.Z)
                dynamicPara:SetContent(info)
                dynamicPara:SetTitle("当前玩家 " .. selected)
            else
                dynamicPara:SetContent("无法获取玩家信息")
                dynamicPara:SetTitle("未选中玩家")
            end
        else
            dynamicPara:SetContent("请从下拉菜单选择一个玩家")
            dynamicPara:SetTitle("未选中玩家")
        end
    end
})

local dynamicPara = dynamicCategory:Paragraph({
    Title = "未选中玩家",
    Desc = "请从下拉菜单选择一个玩家",
    Icon = "user"
})

dynamicCategory:Button({
    Text = "随机传送演示",
    Icon = "send",
    Tooltip = "模拟传送至随机位置",
    Callback = function()
        if not playerDropdown.SelectedValue or playerDropdown.SelectedValue == "无" then
            WasUIPro:Notify({ Title = "错误", Content = "请先选择玩家", Duration = 2 })
            return
        end
        local targetName = playerDropdown.SelectedValue
        local targetPlayer = Players:FindFirstChild(targetName)
        if targetPlayer then
            local randomX = math.random(-100, 100)
            local randomZ = math.random(-100, 100)
            local info = string.format("模拟传送至 X=%.1f Z=%.1f", randomX, randomZ)
            dynamicPara:SetContent(info)
            dynamicPara:SetTitle("已传送 " .. targetName)
            WasUIPro:Notify({ Title = "传送", Content = "已传送至 " .. targetName, Duration = 2 })
        else
            dynamicPara:SetContent("玩家不存在，请刷新列表")
            dynamicPara:SetTitle("传送失败")
        end
    end
})

local styleCategory = dynamicTab:Category({ Title = "段落样式动态切换", IconName = "palette" })

local stylePara = styleCategory:Paragraph({
    Title = "默认标题",
    Desc = "默认描述文字，点击下方按钮可动态修改内容和样式",
    Icon = "file-text"
})

local function updateStyle(style)
    if style == "red" then
        stylePara.TitleLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        stylePara.ContentLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
        stylePara:SetTitle("红色主题")
        stylePara:SetContent("段落文字已变为红色")
    elseif style == "blue" then
        stylePara.TitleLabel.TextColor3 = Color3.fromRGB(100, 150, 255)
        stylePara.ContentLabel.TextColor3 = Color3.fromRGB(120, 170, 255)
        stylePara:SetTitle("蓝色主题")
        stylePara:SetContent("段落文字已变为蓝色")
    else
        stylePara.TitleLabel.TextColor3 = WasUIPro.CurrentTheme.Text
        stylePara.ContentLabel.TextColor3 = WasUIPro.CurrentTheme.Text
        stylePara:SetTitle("默认样式")
        stylePara:SetContent("段落文字已恢复默认颜色")
    end
end

styleCategory:Button({
    Text = "红色样式",
    Icon = "circle",
    Callback = function() updateStyle("red") end
})

styleCategory:Button({
    Text = "蓝色样式",
    Icon = "circle",
    Callback = function() updateStyle("blue") end
})

styleCategory:Button({
    Text = "默认样式",
    Icon = "refresh-cw",
    Callback = function() updateStyle("default") end
})

local extraTab = mainWindow:Tab({ Title = "额外演示" })

local extraCategory = extraTab:Category({ Title = "FeatureName 颜色展示", IconName = "palette" })
extraCategory:Toggle({
    Title = "不知道",
    Value = false,
    FeatureName = "FeatureA",
    Icon = "circle",
    Tooltip = "FeatureA 演示",
    Callback = function(state)
    
        WasUIPro:Notify({ Title = "FeatureA", Content = state and "开启" or "关闭", Duration = 1 })
    end
})

local highlightToggle
extraCategory:Toggle({
    Title = "透视",
    Value = false,
    FeatureName = "FeatureB",
    Icon = "circle",
    Tooltip = "透视",
    Callback = function(state)
        if state then
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local baseHighlight = Instance.new("Highlight")
            baseHighlight.Name = "Highlight"
            baseHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightToggle = {}
            highlightHighlightToggle = baseHighlight
            highlightToggle.Connections = {}

            local function applyHighlight(player)
                task.spawn(function()
                    repeat task.wait() until player.Character
                    local root = player.Character:WaitForChild("HumanoidRootPart")
                    if not root:FindFirstChild("Highlight") then
                        local clone = baseHighlight:Clone()
                        clone.Parent = root
                    end
                end)
            end

            for _,plr in ipairs(Players:GetPlayers()) do
                if plr ~= Players.LocalPlayer then
                    applyHighlight(plr)
                end
            end

            table.insert(highlightToggle.Connections, Players.PlayerAdded:Connect(function(p)
                if p ~= Players.LocalPlayer then
                    applyHighlight(p)
                end
            end))

            table.insert(highlightToggle.Connections, Players.PlayerRemoving:Connect(function(p)
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local root = p.Character.HumanoidRootPart
                    if root:FindFirstChild("Highlight") then
                        root.Highlight:Destroy()
                    end
                end
            end))
            WasUIPro:Notify({ Title = "透视", Content = "已开启", Duration = 1 })
        else
            if highlightToggle then
                for _,con in ipairs(highlightToggle.Connections) do
                    con:Disconnect()
                end
                for _,plr in ipairs(game:GetService("Players"):GetPlayers()) do
                    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                        local root = plr.Character.HumanoidRootPart
                        if root:FindFirstChild("Highlight") then
                            root.Highlight:Destroy()
                        end
                    end
                end
                highlightToggle = nil
            end
            WasUIPro:Notify({ Title = "透视", Content = "已关闭", Duration = 1 })
        end
    end
})


extraCategory:Toggle({
    Title = "",
    Value = false,
    FeatureName = "FeatureC",
    Icon = "circle",
    Tooltip = "装逼让你飞起来",
    Callback = function(state)
        
        WasUIPro:Notify({ Title = "FeatureC", Content = state and "已开启飞行" or "已关闭飞行", Duration = 1 })
    end
})

extraCategory:Toggle({
    Title = "挂机",
    Value = true,
    FeatureName = "FeatureD",
    Icon = "circle",
    Tooltip = "挂机",
    Callback = function(state)
        
        WasUIPro:Notify({ Title = "FeatureD", Content = state and "已开启防挂机" or "已关闭防挂机", Duration = 1 })
    end
})

local isVisible = true
Uis.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.F1 then
        isVisible = not isVisible
        mainWindow:SetVisible(isVisible)
    end
end)

WasUIPro:Notify({ Title = "初始化", Content = "WasUIPro 示例加载完成", Duration = 4 })