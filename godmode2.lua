--This is the second way of god mode.
--By the way, this has to be serversided
if game:GetService("RunService"):IsClient() then error("Script must be server-side in order to work; use h/ and not hl/") end
local Player,Mouse,mouse,UserInputService,ContextActionService = owner
do
	print("FE Compatibility code by Mokiros")
	script.Parent = Player.Character

	--RemoteEvent for communicating
	local Event = Instance.new("RemoteEvent")
	Event.Name = "UserInput_Event"

	--Fake event to make stuff like Mouse.KeyDown work
	local function fakeEvent()
		local t = {_fakeEvent=true,Connect=function(self,f)self.Function=f end}
		t.connect = t.Connect
		return t
	end

	--Creating fake input objects with fake variables
    local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
	local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
	local CAS = {Actions={},BindAction=function(self,name,fun,touch,...)
		CAS.Actions[name] = fun and {Name=name,Function=fun,Keys={...}} or nil
	end}
	--Merged 2 functions into one by checking amount of arguments
	CAS.UnbindAction = CAS.BindAction

	--This function will trigger the events that have been :Connect()'ed
	local function te(self,ev,...)
		local t = m[ev]
		if t and t._fakeEvent and t.Function then
			t.Function(...)
		end
	end
	m.TrigEvent = te
	UIS.TrigEvent = te

	Event.OnServerEvent:Connect(function(plr,io)
	    if plr~=Player then return end
		if io.isMouse then
			m.Target = io.Target
			m.Hit = io.Hit
		else
			local b = io.UserInputState == Enum.UserInputState.Begin
			if io.UserInputType == Enum.UserInputType.MouseButton1 then
				return m:TrigEvent(b and "Button1Down" or "Button1Up")
			end
			for _,t in pairs(CAS.Actions) do
				for _,k in pairs(t.Keys) do
					if k==io.KeyCode then
						t.Function(t.Name,io.UserInputState,io)
					end
				end
			end
			m:TrigEvent(b and "KeyDown" or "KeyUp",io.KeyCode.Name:lower())
			UIS:TrigEvent(b and "InputBegan" or "InputEnded",io,false)
	    end
	end)
	Event.Parent = NLS([==[
	local Player = game:GetService("Players").LocalPlayer
	local Event = script:WaitForChild("UserInput_Event")

	local UIS = game:GetService("UserInputService")
	local input = function(io,a)
		if a then return end
		--Since InputObject is a client-side instance, we create and pass table instead
		Event:FireServer({KeyCode=io.KeyCode,UserInputType=io.UserInputType,UserInputState=io.UserInputState})
	end
	UIS.InputBegan:Connect(input)
	UIS.InputEnded:Connect(input)

	local Mouse = Player:GetMouse()
	local h,t
	--Give the server mouse data 30 times every second, but only if the values changed
	--If player is not moving their mouse, client won't fire events
	while wait(1/30) do
		if h~=Mouse.Hit or t~=Mouse.Target then
			h,t=Mouse.Hit,Mouse.Target
			Event:FireServer({isMouse=true,Target=t,Hit=h})
		end
	end]==],Player.Character)
	Mouse,mouse,UserInputService,ContextActionService = m,m,UIS,CAS
end
Player = owner
plr = Player
Mouse.KeyDown:connect(function(key)
    if key == "e" and plr.Character.Parent == workspace then
        plr.Character.Parent = workspace.Camera
        plr.Character.Archivable = true
        Instance.new("ForceField",plr.Character).Visible = false
        for y,t in pairs(plr.Character:GetChildren()) do
            if t:IsA("Part") and t.Name ~= "HumanoidRootPart" then
                t.Transparency = 0
                if t.Name == "Head" and t:FindFirstChild("face") then
                    t.face.Transparency = 0
                end
            elseif t:IsA("Accessory") and t:FindFirstChild("Handle") then
                t.Handle.Transparency = 0
            end
        end
    elseif key == "t" and plr.Character.Parent == workspace.Camera and part == nil then
        plr.Character.Parent = workspace
        plr.Character.Archivable = false
        plr.Character:FindFirstChildOfClass("ForceField"):Remove()
        for y,t in pairs(plr.Character:GetChildren()) do
            if t:IsA("Part") and t.Name ~= "HumanoidRootPart" then
                t.Transparency = 0
                if t.Name == "Head" and t:FindFirstChild("face") then
                    t.face.Transparency = 0
                end
            elseif t:IsA("Accessory") and t:FindFirstChild("Handle") then
                t.Handle.Transparency = 0
            end
        end
    end
end)
