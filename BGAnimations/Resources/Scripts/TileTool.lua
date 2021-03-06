
local params = ...

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

-- Getting the sheet proportion
local s, Frames

if type(params.File) == "string" then
	s = string.match( params.File, " %dx%d" )
	if s then
		Frames = { string.match( s, "%dx"), string.match( s, "x%d") }
		Frames[1] = tonumber( string.match( Frames[1], "%d" ) )
		Frames[2] = tonumber( string.match( Frames[2], "%d" ) )
	end
end

--In case something is missing
PSX_BGA_Globals["BGA_NoParams"]( params )

local X_pos = params.X_pos
local Y_pos = params.Y_pos
local x, y = params.X_num, params.Y_num

local function StateMath( x, y, self, state )

	state = state + x

	while state < self:GetNumStates() - 1 do 
		state = state + self:GetNumStates()
	end

	while state > self:GetNumStates() - 1 do 
		state = state - self:GetNumStates()
	end

	state = state + y

	while state < self:GetNumStates() - 1 do 
		state = state + self:GetNumStates()
	end

	while state > self:GetNumStates() - 1 do 
		state = state - self:GetNumStates()
	end

	return state

end

local function Find(self, filter) -- filter is the texture path/dir

	local init_af, check = self

	while init_af:GetParent() and not check do
		init_af = init_af:GetParent()
		if init_af.Name then check = true end
	end

	local storage = {}
	local function Filter(tbl)

		for k,v in pairs(tbl) do
			if string.match(tostring(v),"table") then
				Filter(v)
			elseif string.match(tostring(v),"Frame") then
				Filter(v:GetChildren())
			elseif string.match(tostring(v),"Sprite") then
				if v:GetTexture() then

					--[[ v.GetTexture(v).GetPath(v.GetTexture(v))
					please remember self behaviour, this is why
					v:GetTexture():GetPath() returned an error  ]]

					local tex = v:GetTexture()
					if tex:GetPath() == filter then
						storage[#storage+1] = v
					break
					end

				end
			end
		end

	end

	Filter(init_af:GetChildren())
	return storage

end

-- Position offsets

local i_0 = params.X_coord == 0 and ( ( math.abs( x[1] ) + math.abs( x[2] ) ) % 2 ) * 0.5 or 0
local k_0 = params.Y_coord == 0 and ( ( math.abs( y[1] ) + math.abs( y[2] ) ) % 2 ) * 0.5 or 0

for i=x[1],x[2] do
	for k=y[1],y[2] do

		local vec_start = {}
		local vec_end = {}
		local sprites = {}
		local state, file_num = 0, 1
		local stairs, stairs2, search_sprt, tween_lock
		
		t[#t+1] = Def[params.ActorClass]{
			OnCommand=function(self)
			
				if params.ActorClass == "Quad" then
					if not self:GetParent().Results then
						self:GetParent().Results = Find(self, params.File)
					end
					search_sprt = self:GetParent().Results[1]
					self:SetSize( search_sprt:GetZoomedWidth(), search_sprt:GetZoomedHeight() )
					if params.FramingXY then
						stairs2 = true
					end
					self:diffuse(Color.Black)
				elseif params.ActorClass == "Sprite" then

					if not params.Texture then
						self:Load(params.File)
					else
						self:SetTexture(params.Texture)
					end

					if params.FramingXY then
						stairs2 = true
						PSX_BGA_Globals["BGA_FramingXY"]( self, params, i, k, Frames ) --5th033A -> that clothes effect
					elseif params.FramingY then
						PSX_BGA_Globals["BGA_FramingY"]( self, params, i+math.abs(x[1]), k, Frames ) --5th072
					else
						PSX_BGA_Globals["BGA_FrameSelector"](self, params)
					end

				end

				vec_start[1] = SCREEN_CENTER_X+self:GetZoomedWidth()*(i+i_0)*params.Spacing[1]
				vec_start[2] = SCREEN_CENTER_Y+self:GetZoomedHeight()*(k+k_0)*params.Spacing[2]

			 	self:xy( vec_start[1], vec_start[2] )
				self:effectclock("beat")
			 	self:set_tween_uses_effect_delta(true)

			 	if X_pos then
			 		self:x(self:GetX()+X_pos*self:GetZoomedWidth())
			 	end

			 	if Y_pos then
			 		self:y(self:GetY()+Y_pos*self:GetZoomedHeight())
			 	end

				vec_start[1] = self:GetX()
			 	vec_start[2] = self:GetY()

			 	vec_end[1] = vec_start[1]
				vec_end[2] = vec_start[2]

				PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)

			end,
			MoveCommand=function(self)

				if not params.NumTextures then

					if vec_end[1] == vec_start[1]
					and vec_end[2] == vec_start[2] then

						if #sprites == 0 then
			 				for k,v in pairs(self:GetParent():GetChildren()) do
			 					for _,o in pairs(v) do
			 						sprites[#sprites+1] = o
			 						if #sprites > 1 then break end
			 					end
			 				end
			 			end

			 			if params.X_coord ~= 0 then

			 				local X_add = 0
			 				while SCREEN_CENTER_X + self:GetZoomedWidth() * ( x[2] - 1.5 ) + X_add > SCREEN_WIDTH and params.X_coord > 0 do
								X_add = X_add - 1
							end

			 				while SCREEN_CENTER_X + self:GetZoomedWidth() * ( x[1] + 1.5 ) + X_add < 0 and params.X_coord < 0 do
								X_add = X_add + 1
							end

							vec_start[1] = vec_start[1] + X_add 
			 				vec_end[1] = vec_start[1]

			 				params.X_coord = params.X_coord / math.abs(params.X_coord) -- versor
			 				if stairs then
			 					vec_end[1] = vec_end[1] + self:GetZoomedWidth() * self:GetNumStates() * params.X_coord
			 				elseif stairs2 then
			 					vec_end[1] = vec_end[1] + self:GetZoomedWidth() * Frames[2] * params.X_coord
			 				else
			 					vec_end[1] = vec_end[1] + self:GetZoomedWidth() * params.X_coord
			 				end

			 			end

				 		if params.Y_coord ~= 0 then

			 				local Y_add = 0
			 				while SCREEN_CENTER_Y + self:GetZoomedHeight() * ( y[2] + 0.5 ) + Y_add > SCREEN_HEIGHT and params.Y_coord > 0 do
								Y_add = Y_add - 1
							end

			 				while SCREEN_CENTER_Y + self:GetZoomedHeight() * ( y[1] - 0.5 ) + Y_add < 0 and params.Y_coord < 0 do
								Y_add = Y_add + 1
							end

							vec_start[2] = vec_start[2] + Y_add
							vec_end[2] = vec_start[2]
			 				
			 				params.Y_coord = params.Y_coord / math.abs(params.Y_coord) -- versor
			 				if stairs then
			 					vec_end[2] = vec_end[2] + self:GetZoomedHeight() * self:GetNumStates() * params.Y_coord
			 				elseif stairs2 then 
			 					vec_end[2] = vec_end[2] + self:GetZoomedHeight() * Frames[2] * params.Y_coord
			 				else
			 					vec_end[2] = vec_end[2] + self:GetZoomedHeight() * params.Y_coord			 					
			 				end

			 			end

					end

					if params.FlashMove then 

						while vec_end[1] <= vec_start[1] - self:GetZoomedWidth() do 
							vec_end[1] = vec_start[1]
						end

						while vec_end[2] <= vec_start[2] - self:GetZoomedHeight() do 
							vec_end[2] = vec_start[2]
						end

			 			vec_end[1] = vec_end[1] - self:GetZoomedWidth() * 0.25
						vec_end[2] = vec_end[2] - self:GetZoomedHeight() * 0.25

						self:xy( vec_end[1], vec_end[2] )
							:sleep(self:GetNumStates()*0.25)
							:queuecommand("Move")

			 		else

						self:xy( vec_start[1], vec_start[2] )
							:linear( 2 * params.ScrollSpeed )
							:xy( vec_end[1], vec_end[2] )
							:queuecommand("Move")

					end

					if params.Delay then
						if params.ActorClass ~= "Quad" then
							if self:GetNumStates() > 1 then
								self:hurrytweening( params.Delay * ( self:GetNumStates() - 1 ) * 4 )
							else
								self:hurrytweening( params.Delay )
							end
						elseif params.ActorClass == "Quad" then
							if search_sprt:GetNumStates() > 1 then
								self:hurrytweening( params.Delay * ( search_sprt:GetNumStates() - 1 ) * 4 )
							else
								self:hurrytweening( params.Delay )
							end
						end

					end

				else

					if vec_end[1] == vec_start[1]
					and vec_end[2] == vec_start[2] then

						if params.X_coord ~= 0 then
			 				local dir = params.X_coord / math.abs(params.X_coord)
			 				vec_end[1] = vec_start[1] + self:GetZoomedWidth() * ( params.NumItemsX - params.NumTextures - 1 ) * dir
			 			end

			 			if params.Y_coord ~= 0 then
			 				local dir = params.Y_coord / math.abs(params.Y_coord)
			 				vec_end[2] = vec_start[2] + self:GetZoomedHeight() * 2 * dir
			 			end

			 		end

					self:xy( vec_start[1], vec_start[2] )
						:linear( 4 * ( params.NumTextures + 1 ) * params.ScrollSpeed )
						:xy( vec_end[1], vec_end[2] )
						:queuecommand("Move")				

				end

			end,
			ZWriteCommand=function(self)
				if i == x[1]
				and k == y[1] then 
					self:clearzbuffer(true)
				end
				self:zwrite(true)
				self:blend("BlendMode_NoEffect")
			end,
			ZTestCommand=function(self)
				self:ztest(true)
			end,
			FourScreensCommand=function(self)

				if not vec_start["Zoom"] then
					vec_start["X0"] = vec_start[1]
					vec_start["Y0"] = vec_start[2]
					vec_start["Zoom"] = self:GetZoom()
				end

				if k == 0 then
					for p=1,2 do
						self:diffusealpha(1)
						self:sleep(1)
						self:diffusealpha(0)
						self:sleep(1)
					end
				elseif math.abs(k) == 1 then

					self:x( vec_start["X0"] )
					self:zoom(vec_start["Zoom"])
					self:rotationx( ( k - 1 ) * 90 + 60 )
					self:y( vec_start["Y0"] - self:GetZoomedHeight() * k * 0.75 )
					self:diffusealpha(0)
					self:sleep(1)
					self:diffusealpha(1)
					self:sleep(1)
					self:diffusealpha(0)
					self:sleep(1)
					self:diffusealpha(1)
					self:rotationx(0)
					self:zoom( vec_start["Zoom"] * 0.5 )
					self:rotationx( 90 * ( k + 1 ) )

					vec_start[1] = SCREEN_CENTER_X+self:GetZoomedWidth()*(i+i_0)
					vec_start[2] = SCREEN_CENTER_Y+self:GetZoomedHeight()*(k+k_0)
					vec_start[1] = vec_start[1]-self:GetZoomedWidth()*0.5
					vec_start[2] = vec_start[2]-self:GetZoomedHeight()*0.5*k

			 		self:xy( vec_start[1], vec_start[2] )
			 		self:sleep(1)

				end

				self:queuecommand("FourScreens")

			end,
			MirrorCommand=function(self)

				if params.BGMirror then

					if i ~= 0 then
						self:rotationy( 180 * i )
					end

					if params.X_pos and params.X_pos % 2 == 0 
					and params.NumTextures and params.X_coord ~= 0 then
						self:rotationy( 180 )
					end

					if params.Y_pos and params.Y_pos % 2 == 0 
					and params.NumTextures and params.Y_coord ~= 0 then
						self:rotationx( 180 )
					end

				else

					if i % 2 == 0 and k % 2 == 1 then
						self:rotationy( 180 )
					elseif i % 2 == 1 and k % 2 == 0 then
						self:rotationx( 180 )
					elseif i % 2 == 0 and k % 2 == 0 then
						self:rotationx( 180 )
						self:rotationy( 180 )
					end

				end
				
			end,
			MirrorYPerRowCommand=function(self)
				if k % 2 == 0 then
					self:rotationy(180)
				end
			end,
			SpinYCommand=function(self)
			 	self:rotationx(0):linear(2):rotationx(90):linear(2):rotationx(0)
			 	self:queuecommand( "SpinY" )
				self:hurrytweening(params.Speed)
			end,
			SpinXCommand=function(self)
			 	self:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0)
			 	self:queuecommand( "SpinX" )
				self:hurrytweening(params.Speed)
			end,
			SpinXYCommand=function(self)

				local val

				if params.SpinClosed then
					val = { 90, 0 }
				else
					val = { 0, 90 }
				end

				self:rotationx(0)
				self:rotationy(val[1]):linear(1):rotationy(val[2]):linear(1)
					:rotationy(val[1]):sleep(0)
				self:rotationx(val[1])
				self:rotationy(0):linear(1):rotationx(val[2]):linear(1)
					:rotationx(val[1]):sleep(0)
					:queuecommand( "SpinXY" )
					:hurrytweening(params.Speed)

			end,
			SpinFrameCommand=function(self)
				if math.abs(i) % 2 == 0 then
					self:rotationy(180)
				end
				if math.abs(k) % 2 == 0 then
					self:rotationx(180)
				end
			end,
			CrossCommand=function(self)
				if not params.Cross then params.Cross = x[2] end
				local val = params.Cross
				for o = -(val+1),val+1,2 do
					if k == o + i then
						self:visible(false) 
					end
				end
			end,
			Cross2Command=function(self)
				for o = -(x[2]+1),x[2]+1,2 do
					if k == o + i or math.abs(k) > 1 or k == 0 then 
						self:visible(false)
					end
				end
			end,
			OddsCommand=function(self)
				if i % 2 == 1 then 
					self:visible(false)
				elseif math.abs(i) > 0 then
					self:x( self:GetX() - self:GetZoomedWidth() * 0.75 * i / math.abs(i) )
				end
				if math.abs(k) > 0 then
					self:y( self:GetY() + self:GetZoomedHeight() * 0.25 * k / math.abs(k) )
				end
			end,
			OffsetStatesCommand=function(self)
				self:setstate(params.InitState-1)
			end,
			RandomStatesCommand=function(self)
				if self:GetNumStates() > 1 then
					self:setstate(math.random(1,self:GetNumStates())-1)
				end 
			end,
			RandomDelaysCommand=function(self)
				if self:GetNumStates() > 1 then
					params.Delay = math.random(self:GetNumStates()*100,self:GetNumStates()*2*100) * 0.001 * 0.5
					PSX_BGA_Globals["BGA_Details"](self, params)
				end
			end,
			OneTwoStatesCommand=function(self)
				self:setstate(i % self:GetNumStates())
			end,
			StairsStatesCommand=function(self)	
				stairs = true 
				self:setstate(StateMath( i+x[2], k+y[2], self, state ))
			end,
			FramePerSpriteCommand=function(self)

				local s = i + 2 + k * Frames[1] - Frames[1] * 2

				while s > self:GetNumStates() - 1 do
					s = s - self:GetNumStates()
				end

				while s < 0 do
					s = s + self:GetNumStates()
				end

				if not params.Animate then
					self:animate(false):setstate(s)
				end

			end,
			PulseCommand=function(self)
				local z = self:GetZoom()
				self:smooth(1):zoom(0):smooth(1):zoom(z):queuecommand("Pulse")
			end,
			RainbowCommand=function(self)
				self:rainbow():effectperiod(8)
			end,
			ColorCommand=function(self)
				self:diffuse(params.Color)
			end,
			BlendCommand=function(self)
				if not params.Blend then
					self:blend("BlendMode_Modulate")
				else
					self:blend(params.Blend)
				end
			end,
			FadeCommand=function(self)

				if not params.Fade then params.Fade = { 1, 1 } end

				local total = math.abs(x[2])+math.abs(x[1])+1

				if type(params.Color) == "table" then
					if params.Ramp then
						self:diffuseramp():effectcolor1(params.Color):effectperiod(params.FDelay)
					else
						if not params.Color2 then 
							params.Color2 = Color.White
						end
						self:diffuseshift()
						:effectcolor1(params.Color)
						:effectcolor2(params.Color2)
						:effectperiod(params.FDelay)
					end
				elseif params.Color == "Rainbow" then
					self:rainbow():blend("BlendMode_Modulate")
				end

				local beat

				if params.Fade then
					if search_sprt then
						if params.Delay then
							beat = params.Delay * ( search_sprt:GetNumStates() ) * 4
						else
							beat = 4 * ( search_sprt:GetNumStates() )
						end
						self:effectperiod(beat):effectoffset( beat * 0.5 * ( - params.Fade[1] * i - params.Fade[2] * k ) / total )
					end
				end

			end,
			BlinkCommand=function(self)
				self:diffuseramp():effectperiod(1)
			end,
			SplitCommand=function(self)
				if i == 0 then self:diffuse(Color.Red) end
				self:xy( vec_start[1], vec_start[2] )
					:linear(4)
					:x( self:GetX() + self:GetZoomedWidth() * i )
					:y( self:GetY() + self:GetZoomedHeight() * k )
					:queuecommand("Split")
			end,
			ZoominCommand=function(self)
				if i % 2 == 0 then self:sleep(2) end
				self:queuecommand("Zoomin2")
			end,
			Zoomin2Command=function(self)
				local z = self:GetZoom()
				self:zoom( z ):linear(2):zoom( z * 1.5 ):linear(2):zoom( z ):queuecommand("Zoomin2")
			end,
			AlphaCommand=function(self)
				self:diffusealpha(1):linear(2):diffusealpha(0)
				self:linear(2):diffusealpha(1)
				self:queuecommand("Alpha")
			end
		}

	end
end

return Def.ActorFrame{ t }