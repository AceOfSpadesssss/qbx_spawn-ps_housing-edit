local ps_starters = {
    -- ["Name of Starting appartment"] = vector3()
    ["Motel"] = vector3(325.14, -229.54, 54.21)
}

lib.callback.register('qbx_spawn:server:getLastLocation', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    return json.decode(MySQL.single.await('SELECT position FROM players WHERE citizenid = ?', {player.PlayerData.citizenid}).position)
end)

lib.callback.register('qbx_spawn:server:getHouses', function(source)
    local player = exports.qbx_core:GetPlayer(source)
    local houseData = {}
    local playerHouses = MySQL.query.await('SELECT * FROM properties WHERE owner_citizenid = ?', {player.PlayerData.citizenid})
    for i = 1, #playerHouses do
        local key_id = #houseData+1
        local house = playerHouses[i]
        houseData[key_id] = {
            id = house.property_id,
            label = (house.apartment or house.street) .. " " .. house.property_id,
        }
        if house.door_data.x and house.door_data.y and house.door_data.z then
            houseData[key_id].coords = vector3(house.door_data.x, house.door_data.y, house.door_data.z)
        else
            for k, v in pairs(ps_starters) do 
                if house.apartment == k then
                    houseData[key_id].coords = v
                end
            end
        end
    end

    return houseData
end)