local ScaleVar = _screen.h/480

return Def.ActorFrame{

    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end,
		
    LoadActor("../Scripts/KaleidoscopeA/default.lua", ScaleVar, GAMESTATE:GetCurrentSong():GetBackgroundPath(), true)..{}

}