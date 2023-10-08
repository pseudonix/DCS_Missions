--env.info("Dofile Detect Script  - 3 ", true)
--trigger.action.outText("Detect Script Ver 3 Loaded", 5, true)
--Mal edit
-- dofile("C:/Users/saint/Saved Games/DCS.openbeta/Missions/git/DCS_Missions/SOCOMD/detect.lua")
local rdr1 = Unit.getController(Unit.getByName('SA-10-1'))
local rdr2 = Unit.getController(Unit.getByName('SA-10-2')) 
local rdr3 = Unit.getController(Unit.getByName('SA-10-4'))



local tgt1 = Unit.getByName('LR Strike1-1')
local tgt2 = Unit.getByName('LR Strike1-2')
local testTgt = Unit.getByName('TestFlight-1')


 local tgt1Detected = nil -- Initialize variable to hold the last value
 local tgt2Detected = nil -- Initialize variable to hold the last value
 local testTgtDetected = nil -- Initialize variable to hold the last value
local isDetected = nil

local function checkTargetDetection(target, radar, detectionEnum)
    if target ~= nil then
        return radar:isTargetDetected(target, detectionEnum)
    end
    return nil
end

function CheckRadar(isDetected, time)
    
    for det, enum in pairs(Controller.Detection) do
        tgt1Detected = checkTargetDetection(tgt1, rdr1, enum) or  checkTargetDetection(tgt1, rdr2, enum) or  checkTargetDetection(tgt1, rdr3, enum)
        tgt2Detected = checkTargetDetection(tgt2, rdr1, enum) or  checkTargetDetection(tgt2, rdr2, enum) or  checkTargetDetection(tgt2, rdr3, enum)
        testTgtDetected = checkTargetDetection(testTgt, rdr1, enum) or  checkTargetDetection(testTgt, rdr2, enum) or  checkTargetDetection(testTgt, rdr3, enum)
     end

    isDetected = (tgt1Detected == true) or (tgt2Detected == true) or (testTgtDetected == true) or false
    
    -- if 'isDetected' is false script keeps running, if true trigger events
    if isDetected == false or nil then
        -- Keep going
--        trigger.action.outText("Not Detected", 1, true)
        return time + 1
 --       trigger.action.outText("Time: " .. time.tostring , 1, true)
    else
        -- set flag.a
        trigger.action.setUserFlag( 21, 1 )
--        trigger.action.outText("Detected", 10, true)
        return nil
    end
end
    -- This runs a time that executes the function every second.
timer.scheduleFunction(CheckRadar, false, timer.getTime() + 1)