
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/1 5x1.png", 3, 3)..{ 
		OnCommand=cmd(y,self:GetChild("template"):GetHeight()*ScaleVar/1.75) 
	},

	LoadActor("../Scripts/InnerEffect", "/BGAnimations/Sprites/5th/head.png", false, true)..{}

}

return t