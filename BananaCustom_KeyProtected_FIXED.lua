
-- 🔐 Key System đơn giản
local key = "longbeobeo"

local userInput = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("KeyGui")
if not userInput then
    userInput = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    userInput.Name = "KeyGui"

    local Frame = Instance.new("Frame", userInput)
    Frame.Size = UDim2.new(0, 300, 0, 150)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    Frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    Frame.BorderSizePixel = 0

    local TextBox = Instance.new("TextBox", Frame)
    TextBox.Size = UDim2.new(1, -20, 0, 40)
    TextBox.Position = UDim2.new(0, 10, 0, 20)
    TextBox.PlaceholderText = "Nhập key để dùng script"
    TextBox.Text = ""
    TextBox.TextSize = 18

    local Submit = Instance.new("TextButton", Frame)
    Submit.Size = UDim2.new(1, -20, 0, 40)
    Submit.Position = UDim2.new(0, 10, 0, 80)
    Submit.Text = "Xác nhận"
    Submit.TextSize = 18
    Submit.BackgroundColor3 = Color3.fromRGB(50, 150, 50)

    Submit.MouseButton1Click:Connect(function()
        if TextBox.Text == key then
            userInput:Destroy()
            loadstring(scriptCode)()
        else
            TextBox.Text = "❌ Sai key!"
        end
    end)
end

-- Nội dung chính của script
local scriptCode = [[
-- BananaCustom Script Gộp: V1 + V2
-- V1: Auto Farm, Skill, GUI, Safe Mode
-- V2: Sea Event, V4 Draco, PvP, GUI
-- Giả code nội dung bên dưới

print("✅ Script BananaCustom V1 + V2 đang chạy...")
-- (tại đây là phần gộp V1 + V2 thật của bạn)
]]

-- Tự động chạy script nếu key đúng
-- loadstring(scriptCode)()  <- đã gọi trong nút Submit
