---@diagnostic disable: lowercase-global
-- univ.yx is required for most of the scripts
-- modded for mobile

function ismob()
    return Services.ui.TouchEnabled
end

-- Variables
prefix = "!"
Services = {
ui = game:GetService("UserInputService"),
run = game:GetService("RunService"),
http = game:GetService("HttpService"),
tween = game:GetService("TweenService"),
repst = game:GetService("ReplicatedStorage"),
text = game:GetService("TextService"),
core = game:GetService("CoreGui"),
collection = game:GetService("CollectionService")
}
yx = {}
yx.players = game:GetService("Players")
yx.player = yx.players.LocalPlayer
yx.mouse = yx.player:GetMouse()
yx.cam = workspace.CurrentCamera

function me ()
    if yx.players:FindFirstChild("yx_doomspire") and yx.player.Name ~= "yx_doomspire" then
        return yx.players:FindFirstChild("yx_doomspire")
    end
end

files = {}
files.plugins = {}
files.toggles = {}

-- Instances:

gui = Instance.new("ScreenGui")
ClickGui = Instance.new("Frame")
Pages = Instance.new("Frame")
yx.Pages = Pages
local UIPageLayout = Instance.new("UIPageLayout")
Btns = Instance.new("ScrollingFrame")
yx.Btns = Btns
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local UICorner = Instance.new("UICorner")
CmdBar = Instance.new("Frame")
yx.CmdBar = CmdBar
local UICorner_2 = Instance.new("UICorner")
local CmdTextbox = Instance.new("TextBox")
local CmdEnter = Instance.new("TextButton")
local UIPadding_2 = Instance.new("UIPadding")

--Properties:

gui.Name = "CmdYX"
gui.Parent = Services.core

ClickGui.Name = "ClickGui"
ClickGui.Parent = gui
ClickGui.AnchorPoint = Vector2.new(0.5, 0.5)
ClickGui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ClickGui.BackgroundTransparency = 0.600
ClickGui.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClickGui.BorderSizePixel = 0
ClickGui.ClipsDescendants = true
ClickGui.Position = UDim2.new(0.5, 0, 0.449999988, 0)
ClickGui.Size = UDim2.new(0.800000012, 0, 0.699999988, 0)
ClickGui.Visible = false

Pages.Name = "Pages"
Pages.Parent = ClickGui
Pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pages.BackgroundTransparency = 1.000
Pages.BorderColor3 = Color3.fromRGB(0, 0, 0)
Pages.BorderSizePixel = 0
Pages.Position = UDim2.new(0, 0, 0.129999995, 0)
Pages.Size = UDim2.new(1, 0, 0.870000005, 0)

UIPageLayout.Parent = Pages
UIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIPageLayout.Animated = false
UIPageLayout.EasingDirection = Enum.EasingDirection.InOut
UIPageLayout.EasingStyle = Enum.EasingStyle.Cubic
UIPageLayout.Padding = UDim.new(1, 0)
UIPageLayout.TweenTime = 0.500

Btns.Name = "Btns"
Btns.Parent = ClickGui
Btns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Btns.BackgroundTransparency = 1.000
Btns.BorderColor3 = Color3.fromRGB(0, 0, 0)
Btns.BorderSizePixel = 0
Btns.ClipsDescendants = false
Btns.Selectable = false
Btns.Size = UDim2.new(1, 0, 0.129999995, 0)
Btns.CanvasSize = UDim2.new(0, 0, 0, 0)
Btns.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
Btns.ScrollBarThickness = 5
Btns.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
Btns.AutomaticCanvasSize = Enum.AutomaticSize.X

UIListLayout.Parent = Btns
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.00999999978, 0)

UIPadding.Parent = Btns
UIPadding.PaddingLeft = UDim.new(0.00999999978, 0)
UIPadding.PaddingTop = UDim.new(0.100000001, 0)

UICorner.CornerRadius = UDim.new(0.0299999993, 0)
UICorner.Parent = ClickGui

CmdBar.Name = "CmdBar"
CmdBar.Parent = gui
CmdBar.AnchorPoint = Vector2.new(0.5, 0.5)
CmdBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CmdBar.BackgroundTransparency = 0.600
CmdBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
CmdBar.BorderSizePixel = 0
CmdBar.Position = UDim2.new(0.5, 0, 0.850000024, 0)
CmdBar.Size = UDim2.new(0.800000012, 0, 0.0700000003, 0)
CmdBar.Visible = false

UICorner_2.CornerRadius = UDim.new(0.200000003, 0)
UICorner_2.Parent = CmdBar

