

	 env.info("Dofile Airboss Script - ", true)



     -- S-3B Recovery Tanker spawning in air.
local tanker=RECOVERYTANKER:New("USS Roosevelt", "Arco Group")
tanker:SetTakeoffAir()
tanker:SetRadio(253)
tanker:SetModex(511)
tanker:SetTACAN(27, "RCV")
tanker:__Start(1)


-- Create AIRBOSS object.
local AirbossRoosevelt=AIRBOSS:New("USS Roosevelt")


	-- TODO: Change/Add/Remove Recovery Windows to suit mission.
		-- AddRecoveryWindow(self, starttime, stoptime, case, holdingoffset, turnintowind, speed, uturn)

-- Add recovery windows.
	-- Case I from 9 to 10 am.
local window1=AirbossRoosevelt:AddRecoveryWindow( "9:00", "10:00", 1, nil, true, 25)
	-- Case II with +15 degrees holding offset from 15:00 for 60 min.
local window2=AirbossRoosevelt:AddRecoveryWindow("15:00", "16:00", 2,  15, true, 23)
	-- Case III with +30 degrees holding offset from 2100 to 2200.
local window3=AirbossRoosevelt:AddRecoveryWindow("21:00", "22:00", 3,  30, true, 21)

-- Single carrier menu optimization.
AirbossRoosevelt:SetMenuSingleCarrier()

-- Skipper menu.
AirbossRoosevelt:SetMenuRecovery(30, 25, false)

-- Remove landed AI planes from flight deck.
AirbossRoosevelt:SetDespawnOnEngineShutdown()

-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
AirbossRoosevelt:Load()

-- Automatically save player results to your "Saved Games\DCS" folder each time a player get a final grade from the LSO.
AirbossRoosevelt:SetAutoSave()

-- Enable trap sheet.
AirbossRoosevelt:SetTrapSheet()

-- Start airboss class.
AirbossRoosevelt:Start()

--- Function called when recovery tanker is started.
function tanker:OnAfterStart(From,Event,To)

  -- Set recovery tanker.
  AirbossRoosevelt:SetRecoveryTanker(tanker)  


  -- Use tanker as radio relay unit for LSO transmissions.
  AirbossRoosevelt:SetRadioRelayLSO(self:GetUnitName())
  
end

--- Function called when a player gets graded by the LSO.
function AirbossRoosevelt:OnAfterLSOGrade(From, Event, To, playerData, grade)
  local PlayerData=playerData --Ops.Airboss#AIRBOSS.PlayerData
  local Grade=grade --Ops.Airboss#AIRBOSS.LSOgrade

  ----------------------------------------
  --- Interface your Discord bot here! ---
  ----------------------------------------
  
  local score=tonumber(Grade.points)
  local name=tostring(PlayerData.name)
  
  -- Report LSO grade to dcs.log file.
  env.info(string.format("Player %s scored %.1f", name, score))
end