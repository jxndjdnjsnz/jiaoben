local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/china-ui/refs/heads/main/main%20(6).lua"))()

local Window = WindUI:CreateWindow({
    Title = "Private Hub",
    Icon = "rbxassetid://7733654864",
    Author = "ScriptDev",
    Folder = "PrivateHub",
    Size = UDim2.fromOffset(520, 420),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = true,
        Callback = function() end,
        Anonymous = false
    },
    SideBarWidth = 210,
    ScrollBarEnabled = true
})

local StatusTag = Window:Tag({
    Title = "Status : Idle",
    Radius = 8,
    Color = Color3.fromRGB(80, 180, 255),
})

local MainTab = Window:CreateTab("通用功能", 1340479)
local VisualTab = Window:CreateTab("视觉", 1340481)
local MiscTab = Window:CreateTab("杂项", 1340483)

local VirtualUser = game:GetService("VirtualUser")
local AntiAfkRunning = false

MainTab:CreateToggle("玩家ESP", false, function(state)
    
    StatusTag:Update({Title = state and "Status : ESP ON" or "Status : Idle"})
end)

MainTab:CreateToggle("挂机防踢", false, function(state)
    AntiAfkRunning = state
    if state then
        StatusTag:Update({Title = "Status : AntiAFK ON"})
        task.spawn(function()
            while AntiAfkRunning do
                VirtualUser:CaptureMousePosition(Vector2.new(0,0))
                VirtualUser:Button1Down(Enum.UserInputState.Begin)
                task.wait(58)
            end
        end)
    else
        StatusTag:Update({Title = "Status : Idle"})
    end
end)

MainTab:CreateButton("重置本地角色", function()
    game.Players.LocalPlayer.Character:HumanoidRootPart.CFrame = CFrame.new(0,50,0)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

VisualTab:CreateSlider("视野FOV", 70, 30, 120, 1, function(val)
    workspace.CurrentCamera.FieldOfView = val
end)

VisualTab:CreateToggle("无雾", false, function(state)
    if state then
        workspace.FogEnd = 100000
        workspace.FogStart = 100000
    else
        workspace.FogEnd = 1000
        workspace.FogStart = 0
    end
end)

MiscTab:CreateDropdown("天气", {"默认","阴天","浓雾"}, "默认", function(selected)
    if selected == "阴天" then
        workspace.Ambient = Color3.new(0.4,0.4,0.4)
    elseif selected == "浓雾" then
        workspace.FogColor = Color3.new(0.2,0.2,0.2)
        workspace.FogEnd = 120
    else
        workspace.Ambient = Color3.new(1,1,1)
    end
end)

MiscTab:CreateInputBox("自定义打印文字", "", function(text)
    print(text)
end)

Window:AddKeybind("RightControl", function()
    Window:Toggle()
end)
