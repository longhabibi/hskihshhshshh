--// BananaHub Custom - GUI Premium (by ChatGPT)
local key = "longbeobeo"
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")
local oldGui = gui:FindFirstChild("KeyGui")
if oldGui then oldGui:Destroy() end

-- GUI Nhập Key
local screenGui = Instance.new("ScreenGui", gui)
screenGui.Name = "KeyGui"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 180)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", mainFrame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0, 255, 100)

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.Text = "🔐 Nhập Key để mở Script VIP"
title.TextColor3 = Color3.fromRGB(0, 255, 100)
title.BackgroundTransparency = 1
title.TextSize = 18
title.Font = Enum.Font.SourceSansSemibold

local input = Instance.new("TextBox", mainFrame)
input.Size = UDim2.new(1, -40, 0, 40)
input.Position = UDim2.new(0, 20, 0, 60)
input.PlaceholderText = "Nhập key tại đây..."
input.Text = ""
input.TextSize = 16
input.TextColor3 = Color3.new(1, 1, 1)
input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
input.Font = Enum.Font.SourceSans
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

local button = Instance.new("TextButton", mainFrame)
button.Size = UDim2.new(1, -40, 0, 40)
button.Position = UDim2.new(0, 20, 0, 115)
button.Text = "✅ Xác nhận"
button.TextSize = 18
button.TextColor3 = Color3.new(1,1,1)
button.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
button.Font = Enum.Font.SourceSansBold
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

-- Khi nhập đúng key → chạy GUI chính
button.MouseButton1Click:Connect(function()
    if input.Text == key then
        screenGui:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/longhabibi/hskihshhshshh/main/BananaCustom_GUI_MainHub.lua"))()
    else
        input.Text = "❌ Sai key!"
    end
end)
