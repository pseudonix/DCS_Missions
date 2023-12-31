-- env.info("Dofile Detect Script  - 3 ", true)
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




    --TODO: finish this function.

--[[ local function checkDetection(unitTgt, unitCntrl)

    for det, enum in pairs(Controller.Detection) do
        tgt1Detected = unitCntrl:isTargetDetected(unitTgt, enum) -- Update lastValue with the result of isTargetDetected
    end

end ]]

function CheckRadar(isDetected, time)
    

    -- This for loop checks if any of the units are detected. Unit is "tgt1" radar is "con"
for det, enum in pairs(Controller.Detection) do

    if (tgt1 ~= nil ) then
        tgt1Detected = rdr1:isTargetDetected(tgt1, enum) -- Update lastValue with the result of isTargetDetect
    end
    if (tgt2 ~= nil ) then
        tgt2Detected = rdr1:isTargetDetected(tgt2, enum) -- Update lastValue with the result of isTargetDetecte
    end
    if (testTgt ~= nil ) then
        testTgtDetected = rdr1:isTargetDetected(testTgt, enum) -- Update lastValue with the result of isTargetDetecte
    end


end 

        -- set the bool 'isDetected' flase if no detection, true otherwise
    if ((tgt1Detected == false or nil) or (tgt2Detected == false or nil) or (testTgtDetected == false or nil)) then
        isDetected = false
    elseif (tgt1Detected == true or tgt2Detected == true or testTgtDetected == true ) then
        isDetected = true
    end

        -- if 'isDetected' is false script keeps running, if true trigger events
    if isDetected == false or nil then
        -- Keep going
--        trigger.action.outText("Not Detected", 1, true)

        return time + 1
    else
        -- set flag.a
        trigger.action.setUserFlag( 21, 1 )
--        trigger.action.outText("Detected", 10, true)
        return nil
    end
end
    -- This runs a time that executes the function every second.
timer.scheduleFunction(CheckRadar, false, timer.getTime() + 1)