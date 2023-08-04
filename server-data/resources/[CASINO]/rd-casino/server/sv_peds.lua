local casinoPeds = {
	{ x = 979.6, y = 32.82, z = 72.46, h = 246.14, model = 'a_m_y_mexthug_01', _pedType = 30 , scenario = "WORLD_HUMAN_SMOKING" },
	{ x = 971.54, y = 28.18, z = 72.46, h = 20.65, model = 'a_m_y_mexthug_01', _pedType = 30 , scenario = "WORLD_HUMAN_SMOKING" },
	{ x = 965.35, y = 39.75, z = 72.9, h = 200.21, model = 'a_m_y_mexthug_01' ,_pedType = 30 , scenario = "WRLD_HUMAN_SMOKING" },
	{ x = 990.46, y = 38.55, z = 72.06, h = 104.43, model = 'a_m_y_mexthug_01', _pedType = 30 , scenario = "WOORLD_HUMAN_SMOKING" },
	{ x = 986.93, y = 51.46, z = 72.06, h = 190.5, model = 'a_m_y_mexthug_01' , _pedType = 30 , scenario = "WORLD_HUMAN_SMOKING" },

}

RPC.register('rd-casino:getSpawnedPedCoords',function(boolean)
   return casinoPeds
end)