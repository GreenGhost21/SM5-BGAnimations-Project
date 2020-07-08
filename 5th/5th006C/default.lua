
local t = Def.ActorFrame{}

local tweaks = {

	{
		Index = 1,
		Y_num = { -2, 1 },
		Y_pos = 0.5,
		Commands = "StairsStates"
	},

	{
		Index = 2,
		Remove = true
	}
	
}

	t[#t+1] = LoadActor( "/BGAnimations/5th006A", tweaks )..{}

local params = {

	File = "/BGAnimations/Resources/5th/Sprites/DABCDE 4x3.png",
	Frame_i = 1,
	Frame_l = 12

}

	t[#t+1] = LoadActor("../Resources/5th/Scripts/LineXY.lua", params)..{}


return Def.ActorFrame{ t }