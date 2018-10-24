local sprite = "/BGAnimations/Sprites/" .. (...)
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{};

local Params = {
	NumParticles = 8*2,
	File = sprite,
}

local SelectedAngle = {

	-360,
	360,

}

local ZoomValue = {
	
	0.5,
	0.75,
	1,
	
}

for i=1,Params.NumParticles do	

		t[#t+1] = Def.Sprite{
		Texture=Params.File,
		Name="Particle"..i;
			OnCommand=function(self)			
		
				local NoStates if self:GetNumStates() == 1 then 
					numStates = 0 else 
					numStates = math.random(0,self:GetNumStates()-1) 
					end;
					
				local numDelay = self:GetNumStates()
				local colorval = ZoomValue[math.random(1,3)]

			if colorval == 0.5 then size_tween = 5+1 elseif colorval == 0.75 then size_tween = 4+1 elseif colorval == 1 then size_tween = 3+1 end
						
			self:diffusealpha(0):sleep(i/Params.NumParticles):diffusealpha(1)
			:zoom(colorval*ScaleVar):setstate(numStates):SetAllStateDelays((1/numDelay)/2)
			:y(math.random(self:GetHeight()/2,_screen.h-self:GetHeight()/2))
			:x(math.random(-SCREEN_WIDTH,-self:GetWidth()/2))
			:linear(size_tween)
			:set_tween_uses_effect_delta(true):effectclock("beat")
			:x(_screen.w+self:GetWidth()/2)
			:queuecommand("On")
			end;
		}
end

return t;