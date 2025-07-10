-- BananaCustom Script Gộp: V1 + V2
-- V1: Auto Farm, Skill, GUI, Safe Mode
-- V2: Sea Event, V4 Draco, PvP, GUI


-- 🍌 Banana Custom Script V1 by ChatGPT (Auto Farm + Skill + GUI)
-- ✅ Tương thích KRNL – Nhẹ, nhanh, dễ dùng

local Config = {
    AutoFarm = false,
    AutoSkill = false,
    SafeMode = false,
    DelayAttack = 0.2,
    SkillDelay = 1.5,
}

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(), workspace.CurrentCamera.CFrame)
end)

-- Auto Skill Z/X/C/V/F
spawn(function()
    while wait(Config.SkillDelay) do
        if Config.AutoSkill then
            for _, key in pairs({"Z", "X", "C", "V", "F"}) do
                pcall(function()
                    keypress(Enum.KeyCode[key])
                    wait(0.1)
                    keyrelease(Enum.KeyCode[key])
                end)
                wait(0.2)
            end
        end
    end
end)

-- Safe mode khi gần chết
spawn(function()
    while wait(0.5) do
        if Config.SafeMode then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health < 25 then
                char:FindFirstChild("HumanoidRootPart").CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0, 150, 0)
            end
        end
    end
end)

-- Auto Farm mob gần nhất
spawn(function()
    while wait(0.3) do
        if Config.AutoFarm then
            local char = game.Players.LocalPlayer.Character
            local mobs = workspace.Enemies:GetChildren()
            for _, mob in pairs(mobs) do
                if mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") and mob.Humanoid.Health > 0 then
                    char.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                    vu:Button1Down(Vector2.new(), workspace.CurrentCamera.CFrame)
                    wait(Config.DelayAttack)
                    vu:Button1Up(Vector2.new(), workspace.CurrentCamera.CFrame)
                end
            end
        end
    end
end)

-- GUI đơn giản
local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 240, 0, 200)
frame.Position = UDim2.new(0.02, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0

local function addBtn(text, flag, posY)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 220, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Text = "❌ " .. text
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(function()
        Config[flag] = not Config[flag]
        btn.Text = (Config[flag] and "✅ " or "❌ ") .. text
    end)
end

addBtn("Auto Farm Mob", "AutoFarm", 10)
addBtn("Auto Skill (Z/X/C...)", "AutoSkill", 60)
addBtn("Safe Mode (HP thấp bay lên)", "SafeMode", 110)


-- === Phần V2 bắt đầu ===


-- 🍌 BananaCustom V2 – Sea Event + Race V4 + Auto PvP (Draco V4)
-- ✅ Viết riêng bởi ChatGPT – Dùng cho KRNL

local Config = {
    AutoSeaEvent = false,
    AutoRaceV4 = false,
    AutoPvP = false,
    SafeMode = true,
}

-- Anti-AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:Button2Down(Vector2.new(), workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(), workspace.CurrentCamera.CFrame)
end)

-- 🛡 Safe Mode
spawn(function()
    while wait(1) do
        if Config.SafeMode then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.Health < 30 then
                char:FindFirstChild("HumanoidRootPart").CFrame = char.HumanoidRootPart.CFrame + Vector3.new(0,150,0)
            end
        end
    end
end)

-- 🌊 Auto Sea Event: Leviathan, Sea Beast, Golem
spawn(function()
    while wait(1) do
        if Config.AutoSeaEvent then
            for _,v in pairs(workspace.Enemies:GetChildren()) do
                local name = v.Name:lower()
                if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    if name:find("leviathan") or name:find("sea beast") or name:find("golem") or name:find("lava") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
                        vu:Button1Down(Vector2.new(), workspace.CurrentCamera.CFrame)
                        wait(0.2)
                        vu:Button1Up(Vector2.new(), workspace.CurrentCamera.CFrame)
                    end
                end
            end
        end
    end
end)

-- 🧬 Auto Race V4 Unlock (Draco – mô phỏng)
spawn(function()
    while wait(2) do
        if Config.AutoRaceV4 then
            local player = game.Players.LocalPlayer
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                -- Giả lập dịch chuyển tới Temple of Time (nếu có)
                local temple = workspace:FindFirstChild("TempleOfTime")
                if temple then
                    char.HumanoidRootPart.CFrame = temple.CFrame + Vector3.new(0, 10, 0)
                end
            end
        end
    end
end)

-- ⚔ Auto PvP: Gặp ai gần là kill
spawn(function()
    while wait(1) do
        if Config.AutoPvP then
            local localPlr = game.Players.LocalPlayer
            local minDist, target = math.huge, nil

            for _,plr in pairs(game.Players:GetPlayers()) do
                if plr ~= localPlr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                    local dist = (localPlr.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude
                    if dist < minDist and dist <= 150 then
                        minDist = dist
                        target = plr
                    end
                end
            end

            if target then
                localPlr.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
                vu:Button1Down(Vector2.new(), workspace.CurrentCamera.CFrame)
                wait(0.3)
                vu:Button1Up(Vector2.new(), workspace.CurrentCamera.CFrame)
            end
        end
    end
end)

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 240, 0, 200)
frame.Position = UDim2.new(0.23, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0

local function addBtn(text, flag, posY)
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0, 220, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Text = "❌ " .. text
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(function()
        Config[flag] = not Config[flag]
        btn.Text = (Config[flag] and "✅ " or "❌ ") .. text
    end)
end

addBtn("Auto Sea Event (Boss, Leviathan...)", "AutoSeaEvent", 10)
addBtn("Auto Unlock Race V4 (Draco)", "AutoRaceV4", 60)
addBtn("Auto PvP Khô Máu", "AutoPvP", 110)