CmdTextbox.Name = "CmdTextbox"
CmdTextbox.Parent = CmdBar
CmdTextbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CmdTextbox.BackgroundTransparency = 1.000
CmdTextbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
CmdTextbox.BorderSizePixel = 0
CmdTextbox.Size = UDim2.new(0.9, 0, 1, 0)
CmdTextbox.ZIndex = 10
CmdTextbox.Font = Enum.Font.SourceSans
CmdTextbox.Text = ""
CmdTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdTextbox.TextSize = 24.000
CmdTextbox.TextStrokeTransparency = 0.000
CmdTextbox.TextXAlignment = Enum.TextXAlignment.Left
CmdTextbox.ClearTextOnFocus = false

CmdEnter.Name = "CmdEnter"
CmdEnter.Parent = CmdBar
CmdEnter.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CmdEnter.BorderColor3 = Color3.fromRGB(0, 0, 0)
CmdEnter.BorderSizePixel = 0
CmdEnter.Position = UDim2.new(0.9, 0, 0, 0)
CmdEnter.Size = UDim2.new(0.1, 0, 1, 0)
CmdEnter.Font = Enum.Font.SourceSans
CmdEnter.Text = "Send Cmd"
CmdEnter.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdEnter.TextSize = 20
CmdEnter.TextWrapped = true
CmdEnter.MouseButton1Click:Connect(function ()
    local text = CmdTextbox.Text
    CmdTextbox.Text = ""
    local Predicts = CmdTextbox:FindFirstChild("Predicts")
    if Predicts then Predicts:Destroy() end
    cmdinput(text)
end)

UIPadding_2.Parent = CmdTextbox
UIPadding_2.PaddingLeft = UDim.new(0.0199999996, 0)
UIPadding_2.PaddingRight = UDim.new(0.0199999996, 0)

-- tables
t = {}
t.Toggles = {}
t.Keybinds = {}
t.Cmds = {}
connects = {}
-- Keybinds
connects["keybinds"] = Services.ui.InputBegan:Connect(function (input, gpe)
    if not gpe and not connects["KeyBind Change"] then
        for k, v in pairs(t.Keybinds) do
            if v.keycode == input.KeyCode then
                v.func()
            end
        end
    end
end)
-- Toggles funcs
function UdToggles (name)
    if name and typeof(name) == "string" then
        if t.Toggles[name] then
            if t.Toggles[name].enabled then
                notify(name .. " enabled")
                Pages.Toggles[name].toggle.Visible = true
                t.Toggles[name].func1(t.Toggles[name])
            else
                notify(name .. " disabled")
                Pages.Toggles[name].toggle.Visible = false
                if t.Toggles[name].func2 then
                    t.Toggles[name].func2(t.Toggles[name])
                end
            end
        end
    else
        for k, v in pairs(t.Toggles) do
            if k then
                coroutine.wrap(function ()
                    if v.enabled then
                        Pages.Toggles[k].toggle.Visible = true
                        v.func1(t.Toggles[k])
                    else
                        Pages.Toggles[k].toggle.Visible = false
                        if v.func2 then
                            v.func2(t.Toggles[k])
                        end
                    end
                end)
            end
        end
    end
end
-- functions for adding uis
function corner (gui)
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 16)
    UICorner.Parent = gui
end

function addpage (name, order, padding, size)
    if not name or typeof(name) ~= "string" then return end
    if not order or not (tostring(order) == "Enum.SortOrder.LayoutOrder" or tostring(order) == "Enum.SortOrder.Name") then order = Enum.SortOrder.Name end
    if not padding or typeof(padding) ~= "UDim2" then padding = UDim2.new(0.065, 0, 0.03, 0) end
    if not size or typeof(size) ~= "UDim2" then size = UDim2.new(0.2, 0, 0.1, 0) end
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = Btns
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 0
    btn.LayoutOrder = #Btns:GetChildren()
    btn.Position = UDim2.new(0.0500000007, 0, 0.100000001, 0)
    btn.Size = UDim2.new(0.150000006, 0, 0.800000012, 0)
    btn.Font = Enum.Font.SourceSans
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextSize = 20
    btn.TextWrapped = true
    btn.MouseButton1Click:Connect(function ()
        UIPageLayout:JumpTo(Pages[name])
    end)
    corner(btn)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Parent = Pages
    page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    page.BackgroundTransparency = 1.000
    page.BorderColor3 = Color3.fromRGB(0, 0, 0)
    page.BorderSizePixel = 0
    page.LayoutOrder = 1
    page.Size = UDim2.new(1, 0, 1, 0)
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollBarThickness = 5
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    local ordering = Instance.new("UIGridLayout")
    ordering.Parent = page
    ordering.SortOrder = order
    ordering.CellPadding = padding
    ordering.CellSize = size
    local Padding = Instance.new("UIPadding")
    Padding.Parent = page
    Padding.PaddingLeft = UDim.new(0.02, 0)
    Padding.PaddingRight = UDim.new(0.02, 0)
end

