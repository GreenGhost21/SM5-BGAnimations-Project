
local tweaks = {
	Index = 2,
	File = "/BGAnimations/Resources/5th/Sprites/CAB 5x4.png",
	ResetParams = true,
	Frame_i = 11,
	Frame_l = 11+4,
	Script = "../Resources/5th/Scripts/LineXY.lua"
}

return Def.ActorFrame{
	LoadActor( "../5th068A", tweaks )..{}
}