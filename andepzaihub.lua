--[[ 
    NEXT-GEN GREEN CYBERPUNK KEY SYSTEM 2026 - AN DEP ZAI HUB EDITION
    Sửa lỗi không hiển thị UI - Tối ưu hóa phân cấp Object độc lập
]]

local Config_URL = "https://raw.githubusercontent.com/Bubu2k/config.txt/refs/heads/main/config.txt" 

---------------------------------------------------------
-- HỆ THỐNG TỰ ĐỘNG TẢI DỮ LIỆU
---------------------------------------------------------
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local fetchedLink = "https://funlink.io/Pu_s2wc" 
local fetchedKey = "vietnam76" 

local success, response = pcall(function()
    return game:HttpGet(Config_URL)
end)

if success and response then
    local lines = {}
    for line in string.gmatch(response, "[^\r\n]+") do
        table.insert(lines, line)
    end
    if lines[1] then fetchedLink = string.gsub(lines[1], "%s+", "") end
    if lines[2] then fetchedKey = string.gsub(lines[2], "%s+", "") end
end

-- TẠO GIAO DIỆN CHÍNH (ĐÃ FIX PHÂN CẤP)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "NextGen_KeySystem_Fixed"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Khung chính đặt trực tiếp vào ScreenGui để chắc chắn hiển thị
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 14, 11)
MainFrame.BackgroundTransparency = 0.05
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 230)
MainFrame.ClipsDescendants = false
MainFrame.ZIndex = 2

-- Bóng đổ đưa về làm con của MainFrame và đẩy ra phía sau (ZIndex = 1)
local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Parent = MainFrame
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 60, 1, 60)
DropShadow.BackgroundTransparency = 1
DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 255, 120)
DropShadow.ImageTransparency = 0.5
DropShadow.ZIndex = 1

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 16)

local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Thickness = 2.5
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local UIGradient = Instance.new("UIGradient", UIStroke)
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 127)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 60, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 127))
}

-- Vòng xoay cầu vồng Neon Green mượt mà
local rotationConnection
rotationConnection = RunService.RenderStepped:Connect(function()
    if UIGradient and UIGradient.Parent then
        UIGradient.Rotation = (UIGradient.Rotation + 1) % 360
    else
        rotationConnection:Disconnect()
    end
end)

local Title = Instance.new("TextLabel", MainFrame)
Title.Text = "GREEN CYBER ACCESS"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.ZIndex = 3

local KeyInput = Instance.new("TextBox", MainFrame)
KeyInput.PlaceholderText = "Nhập mã key truy cập tại đây..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(16, 22, 18)
KeyInput.Position = UDim2.new(0.08, 0, 0.30, 0)
KeyInput.Size = UDim2.new(0.84, 0, 0, 42)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.GothamSemibold
KeyInput.TextSize = 13
KeyInput.ZIndex = 3
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)
local InputStroke = Instance.new("UIStroke", KeyInput)
InputStroke.Thickness = 1.2
InputStroke.Color = Color3.fromRGB(0, 255, 127)
InputStroke.Transparency = 0.6

local CopyBtn = Instance.new("TextButton", MainFrame)
CopyBtn.Text = "GET KEY LINK"
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.TextSize = 12
CopyBtn.BackgroundColor3 = Color3.fromRGB(15, 30, 20)
CopyBtn.TextColor3 = Color3.fromRGB(120, 255, 170)
CopyBtn.Position = UDim2.new(0.08, 0, 0.58, 5)
CopyBtn.Size = UDim2.new(0.84, 0, 0, 32)
CopyBtn.ZIndex = 3
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 8)

local SubmitBtn = Instance.new("TextButton", MainFrame)
SubmitBtn.Text = "ACTIVATE SCRIPT"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 13
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Position = UDim2.new(0.08, 0, 0.77, 10)
SubmitBtn.Size = UDim2.new(0.84, 0, 0, 38)
SubmitBtn.ZIndex = 3
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 10)

-- HỆ THỐNG KÉO THẢ MƯỢT MÀ KHÔNG LỖI
local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

-- HIỆU ỨNG HOVER DI CHUỘT
local function SetupHover(button, hoverBg, hoverSize, normalBg, normalSize)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Cubic), {BackgroundColor3 = hoverBg, Size = hoverSize}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2, Enum.EasingStyle.Cubic), {BackgroundColor3 = normalBg, Size = normalSize}):Play()
    end)
end
SetupHover(CopyBtn, Color3.fromRGB(25, 50, 30), UDim2.new(0.86, 0, 0, 34), Color3.fromRGB(15, 30, 20), UDim2.new(0.84, 0, 0, 32))
SetupHover(SubmitBtn, Color3.fromRGB(0, 240, 120), UDim2.new(0.86, 0, 0, 40), Color3.fromRGB(0, 200, 100), UDim2.new(0.84, 0, 0, 38))

-- HỆ THỐNG THÔNG BÁO TỐI ƯU
local function AdvancedNotify(msg, color)
    local NotifyGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local Box = Instance.new("Frame", NotifyGui)
    Box.Size = UDim2.new(0, 280, 0, 45)
    Box.Position = UDim2.new(0.5, -140, 0, -60)
    Box.BackgroundColor3 = Color3.fromRGB(12, 16, 13)
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 10)
    
    local S = Instance.new("UIStroke", Box)
    S.Color = color
    S.Thickness = 1.5
    
    local Text = Instance.new("TextLabel", Box)
    Text.Size = UDim2.new(1, 0, 1, 0)
    Text.BackgroundTransparency = 1
    Text.Text = msg
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.Font = Enum.Font.GothamBold
    Text.TextSize = 12
    
    TweenService:Create(Box, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -140, 0, 40)}):Play()
    task.wait(2.2)
    TweenService:Create(Box, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, -140, 0, -60)}):Play()
    task.wait(0.3)
    NotifyGui:Destroy()
end

-- SỰ KIỆN NÚT BẤM
CopyBtn.MouseButton1Click:Connect(function()
    setclipboard(fetchedLink)
    CopyBtn.Text = "COPIED URL!"
    AdvancedNotify("Đã sao chép link thành công!", Color3.fromRGB(0, 255, 127))
    task.wait(2)
    CopyBtn.Text = "GET KEY LINK"
end)

SubmitBtn.MouseButton1Click:Connect(function()
    local userKey = KeyInput.Text
    
    if userKey == fetchedKey then
        SubmitBtn.Text = "ACCESS GRANTED!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
        SubmitBtn.TextColor3 = Color3.fromRGB(10, 14, 11)
        
        if rotationConnection then rotationConnection:Disconnect() end
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
        task.wait(0.3)
        ScreenGui:Destroy()
        
        -- ĐÃ THAY ĐỔI: Chạy AnDepZaiHubBeta tại đây
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubBeta.lua"))()
        end)
        
        if not success then
            AdvancedNotify("Lỗi nạp mã nguồn chính!", Color3.fromRGB(255, 70, 70))
            warn("Lỗi Script: " .. tostring(err))
        end
    else
        SubmitBtn.Text = "ACCESS DENIED!"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        AdvancedNotify("Mã khóa không chính xác!", Color3.fromRGB(255, 70, 70))
        task.wait(2)
        SubmitBtn.Text = "ACTIVATE SCRIPT"
        SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
    end
end)
