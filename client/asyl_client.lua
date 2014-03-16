class "Asyl"

function Asyl:__init(uniquePrefix)
	self.sendName = "Asyl" .. uniquePrefix .. "Request"
	self.awaitingHandles = {}
	
	-- Subscribe to network callback event
	Network:Subscribe("Asyl" .. uniquePrefix .. "Callback", self, self.Callback)
end

--[[
	Handle: 	The name that the server will use to determine what function to use to get the results
	Callback: 	A function that gets called when the data has been received
	Arguments:	Argumetns that will be sent to the server (optional)
	State:		An argument that will be sent back through the specified callback, without being touched.
				Can be used for identifying a specific callback, but may contain anything.
]]
function Asyl:GetData(handle, callback, arguments, state)
	if handle == nil then
		print("No Asyl handle was specified in GetData")
		return
	end
	
	if callback == nil then
		print("No Asyl callback was specified in GetData")
		return
	end

	self.awaitingHandles[handle] = callback
	Network:Send(self.sendName, { handle = handle, arguments = arguments, state = state })
end

function Asyl:Callback(args)
	local handle = args.handle
	local data = args.data
	local state = args.state
	
	local callbackHandler = self.awaitingHandles[handle]
	if callbackHandler == nil then
		print("Asyl callback was made, but found no handler. Handle: \"" .. handle .. "\".")
		return
	end
	
	callbackHandler(data, state)
end