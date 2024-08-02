-- SPEED OF LIGHT MOVESET --

local Players = game:GetService("Players")
local player = Players.LocalPlayer

if player and player:FindFirstChild("Backpack") then
    local backpack = player.Backpack
    
    for _, item in ipairs(backpack:GetChildren()) do
        if item:IsA("Tool") then
            item:Destroy()
        end
    end
end

-- Create the Tool instance
local tool = Instance.new("Tool")
tool.Name = "Energized Punches"
tool.RequiresHandle = false
tool.CanBeDropped = true
tool.ToolTip = "*furiously barrages*"

-- Animation IDs
local mainAnimationId = "rbxassetid://10466974800"
local pushBackAnimationId = "rbxassetid://10471478869"

-- Damage parameters
local minDamage = 5
local maxDamage = 10
local pushBackDistance = 15

-- Function to play an animation
local function playAnimation(animationId, humanoid)
    local animation = Instance.new("Animation")
    animation.AnimationId = animationId
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack:Play()
    animationTrack:AdjustSpeed(5)
    return animationTrack
end

-- Function to play the push-back animation
local function playPushBackAnimation(humanoid)
    local pushBackAnimation = Instance.new("Animation")
    pushBackAnimation.AnimationId = pushBackAnimationId
    local pushBackAnimationTrack = humanoid:LoadAnimation(pushBackAnimation)
    pushBackAnimationTrack:Play()
end

-- Connect tool activation event
    tool.Equipped:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Check if there is a player in front
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local lookDirection = humanoidRootPart.CFrame.LookVector
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local raycastResult = workspace:Raycast(humanoidRootPart.Position, lookDirection * 20, raycastParams)
    
    if raycastResult and raycastResult.Instance and raycastResult.Instance.Parent:FindFirstChild("Humanoid") then
        -- There is a player in front, play secondary animation after 0.7 seconds
        local hitCharacter = raycastResult.Instance.Parent
        local hitHumanoidRootPart = hitCharacter:FindFirstChild("HumanoidRootPart")
        local hitHumanoid = hitCharacter:FindFirstChild("Humanoid")
        
        if hitHumanoidRootPart and hitHumanoid then
            -- Play the main animation immediately
            local mainAnimationTrack = playAnimation(mainAnimationId, humanoid)
            
            -- Apply damage and push back after the delay
            local damage = math.random(minDamage, maxDamage)
            hitHumanoid:TakeDamage(damage)
            local pushBackDirection = (hitHumanoidRootPart.Position - humanoidRootPart.Position).unit
            local pushBackForce = pushBackDirection * pushBackDistance
            hitHumanoidRootPart.Velocity = pushBackForce
            playPushBackAnimation(hitHumanoid)  -- Play push-back animation
            print("Dealt " .. damage .. " damage, pushed back player, and played push-back animation on player: " .. hitCharacter.Name)
        end
        local soundeffect = Instance.new("Sound")
    soundeffect.SoundId = "rbxassetid://17799049330"
    soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
    soundeffect:Play()
    soundeffect.Volume = 1
    wait(0.3)
    soundeffect:Stop()
    else
        -- No player found in front, just play main animation
        print("No player found in front.")
        playAnimation(mainAnimationId, humanoid)
    end
end)

-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack


-- Create the Tool instance
local tool = Instance.new("Tool")
tool.Name = "Shooter"
tool.RequiresHandle = false
tool.CanBeDropped = true
tool.ToolTip = "*pulls out your arm*"

-- Animation IDs
local mainAnimationId = "rbxassetid://13073745835"
local pushBackAnimationId = "rbxassetid://10471478869"

-- Damage parameters
local minDamage = 15
local maxDamage = 20
local pushBackDistance = 20

