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

local basicTab = mainWindow:Tab({ Title = "TWISTED X 0.15" })
local basicCategory = basicTab:Category({ Title = "车辆", IconName = "layout-grid" })

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
basicCategory:Button({
    Text = "待更新",
    Icon = "car",
    Tooltip = "还不知道做啥",
    Callback = function()
        
    end
})


basicTab:Paragraph({
    Title = "关于JB",
    Desc = "jxndjdnjsnz自制",
    Icon = "info"
})

local advancedTab = mainWindow:Tab({ Title = "其他脚本" })

local advancedCategory = advancedTab:Category({ Title = "其他脚本", IconName = "sliders-horizontal" })

advancedCategory:ColorPickerButton({
    Title = "RB脚本",
    Default = Color3.fromRGB(153, 51, 255),
    ConfigKey = "jb",
    Callback = function(color, alpha)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/Rb-Hub"))()
    end
})

advancedCategory:ColorPickerButton({
    Title = "皮脚本",
    Default = Color3.fromRGB(153, 51, 255),
    ConfigKey = "jb",
    Callback = function(color, alpha)
        getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
    end
})

advancedCategory:ColorPickerButton({
    Title = "KG脚本",
    Default = Color3.fromRGB(153, 51, 255),
    ConfigKey = "jb",
    Callback = function(color, alpha)
        KG_SCRIPT = "张硕制作"
loadstring(request({Url="https://github.com/ZS-NB/KG/raw/main/张硕.lua"}).Body)()
-- QQ交流群819104139
    end
})
advancedCategory:ColorPickerButton({
    Title = "BS黑洞中心脚本",
    Default = Color3.fromRGB(153, 51, 255),
    ConfigKey = "jb",
    Callback = function(color, alpha)
        loadstring(game:HttpGet("https://gitee.com/BS_script/script/raw/master/BS_Script.Luau"))()
    end
})
local demoSliderTab = mainWindow:Tab({ Title = "通用" })
local sliderCategory = demoSliderTab:Category({ Title = "通用", IconName = "activity" })

sliderCategory:Button({
    Text = "飞行V3",
    Icon = "play",
    Tooltip = "已开启飞行",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kongbaNB/9178/refs/heads/main/fly.lua"))()
    end
})
sliderCategory:Button({
    Text = "待更新",
    Icon = "play",
    Tooltip = "",
    Callback = function()
        
    end
})
local dynamicTab = mainWindow:Tab({ Title = "终极战场" })
local dynamicCategory = dynamicTab:Category({ Title = "终极战场", IconName = "users" })

dynamicCategory:Button({
    Text = "篡改",
    Icon = "play",
    Tooltip = "玩的时候第一先开启这个功能",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/ubg-script/refs/heads/main/%E6%8B%A6%E6%88%AA.txt"))()
    end
})
dynamicCategory:Button({
    Text = "假防",
    Icon = "play",
    Tooltip = "关闭功能后，按一次防守即可取消",
    Value = false
    Callback = function(state)
        fakeBlockEnabled = state
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local BlockRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Combat"):WaitForChild("Block")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        local function enableBlock()
            pcall(function()
                BlockRemote:FireServer(true)
            end)
        end

        if fakeBlockEnabled then
            enableBlock()
        end

        if not loopRunning then
            loopRunning = true
            task.spawn(function()
                while true do
                    task.wait(0.01)
                    if fakeBlockEnabled then
                        local success, isBlocking = pcall(function()
                            return character:GetAttribute("IsBlocking")
                        end)
                        if success and not isBlocking then
                            enableBlock()
                        end
                    end
                end
            end)
        end
    end
})
dynamicCategory:Button({
    Text = "侧闪无冷却",
    Icon = "play",
    Tooltip = "",
    Value = false
    Callback = function(state)
        local dashCooldown = game:GetService("ReplicatedStorage").Settings.Cooldowns.Dash
        if state then
            dashCooldown.Value = 1
        else
            dashCooldown.Value = defaultCooldown
        end
    end
})
local defaultMeleeCooldown = game:GetService("ReplicatedStorage").Settings.Cooldowns.Melee.Value

dynamicCategory:Button({
    Text = "近战无冷却",
    Value = false,
    Icon = "play",
    Tooltip = "",
    Callback = function(state)
        local meleeCooldown = game:GetService("ReplicatedStorage").Settings.Cooldowns.Melee
        if state then
            meleeCooldown.Value = 1
        else
            meleeCooldown.Value = defaultMeleeCooldown
        end
    end
})
local defaultUltimateTimer = settings.Multipliers.UltimateTimer.Value
dynamicCategory:Button({
    Text = "延长大招时间",
    Icon = "play",
    Value = false,
    Tooltip = "",
    Callback = function(state)
        settings.Multipliers.UltimateTimer.Value = state and 100000 or defaultUltimateTimer
    end
})
dynamicCategory:Button({
    Text = "取消攻击后摇",
    Value = false,
    Icon = "play",
    Tooltip = "",
    Callback = function(state)
        settings.Toggles.DisableHitStun.Value = state
    end
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local wallCombo = ReplicatedStorage.Settings.Cooldowns.WallCombo
dynamicCategory:Button({
    Text = "墙打无冷却",
    Value = false,
    Icon = "play",
    Tooltip = "",
    Callback = function(state)
        if state then
            wallCombo.Value = 0
            print("WallCombo cooldown set to 0")
        else
            wallCombo.Value = 100
            print("WallCombo cooldown reset to 100")
        end
    end
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local wall = nil
pcall(function()
    wall = workspace.Map.Structural.Terrain:GetChildren()[5]:GetChildren()[12]
end)

if not wall then
    wall = Instance.new("Part")
    wall.Parent = workspace
end

wall.Size = Vector3.new(12,6,2)
wall.Transparency = 0.6
wall.Material = Enum.Material.SmoothPlastic
wall.Anchored = true
wall.CanCollide = true
wall.CFrame = wall.CFrame or CFrame.new(0,5,0)

if getconnections then
    for _, conn in pairs(getconnections(wall.AncestryChanged)) do
        conn:Disable()
    end
end

local mt = getrawmetatable(game)
setreadonly(mt,false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if self == wall and method == "Destroy" then
        return
    end
    return old(self, ...)
end)
setreadonly(mt,true)

local followConnection = nil
dynamicCategory:Button({
    Text = "随处墙打",
    Icon = "play",
    Value = false,
    Tooltip = "",
    Callback = function(state)
        if state then
            if not followConnection then
                followConnection = RunService.RenderStepped:Connect(function()
                    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        wall.CFrame = hrp.CFrame * CFrame.new(0,0,-8)
                    end
                end)
            end
        else
            if followConnection then
                followConnection:Disconnect()
                followConnection = nil
            end
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

extraCategory:Toggle({
    Title = "待更新",
    Value = false,
    FeatureName = "FeatureB",
    Icon = "circle",
    Tooltip = "透视",
    Callback = function(state)
        
    end
})


extraCategory:Toggle({
    Title = "待更新",
    Value = false,
    FeatureName = "FeatureC",
    Icon = "circle",
    Tooltip = "装逼让你飞起来",
    Callback = function(state)
        
        WasUIPro:Notify({ Title = "FeatureC", Content = state and "已开启飞行" or "已关闭飞行", Duration = 1 })
    end
})

extraCategory:Toggle({
    Title = "待更新",
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