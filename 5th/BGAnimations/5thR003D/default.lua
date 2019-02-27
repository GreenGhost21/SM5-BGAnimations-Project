local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child)child:visible(false):finishtweening()end,{})
	end,

Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse(Color.Black)
		end,
	},
	LoadActor("/BGAnimations/Backgrounds/5th/Rainbow/3.png")..{
		OnCommand=function(self)
			self:zoom(1*ScaleVar)
			self:Center():x(self:GetX()+self:GetWidth()):rainbow():effectperiod(8):diffusealpha(1/3):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("/BGAnimations/Backgrounds/5th/Rainbow/3.png")..{
		OnCommand=function(self)
			self:zoom(1*ScaleVar)
			self:Center():x(self:GetX()+self:GetWidth()):rainbow():effectperiod(8):diffusealpha(1/3):blend("BlendMode_Add"):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("/BGAnimations/Backgrounds/5th/Rainbow/3.png")..{
		OnCommand=function(self)
			self:zoom(1*ScaleVar)
			self:Center():x(self:GetX()-self:GetWidth()):rainbow():effectperiod(8):diffusealpha(1/3):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("/BGAnimations/Backgrounds/5th/Rainbow/3.png")..{
		OnCommand=function(self)
			self:zoom(1*ScaleVar)
			self:Center():x(self:GetX()-self:GetWidth()):rainbow():effectperiod(8):diffusealpha(1/3):blend("BlendMode_Add"):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("/BGAnimations/Backgrounds/5th/Rainbow/3.png")..{
		OnCommand=function(self)
			self:zoom(1*ScaleVar)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/3):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("/BGAnimations/Backgrounds/5th/Rainbow/3.png")..{
		OnCommand=function(self)
			self:zoom(1*ScaleVar)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/3):blend("BlendMode_Add"):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
	LoadActor("/BGAnimations/Backgrounds/5th/Rainbow/Color.png")..{
		OnCommand=function(self)
			self:Center():rainbow():effectperiod(8):diffusealpha(1/3):blend("BlendMode_Add"):effectclock("beat"):set_tween_uses_effect_delta(true)
		end
	},
}