-- Function to play an animation
local function playAnimation(animationId, humanoid)
    local animation = Instance.new("Animation")
    animation.AnimationId = animationId
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack:Play()
    animationTrack:AdjustSpeed(5)
    wait(0.1)
    animationTrack:AdjustSpeed(1)
    wait(0.4)
    local hit1 = game.ReplicatedStorage.Resources.KJEffects["HitParticles"].Hit:Clone()
    hit1.Parent = game.Players.LocalPlayer.Character["Right Arm"]
    for _, child in ipairs(hit1:GetChildren()) do
        if child:IsA("ParticleEmitter") then -- Check if the child is a ParticleEmitter
            child:Emit(50) -- Emit 20 particles
        end
    end
    return animationTrack
end

-- Function to play the push-back animation
local function playPushBackAnimation(humanoid)
    local pushBackAnimation = Instance.new("Animation")
    pushBackAnimation.AnimationId = pushBackAnimationId
    local pushBackAnimationTrack = humanoid:LoadAnimation(pushBackAnimation)
    pushBackAnimationTrack:Play()
end

-- Connect tool activation event
tool.Equipped:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Check if there is a player in front
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local lookDirection = humanoidRootPart.CFrame.LookVector
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local raycastResult = workspace:Raycast(humanoidRootPart.Position, lookDirection * 20, raycastParams)
    
    if raycastResult and raycastResult.Instance and raycastResult.Instance.Parent:FindFirstChild("Humanoid") then
        -- There is a player in front, play secondary animation after 0.7 seconds
        local hitCharacter = raycastResult.Instance.Parent
        local hitHumanoidRootPart = hitCharacter:FindFirstChild("HumanoidRootPart")
        local hitHumanoid = hitCharacter:FindFirstChild("Humanoid")
        
        if hitHumanoidRootPart and hitHumanoid then
            -- Play the main animation immediately
            local mainAnimationTrack = playAnimation(mainAnimationId, humanoid)
            
            -- Apply damage and push back after the delay
            local damage = math.random(minDamage, maxDamage)
            hitHumanoid:TakeDamage(damage)
            local pushBackDirection = (hitHumanoidRootPart.Position - humanoidRootPart.Position).unit
            local pushBackForce = pushBackDirection * pushBackDistance
            hitHumanoidRootPart.Velocity = pushBackForce
            playPushBackAnimation(hitHumanoid)  -- Play push-back animation
            print("Dealt " .. damage .. " damage, pushed back player, and played push-back animation on player: " .. hitCharacter.Name)
        end
        local soundeffect = Instance.new("Sound")
    soundeffect.SoundId = "rbxassetid://17325540665"
    soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
    soundeffect:Play()
    soundeffect.Volume = 1
    else
        -- No player found in front, just play main animation
        print("No player found in front.")
        playAnimation(mainAnimationId, humanoid)
        local soundeffect = Instance.new("Sound")
    soundeffect.SoundId = "rbxassetid://17325540665"
    soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
    soundeffect:Play()
    soundeffect.Volume = 1
    end
end)

-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack


-- Create the Tool instance
local tool = Instance.new("Tool")
tool.Name = "Time Travel Fighting"
tool.RequiresHandle = false
tool.CanBeDropped = true
tool.ToolTip = "weakest dummy fight back"

-- Animation IDs
local mainAnimationId = "rbxassetid://18440406788"
local pushBackAnimationId = "rbxassetid://18440398084"

-- Damage parameters
local minDamage = 20
local maxDamage = 25
local pushBackDistance = 30

-- Function to play an animation
local function playAnimation(animationId, humanoid)
    local animation = Instance.new("Animation")
    animation.AnimationId = animationId
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack:Play()
    animationTrack:AdjustSpeed(20)
    wait(0.5)
    return animationTrack
end

-- Function to play the push-back animation
local function playPushBackAnimation(humanoid)
    local pushBackAnimation = Instance.new("Animation")
    pushBackAnimation.AnimationId = pushBackAnimationId
    local pushBackAnimationTrack = humanoid:LoadAnimation(pushBackAnimation)
    pushBackAnimationTrack:Play()
    pushBackAnimationTrack:AdjustSpeed(10)
    wait(0.5)
    pushBackAnimationTrack:AdjustSpeed(1)
