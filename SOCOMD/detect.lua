-- env.info("Dofile Detect Script  - 3 ", true)

local con = Unit.getController(Unit.getByName('SA-10RDR'))

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
        tgt1Detected = con:isTargetDetected(tgt1, enum) -- Update lastValue with the result of isTargetDetecte
    end
    if (tgt2 ~= nil ) then
        tgt2Detected = con:isTargetDetected(tgt2, enum) -- Update lastValue with the result of isTargetDetecte
    end
    if (testTgt ~= nil ) then
        testTgtDetected = con:isTargetDetected(testTgt, enum) -- Update lastValue with the result of isTargetDetecte
    end


end 

        -- set the bool 'isDetected' flase if no detection, true otherwise
    if (tgt1Detected or tgt2Detected or testTgtDetected == false or nil ) then
        isDetected = false
    else
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