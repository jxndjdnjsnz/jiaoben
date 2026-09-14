local cloneref = (cloneref or clonereference or function(instance)
    return instance
end)
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local WindUI
do
    local ok, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
    end)
    if not ok then
        warn("❌ WindUI 加载失败，网络无法访问GitHub raw：", result)
        return
    end
    WindUI = result
end

local Window = WindUI:CreateWindow({
    Title = "Private Hub",
    Folder = "PrivateHub_WindUI",
    Icon = "solar:home-2-bold-duotone",
    Size = UDim2.fromOffset(420, 340),
    OpenButton = {
        Title = "Open",
        CornerRadius = UDim.new(1,0),
        Enabled = true,
        Draggable = true,
        Scale = 0.3
    },
    Topbar = {
        Height = 36,
        ButtonsType = "Mac"
    }
})

Window:Tag({
    Title = "Ready",
    Color = Color3.fromHex("#22bb55"),
    Border = true
})

local Green = Color3.fromHex("#10C550")
local Blue = Color3.fromHex("#257AF7")
local Orange = Color3.fromHex("#ECA201")
local Red = Color3.fromHex("#ef4f1d")

local MainTab = Window:Tab({
    Title = "通用",
    Icon = "solar:settings-bold"
})

local VisualTab = Window:Tab({
    Title = "视觉",
    Icon = "solar:eye-bold",
    IconColor = Blue
})

local MiscTab = Window:Tab({
    Title = "杂项",
    Icon = "solar:stack-2-bold",
    IconColor = Orange
})

local MainGroup = MainTab:Group({})

local antiAfkRunning = false
MainGroup:Toggle({
    Title = "挂机防踢",
    Desc = "模拟输入防止闲置踢出",
    Value = false,
    Callback = function(state)
        antiAfkRunning = state
        if state then
            WindUI:Notify({
                Title = "防踢已开启",
                Content = "将持续模拟用户输入",
                Duration = 2
            })
            task.spawn(function()
                while antiAfkRunning do
                    VirtualUser:CaptureMousePosition(Vector2.new(0,0))
                    VirtualUser:Button1Down(Enum.UserInputState.Begin)
                    task.wait(58)
                end
            end)
        else
            WindUI:Notify({
                Title = "防踢已关闭",
                Duration = 2
            })
        end
    end
})

MainGroup:Space()

MainGroup:Button({
    Title = "召唤 Dominator 1",
    Color = Red,
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").SpawnCar
        if Event and Event:IsA("RemoteEvent") then
            Event:FireServer("Dominator 1")
            WindUI:Notify({Title="车辆召唤",Content="Dominator 1 请求已发送",Duration=2})
        else
            WindUI:Notify({Title="错误",Content="找不到SpawnCar事件",Duration=3})
        end
    end
})

MainGroup:Button({
    Title = "召唤 Dominator 2",
    Color = Red,
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").SpawnCar
        if Event and Event:IsA("RemoteEvent") then
            Event:FireServer("Dominator 2")
            WindUI:Notify({Title="车辆召唤",Content="Dominator 2 请求已发送",Duration=2})
        else
            WindUI:Notify({Title="错误",Content="找不到SpawnCar事件",Duration=3})
        end
    end
})

MainGroup:Button({
    Title = "召唤 Dominator 3",
    Color = Red,
    Callback = function()
        local Event = game:GetService("ReplicatedStorage").SpawnCar
        if Event and Event:IsA("RemoteEvent") then
            Event:FireServer("Dominator 3")
            WindUI:Notify({Title="车辆召唤",Content="Dominator 3 请求已发送",Duration=2})
        else
            WindUI:Notify({Title="错误",Content="找不到SpawnCar事件",Duration=3})
        end
    end
})

MainGroup:Space()

MainGroup:Button({
    Title = "重置本地角色",
    Color = Orange,
    Callback = function()
        local lp = game.Players.LocalPlayer
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.Health = 0
        end
        WindUI:Notify({Title="角色已重置", Duration=2})
    end
})

MainGroup:Space()

MainGroup:Keybind({
    Title = "UI 切换快捷键",
    Desc = "按下按键显示/隐藏窗口",
    Value = "RightControl",
    Callback = function(keyCode)
        Window:SetToggleKey(Enum.KeyCode[keyCode])
    end
})

local VisualGroup = VisualTab:Group({})

VisualGroup:Slider({
    Title = "相机FOV视野",
    Value = {Min=30, Max=120, Default=70},
    Step = 1,
    IsTooltip = true,
    Callback = function(val)
        workspace.CurrentCamera.FieldOfView = val
    end
})

VisualGroup:Space()

VisualGroup:Toggle({
    Title = "无雾效果",
    Value = false,
    Callback = function(state)
        if state then
            workspace.FogStart = 100000
            workspace.FogEnd = 100000
        else
            workspace.FogStart = 0
            workspace.FogEnd = 1000
        end
    end
})

local MiscGroup = MiscTab:Group({})
local weatherList = {"默认","阴天","浓雾"}

