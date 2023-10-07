do

 	 env.info("Dofile Tanker Script - ", true)


    local tankerShell = GROUP:FindByName( "Shell" )
    local tankerTexaco = GROUP:FindByName( "Texaco" )
    local awacsWizard = GROUP:FindByName( "Wizard" )
    local transportAscot = GROUP:FindByName( "C-130 SOCOM Support" )
    local carrierGroup = GROUP:FindByName( "BLUFOR Carrier Group" )

    -- Create top level menu items. 
    local TransportMenu = MENU_COALITION:New( coalition.side.BLUE, "C-130 SOCOM support" )
    local TankersMenu = MENU_COALITION:New( coalition.side.BLUE, "Tankers" )
    local AWACSMenu = MENU_COALITION:New( coalition.side.BLUE, "AWACS tasking" )
    local carrierGroupMenu = MENU_COALITION:New( coalition.side.BLUE, "Carrier Group" )
    -- Create sub menues
    local ShellMenu = MENU_COALITION:New( coalition.side.BLUE, "Shell", TankersMenu )
    local TexacoMenu = MENU_COALITION:New( coalition.side.BLUE, "Texaco", TankersMenu )


local function tankHoldFnc(tnkrGrpParam)

    if(tnkrGrpParam == tankerShell) then
        trigger.action.setUserFlag( 6, 1  )
    elseif(tnkrGrpParam == tankerTexaco) then
        trigger.action.setUserFlag( 7, 1 )
    end
end

local function tankEnroutFnc(tnkrGrpParam)
    if(tnkrGrpParam == tankerShell) then
        trigger.action.setUserFlag( 8, 1 )
    elseif(tnkrGrpParam == tankerTexaco) then
        trigger.action.setUserFlag( 9, 1 )
    end
end

    --TODO: Look at menu logic: Add opens only when they are relevent (eg. No landing option if the AC is grouded)
    --TODO: Look at shrinking this
local function c130startFnc()
        trigger.action.setUserFlag( 1, 1 )
end

local function c130DepartHoldFnc()
        trigger.action.setUserFlag( 3, 1 )
end

local function c130ReturnHoldFnc()
        trigger.action.setUserFlag( 4, 1 )
end

local function c130ScramFnc()
        trigger.action.setUserFlag( 5, 1 )
end

local function awacsTaskingFnc()
        trigger.action.setUserFlag( 2, 1 )
end

local function carrierGroupSupportFnc()
    trigger.action.setUserFlag( 35, 1 )
end

----Comm Lists below----
            -- Format for Radio comm commands. --
    --   MENU_COALITION_COMMAND:New(Coalition, MenuText, ParentMenu, CommandMenuFunction, CommandMenuArgument)

    ---
    --- Radio Commands
    ---
    --Tankers comm list--

local ShellHoldMenItm = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Hold Ref Next WP", ShellMenu , tankHoldFnc, tankerShell)
local ShellTankMenItm = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Tank Enroute", ShellMenu, tankEnroutFnc, tankerShell)
local TexacoHoldMenItm = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Hold Ref Next WP", TexacoMenu,  tankHoldFnc ,tankerTexaco)
local TexacoTankMenItm = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Tank Enroute", TexacoMenu,  tankEnroutFnc, tankerTexaco)


    --Carrier Group comm list--
local CarriergroupsupportMenItm = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Help with Red Air problem", carrierGroupMenu , carrierGroupSupportFnc)

    -- AWACS comm list--
local AWACStaskingMenItm = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Commence AWACS role", AWACSMenu , awacsTaskingFnc)

    --C130 comm list--
local C130startMenItm = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Startup and Depart", TransportMenu , c130startFnc)
local C130departholdMenItem = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Push to Dropzone", TransportMenu , c130DepartHoldFnc)
local C130returnholdMenItm = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Return To Hold Point", TransportMenu , c130ReturnHoldFnc)
local C130scramMenItm = MENU_COALITION_COMMAND:New( coalition.side.BLUE, "Scram, enemy threat nearby", TransportMenu , c130ScramFnc)


end