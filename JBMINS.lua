local WindUI = require("./src/Init")
local Localization = WindUI:Localization({
    Enabled = true,
    Prefix = "loc:",
    DefaultLanguage = "en",
    Translations = {
        ["en"] = {
            ["WINDUI_EXAMPLE"] = "WindUI Example",
            ["WELCOME"] = "Welcome to WindUI!",
            ["LIB_DESC"] = "Beautiful UI library for Roblox",
            ["SETTINGS"] = "Settings",
            ["APPEARANCE"] = "Appearance",
            ["FEATURES"] = "Features",
            ["UTILITIES"] = "Utilities",
            ["UI_ELEMENTS"] = "UI Elements",
            ["CONFIGURATION"] = "Configuration",
            ["SAVE_CONFIG"] = "Save Configuration",
            ["LOAD_CONFIG"] = "Load Configuration",
            ["THEME_SELECT"] = "Select Theme",
            ["TRANSPARENCY"] = "Window Transparency",
            ["LOCKED_TAB"] = "Locked Tab"
        }
    }
})
local CONST = {
    WINDOW_WIDTH = 580,
    WINDOW_HEIGHT = 490,
    TIME_REFRESH_RATE = 1,
    TRANSPARENCY_STEP = 0.1,
    NOTIFY_DEFAULT_DURATION = 2,
    RANDOM_DROPDOWN_COUNT = 80
}
WindUI.TransparencyValue = 0.2
WindUI:SetTheme("Dark")
local function gradient(startHex, endHex, text)
    local startColor = Color3.fromHex(startHex)
    local endColor = Color3.fromHex(endHex)
    local result = ""
    local strLen = #text
    if strLen == 0 then return text end
    for i = 1, strLen do
        local t = (i - 1) / (strLen - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, text:sub(i, i))
    end
    return result
end
WindUI:Popup({
    Title = gradient("#6A11CB", "#2575FC", "WindUI Demo"),
    Icon = "sparkles",
    Content = "loc:LIB_DESC",
    Buttons = {
        {
            Title = "Get Started",
            Icon = "arrow-right",
            Variant = "Primary",
            Callback = function() end
        }
    }
})
local Window = WindUI:CreateWindow({
    Title = "loc:WINDUI_EXAMPLE",
    Icon = "geist:window",
    Author = "loc:WELCOME",
    Folder = "WindUI_Example",
    Size = UDim2.fromOffset(CONST.WINDOW_WIDTH, CONST.WINDOW_HEIGHT),
    Theme = "Dark",
    HidePanelBackground = false,
    NewElements = false,
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            WindUI:Notify({
                Title = "User Profile",
                Content = "User profile clicked!",
                Duration = CONST.NOTIFY_DEFAULT_DURATION
            })
        end
    },
    Acrylic = false,
    HideSearchBar = false,
    SideBarWidth = 200,
    OpenButton = {
        Title = "Open .ftgs hub UI",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 3,
        Enabled = true,
        OnlyMobile = false,
        Color = ColorSequence.new(Color3.fromHex("#30FF6A"), Color3.fromHex("#e7ff2f"))
    }
})
Window.User:SetAnonymous(true)
Window:SetIconSize(48)
Window:Tag({
    Title = "v1.6.4",
    Color = Color3.fromHex("#30ff6a")
})
Window:Tag({
    Title = "Beta",
    Color = Color3.fromHex("#315dff")
})
local TimeTag = Window:Tag({
    Title = "--:--",
    Radius = 0,
    Color = WindUI:Gradient({
        ["0"] = { Color = Color3.fromHex("#FF0F7B"), Transparency = 0 },
        ["100"] = { Color = Color3.fromHex("#F89B29"), Transparency = 0 },
    }, { Rotation = 45 }),
})
local hue = 0
local timeThread = task.spawn(function()
    while task.wait(CONST.TIME_REFRESH_RATE) do
        if not Window.Root or not Window.Root:IsDescendantOf(game:GetService("Players").LocalPlayer:WaitForPlayerGui()) then
            break
        end
        local now = os.date("*t")
        local hours = string.format("%02d", now.hour)
        local minutes = string.format("%02d", now.min)
        hue = (hue + 0.01) % 1
        TimeTag:SetTitle(hours .. ":" .. minutes)
    end
end)
Window:CreateTopbarButton("theme-switcher", "moon", function()
    local target = WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark"
    WindUI:SetTheme(target)
    WindUI:Notify({
        Title = "Theme Changed",
        Content = "Current theme: " .. WindUI:GetCurrentTheme(),
        Duration = CONST.NOTIFY_DEFAULT_DURATION
    })
end, 990)
local Sections = {
    Main = Window:Section({ Title = "loc:FEATURES", Opened = true }),
    Settings = Window:Section({ Title = "loc:SETTINGS", Opened = true }),
    Utilities = Window:Section({ Title = "loc:UTILITIES", Opened = true })
}
local function createLockedTab(count)
    local tabs = {}
    for i = 1, count do
        table.insert(tabs, Window:Tab({
            Title = "loc:LOCKED_TAB",
            Icon = "bird",
            Locked = true
        }))
    end
    return tabs
