local directory = game:GetService("ReplicatedStorage").ClientDB.Inventory;
local hs = game:GetService("HttpService");


local function moduleharvest(module)
	local newstuff = {}
	for i,v in pairs(module) do
		if type(v) == "table" then
			for i2, v2 in pairs(v) do 
				local yourmom = {}
				for i3,v3 in pairs(v2) do 
					yourmom[i3] = v3 
				end 
				table.insert(newstuff, yourmom)
			end
		end
	end
	return newstuff
end

for i,v in pairs(directory:GetDescendants()) do
   -- content pack database and inventory database don't contain information you need
   if v.ClassName == "ModuleScript" and v.Name ~= "ContentPackDB" and v.Name ~= "InventoryDB" then
   		local success, error = pcall(function()
   		writefile(v.Name .. ".json", hs:JSONEncode(moduleharvest(require(v))))
   		end)
   		if error then print(v.Name .. "had an error in it.") end
   		wait(1) -- yields the script because my potato laptop will explode without this
   		print(v.Name .. ": Completed.")
   end
end

print("Harvest successful! This will still work if Adopt Me's developers add new items.")