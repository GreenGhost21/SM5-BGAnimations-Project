return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child)child:visible(false):finishtweening()end,{})
	end,

Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse(Color.Black)
		end,
	},
		LoadActor("../5thR003B/default.lua")..{
			OnCommand=function(self)
			self:x(0)
			end
		},
		LoadActor("../5thR003C/default.lua")..{
			OnCommand=function(self)
			self:x(0):sleep(1):linear(1):diffusealpha(1):linear(1):diffusealpha(0):sleep(3):linear(1):diffusealpha(0):set_tween_uses_effect_delta(true):effectclock("beat"):queuecommand("On")
			end
		},
		LoadActor("../5thR003D/default.lua")..{
			OnCommand=function(self)
			self:x(0):sleep(2):linear(1):diffusealpha(1):linear(1):diffusealpha(0):sleep(2):linear(1):diffusealpha(0):set_tween_uses_effect_delta(true):effectclock("beat"):queuecommand("On")
			end
		},
		LoadActor("../5thR003E/default.lua")..{
			OnCommand=function(self)
			self:x(0):sleep(3):linear(1):diffusealpha(1):linear(1):diffusealpha(0):sleep(1):linear(1):diffusealpha(0):set_tween_uses_effect_delta(true):effectclock("beat"):queuecommand("On")
			end
		},
}