end

-- Connect tool activation event
tool.Equipped:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Check if there is a player in front
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local lookDirection = humanoidRootPart.CFrame.LookVector
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local raycastResult = workspace:Raycast(humanoidRootPart.Position, lookDirection * 20, raycastParams)
    
    if raycastResult and raycastResult.Instance and raycastResult.Instance.Parent:FindFirstChild("Humanoid") then
        -- There is a player in front, play secondary animation after 0.7 seconds
        local hitCharacter = raycastResult.Instance.Parent
        local hitHumanoidRootPart = hitCharacter:FindFirstChild("HumanoidRootPart")
        local hitHumanoid = hitCharacter:FindFirstChild("Humanoid")
        
        if hitHumanoidRootPart and hitHumanoid then
            -- Play the main animation immediately
            local mainAnimationTrack = playAnimation(mainAnimationId, humanoid)
            
            -- Apply damage and push back after the delay
            local damage = math.random(minDamage, maxDamage)
            hitHumanoid:TakeDamage(damage)
            local pushBackDirection = (hitHumanoidRootPart.Position - humanoidRootPart.Position).unit
            local pushBackForce = pushBackDirection * pushBackDistance
            hitHumanoidRootPart.Velocity = pushBackForce
            playPushBackAnimation(hitHumanoid)  -- Play push-back animation
            print("Dealt " .. damage .. " damage, pushed back player, and played push-back animation on player: " .. hitCharacter.Name)
        end
    else
        -- No player found in front, just play main animation
        print("No player found in front.")
        playAnimation(mainAnimationId, humanoid)
    end
end)

-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack

-- Create the Tool instance
local tool = Instance.new("Tool")
tool.Name = "Running Fists"
tool.RequiresHandle = false
tool.CanBeDropped = true
tool.ToolTip = "take this you little wimp"

-- Animation IDs
local mainAnimationId = "rbxassetid://13560306510"
local pushBackAnimationId = "rbxassetid://10471478869"

-- Damage parameters
local minDamage = 10
local maxDamage = 15
local pushBackDistance = 15

-- Function to play an animation
local function playAnimation(animationId, humanoid)
    local animation = Instance.new("Animation")
    animation.AnimationId = animationId
    local animationTrack = humanoid:LoadAnimation(animation)
    animationTrack:Play()
    animationTrack:AdjustSpeed(10)
    wait(0.35)
    return animationTrack
end

-- Function to play the push-back animation
local function playPushBackAnimation(humanoid)
    local pushBackAnimation = Instance.new("Animation")
    pushBackAnimation.AnimationId = pushBackAnimationId
    local pushBackAnimationTrack = humanoid:LoadAnimation(pushBackAnimation)
    pushBackAnimationTrack:Play()
end

-- Connect tool activation event
tool.Equipped:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    -- Check if there is a player in front
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local lookDirection = humanoidRootPart.CFrame.LookVector
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local raycastResult = workspace:Raycast(humanoidRootPart.Position, lookDirection * 20, raycastParams)
    
    if raycastResult and raycastResult.Instance and raycastResult.Instance.Parent:FindFirstChild("Humanoid") then
        -- There is a player in front, play secondary animation after 0.7 seconds
        local hitCharacter = raycastResult.Instance.Parent
        local hitHumanoidRootPart = hitCharacter:FindFirstChild("HumanoidRootPart")
        local hitHumanoid = hitCharacter:FindFirstChild("Humanoid")
        
        if hitHumanoidRootPart and hitHumanoid then
            -- Play the main animation immediately
            local mainAnimationTrack = playAnimation(mainAnimationId, humanoid)
            
            -- Apply damage and push back after the delay
            local damage = math.random(minDamage, maxDamage)
            hitHumanoid:TakeDamage(damage)
            local pushBackDirection = (hitHumanoidRootPart.Position - humanoidRootPart.Position).unit
            local pushBackForce = pushBackDirection * pushBackDistance
            hitHumanoidRootPart.Velocity = pushBackForce
            playPushBackAnimation(hitHumanoid)  -- Play push-back animation
            print("Dealt " .. damage .. " damage, pushed back player, and played push-back animation on player: " .. hitCharacter.Name)
        end
    else
        -- No player found in front, just play main animation
        print("No player found in front.")
        playAnimation(mainAnimationId, humanoid)
    end