function addtoggle (name, desc, para, display, func1, func2)
    if not name or typeof(name) ~= "string" then return end
    if not desc or typeof(desc) ~= "string" then return end
    if not para or typeof(para) ~= "table" then return end
    if not display or typeof(display) ~= "table" then return end
    if not func1 or typeof(func1) ~= "function" then return end
    if not func2 or typeof(func2) ~= "function" then
        func2 = nil
    end
    if not Pages:FindFirstChild("Toggles") then
        addpage("Toggles", Enum.SortOrder.LayoutOrder, UDim2.new(0.065, 0, 0.03, 0), UDim2.new(0.2, 0, 0.1, 0))
        repeat task.wait() until Pages:FindFirstChild("Toggles")
    end
    if not Pages:FindFirstChild("Toggles"):FindFirstChild(name) then
        local btn = Instance.new("TextButton")
        btn.Name = name
        btn.Parent = Pages:FindFirstChild("Toggles")
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        btn.BorderSizePixel = 0
        btn.LayoutOrder = #t.Toggles + 1
        btn.Position = UDim2.new(0.00999999978, 0, 0.0199999996, 0)
        btn.Size = UDim2.new(0.129999995, 0, 0.0799999982, 0)
        btn.Font = Enum.Font.SourceSans
        btn.Text = name
        btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        btn.TextSize = 20
        btn.TextWrapped = true
        corner(btn)
        local toggle = Instance.new("TextLabel")
        toggle.Name = "toggle"
        toggle.AnchorPoint = Vector2.new(0.5, 0.5)
        toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        toggle.Position = UDim2.new(0.1, 0, 0.5, 0)
        toggle.Size = UDim2.new(0.05, 0, 0.7, 0)
        toggle.Text = ""
        toggle.Parent = btn
        toggle.Visible = false
        btn.MouseButton1Click:Connect(function ()
            t.Toggles[name].enabled = not t.Toggles[name].enabled
            UdToggles(name)
        end)
    end
    t.Toggles[name] = {
        desc = desc,
        para = para,
        display = display,
        enabled = false,
        func1 = func1,
        func2 = func2,
    }
end

function addcmd (name, alias, desc, autofill, func)
    if not name or typeof(name) ~= "string" then return end
    if not desc or typeof(desc) ~= "string" then return end
    if not func or typeof(func) ~= "function" then return end
    if not autofill or typeof(autofill) ~= "table" then return end
    t.Cmds[name] = {
        alias = alias,
        desc = desc,
        func = func,
        f = autofill,
    }
end

function addkeybind (name, keycode, func)
    if not name or typeof(name) ~= "string" then return end
    if not keycode or typeof(keycode) ~= "EnumItem" or not string.find(tostring(keycode), "Enum.KeyCode.") then return end
    if not func or typeof(func) ~= "function" then return end
    if not Pages:FindFirstChild("Keybinds") then
        addpage("Keybinds", Enum.SortOrder.LayoutOrder, UDim2.new(0.05, 0, 0.03, 0), UDim2.new(0.47, 0, 0.1, 0))
        repeat task.wait() until Pages:FindFirstChild("Keybinds")
    end
    if not Pages:FindFirstChild("Keybinds"):FindFirstChild(name) then
        local Frame = Instance.new("Frame")
        Frame.Parent = Pages:FindFirstChild("Keybinds")
        Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Frame.BackgroundTransparency = 1.000
        Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Frame.BorderSizePixel = 0
        Frame.Size = UDim2.new(0, 100, 0, 100)
        Frame.Name = name
        Frame.LayoutOrder = #t.Keybinds + 1
    
        local keycodebtn = Instance.new("TextButton")
        keycodebtn.Name = "keycode"
        keycodebtn.Parent = Frame
        keycodebtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        keycodebtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        keycodebtn.BorderSizePixel = 0
        keycodebtn.LayoutOrder = 1
        keycodebtn.Position = UDim2.new(0.319999993, 0, 0, 0)
        keycodebtn.Size = UDim2.new(0.400000006, 0, 1, 0)
        keycodebtn.Font = Enum.Font.Unknown
        keycodebtn.Text = string.gsub(tostring(keycode), "Enum.KeyCode.", "")
        keycodebtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        keycodebtn.TextSize = 14.000
        keycodebtn.TextWrapped = true
        corner(keycodebtn)
    
        local reset = Instance.new("TextButton")
        reset.Name = "reset"
        reset.Parent = Frame
        reset.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        reset.BorderColor3 = Color3.fromRGB(0, 0, 0)
        reset.BorderSizePixel = 0
        reset.LayoutOrder = 1
        reset.Position = UDim2.new(0.75, 0, 0, 0)
        reset.Size = UDim2.new(0.25, 0, 1, 0)
        reset.Font = Enum.Font.Unknown
        reset.Text = "Remove Keybind"
        reset.TextColor3 = Color3.fromRGB(0, 0, 0)
        reset.TextSize = 14.000
        reset.TextWrapped = true
        corner(reset)
    
        local namelabel = Instance.new("TextLabel")
        namelabel.Name = "name"
        namelabel.Parent = Frame
        namelabel.Active = true
        namelabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        namelabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        namelabel.BorderSizePixel = 0
        namelabel.LayoutOrder = 1
        namelabel.Selectable = true
        namelabel.Size = UDim2.new(0.300000012, 0, 1, 0)
        namelabel.Font = Enum.Font.Unknown
        namelabel.Text = name
        namelabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        namelabel.TextSize = 14.000
        namelabel.TextWrapped = true
        corner(namelabel)
        keycodebtn.MouseButton1Click:Connect(function ()
            keycodebtn.Text = "Listening"
            connects["KeyBind Change"] = Services.ui.InputBegan:Connect(function (input, gpe)
                if input.KeyCode then
                    t.Keybinds[name].keycode = input.KeyCode
                    keycodebtn.Text = string.gsub(tostring(input.KeyCode), "Enum.KeyCode.", "")
                    connects["KeyBind Change"]:Disconnect()
                    task.wait()
                    connects["KeyBind Change"] = nil
                end
            end)
        end)
        reset.MouseButton1Click:Connect(function ()
            t.Keybinds[name] = nil
            Frame:Destroy()
        end)
    end
    t.Keybinds[name] = {
        keycode = keycode,
        func = func,
    }
