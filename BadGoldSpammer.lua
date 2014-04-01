
--
-- Globals
--
BadGoldSpammer = {}
local BGS = BadGoldSpammer

--
-- Functions
--
local function Initialize( self, addOnName )

  if addOnName ~= "BadGoldSpammer" then return end

  EVENT_MANAGER:RegisterForEvent(
    "BadGoldSpammer", EVENT_CHAT_MESSAGE_CHANNEL, BGS.EventChatMessageChannel)

end

function BGS.EventChatMessageChannel(eventCode, messageType, fromName, text)

  if not ((messageType == CHAT_CHANNEL_ZONE) or
          (messageType == CHAT_CHANNEL_YELL) or 
          (messageType == CHAT_CHANNEL_WHISPER_INCOMING))
  then return end

  -- www...GOLD...com
  local found = string.find( 
    text, 
    "[wWV]+%.%w*[gG][oO0][lL1][dD]%w*%.[cC][oO0][mM]")

  if found == nil then return end

  -- Don't auto ignore friends
  if IsFriend(fromName) then return end 

  -- d( messageType .. " : " .. fromName .. " : " .. text)
  d( "BadGoldSpammer is adding ignore for: " .. fromName)

  -- local num = GetNumIgnored()
  AddIgnore(fromName)

  -- local note = "BadGoldSpammer\nAdded on " .. GetTimeString() .. "\n\n" .. text

  -- SetIgnoreNote(num, note)

end

-- Init Hook --
EVENT_MANAGER:RegisterForEvent( 
  "BadGoldSpammer", EVENT_ADD_ON_LOADED, Initialize )