end)

-- Add the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local AnimationId = "rbxassetid://15957361339"
local SoundId = "rbxassetid://15956555583"


local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Mouse = LocalPlayer:GetMouse()
local Humanoid = Character:WaitForChild("Humanoid")
local Torso = Character:WaitForChild("Torso")


local TweenSpeed = 100000


local CooldownTime = 0.9
local LastActivated = 0


local animation = Instance.new("Animation")
animation.AnimationId = AnimationId


local animTrack = Humanoid:LoadAnimation(animation)


local tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Velocity Manipulate"
tool.ManualActivationOnly = false


local sound = Instance.new("Sound")
sound.SoundId = SoundId
sound.Volume = 1
sound.Parent = Character.HumanoidRootPart


function tweenTeleport(to, speed)
    local rootPart = Character.HumanoidRootPart
    local distance = (to.Position - rootPart.Position).Magnitude
    local tweenInfo = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear)
    
    local tween = TweenService:Create(rootPart, tweenInfo, {
        CFrame = to
    })


    tween:Play()
    tween.Completed:Wait()
end


local function findDescendant(parent, name)
    local child = parent:FindFirstChild(name)
    if not child then
        for _, descendant in ipairs(parent:GetChildren()) do
            child = findDescendant(descendant, name)
            if child then
                break
            end
        end
    end
    return child
end


local function duplicateEmitter(originalEmitter)
    local duplicate = originalEmitter:Clone()
    duplicate.Parent = originalEmitter.Parent
    duplicate.Rate = 100
    return duplicate
end


tool.Equipped:Connect(function()
    local currentTime = tick()


    if currentTime - LastActivated >= CooldownTime then
        LastActivated = currentTime


        local position = Mouse.Hit + Vector3.new(0, 2.5, 0)
        tweenTeleport(CFrame.new(position.X, position.Y, position.Z), TweenSpeed)
        
        animTrack:Play()
        
        sound:Play()
        
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local resourcesFolder = replicatedStorage:WaitForChild("Resources", 2)
        if resourcesFolder then
            local kjEffectsFolder = resourcesFolder:FindFirstChild("KJEffects")
            if kjEffectsFolder then
                local tpThingEmitter = findDescendant(kjEffectsFolder, "tpthing")
                if tpThingEmitter and tpThingEmitter:IsA("ParticleEmitter") then
                    local duplicatedEmitter = duplicateEmitter(tpThingEmitter)
                    
                    duplicatedEmitter.Parent = Torso
                    print("Successfully parented duplicated tpthing ParticleEmitter to Torso and set Rate to 100.")
                    
                    wait(0.2)
                    
                    duplicatedEmitter.Rate = 0
                    print("Successfully set Rate of duplicated emitter to 0 after 0.2 seconds.")
                else
                    warn("Could not find tpthing ParticleEmitter or it is not a ParticleEmitter.")
                end
            else
                warn("Could not find KJEffects folder inside Resources.")
            end
        else
            warn("Could not find Resources folder inside ReplicatedStorage.")
        end
    end
end)


tool.Parent = LocalPlayer.Backpack

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function findGuiAndSetText()
    local screenGui = playerGui:FindFirstChild("ScreenGui")
    if screenGui then
        local magicHealthFrame = screenGui:FindFirstChild("MagicHealth")
        if magicHealthFrame then
            local textLabel = magicHealthFrame:FindFirstChild("TextLabel")
            if textLabel then
                textLabel.Text = "SPEED OF LIGHT"
            end
        end
    end
end


playerGui.DescendantAdded:Connect(findGuiAndSetText)
findGuiAndSetText()
