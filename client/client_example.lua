Events:Subscribe("ModuleLoad", function()
	local asylHandler = Asyl("AsylSample")
	
	local myButton = Button.Create()
	myButton:SetText("Test")
	asylHandler:GetData("ExampleDataRequest", ExampleDataRequestResponse, { number1 = 1, number2 = 2 }, myButton)
end)

function ExampleDataRequestResponse(data, state)
	Chat:Print("Response: " .. data.item1 .. ", " .. data.item2 .. ", " .. data.item3 .. ", state: " .. state:GetText(), Color(255, 0, 0))
end