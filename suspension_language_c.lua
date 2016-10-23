----------------------------------------------------------------------------------------------------------------------------------------------------------------
----- You want to help me with this small translation send me a email "webmaster@whispers.com.br" --------------
----- On future updates i'll add more languages if you can translate to another language feel free to help us  ------
----- Coded by Lucas H. (Stoppered) -----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function LanguageCall ( language, limitsuspension, movesuspension, warndriver  )

language = (language)
movewith = (movesuspension)
warndriver = (warndriver)
    
if  (language == "english") then
    CMDCommand = "suspension" -- If you change don't put / just type example "suspension", or "hydraulic"
	txtSuspension = "You can not change the suspension in motion"
	txtOnlyDriverAllow = "Only the driver can change the suspension"
	txtPedNotInCar = "You're not in a car"
	txtButtonToPress = "Tool suspension 0.1 enabled press 'F12' to open"
	txtLevelMaxLower = "Suspension in max height you can't get more lower"
	txtLevelMaxUp = "Suspension in max height you can't get more tall"
	txtWarnDriver = "You can change the suspension pressing F12"
	--- Buttons
	TxtInicio = "Suspension tool enabled for adjust the suspension press \"scroll mouse up and down\" or numpad + -"
    TxtCTRL = "   Hold CTRL to use"
	
else if  (language == "portuguese") then
	txtSuspension = "Não é possível alterar a suspensão em movimento"
	txtOnlyDriverAllow = "Apenas o motorista pode alterar a suspensão"
	txtPedNotInCar = "Você não está em um carro"
	txtButtonToPress = "Tool suspension 0.1 rebaixe seu carro pressione 'F12' para abrir"
	txtLevelMaxLower = "Suspensão no limite máximo de altura não é possível descer mais"
	txtLevelMaxUp = "Suspensão no limite máximo de altura não é possível subir mais"
	txtWarnDriver = "Você pode rebaixar o seu carro facilmente pressionando F12"
	-- Buttons
	TxtInicio = "Ajuste sua suspensão use \"scroll do mouse para cima ou para baixo\" ou use numpad + / - para ajustar"
    TxtCTRL = "Segure CTRL para usar"
	
else if  (language == "spanish") then
    txtSuspension = "No se puede cambiar la suspensión en movimiento"
	txtOnlyDriverAllow = "Sólo el conductor puede cambiar la suspensión"
	txtPedNotInCar = "No estás en un coche"
	txtButtonToPress = "Tool suspension 0.1 deje la suspensión de su coche más deportivo 'F12'"
	txtLevelMaxLower = "Suspensión en el límite de altura no puede ir más bajo"
	txtLevelMaxUp = "Suspensión en el límite de altura no puede ir más alto"
    txtWarnDriver = "Usted puede cambiar fácilmente su suspensión presionando F12"
	-- Buttons
	TxtInicio = "Ajuste su suspensión con el \"scroll do mouse arriba o abajo\" uo usar numpad + / - para ajustar"
    TxtCTRL = "Oprimir CTRL para usar"
	
	end

end
end
end

-- To make this little multi language tool
-- I've use some triggers on the suspension_s.lua to send some information about the language on the settings

addEvent( "doLanguageNameTransfer", true )
addEventHandler( "doLanguageNameTransfer", getRootElement(), LanguageCall  )