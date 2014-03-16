Events:Subscribe("ModuleLoad", function()
	local asylHandler = Asyl("AsylSample")
	
	asylHandler:GetData("ExampleDataRequest", ExampleDataRequestResponse, { number1 = 1, number2 = 2 }, "My state.")
end)

function ExampleDataRequestResponse(data, state)
	Chat:Print("Response: " .. data.item1 .. ", " .. data.item2 .. ", " .. data.item3 .. ", state: " .. state, Color(255, 0, 0))
end