end
local Tabs = {
    Elements = Sections.Main:Tab({ Title = "loc:UI_ELEMENTS", Icon = "layout-grid", Desc = "UI Elements Example" }),
    Appearance = Sections.Settings:Tab({ Title = "loc:APPEARANCE", Icon = "brush" }),
    Config = Sections.Utilities:Tab({ Title = "loc:CONFIGURATION", Icon = "settings" }),
    Locked = createLockedTab(5)
}
Tabs.Elements:Section({ Title = "Interactive Components", TextSize = 20 })
Tabs.Elements:Section({ Title = "Explore WindUI's powerful elements", TextSize = 16, TextTransparency = .25 })
Tabs.Elements:Divider()
local ElementsSection = Tabs.Elements:Section({
    Title = "Section Example",
    Icon = "bird",
    TextXAlignment = "Center",
    Opened = true,
    Box = true,
})
Tabs.Elements:Section({ Title = "Section Example 2", TextXAlignment = "Center", Opened = true, Box = true })
Tabs.Elements:Section({ Title = "Section Example 2", TextXAlignment = "Center", Opened = true })
local toggleState = false
local featureToggle = ElementsSection:Toggle({
    Title = "Enable Features",
    Flag = "featureToggle",
    Value = false,
    Callback = function(state)
        toggleState = state
        WindUI:Notify({
            Title = "Features",
            Content = state and "Features Enabled" or "Features Disabled",
            Icon = state and "check" or "x",
            Duration = CONST.NOTIFY_DEFAULT_DURATION
        })
    end
})
local intensitySlider = ElementsSection:Slider({
    Title = "Effect Intensity",
    Desc = "Adjust the effect strength",
    Flag = "intensitySlider",
    Value = { Min = 0, Max = 100, Default = 50 },
    Callback = function(value)
        print("Intensity set to:", value)
    end
})
intensitySlider:SetMin(20)
intensitySlider:SetMax(200)
intensitySlider:Set(100)
local iconNames = {}
for name, _ in next, WindUI.Creator.Icons.Icons.lucide do
    table.insert(iconNames, name)
