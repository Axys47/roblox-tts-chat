local SoundService = game:GetService("SoundService")
local function init(player:Player)
-------------------speech thingy---------------------------------------
local audioTextToSpeech : AudioTextToSpeech = Instance.new("AudioTextToSpeech")
audioTextToSpeech.Parent = player
audioTextToSpeech.Volume = 3
-------------------output----------------------------------------------
local deviceOutput = Instance.new("AudioDeviceOutput")
deviceOutput.Parent = SoundService
deviceOutput.Name = player.Name.."ttsoutput"
-------------------wire------------------------------------------------
local wire = Instance.new("Wire")
wire.Parent = deviceOutput
wire.SourceInstance = audioTextToSpeech
wire.TargetInstance = deviceOutput
-------------------detectorstuff----------------------------
player.Chatted:Connect(function(message)
    audioTextToSpeech.Pitch = math.random(-12,12)
    audioTextToSpeech.VoiceId = tostring(math.random(9,10))
    audioTextToSpeech.Text = tostring(message)
    audioTextToSpeech:Play()
end)
end
game.Players.PlayerAdded:Connect(init)
