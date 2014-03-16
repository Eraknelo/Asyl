class "Asyl"

function Asyl:__init(uniquePrefix)
	self.sendName = "Asyl" .. uniquePrefix .. "Callback"
	self.requestHandlers = {}

	-- Subscribe to network request event
	Network:Subscribe("Asyl" .. uniquePrefix .. "Request", self, self.Request)
end

--[[
	Handle:		The handle the client will send that should be associated with the callback
	Callback:	The function that will return the data that will be sent back to the client
]]
function Asyl:AddHandler(handle, callback)
	self.requestHandlers[handle] = callback
end

function Asyl:Request(args, player)
	local handle = args.handle
	local arguments = args.arguments
	
	local callback = self.requestHandlers[handle]
	if callback == nil then
		print("Asyl request was made to non-existent handler \"" .. handle .. "\".")
		return
	end
	
	local data = callback(arguments)
	Network:Send(player, self.sendName, { handle = handle, data = data })
end