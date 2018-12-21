local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("../Sprites/ClothesSprites/1.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(6/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar*2,self:GetY()-self:GetHeight()*ScaleVar*1.5;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/2.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(5/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar,self:GetY()-self:GetHeight()*ScaleVar*1.5;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/3.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(4/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar*0,self:GetY()-self:GetHeight()*ScaleVar*1.5;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/4.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(3/4);effectperiod,8;finishtweening;Center;xy,self:GetX()+self:GetWidth()*ScaleVar,self:GetY()-self:GetHeight()*ScaleVar*1.5;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/5.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(2/4);effectperiod,8;finishtweening;Center;xy,self:GetX()+self:GetWidth()*ScaleVar*2,self:GetY()-self:GetHeight()*ScaleVar*1.5;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/6.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(2/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar*2,self:GetY()-self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/7.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(3/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar,self:GetY()-self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/8.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(4/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar*0,self:GetY()-self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/9.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(5/4);effectperiod,8;finishtweening;Center;xy,self:GetX()+self:GetWidth()*ScaleVar,self:GetY()-self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/10.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(6/4);effectperiod,8;finishtweening;Center;xy,self:GetX()+self:GetWidth()*ScaleVar*2,self:GetY()-self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/11.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(6/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar*2,self:GetY()+self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/12.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(5/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar,self:GetY()+self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/13.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(4/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar*0,self:GetY()+self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/14.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(3/4);effectperiod,8;finishtweening;Center;xy,self:GetX()+self:GetWidth()*ScaleVar,self:GetY()+self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/15.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(2/4);effectperiod,8;finishtweening;Center;xy,self:GetX()+self:GetWidth()*ScaleVar*2,self:GetY()+self:GetHeight()*ScaleVar*1.5/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/16.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(2/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar*2,self:GetY()+self:GetHeight()*ScaleVar*1.5*3/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/17.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(3/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar,self:GetY()+self:GetHeight()*ScaleVar*1.5*3/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/18.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(4/4);effectperiod,8;finishtweening;Center;xy,self:GetX()-self:GetWidth()*ScaleVar*0,self:GetY()+self:GetHeight()*ScaleVar*1.5*3/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
	LoadActor("../Sprites/ClothesSprites/19.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(5/4);effectperiod,8;finishtweening;Center;xy,self:GetX()+self:GetWidth()*ScaleVar,self:GetY()+self:GetHeight()*ScaleVar*1.5*3/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat';)
	};
	LoadActor("../Sprites/ClothesSprites/20.png")..{
		OnCommand=cmd(rainbow;effectoffset,1/(6/4);effectperiod,8;finishtweening;Center;xy,self:GetX()+self:GetWidth()*ScaleVar*2,self:GetY()+self:GetHeight()*ScaleVar*1.5*3/3;zoom,ScaleVar;zoom,ScaleVar;smooth,1;zoom,0;smooth,1;zoom,ScaleVar;queuecommand,"On";set_tween_uses_effect_delta,true;effectclock,'beat')
	};
}