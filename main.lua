-- rynexhub | +1 Speed Motorcycle Escape!
-- Version: Final Polish

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Window Setup
local Window = Rayfield:CreateWindow({
   Name = "🚀 rynexhub | +1 Speed Motorcycle Escape!",
   LoadingTitle = "rynexhub Loading...",
   LoadingSubtitle = "by RynexStar",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "rynexhub_configs",
      FileName = "MainConfig"
   },
   KeySystem = true,
   KeySettings = {
      Title = "Security System",
      Subtitle = "Key: rynex",
      Note = "Bro, the key is literally rynex ;-;", 
      FileName = "rynex_key_save",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"rynex"}
   }
})

-- Services & Remotes
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = game.Players.LocalPlayer
local WalkRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("GainSpeed_Walk")
local RebirthRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Rebirth")
local VehicleRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeVehicle")

-- Control Variables
local SpeedActive = false
local RebirthActive = false
local WinActive = false
local SpeedDelay = 0.1
local RebirthDelay = 0.1

-- Anti-AFK
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- TABS
local MainTab = Window:CreateTab("⚡ Main Farm", 4483362458)
local WinsTab = Window:CreateTab("🏆 Wins & Shop", 4483362458)
local NotesTab = Window:CreateTab("📜 Notes", 4483362458)

--- SPEED & REBIRTH ---
MainTab:CreateSection("Speed Farmer")
MainTab:CreateToggle({
   Name = "Auto-Gain Speed",
   CurrentValue = false,
   Flag = "SpeedToggle",
   Callback = function(Value)
      SpeedActive = Value
      if Value then
         task.spawn(function()
            while SpeedActive do
               WalkRemote:FireServer()
               task.wait(SpeedDelay)
            end
         end)
      end
   end,
})

MainTab:CreateSlider({
   Name = "Speed Spam Delay",
   Range = {0.01, 1},
   Increment = 0.01,
   Suffix = "s",
   CurrentValue = 0.1,
   Flag = "SpeedSlider",
   Callback = function(Value)
      SpeedDelay = Value
   end,
})

MainTab:CreateSection("Infinite Rebirth")
MainTab:CreateToggle({
   Name = "Auto-Rebirth (OP) 💀",
   CurrentValue = false,
   Flag = "RebirthToggle",
   Callback = function(Value)
      RebirthActive = Value
      if Value then
         task.spawn(function()
            while RebirthActive do
               RebirthRemote:FireServer()
               task.wait(RebirthDelay)
            end
         end)
      end
   end,
})

--- WINS & VEHICLE ---
WinsTab:CreateSection("Win Farming")
WinsTab:CreateToggle({
   Name = "Auto-Win Teleport (1s)",
   CurrentValue = false,
   Flag = "WinToggle",
   Callback = function(Value)
      WinActive = Value
      if Value then
         task.spawn(function()
            while WinActive do
               local char = Player.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  char.HumanoidRootPart.CFrame = CFrame.new(-1500, 126, 4227)
               end
               task.wait(1)
            end
         end)
      end
   end,
})

WinsTab:CreateSection("Vehicle Shop")
WinsTab:CreateButton({
   Name = "TP to Bike Shop (2500 Wins)",
   Callback = function()
      local char = Player.Character
      if char and char:FindFirstChild("HumanoidRootPart") then
         char.HumanoidRootPart.CFrame = CFrame.new(83, 57, -66)
      end
   end,
})

WinsTab:CreateButton({
   Name = "Equip Racing Bike (Must Own)",
   Callback = function()
      local args = {"Racing"}
      VehicleRemote:FireServer(unpack(args))
      Rayfield:Notify({
         Title = "Vehicle",
         Content = "Trying to equip Racing Bike...",
         Duration = 3,
         Image = 4483345998,
      })
   end,
})

--- NOTES ---
NotesTab:CreateSection("About rynexhub")
NotesTab:CreateParagraph({Title = "Developer Information", Content = "This script was developed by RynexStar, a beginner script creator. This project was made for educational and fun purposes only."})
NotesTab:CreateParagraph({Title = "Disclaimer", Content = "We are not responsible for any bans or account penalties. You are using this script at your own risk. You downloaded it because you wanted to!"})

Rayfield:Notify({
   Title = "rynexhub Loaded!",
   Content = "Ready to dominate +1 Speed Motorcycle Escape!",
   Duration = 5,
   Image = 4483345998,
})
