local ScaleVar = _screen.h/480
local file = "/BGAnimations/Backgrounds/5th/Kaleidoscopes/3 (stretch).png"

return Def.ActorFrame{

    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end, 
		
    LoadActor("../Scripts/KaleidoscopeA/default.lua", ScaleVar, file)..{},
 	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/Rhombus 3x1.png", 3, 1, false, "Left" )..{
		OnCommand=cmd( x,self:GetChild("template"):GetWidth()/2*ScaleVar;queuecommand,"Stairs" )
	}
}