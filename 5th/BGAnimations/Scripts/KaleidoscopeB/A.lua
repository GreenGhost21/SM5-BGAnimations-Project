local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

	for i = -4,4 do
		t[#t+1] = LoadActor("1.lua")..{
			OnCommand=function(self)
				self:x( 240 )
				self:y( 240 + 184 * i * ScaleVar )
			end
		}
	end

return t