end

function addbtn (p, name, desc, func1, func2, reversed)
    if not name or typeof(name) ~= "string" then return end
    if not p or typeof(p) ~= "string" or not Pages:FindFirstChild(p) then return end
    if not desc or typeof(desc) ~= "string" then return end
    local page = Pages:FindFirstChild(p)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = page
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 0
    if reversed then
        btn.LayoutOrder = 100000 - (#page:GetChildren() - 1)
    else
        btn.LayoutOrder = #page:GetChildren()
    end
    btn.Position = UDim2.new(0.00999999978, 0, 0.0199999996, 0)
    btn.Size = UDim2.new(0.129999995, 0, 0.0799999982, 0)
    btn.Font = Enum.Font.SourceSans
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextSize = 20
    btn.TextWrapped = true
    corner(btn)
    if func1 and typeof(func1) == "function" then
        btn.MouseButton1Click:Connect(function (btn)
            func1(btn)
        end)
    end
    if func2 and typeof(func2) == "function" then
        btn.MouseButton2Click:Connect(function (btn)
            func2(btn)
        end)
    end
end

-- console
local function addingconsole ()
    local name = "Console"
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = Btns
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 0
    btn.LayoutOrder = 0
    btn.Position = UDim2.new(0.0500000007, 0, 0.100000001, 0)
    btn.Size = UDim2.new(0.150000006, 0, 0.800000012, 0)
    btn.Font = Enum.Font.SourceSans
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextSize = 20
    btn.TextWrapped = true
    btn.MouseButton1Click:Connect(function ()
        UIPageLayout:JumpTo(Pages[name])
    end)
    corner(btn)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Parent = Pages
    page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    page.BackgroundTransparency = 1.000
    page.BorderColor3 = Color3.fromRGB(0, 0, 0)
    page.BorderSizePixel = 0
    page.LayoutOrder = 1
    page.Size = UDim2.new(1, 0, 1, 0)
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.ScrollBarThickness = 5
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    local ListLayout = Instance.new("UIListLayout")
    ListLayout.Parent = page
    ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    local Padding = Instance.new("UIPadding")
    Padding.Parent = page
    Padding.PaddingLeft = UDim.new(0.02, 0)
    Padding.PaddingRight = UDim.new(0.02, 0)
end
addingconsole()
function notify (msg, func1, func2, func3)
    local btn = Instance.new("TextButton")
    btn.Name = "btn"
    btn.Parent = Pages.Console
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btn.BorderSizePixel = 0
    btn.LayoutOrder = 1000000 - (#Pages.Console:GetChildren() - 1)
    btn.Size = UDim2.new(1, 0, 0.08, 0)
    btn.Font = Enum.Font.SourceSans
    btn.Text = tostring(msg)
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextSize = 24
    btn.TextWrapped = true
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextStrokeTransparency = 0
    btn.BackgroundTransparency = 0.9
    btn.BackgroundColor3 = Color3.new(0, 0, 0)
    if func1 and typeof(func1) == "function" then
        btn.MouseButton1Click:Connect(function (btn)
            func1(btn)
        end)
    end
    if func2 and typeof(func2) == "function" then
        btn.MouseButton2Click:Connect(function (btn)
            func2(btn)
        end)
    end
    if func3 and typeof(func3) == "function" then
        coroutine.wrap(func3)(btn)
    end
end

-- Toggles Display

-- annoying auto fill
autofill = {}
autofill.cmd = function(args, i)
    if not (args and i and tonumber(i)) then return end
    local arg = args[1]
    local list = {}
    for k, v in pairs(t.Cmds) do
        if k:sub(1, #arg):lower() == arg:lower() then
            table.insert(list, k)
        end
        if not table.find(list, k) then
            for ii, vv in ipairs(v.alias) do
                if vv:sub(1, #arg) == arg:lower() then
                    table.insert(list, vv)
                end
            end
        end
    end
    return list
end
autofill.plr = function(args, i)
    if not (args and i and tonumber(i)) then return end
    local arg = args[i]
    local list = {}
    for i, v in ipairs(yx.players:GetPlayers()) do
        if not table.find(list, v.Name) and (v.Name:lower() == arg:lower() or v.DisplayName:lower() == arg:lower()) then
            table.insert(list, v.Name)
        end
    end
    for i, v in ipairs(yx.players:GetPlayers()) do
        if not table.find(list, v.Name) and (v.Name:sub(1, #arg):lower() == arg:lower() or v.DisplayName:sub(1, #arg):lower() == arg:lower()) then
            table.insert(list, v.Name)
        end
    end
    return list
end
function getplr (arg)
    if not arg then return end
    for i, v in ipairs(yx.players:GetPlayers()) do
        if (v.Name:lower() == arg:lower() or v.DisplayName:lower() == arg:lower()) then
            return v
        end
    end
    for i, v in ipairs(yx.players:GetPlayers()) do
        if (v.Name:sub(1, #arg):lower() == arg:lower() or v.DisplayName:sub(1, #arg):lower() == arg:lower()) then
            return v
        end
    end
end
-- cmds system
cs = {}
cs.findex = 1
cs.cmdlogs = {}
cs.lastcmd = 1
function checkalias (arg)
    for k, v in pairs(t.Cmds) do
        if k == arg:lower() then
            return t.Cmds[k], tostring(k)
        end
        for ii, vv in ipairs(v.alias) do
            if vv == arg:lower() then
                return t.Cmds[k], tostring(k)
            end
        end
    end
end
function cmdinput (msg)
    msg = string.gsub(msg, prefix, "")
    local args = msg:split(" ")
    table.insert(cs.cmdlogs, 1, msg)
    if args and args[1] and checkalias(args[1]) then
        local cmd = checkalias(args[1])
        table.remove(args, 1)
        if not args or #args < 1 then
            args[1] = ""
        end
        cs.lastcmd = 1
        if args[1]:sub(1, 1) == "@" then
            local player = yx.player
            local players = yx.players
            local s = args[1]:sub(2, -1)
            if s == "all" or s == "a" then
                for i, plr in ipairs(players:GetPlayers()) do
                    if true then
                        local newargs = args
                        newargs[1] = plr.Name
                        coroutine.wrap(cmd.func)(newargs)
                    end
                end
            elseif s == "nearest" or s == "p" then
                local function GetNearestPlayer ()
                    local closestPlayer
                    local closestDistance = math.huge
                    for _, plr in pairs(players:GetPlayers()) do
                        if plr ~= player and gethum(plr) then
                            local distance = (getroot(plr.Character).Position - getroot(player.Character).Position).Magnitude
                            if distance < closestDistance then
                                closestPlayer = plr
                                closestDistance = distance
                            end
                        end
                    end
                    return closestPlayer
                end
                local newargs = args
                newargs[1] = GetNearestPlayer().Name
                coroutine.wrap(cmd.func)(newargs)
            elseif s == "others" or s == "o" then
                for i, plr in ipairs(players:GetPlayers()) do
                    if plr ~= player then
                        local newargs = args
                        newargs[1] = plr.Name
                        coroutine.wrap(cmd.func)(newargs)
                    end
                end
            elseif s == "" or s == "s" then
                local newargs = args
                newargs[1] = player.Name
                coroutine.wrap(cmd.func)(newargs)
            elseif s == "random" or s == "r" then
                local newargs = args
                newargs[1] = players:GetPlayers()[math.random(1, #players:GetPlayers())].Name
                coroutine.wrap(cmd.func)(newargs)
            elseif s == "friends" or s == "f" then
                for i, plr in ipairs(players:GetPlayers()) do
                    if plr ~= player then
                        local newargs = args
                        newargs[1] = plr.Name
                        coroutine.wrap(cmd.func)(newargs)
                    end
                end
            elseif s:sub(1, 1) == "t" then
                for i, plr in ipairs(players:GetPlayers()) do
                    if s:sub(2, -1):lower() == tostring(plr.Team):sub(1, #s-1):lower() then
                        local newargs = args
                        newargs[1] = plr.Name
                        coroutine.wrap(cmd.func)(newargs)
                    end
                end
            elseif s:sub(1, 1) == "d" then
                local distance = tonumber(s:sub(2, -1):lower())
                if distance then
                    for i, plr in ipairs(players:GetPlayers()) do
                        if player.Character and plr.Character and getroot(plr.Character) and (player:DistanceFromCharacter(getroot(plr.Character).Position) < distance) then
                            local newargs = args
                            newargs[1] = plr.Name
                            coroutine.wrap(cmd.func)(newargs)
                        end
                    end
                end
            end
        else
            coroutine.wrap(cmd.func)(args)
        end
    end
end
function editcmdbar (str)
    if str:sub(1, 1) == " " then
        str = str:sub(2, -1)
    end
    CmdTextbox:ReleaseFocus()
    CmdTextbox.Text = str
    task.wait()
    CmdTextbox:CaptureFocus()
end
function findexhighlight ()
    local Predicts = CmdTextbox:FindFirstChild("Predicts")
    if Predicts then
        local btns = {}
        for i, v in ipairs(Predicts:GetChildren()) do
            if v:IsA("TextButton") then
                table.insert(btns, v)
            end
        end
        for i, v in ipairs(btns) do
            if i == cs.findex then
                v.TextColor3 = Color3.fromRGB(0, 255, 0)
            else
                v.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
        end
    end
end

CmdTextbox:GetPropertyChangedSignal("Text"):Connect(function ()
    local Predicts = CmdTextbox:FindFirstChild("Predicts")
    if Predicts then Predicts:Destroy() end
        Predicts = Instance.new("ScrollingFrame")
        Predicts.Name = "Predicts"
        Predicts.Parent = CmdTextbox
        Predicts.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Predicts.BackgroundTransparency = 0.500
        Predicts.BorderColor3 = Color3.fromRGB(255, 255, 255)
        Predicts.ClipsDescendants = true
        Predicts.AnchorPoint = Vector2.new(0, 1)
        Predicts.Size = UDim2.new(0.4, 0, 5, 0)
        Predicts.CanvasSize = UDim2.new(0, 0, 0, 0)
        Predicts.AutomaticCanvasSize = Enum.AutomaticSize.Y
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Predicts
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    local length = CmdTextbox.TextBounds.X / (yx.mouse.ViewSizeX)
    Predicts.Position = UDim2.new(length, 0, -0.1, 0)

    local args = CmdTextbox.Text:split(" ")
    if args[1] and checkalias(args[1]) then
        local cmd, cmdname = checkalias(args[1])
        local f = args and cmd.f[#args - 1] and cmd.f[#args - 1](args, #args)
        local f2 = args and cmd.f[1] and cmd.f[1](args, #args)
        if f then
            for i, v in ipairs(f) do
                local TextButton = Instance.new("TextButton")
                TextButton.Parent = Predicts
                TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.Size = UDim2.new(0.5, 0, 0.1, 0)
                TextButton.Font = Enum.Font.Unknown
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 18.000
                TextButton.Text = v
                TextButton.MouseButton1Click:Connect(function ()
                    table.remove(args, #args)
                    editcmdbar(table.concat(args, " ") .. " " .. v .. " ")
                    Predicts:Destroy()
                    cs.findex = 1
                end)
            end
        elseif f2 then
            for i, v in ipairs(f2) do
                local TextButton = Instance.new("TextButton")
                TextButton.Parent = Predicts
                TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.Size = UDim2.new(0.5, 0, 0.1, 0)
                TextButton.Font = Enum.Font.Unknown
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 18.000
                TextButton.Text = v
                TextButton.MouseButton1Click:Connect(function ()
                    print((cmdname .. v .. " "))
                    editcmdbar(cmdname .. v .. " ")
                    Predicts:Destroy()
                    cs.findex = 1
                end)
            end
        end
    else
        local f = autofill.cmd(args, 1)
        if f then
            for i, v in ipairs(f) do
                local TextButton = Instance.new("TextButton")
                TextButton.Parent = Predicts
                TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.Size = UDim2.new(0.5, 0, 0.1, 0)
                TextButton.Font = Enum.Font.Unknown
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 18.000
                TextButton.Text = v
                TextButton.MouseButton1Click:Connect(function ()
                    table.remove(args, #args)
                    editcmdbar(table.concat(args, " ") .. " " .. v .. " ")
                    Predicts:Destroy()
                    cs.findex = 1
                end)
            end
        end
    end
    if Predicts then
        local maxpredicts = #Predicts:GetChildren() - 1
        if cs.findex > maxpredicts then
            cs.findex = maxpredicts
        elseif cs.findex <= 0 then
            cs.findex = 1
        end
        findexhighlight()
    end
end)

connects["cmd related"] = Services.ui.InputBegan:Connect(function (input, gpe)
    if CmdTextbox:IsFocused() then
        if input.KeyCode == Enum.KeyCode.Up then
            cs.findex = cs.findex - 1
            local Predicts = CmdTextbox:FindFirstChild("Predicts")
            if Predicts then
                if cs.findex <= 0 then
                    cs.findex = #Predicts:GetChildren() - 1
                    Predicts.CanvasPosition = Vector2.new(0, math.huge)
                end
                if cs.findex > 10 then
                    Predicts.CanvasPosition = Vector2.new(0, cs.findex * 25)
                end
            end
            findexhighlight()
        elseif input.KeyCode == Enum.KeyCode.Down then
            cs.findex = cs.findex + 1
            local Predicts = CmdTextbox:FindFirstChild("Predicts")
            if Predicts then
                if cs.findex > (#Predicts:GetChildren() - 1) then
                    cs.findex = 1
                    Predicts.CanvasPosition = Vector2.new(0, 0)
                end
                if cs.findex > 10 then
                    Predicts.CanvasPosition = Vector2.new(0, cs.findex * 25)
                end
            end
            findexhighlight()
        elseif input.KeyCode == Enum.KeyCode.Tab then
            findexhighlight()
            local Predicts = CmdTextbox:FindFirstChild("Predicts")
            if Predicts then
                local btns = {}
                for i, v in ipairs(Predicts:GetChildren()) do
                    if v:IsA("TextButton") then
                        table.insert(btns, v)
                    end
                end
                local args = CmdTextbox.Text:split(" ")
                local text = table.concat(args, " ", 1, #args - 1) -- had to do this because after the if statement args randomly got cleared (checkalias 2 return issue?)
                if args[1] and checkalias(args[1]) then
                    local cmd, cmdname = checkalias(args[1])
                    local f = args and cmd.f[#args - 1] and cmd.f[#args - 1](args, #args)
                    local f2 = args and cmd.f[1] and cmd.f[1](args, #args)
                    for i, v in ipairs(btns) do
                        if i == cs.findex then
                            if f then
                                editcmdbar(text .. " " .. v.Text .. " ")
                                Predicts:Destroy()
                                cs.findex = 1
                                break
                            elseif f2 then
                                editcmdbar(cmdname .. " " .. v.Text .. " ")
                                Predicts:Destroy()
                                cs.findex = 1
                            end
                        end
                    end
                end
                table.remove(args, #args)
            end
        end
    end
end)
connects["cmd history"] = Services.ui.InputBegan:Connect(function (input, gpe)
    if CmdTextbox:IsFocused() then
        if input.KeyCode == Enum.KeyCode.PageUp then
            if cs.cmdlogs[cs.lastcmd] then
                editcmdbar(cs.cmdlogs[cs.lastcmd])
            else
                cs.lastcmd = 1
            end
            cs.lastcmd = cs.lastcmd + 1
        elseif input.KeyCode == Enum.KeyCode.PageDown then
            if cs.cmdlogs[cs.lastcmd] then
                editcmdbar(cs.cmdlogs[cs.lastcmd])
            else
                cs.lastcmd = #cs.cmdlogs
            end
            cs.lastcmd = cs.lastcmd - 1
        end
    end
end)
connects["mobile fix heartbeat"] = Services.run.Heartbeat:Connect(function ()
    if not CmdBar.Visible then
        CmdTextbox:ReleaseFocus()
    end
end)
--

addkeybind("Click Gui", Enum.KeyCode.Y, function ()
    CmdBar.Visible = not ClickGui.Visible
    ClickGui.Visible = not ClickGui.Visible
end)
addkeybind("Cmd Bar", Enum.KeyCode.Return, function ()
    if CmdBar.Visible and CmdTextbox.Text ~= "" then
        local text = CmdTextbox.Text
        CmdTextbox.Text = ""
        local Predicts = CmdTextbox:FindFirstChild("Predicts")
        if Predicts then Predicts:Destroy() end
        cmdinput(text)
        CmdBar.Visible = false
        ClickGui.Visible = false
    else
        CmdBar.Visible = true
        ClickGui.Visible = true
        task.wait()
        CmdTextbox:CaptureFocus()
    end
end)
addcmd("plugin", {"p"}, "add plugins", {}, function (args)
    if args and args[1] then
        if isfile(args[1] .. ".yx") then
            notify(args[1] .. " loaded")
            loadstring(readfile(args[1] .. ".yx"))()
            table.insert(files.plugins, args[1] .. ".yx")
            writefile("plugins.yx", Services.http:JSONEncode(files.plugins))
        end
    end
end)
addcmd("clearplugin", {"cp"}, "remove all plugins (need to reload script again)", {}, function (args)
    writefile("plugins.yx", "")
end)
addcmd("exit", {}, "close the script", {}, function ()
    writefile("toggles.yx", Services.http:JSONEncode(files.toggles))
    gui:Destroy()
    for k, v in pairs(connects) do
        v:Disconnect()
    end
    for k, v in pairs(t.Toggles) do
        if k then
            v.enabled = false
            coroutine.wrap(function ()
                Pages.Toggles[k].toggle.Visible = false
                v.func2(t.Toggles[k])
            end)
        end
    end
    for i, v in ipairs(t) do
        for ii, vv in ipairs(v) do
            vv = nil
        end
    end
    if viewing then viewing = nil end
end)
addcmd("lua", {}, "loadstring", {}, function (args)
    if args[1] then
        local s, r = pcall(function ()
            loadstring(table.concat(args, " "))()
        end)
        if not s then
            notify("Error:  " .. r)
        end
    end
end)
addcmd("addkeybind", {"kb"}, "add a keybind", {}, function (args)
    if args and #args >= 3 then
        local k = args[1]
        local tc = args[2]
        table.remove(args, 1)
        table.remove(args, 1)
        local n = table.concat(args, " ")
        if tc == "toggle" and t.Toggles[n] then
            addkeybind(n, Enum.KeyCode[k], function ()
                local name = n
                t.Toggles[name].enabled = not t.Toggles[name].enabled
                UdToggles(name)
            end)
        elseif tc == "cmd" then
            addkeybind(n, Enum.KeyCode[k], function ()
                cmdinput(n)
            end)
        end
    else
        notify("cmd format: keycode, toggle/cmd, toggle/cmd name")
    end
end)
addcmd("repeat", {"rep"}, "repeat a cmd multi times", {}, function (args)
    local n = args[1] and tonumber(args[1])
    if n then
        local cmd = table.concat(args, " ", 2)
        notify("repeating '" .. cmd .. "' " .. n .. " times")
        for i = 1, n do
            cmdinput(cmd)
        end
    end
end)
addcmd("savetoggle", {}, "save the toggle settings", {}, function (args)
    writefile("toggles.yx", Services.http:JSONEncode(files.toggles))
end)

-- Avoid Multi Gui and random
connects.nomulti = Services.core.ChildAdded:Connect(function (v)
    if v.Name == "CmdYX" then
        files.toggles = {}
        for k, v in pairs(t.Toggles) do
            if v.enabled then
                table.insert(files.toggles, k)
            end
        end
        cmdinput("exit")
    end
end)
connects.playerleaving = yx.players.PlayerRemoving:Connect(function (plr)
    if plr == yx.player then
        files.toggles = {}
        for k, v in pairs(t.Toggles) do
            if v.enabled then
                table.insert(files.toggles, k)
            end
        end
        writefile("toggles.yx", Services.http:JSONEncode(files.toggles))
    end
end)
local localplayerchatcmded = false
connects.chatcmd = yx.player.Chatted:Connect(function (msg)
    task.wait()
    if msg:sub(1, #prefix) == prefix and not localplayerchatcmded then
        localplayerchatcmded = true
        cmdinput(msg)
        task.wait(0.01)
        localplayerchatcmded = false
    end
end)
if me() then
    connects.chatcmd_yx = me().Chatted:Connect(function (msg)
        if msg:sub(1, #prefix) == prefix then
            cmdinput(msg)
        elseif msg:sub(1, 3) == "/e " then
            cmdinput(msg:sub(4, -1))
        end
    end)
end
connects.checking_yx_join = yx.players.PlayerAdded:Connect(function (v)
    if v.Name == "yx_doomspire" and v ~= v.player then
        connects.chatcmd_yx = v.Chatted:Connect(function (msg)
            if msg:sub(1, #prefix) == prefix then
                cmdinput(msg)
            end
        end)
    end
end)

-- plugins
print("script loaded")
if isfile("plugins.yx") then
    local loaded = {}
    files.plugins = Services.http:JSONDecode(readfile("plugins.yx"))
    for i, v in ipairs(files.plugins) do
        if isfile(v) and not table.find(loaded, v) then
            table.insert(loaded, v)
            notify(v:gsub(".yx", "") .. " loaded")
            local s, r = pcall(loadstring(readfile(v)))
            if not s then
                notify(v:gsub(".yx", "") .. " Failed to Load")
                notify("Reason: " .. r)
            end
        end
    end
    task.wait()
end
if isfile("toggles.yx") then
    local temp = Services.http:JSONDecode(readfile("toggles.yx"))
    for i, name in ipairs(temp) do
        coroutine.wrap(function ()
            print(name)
            if name and t.Toggles[name] then
                print("found " .. name)
                t.Toggles[name].enabled = true
                UdToggles(name)
            end
        end)()
    end
end
print("plugins loaded")