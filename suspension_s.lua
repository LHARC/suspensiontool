function VariablesUpdated()
language = get("language")
limitsuspension = get("limit")
movesuspension = get("suspensionmove")
warndriver = get("messagedriver")

end
addEvent( "onVariablesUpdated", true )
addEventHandler( "onVariablesUpdated", root, VariablesUpdated )

function LanguageName( player )
    VariablesUpdated()
     triggerClientEvent ("doLanguageNameTransfer", getRootElement(), language, limitsuspension, movesuspension, warndriver )
	end
addEvent( "onCreateLanguage", true )
addEventHandler( "onCreateLanguage", root, LanguageName )


function descer( player )
local veh = getPedOccupiedVehicle ( source )
if not veh then return end
local suspensao = (getVehicleHandling(veh)['suspensionLowerLimit']) -- Get actual car handling for lower

if limitsuspension == "true" then -- Verify if limit suspension are true or false on this mod settings

 if suspensao == math.abs(suspensao) then -- Compares and checks if it is a negative number

  triggerClientEvent (source,"doNotice", getRootElement(), "txtLevelMaxLower", language )
else
setVehicleHandling ( veh, "suspensionLowerLimit", suspensao+0.1 ) -- With suspension limit 
end
else
setVehicleHandling ( veh, "suspensionLowerLimit", suspensao+0.1 ) -- Without suspension  limit 
end
 end
addEvent("descer", true)
addEventHandler("descer", root, descer)

function subir( player )
local veh = getPedOccupiedVehicle ( source )
if not veh then return end
local altura_original = (getVehicleHandling(veh)['suspensionUpperLimit']*-1) -- Get the original handling and multiply to get negative and matches with the actual
local suspensao = (getVehicleHandling(veh)['suspensionLowerLimit']) -- Get actual handling from the player car


if limitsuspension == "true" then  -- Verify if limit suspension are true or false on this mod settings

 if (suspensao < altura_original-0.2) then --  Compares if the suspension are less then original handling height
			     triggerClientEvent (source, "doNotice", getRootElement(), "txtLevelMaxUp", language )
else
setVehicleHandling ( veh, "suspensionLowerLimit", suspensao-0.1 ) -- With suspension limit
end
else
setVehicleHandling ( veh, "suspensionLowerLimit", suspensao-0.1 ) -- Without suspension limit
end
end

function EscondeJanela( player )
  triggerClientEvent (source, "doEsconder", getRootElement()) -- Pass the value of the language from GET	 
end

			
addEvent("subir", true)
addEventHandler("subir", root, subir)
addEventHandler ( "onVehicleExit", root, EscondeJanela )