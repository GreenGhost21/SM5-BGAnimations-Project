local tool_sprite, RState, rotationz_allow, rotationx_allow = ...

local t = Def.ActorFrame{}

for i=0,3 do

    t[#t+1] = LoadActor( "A.lua", tool_sprite, RState, rotationz_allow, rotationx_allow, i )..{

    OnCommand=function(self)
        self:diffusealpha(0):sleep(i):diffusealpha(1):zbuffer(true):queuecommand("Next")
    end,

    NextCommand=function(self)
        self:x( math.random( - SCREEN_WIDTH * 0.5 - self:GetWidth(), SCREEN_WIDTH * 0.5 + self:GetWidth() ) )
        self:y( math.random( - SCREEN_HEIGHT * 0.5 - self:GetHeight(), SCREEN_HEIGHT * 0.5 + self:GetHeight() ) )
        self:z(-1000):linear(4):z(200):queuecommand("Next")
    end

    }

end

return t