MiscGroup:Dropdown({
    Title = "环境天气",
    Values = weatherList,
    Value = "默认",
    Callback = function(selected)
        if selected == "阴天" then
            local cloneref = (cloneref or clonereference or function(instance)
    return instance
end)
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local WindUI
do
    local ok, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
    end)
    if not ok then
        warn("❌ WindUI 加载失败，网络无法访问GitHub raw：", result)
        return
    end
    WindUI = result
end

local Window = WindUI:CreateWindow({
    Title = "Private Hub",
    Folder = "PrivateHub_WindUI",
    Icon = "solar:home-2-bold-duotone",
    Size = UDim2.fromOffset(420, 340),
    OpenButton = {
        Title = "Open",
        CornerRadius = UDim.new(1,0),
        Enabled = true,
        Draggable = true,
        Scale = 0.3
    },
    Topbar = {
        Height = 36,
        ButtonsType = "Mac"
    }
})

Window:Tag({
    Title = "Ready",
    Color = Color3.fromHex("#22bb55"),
    Border = true
})

local Green = Color3.fromHex("#10C550")
local Blue = Color3.fromHex("#257AF7")
local Orange = Color3.fromHex("#ECA201")
local Red = Color3.fromHex("#ef4f1d")

local MainTab = Window:Tab({
    Title = "通用",
    Icon = "solar:settings-bold"
})

local VisualTab = Window:Tab({
    Title = "视觉",
    Icon = "solar:eye-bold",
    IconColor = Blue
})

local MiscTab = Window:Tab({
    Title = "杂项",
    Icon = "solar:stack-2-bold",
    IconColor = Orange
})

local MainGroup = MainTab:Group({})

local antiAfkRunning = false
MainGroup:Toggle({
    Title = "挂机防踢",
    Desc = "模拟输入防止闲置踢出",
    Value = false,
    Callback = function(state)
        antiAfkRunning = state
        if state then
            WindUI:Notify({
                Title = "防踢已开启",
                Content = "将持续模拟用户输入",
                Duration = 2
            })
            task.spawn(function()
                while antiAfkRunning do
                    VirtualUser:CaptureMousePosition(Vector2.new(0,0))
                    VirtualUser:Button1Down(Enum.UserInputState.Begin)
                    task.wait(58)
                end
            end)
        else
            WindUI:Notify({
                Title = "防踢已关闭",
                Duration = 2
            })
        end
    end
})

MainGroup:Space()

MainGroup:Button({
    Title = "召唤 Dominator 1",
    Color = Red,
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
                GetNil("PlayersCar", "1_45299137")
        )
        local Event = game:GetService("ReplicatedStorage").SpawnCar
        if Event and Event:IsA("RemoteEvent") then
            Event:FireServer("Dominator 1")
            WindUI:Notify({Title="车辆召唤",Content="Dominator 1 请求已发送",Duration=2})
        else
            WindUI:Notify({Title="错误",Content="找不到SpawnCar事件",Duration=3})
        end
    end
})

MainGroup:Button({
    Title = "召唤 Dominator 2",
    Color = Red,
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
                GetNil("PlayersCar", "1_45299137")
        )
        local Event = game:GetService("ReplicatedStorage").SpawnCar
        if Event and Event:IsA("RemoteEvent") then
            Event:FireServer("Dominator 2")
            WindUI:Notify({Title="车辆召唤",Content="Dominator 2 请求已发送",Duration=2})
        else
            WindUI:Notify({Title="错误",Content="找不到SpawnCar事件",Duration=3})
        end
    end
})

MainGroup:Button({
    Title = "召唤 Dominator 3",
    Color = Red,
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
                GetNil("PlayersCar", "1_45299137")
        )
        local Event = game:GetService("ReplicatedStorage").SpawnCar
        if Event and Event:IsA("RemoteEvent") then
            Event:FireServer("Dominator 3")
            WindUI:Notify({Title="车辆召唤",Content="Dominator 3 请求已发送",Duration=2})
        else
            WindUI:Notify({Title="错误",Content="找不到SpawnCar事件",Duration=3})
        end
    end
})

MainGroup:Space()

MainGroup:Button({
    Title = "重置本地角色",
    Color = Orange,
    Callback = function()
        local lp = game.Players.LocalPlayer
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.Health = 0
        end
        WindUI:Notify({Title="角色已重置", Duration=2})
    end
})

MainGroup:Space()

MainGroup:Keybind({
    Title = "UI 切换快捷键",
    Desc = "按下按键显示/隐藏窗口",
    Value = "RightControl",
    Callback = function(keyCode)
        Window:SetToggleKey(Enum.KeyCode[keyCode])
    end
})

local VisualGroup = VisualTab:Group({})

VisualGroup:Slider({
    Title = "相机FOV视野",
    Value = {Min=30, Max=120, Default=70},
    Step = 1,
    IsTooltip = true,
    Callback = function(val)
        workspace.CurrentCamera.FieldOfView = val
    end
})

VisualGroup:Space()

VisualGroup:Toggle({
    Title = "无雾效果",
    Value = false,
    Callback = function(state)
        if state then
            workspace.FogStart = 100000
            workspace.FogEnd = 100000
        else
            workspace.FogStart = 0
            workspace.FogEnd = 1000
        end
    end
})

local MiscGroup = MiscTab:Group({})
local weatherList = {"默认","阴天","浓雾"}

MiscGroup:Dropdown({
    Title = "环境天气",
    Values = weatherList,
    Value = "默认",
    Callback = function(selected)
        if selected == "阴天" then
            workspace.Ambient = Color3.new(0.4,0.4,0.4)
         elseif selected == "浓雾" then
             workspace.FogColor = Color3.new(0.2,0.2,0.2)
             workspace.FogEnd = 120
         else
             workspace.Ambient = Color3.new(1,1,1)
             workspace.FogColor = Color3.new(1,1,1)
         end
         WindUI:Notify({Title="天气已切换："..selected, Duration=2})
     end
 })
 MiscGroup:Space()
 MiscGroup:Input({
     Title = "控制台打印文本",
     Placeholder = "输入内容按下回车",
     Callback = function(text)
         print("[UserInput]", text)
         WindUI:Notify({Title="已打印", Content=text, Duration=2})
     end
 })