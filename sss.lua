print('loading 1')

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localplayer = Players.LocalPlayer

print("loading 2")

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/bowlofrice767/rayfield/main/rayfield123.lua'))()
local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua'))()

if game.GameId == 66654135 then
	print("loading 3")
	Sense.Load()

	---

	local Window = Rayfield:CreateWindow({
		Name = "Xone hub",
		LoadingTitle = "Xone hub",
		LoadingSubtitle = "Murder Mystery 2",
		ConfigurationSaving = {
			Enabled = false,
			FolderName = "xonehub",
			FileName = "xonehub"
		},
		Discord = {
			Enabled = false,
			Invite = "DSFSFDSFDSFDDSDFFSDSFDFSDFDS",
			RememberJoins = false
		},
		KeySystem = false,
		KeySettings = {
			Title = "Sirius Hub",
			Subtitle = "Key System",
			Note = "Join the discord (discord.gg/sirius)",
			FileName = "SiriusKey",
			SaveKey = true,
			GrabKeyFromSite = false,
			Key = "Hello"
		}
	})

	local Settings = {
		Silent = false,
		KnifeAura = false,
		Character = {
			WalkSpeedEnabled = false,
			WalkSpeed = 16,
			OldWalkSpeed = 16,
			JumpPowerEnabled = false,
			JumpPower = 50,
			OldJumpPower = 50,
			Noclip = false,
			NoclipCam = false
		}
	}

	local Tabs = {
		Main = Window:CreateTab("Main", 4483362458),
		Esp = Window:CreateTab("ESP", 4483362458),
		Misc = Window:CreateTab("Misc", 4483362458),
	}

	Tabs.Main:CreateSection("Main")

	Tabs.Main:CreateToggle({
		Name = "Silent Aim",
		CurrentValue = false,
		Flag = "Silent",
		Callback = function(Value)
			Settings.Silent = Value
		end,
	})

	Tabs.Main:CreateToggle({
		Name = "Knife Aura",
		CurrentValue = false,
		Flag = "KnifeAura",
		Callback = function(Value)
			Settings.KnifeAura = Value
		end,
	})

	---

	Tabs.Esp:CreateSection("Players Esp")

	Tabs.Esp:CreateToggle({
		Name = "Esp Enabled",
		CurrentValue = false,
		Flag = "Esp_Enabled",
		Callback = function(Value)
			Sense.teamSettings['enemy'].enabled = Value
			Sense.teamSettings['friendly'].enabled = Value
		end,
	})

	Tabs.Esp:CreateToggle({
		Name = "Box Enabled",
		CurrentValue = false,
		Flag = "Box_Enabled",
		Callback = function(Value)
			Sense.teamSettings['enemy'].box = Value
			Sense.teamSettings['friendly'].box = Value
		end,
	})

	Tabs.Esp:CreateToggle({
		Name = "Chams Enabled",
		CurrentValue = false,
		Flag = "Chams_Enabled",
		Callback = function(Value)
			Sense.teamSettings['enemy'].chams = Value
			Sense.teamSettings['friendly'].chams = Value
		end,
	})

	Tabs.Esp:CreateToggle({
		Name = "Name Enabled",
		CurrentValue = false,
		Flag = "Name_Enabled",
		Callback = function(Value)
			Sense.teamSettings['enemy'].name = Value
			Sense.teamSettings['friendly'].name = Value
		end,
	})

	Tabs.Esp:CreateToggle({
		Name = "Role Enabled",
		CurrentValue = false,
		Flag = "Role_Enabled",
		Callback = function(Value)
			Sense.teamSettings['enemy'].weapon = Value
			Sense.teamSettings['friendly'].weapon = Value
		end,
	})

	Tabs.Esp:CreateToggle({
		Name = "Arrows Enabled",
		CurrentValue = false,
		Flag = "Arrows_Enabled",
		Callback = function(Value)
			Sense.teamSettings['enemy'].offScreenArrow = Value
			Sense.teamSettings['friendly'].offScreenArrow = Value
		end,
	})

	---

	Tabs.Misc:CreateToggle({
		Name = "Walkspeed Enabled",
		CurrentValue = false,
		Flag = "Walkspeed_Enabled",
		Callback = function(Value)
			local character = localplayer.Character
			local oldspeed = 16

			if character then
				local humanoid = character:WaitForChild("Humanoid")

				if humanoid then
					if Value then
						oldspeed = humanoid.WalkSpeed
					else
						humanoid.WalkSpeed = Settings.Character.OldWalkSpeed
					end
				end
			end

			if Value then
				Settings.Character.OldWalkSpeed = oldspeed
			end

			Settings.Character.WalkSpeedEnabled = Value
		end,
	})

	Tabs.Misc:CreateSlider({
		Name = "Walkspeed",
		Range = {0, 100},
		Increment = 1,
		Suffix = "",
		CurrentValue = Settings.Character.WalkSpeed,
		Flag = "Walkspeed",
		Callback = function(Value)
			Settings.Character.WalkSpeed = Value
		end,
	})

	Tabs.Misc:CreateToggle({
		Name = "JumpPower Enabled",
		CurrentValue = false,
		Flag = "JumpPower_Enabled",
		Callback = function(Value)
			local character = localplayer.Character
			local oldpower = 50

			if character then
				local humanoid = character:WaitForChild("Humanoid")

				if humanoid then
					if Value then
						oldpower = humanoid.JumpPower
					else
						humanoid.JumpPower = Settings.Character.OldJumpPower
					end
				end
			end

			if Value then
				Settings.Character.OldJumpPower = oldpower
			end

			Settings.Character.JumpPowerEnabled = Value
		end,
	})

	Tabs.Misc:CreateSlider({
		Name = "JumpPower",
		Range = {0, 150},
		Increment = 1,
		Suffix = "",
		CurrentValue = Settings.Character.JumpPower,
		Flag = "JumpPower",
		Callback = function(Value)
			Settings.Character.JumpPower = Value
		end,
	})

	Tabs.Misc:CreateToggle({
		Name = "Noclip Enabled",
		CurrentValue = false,
		Flag = "Noclip_Enabled",
		Callback = function(Value)
			Settings.Character.Noclip = Value
		end,
	})

	Tabs.Misc:CreateToggle({
		Name = "Noclip Cam Enabled",
		CurrentValue = false,
		Flag = "Noclip_Cam_Enabled",
		Callback = function(Value)
			local sc = (debug and debug.setconstant) or setconstant
			local gc = (debug and debug.getconstants) or getconstants

			if not sc or not getgc or not gc then
				Rayfield:Notify({
					Title = "Incompatible Exploit",
					Content = "Your exploit does not support this command (missing setconstant or getconstants or getgc)",
					Duration = 6.5,
					Image = 4483362458,
					Actions = {},
				})
			end

			if Value then
				local pop = localplayer.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
				for _, v in pairs(getgc()) do
					if type(v) == 'function' and getfenv(v).script == pop then
						for i, v1 in pairs(gc(v)) do
							if tonumber(v1) == .25 then
								sc(v, i, 0)
							elseif tonumber(v1) == 0 then
								sc(v, i, .25)
							end
						end
					end
				end
			else
				localplayer.CameraMaxZoomDistance = 400
				localplayer.CameraMode = "Classic"
			end
		end,
	})

	---

	local roles = {}
	local Murderer, Sheriff, Hero

	local function getRole(player)
		if player.Character == nil then return "Innocent" end 

		for i, v in pairs(roles) do
			if i == player.Name then
				if v.Role == "Murderer" then 
					return "Murder" 
				end

				return v.Role
			end
		end

		if player.Character:FindFirstChild("Knife") or player.Backpack:FindFirstChild("Knife") then
			return "Murder"
		elseif player.Character:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Gun") then
			return "Sheriff"
		end

		return "Innocent"
	end

	function Sense.isFriendly(player)
		local lp_role = getRole(localplayer)
		local p_role = getRole(player)

		if lp_role == "Murder" then
			if p_role == "Sheriff" or p_role == "Hero" then 
				return false
			end
		else
			if p_role == "Murder" then 
				return false
			end
		end

		return true
	end

	function Sense.getWeapon(player)
		return getRole(player)
	end

	---

	local timer_roles = 0

	RunService.RenderStepped:Connect(function(deltaTime)
		timer_roles += deltaTime

		if timer_roles >= 1 then
			roles = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()

			for i, v in pairs(roles) do
				if v.Role == "Murderer" then
					Murderer = i
				elseif v.Role == 'Sheriff'then
					Sheriff = i
				elseif v.Role == 'Hero'then
					Hero = i
				end
			end

			timer_roles = 0
		end

		local character = localplayer.Character

		if character then
			local humanoid = character:FindFirstChild("Humanoid")

			if humanoid then
				if Settings.Character.WalkSpeedEnabled then
					humanoid.WalkSpeed = Settings.Character.WalkSpeed
				end

				if Settings.Character.JumpPowerEnabled then
					humanoid.JumpPower = Settings.Character.JumpPower
				end
			end

			if Settings.Character.Noclip then
				for _, child in pairs(character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide == true then
						child.CanCollide = false
					end
				end
			end
		end

		if Settings.KnifeAura then
			local char = localplayer.Character
			local knife = char and char:FindFirstChild("Knife")

			if knife then
				for i,v in pairs(Players:GetPlayers()) do
					if v == localplayer then continue end

					local plchar = v.Character
					local humanoidRootPart = plchar and plchar:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						if localplayer:DistanceFromCharacter(humanoidRootPart.Position) < 20 then
							wait()

							pcall(function()
								localplayer.Character.Knife.Stab:FireServer("Down")
							end)

							firetouchinterest(humanoidRootPart, knife.Handle, 1)
							firetouchinterest(humanoidRootPart, knife.Handle, 0)
						end
					end
				end
			end
		end
	end)

	---

	local namecall

	namecall = hookmetamethod(game, "__namecall", function(self, ...)
		local args = {...}
		local method = getnamecallmethod()

		if not checkcaller() then
			if self.Name == "ShootGun" and method == "InvokeServer" then
				if Murderer then
					local Root = Players[tostring(Murderer)].Character.PrimaryPart;
					local Veloc = Root.AssemblyLinearVelocity;
					local Pos = Root.Position + (Veloc * Vector3.new(25 / 200, 0, 25 / 200));
					args[2] = Pos;

					return namecall(self, unpack(args));
				end;
			end
		end

		return namecall(self, ...)
	end)
else
	Rayfield:Notify({
		Title = "Game is not supported",
		Content = "This is mm2 script",
		Duration = 6.5,
		Image = 4483362458,
		Actions = {}
	})
	
	print("game not supported")
end
