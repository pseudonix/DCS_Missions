 env.info("Do Script detect  - 3 ", true)

 -- test Comment

local con = Unit.getController(Unit.getByName('SA-10RDR'))
  local target = Unit.getByName('TestFlight-1')



local lastValue = nil -- Initialize variable to hold the last value

for det, enum in pairs(Controller.Detection) do
    lastValue = con:isTargetDetected(target, enum) -- Update lastValue with the result of isTargetDetected
end


function CheckRadar(isDetected, time)
    for det, enum in pairs(Controller.Detection) do
        lastValue = con:isTargetDetected(target, enum) -- Update lastValue with the result of isTargetDetected
    end

    isDetected = lastValue
     -- Do things to check, use isDetected (which is the scheduleFunction's second argument)
    if isDetected == false or nil then
        -- Keep going
        trigger.action.outText("Not Detected", 1, true)

        return time + 1
    else
        -- set flag.a
        trigger.action.setUserFlag( 21, 1 )
        trigger.action.outText("Detected", 10, true)
        return nil
    end
end
timer.scheduleFunction(CheckRadar, false, timer.getTime() + 1)