end
local dropdownLargeData = {}
for i = 1, CONST.RANDOM_DROPDOWN_COUNT do
    local randomIcon = iconNames[math.random(1, #iconNames)]
    table.insert(dropdownLargeData, {
        Title = "Test " .. i,
        Icon = randomIcon
    })
end
local dropdownSmallData = {
    { Title = "Test 1", Icon = "bird" },
    { Title = "Test 2", Icon = "house" },
    { Title = "Test 3", Icon = "droplet" },
    { Title = "Test 4", Icon = "user" }
}
ElementsSection:Space()
local testDropdown = ElementsSection:Dropdown({
    Title = "Dropdown test",
    Values = dropdownLargeData,
    Flag = "testDropdown",
    SearchBarEnabled = true,
    Value = "Test 1",
    Callback = function() end
})
local testDropdown2 = ElementsSection:Dropdown({
    Title = "Dropdown test 2",
    Flag = "testDropdown2",
    Values = dropdownSmallData,
    SearchBarEnabled = true,
    Value = "Test 1",
    Callback = function(opt)
        print("Selected: " .. opt.Title .. " | Icon: " .. opt.Icon)
    end
})
local testDropdown3 = ElementsSection:Dropdown({
    Title = "Dropdown test 3",
    Flag = "testDropdown3",
    Values = { {Title = "Test 1"}, {Title = "Test 2"} },
    SearchBarEnabled = true,
    Value = "Test 1",
    Callback = function() end
})
ElementsSection:Divider()
ElementsSection:Button({
    Title = "Show Notification",
    Icon = "bell",
    Callback = function()
        WindUI:Notify({
            Title = "Hello WindUI!",
            Content = "This is a sample notification",
            Icon = "bell",
            Duration = 3
        })
    end
})
ElementsSection:Colorpicker({
    Title = "Select Color",
    Default = Color3.fromHex("#30ff6a"),
    Transparency = 0,
    Callback = function(color, transparency)
        WindUI:Notify({
            Title = "Color Changed",
            Content = string.format("Hex: %s\nAlpha: %.1f", color:ToHex(), transparency),
            Duration = CONST.NOTIFY_DEFAULT_DURATION
        })
    end
})
ElementsSection:Code({
    Title = "my_code.luau",
    Code = [[print("Hello world!")]],
    OnCopy = function()
        print("Copied to clipboard!")
        WindUI:Notify({
            Title = "Copied",
            Content = "Code copied to clipboard",
            Duration = CONST.NOTIFY_DEFAULT_DURATION
        })
    end
})
Tabs.Appearance:Paragraph({
    Title = "Customize Interface",
    Desc = "Personalize your experience",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})
local themeList = {}
for themeName in pairs(WindUI:GetThemes()) do
    table.insert(themeList, themeName)
end
table.sort(themeList)
local syncLock = { themeSwitch = true, dropdownSwitch = true }
local themeDropdown = Tabs.Appearance:Dropdown({
    Title = "loc:THEME_SELECT",
    Values = themeList,
    Flag = "themeDropdown",
    SearchBarEnabled = true,
    MenuWidth = 280,
    Value = "Dark",
    Callback = function(theme)
        syncLock.dropdownSwitch = false
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "Theme Applied",
            Content = theme,
            Icon = "palette",
            Duration = CONST.NOTIFY_DEFAULT_DURATION
        })
        syncLock.dropdownSwitch = true
    end
})
local transparencySlider = Tabs.Appearance:Slider({
    Title = "loc:TRANSPARENCY",
    Value = { Min = 0, Max = 1, Default = 0 },
    Flag = "transparencySlider",
    Step = CONST.TRANSPARENCY_STEP,
    Callback = function(val)
        Window:SetBackgroundTransparency(val)
        Window:SetBackgroundImageTransparency(val)
    end
})
local ThemeToggle = Tabs.Appearance:Toggle({
    Title = "Enable Dark Mode",
    Desc = "Use dark color scheme",
    Value = true,
    Callback = function(state)
        if syncLock.themeSwitch then
            WindUI:Set(state and "Dark" or "Light")
        end
        if syncLock.dropdownSwitch then
            themeDropdown:Select(state and "Dark" or "Light")
        end
    end
})
WindUI:OnThemeChange(function(currentTheme)
    syncLock.themeSwitch = false
    ThemeToggle:Set(currentTheme == "Dark")
    task.wait(0.05)
    syncLock.themeSwitch = true
end)
Tabs.Appearance:Button({
    Title = "Create New Theme",
    Icon = "plus",
    Callback = function()
        Window:Dialog({
            Title = "Create Theme",
            Content = "This feature is coming soon!",
            Buttons = {
                { Title = "OK", Variant = "Primary" }
            }
        })
    end
})
Tabs.Config:Paragraph({
    Title = "Configuration Manager",
    Desc = "Save and load your settings",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})
