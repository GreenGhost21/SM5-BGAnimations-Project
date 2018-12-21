local ScaleVar = _screen.h/480
return Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse(Color.Black)
		end,
	},
	LoadActor("../Backgrounds/Rainbow/6A.png")..{
		OnCommand=function(self)
			self:zoom(0.75*3*ScaleVar)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/2):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("../Backgrounds/Rainbow/6A.png")..{
		OnCommand=function(self)
			self:zoom(0.75*2*ScaleVar)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/2):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("../Backgrounds/Rainbow/6A.png")..{
		OnCommand=function(self)
			self:zoom(0.75*ScaleVar)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/2):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("../Backgrounds/Rainbow/6B.png")..{
		OnCommand=function(self)
			self:zoom(0.25*ScaleVar)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/2):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("../Backgrounds/Rainbow/Color.png")..{
		OnCommand=function(self)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/2):blend("BlendMode_Add"):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
}