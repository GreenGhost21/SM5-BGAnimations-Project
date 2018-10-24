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
		LoadActor("../Backgrounds/Rainbow/1.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*28)*ScaleVar):diffuseshift():effectcolor1(Color.HoloGreen):effectperiod(8):effectcolor2(color("#ef40e5")):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*24)*ScaleVar):diffuseshift():effectcolor1(Color.Blue):effectperiod(8):effectcolor2(Color.Yellow):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*20)*ScaleVar):diffuseshift():effectcolor1(Color.Orange):effectperiod(8):effectcolor2(Color.Red):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*16)*ScaleVar):diffuseshift():effectcolor1(Color.Green):effectperiod(8):effectcolor2(Color.Purple):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*12)*ScaleVar):diffuseshift():effectcolor1(Color.Yellow):effectperiod(8):effectcolor2(Color.Green):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*8)*ScaleVar):diffuseshift():effectcolor1(Color.Red):effectperiod(8):effectcolor2(Color.Blue):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1.png")..{
			OnCommand=function(self)
			self:Center():zoom((0.25+0.125*4)*ScaleVar):diffuseshift():effectcolor1(Color.Green):effectperiod(8):effectcolor2(color("#ef40e5")):effectclock("beat")
			end
		},
		LoadActor("../Backgrounds/Rainbow/1.png")..{
			OnCommand=function(self)
			self:Center():zoom(0.25*ScaleVar):diffuseshift():effectcolor1(color("#ef40e5")):effectperiod(8):effectcolor2(Color.Green):effectclock("beat")
			end
		},
	Def.Quad{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y):zoomto(SCREEN_WIDTH,SCREEN_HEIGHT):diffuse(Color.White):rainbow():effectperiod(8):diffusealpha(0.25):blend("BlendMode_Modulate"):effectclock("beat")
		end,
	},
		LoadActor("../Backgrounds/Rainbow/3.png")..{
			OnCommand=function(self)
			self:Center():blend("BlendMode_WeightedMultiply"):zoom(ScaleVar)
			end
		},
		LoadActor("../Backgrounds/Rainbow/3.png")..{
			OnCommand=function(self)
			self:Center():blend("BlendMode_WeightedMultiply"):x(self:GetX()+self:GetWidth()*ScaleVar):zoomx(-1):zoom(ScaleVar)
			end
		},
		LoadActor("../Backgrounds/Rainbow/3.png")..{
			OnCommand=function(self)
			self:Center():blend("BlendMode_WeightedMultiply"):x(self:GetX()-self:GetWidth()*ScaleVar):zoomx(-1):zoom(ScaleVar)
			end
		},
}
