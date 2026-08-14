local WasUIPro = loadstring(game:HttpGet("https://github.com/WasKKal/WasUI-For-Roblox/raw/refs/heads/main/WasUIPro.lua"))()
local VirtualUserService = game:GetService("VirtualUser")
local Uis = game:GetService("UserInputService")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
     VirtualUserService:CaptureMouse()
     VirtualUserService:Click2(Vector2.new() 
end)
local Players = game:GetService("Players")

WasUIPro:SetDefaultTheme("Dark")
WasUIPro:SetDefaultRainbowMode("流动")
WasUIPro:SetLanguage("中文") 

local mainWindow = WasUIPro:CreateWindow({
    Title = "WasUIPro 完整演示",
    WelcomeText = "展示所有控件及动态功能",
    MinimizedText = "WasUIPro",
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
             WasUIPro:Notify({ Title = "防挂机", Content = "已开启防挂机", Duration = 20 })
             WasUIPro:Notify({ Title = "关于", Content = "专门做Twisted追风类的脚本", Duration = 20 })
        end
    })
end)

local basicTab = mainWindow:Tab({ Title = "TWISTED" })
local basicCategory = basicTab:Category({ Title = "召唤车辆", IconName = "layout-grid" })

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
    Text = "召唤RAXPOL",
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
        WasUIPro:Notify({ Title = "按钮", Content = "你召唤了RAXPOL", Duration = 2 })
    end
})

basicTab:Paragraph({
    Title = "关于 WasJB",
    Desc = "专门做Twisted X 0.15,作者是jxndjdnjsnz",
    Icon = "info"
})

local advancedTab = mainWindow:Tab({ Title = "其他脚本" })
local advancedCategory = advancedTab:Category({ Title = "其他脚本", IconName = "sliders-horizontal" })

advancedCategory:Button({
    Text = "Rb脚本",
    Icon = "play",
    Tooltip = "切换Rb脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/Rb-Hub"))()
        WasUIPro:Notify({ Title = "按钮", Content = "已切换其他脚本", Duration = 2 })
        end
})
advancedCategory:Button({
    Text = "BS黑洞中心脚本",
    Icon = "play",
    Tooltip = "切换BS脚本",
    Callback = function()
        loadstring(game:HttpGet("https://gitee.com/BS_script/script/raw/master/BS_Script.Luau"))()
        WasUIPro:Notify({ Title = "按钮", Content = "已切换其他脚本", Duration = 2 })
        end
})

WasUIPro:Notify({ Title = "初始化", Content = "WasUIPro 示例加载完成", Duration = 4 })