function CriarJanela() -- Create all windows necessary to suspension
triggerServerEvent ( "onCreateLanguage", localPlayer ) 
janela_rebaixar = guiCreateWindow(128, 170, 579, 48, "SUSPENSION LHARC-94 TOOL 0.1", false)
guiWindowSetSizable(janela_rebaixar, false)
guiSetVisible ( janela_rebaixar, false )

bindKey("F12", "down", BaixarCarro)


-- Create the window for the CTRL HOLD suspension controller

janela_ctrl = guiCreateWindow(639, 448, 151, 120, "TOOL LHARC-94", false)
guiWindowSetSizable(janela_ctrl, false)

guiSetAlpha(janela_ctrl, 0.50)
SuspensionUp = guiCreateButton(12, 44, 122, 26, "˄", false, janela_ctrl)
SuspensionDown = guiCreateButton(12, 76, 122, 23, "˅", false, janela_ctrl)
TxtHoldCtrl = guiCreateLabel(12, 19, 127, 15, "", false, janela_ctrl)    
guiSetVisible ( janela_ctrl, false ) -- Set hold ctrl visible
avisos_janela_rebaixa = guiCreateLabel(12, 19, 563, 15, "", false, janela_rebaixar)
SmallWaterMark = guiCreateLabel(71, 100, 58, 15, "lharc systems", false, janela_ctrl)
guiSetAlpha(SmallWaterMark, 0.17)
guiSetFont(SmallWaterMark, "default-small") 

 end
 

 
 function Notice(noticia,language)
local NoticeText = loadstring("return " .. noticia)()		
if (guiGetVisible(janela_rebaixar) == false) then
guiSetVisible(janela_rebaixar, false)		
local Timer = setTimer ( function ( ) 
guiSetVisible(janela_rebaixar, true)							
			Timer = nil 
	 end, 10000, 1, localPlayer )
	 			Timer = nil 	
else
guiSetText ( avisos_janela_rebaixa ,  NoticeText)

local Timer = setTimer ( function ( ) 
guiSetVisible(janela_rebaixar, false)
			Timer = nil 
	 end, 10000, 1, localPlayer )
	 			Timer = nil 
	 end
	 
	 end
addEvent( "doNotice", true )
addEventHandler( "doNotice", getRootElement(), Notice  )


function EscondeMostra()
	 
		  if (guiGetVisible(janela_rebaixar) == false) or (guiGetVisible(janela_ctrl) == false) then -- Check if the GUI are visible
guiSetVisible(janela_rebaixar, true)		
guiSetVisible(janela_ctrl, true)				  
			bindKey("mouse_wheel_up", "down", Levanta) 
		    bindKey("mouse_wheel_down", "down", Desce)
			bindKey("num_add", "down", Levanta) 
			bindKey("num_sub", "down", Desce)
			if(movewith == "false") then
			bindKey("w", "down", EscondeJanela)
			bindKey("s", "down", EscondeJanela)
			end
			local Timer = setTimer ( function ( ) 
			guiSetVisible(janela_rebaixar, false)		
			Timer = nil 
	 end, 10000, 1, localPlayer )
	 			Timer = nil 
            triggerServerEvent ( "onVariablesUpdated", localPlayer ) -- Verify status like (limit,move with suspension are true or false)

			    else
  EscondeJanela()
			end
						  end
			function EscondeJanela() -- This function hide the GUI and unbind all the keys that i've pass before
			guiSetVisible(janela_rebaixar, false)		
            guiSetVisible(janela_ctrl, false)		
     	    unbindKey("mouse_wheel_up", "down", Levanta) 
		    unbindKey("mouse_wheel_down", "down", Desce)
			unbindKey("num_add", "down", Levanta) 
			unbindKey("num_sub", "down", Desce)
			
			if(movewith == "false") then
			unbindKey("w", "down", EscondeJanela)
			unbindKey("s", "down", EscondeJanela)
			end
			unbindKey("lctrl", "up", ActiveMouseClick)
			unbindKey("lctrl", "down", ActiveMouseClick)
	
			
			end
addEvent( "doEsconder", true )
addEventHandler( "doEsconder", getRootElement(), EscondeJanela  )

			
			 function onGuiClick ()
    if (source == SuspensionUp) then
        triggerServerEvent("subir", localPlayer)
    elseif (source == SuspensionDown) then
        triggerServerEvent("descer", localPlayer)
    end
end
addEventHandler("onClientGUIClick",root,onGuiClick)	  
 addEventHandler( "onClientResourceStart", getResourceRootElement( getThisResource( ) ), CriarJanela )
