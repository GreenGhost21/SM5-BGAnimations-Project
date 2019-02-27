local ScaleVar = _screen.h/480
return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	LoadActor("/BGAnimations/Backgrounds/5th/48 (stretch).png")..{
		OnCommand=cmd(Center;zoom,16*ScaleVar;customtexturerect,0,0,16,16)
	};
	LoadActor("/BGAnimations/Backgrounds/5th/59 (stretch).png")..{
		OnCommand=function(self)

		local relative_posx = (self:GetWidth()/2)/self:GetWidth()
		local texcoordvelocity_x = relative_posx/4
				
			self:Center()
			:zoom(16*ScaleVar)
			:texcoordvelocity(-2*texcoordvelocity_x*(640/self:GetWidth()),0)
			:customtexturerect(0,0,16,16)
			:set_use_effect_clock_for_texcoords(true)
			:addimagecoords(self:GetWidth()/4,0)
			:effectclock('beat')
		end	
	};
}