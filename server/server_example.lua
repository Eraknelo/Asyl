Events:Subscribe("ModuleLoad", function()
	local asylHandler = Asyl("AsylSample")
	
	asylHandler:AddHandler("ExampleDataRequest", ExampleDataRequestRequest)
end)

function ExampleDataRequestRequest(arguments)
	return { item1 = arguments.number1 + arguments.number2, item2 = "B", item3 = "C" }
end