local configName = "default"
local configFile = nil
local MyPlayerData = {
    name = "Player1",
    level = 1,
    inventory = { "sword", "shield", "potion" }
}
local configInput = Tabs.Config:Input({
    Title = "Config Name",
    Value = configName,
    Callback = function(val)
        configName = val and val ~= "" and val or "default"
    end
})
local ConfigManager = Window.ConfigManager
Tabs.Config:Dropdown({
    Title = "Select Config",
    Values = ConfigManager and ConfigManager:AllConfigs() or {},
    Value = configName,
    AllowNone = false,
    Callback = function(val)
        configName = val
        configInput:Set(configName)
    end
})
if ConfigManager then
    ConfigManager:Init(Window)
    ConfigManager:Register(featureToggle)
    ConfigManager:Register(intensitySlider)
    ConfigManager:Register(testDropdown)
    ConfigManager:Register(themeDropdown)
    ConfigManager:Register(transparencySlider)
    Tabs.Config:Space()
    Tabs.Config:Button({
        Title = "loc:SAVE_CONFIG",
        Icon = "save",
        IconAlign = "Left",
        Justify = "Center",
        Color = Color3.fromHex("315dff"),
        Callback = function()
            if not ConfigManager then return end
            configFile = ConfigManager:CreateConfig(configName)
            configFile:Set("playerData", MyPlayerData)
            configFile:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
            local ok, msg = pcall(function() return configFile:Save() end)
            if ok and msg then
                WindUI:Notify({
                    Title = "loc:SAVE_CONFIG",
                    Content = "Saved as: " .. configName,
                    Icon = "check",
                    Duration = CONST.NOTIFY_DEFAULT_DURATION
                })
            else
                WindUI:Notify({
                    Title = "Error",
                    Content = "Failed to save config",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })
    Tabs.Config:Space()
    Tabs.Config:Button({
        Title = "loc:LOAD_CONFIG",
        IconAlign = "Left",
        Justify = "Center",
        Color = Color3.fromHex("315dff"),
        Icon = "folder",
        Callback = function()
            if not ConfigManager then return end
            configFile = ConfigManager:CreateConfig(configName)
            local ok, loadedData = pcall(function() return configFile:Load() end)
            if ok and loadedData then
                if loadedData.playerData then
                    MyPlayerData = loadedData
                end
                local lastSave = loadedData.lastSave or "Unknown"
                WindUI:Notify({
                    Title = "loc:LOAD_CONFIG",
                    Content = string.format("Loaded: %s\nLast save: %s", configName, lastSave),
                    Icon = "refresh-cw",
                    Duration = 5
                })
                Tabs.Config:Paragraph({
                    Title = "Player Data",
                    Desc = string.format(
                        "Name: %s\nLevel: %d\nInventory: %s",
                        MyPlayerData.name,
                        MyPlayerData.level,
                        table.concat(MyPlayerData.inventory, ", ")
                    )
                })
            else
                WindUI:Notify({
                    Title = "Error",
                    Content = "Failed to load config",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })
else
    Tabs.Config:Paragraph({
        Title = "Config Manager Not Available",
        Desc = "This feature requires ConfigManager",
        Image = "alert-triangle",
        ImageSize = 20,
        Color = "White"
    })
end
Tabs.Config:Paragraph({
    Title = "Github Repository",
    Desc = "github.com/Footagesus/WindUI",
    Image = "github",
    ImageSize = 20,
    Color = "Grey",
    Buttons = {
        {
            Title = "Copy Link",
            Icon = "copy",
            Variant = "Tertiary",
            Callback = function()
                setclipboard("https://github.com/Footagesus/WindUI")
                WindUI:Notify({
                    Title = "Copied!",
                    Content = "GitHub link copied to clipboard",
                    Duration = CONST.NOTIFY_DEFAULT_DURATION
                })
            end
        }
    }
})
Window:OnClose(function()
    print("Window closed")
    if ConfigManager and configFile then
        local ok = pcall(function()
            configFile:Set("playerData", MyPlayerData)
            configFile:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
            return configFile:Save()
        end)
        if not ok then
            print("Auto-save failed on window close")
        end
    end
end)
Window:OnDestroy(function()
    print("Window destroyed, terminating time thread")
    task.cancel(timeThread)
end)
Window:OnOpen(function()
    print("Window opened")
end)
Window:UnlockAll()
local lockedElements = Window:GetUnlocked()
if lockedElements and #lockedElements > 0 then
    print("Locked Elements in Window: ")
    local langTrans = Localization.Translations[WindUI.Creator.Language] or Localization.Translations[Localization.DefaultLanguage]
    for _, elem in lockedElements do
        local rawTitle = elem.Title or "Unknown"
        local displayTitle = rawTitle
        if rawTitle:sub(1, #Localization.Prefix) == Localization.Prefix then
            local key = rawTitle:gsub("^" .. Localization.Prefix, "")
            displayTitle = langTrans[key] or rawTitle
        end
        print("- " .. displayTitle)
    end
end
