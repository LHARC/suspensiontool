	function ActiveMouseClick()
		 		if getKeyState( "lctrl" ) == true then -- Check if CTRL are on holding
		 showCursor ( true )
		 else
		 		 showCursor ( false )
		 end
		end
		
		function PlayerWarn( thePlayer, seat)
			if thePlayer == getLocalPlayer() and seat == 0 then
				 outputChatBox (txtWarnDriver, localPlayer )
				 end
		end
		addEvent( "doPlayerWarn", true )
        addEventHandler( "doPlayerWarn", getRootElement(), PlayerWarn )
		


function BaixarCarro ( )
    if isPedInVehicle(localPlayer) then
	
		    guiSetText ( TxtHoldCtrl ,  TxtCTRL)
		    guiSetText ( avisos_janela_rebaixa ,  TxtInicio )


		 local vehicle = getPedOccupiedVehicle(localPlayer)
		 local seatvehicle = getVehicleOccupant(vehicle,0)
		 if(seatvehicle) then
		  setVehiclePlateText( vehicle, "LHARC-94")
		 bindKey("lctrl", "down", ActiveMouseClick)
         bindKey("lctrl", "up", ActiveMouseClick)
		
		 if (getElementVelocity(vehicle) == 0) or (movewith == "true") then -- Get if car is stopped
		     EscondeMostra()
			else
             outputChatBox ( txtSuspension, localPlayer ) -- Language text from suspension_language_c
			end
    else
         outputChatBox ( txtOnlyDriverAllow, localPlayer) -- Language text from suspension_language_c
    end
	else
         outputChatBox ( txtPedNotInCar, localPlayer) -- Language text from suspension_language_c
	end
end

addEvent( "doSuspensionTool", true )
addEventHandler( "doSuspensionTool", getRootElement(), BaixarCarro  )

function Levanta()
     triggerServerEvent("subir", localPlayer)
end

function Desce()
      triggerServerEvent("descer", localPlayer)
end
addEventHandler ( "onClientVehicleEnter", root, PlayerWarn )