--- @since 25.2.26

local function setup(_, opts)
	local type = opts and opts.type or ui.Border.ROUNDED
	local old_build = Tab.build

	Tab.build = function(self, ...)
		local bar = function(c, x, y)
			if x <= 0 or x == self._area.w - 1 or th.mgr.border_symbol ~= "│" then
				return ui.Bar(ui.Edge.TOP)
			end

			return ui.Bar(ui.Edge.TOP)
				:area(
					ui.Rect { x = x, y = math.max(0, y), w = ya.clamp(0, self._area.w - x, 1), h = math.min(1, self._area.h) }
				)
				:symbol(c)
		end

		local c = self._chunks
		self._chunks = {
			c[1]:pad(ui.Pad.y(1)),
			-- TODO: remove this compatibility hack
			fs.unique and c[2]:pad(ui.Pad.y(1)) or c[2]:pad(ui.Pad(1, c[3].w > 0 and 0 or 1, 1, c[1].w > 0 and 0 or 1)),
			c[3]:pad(ui.Pad.y(1)),
		}

		local style = th.mgr.border_style
		if rt.opener then -- TODO: remove this compatibility hack
			self._base = ya.list_merge(self._base or {}, {
				ui.Border(ui.Edge.ALL):area(self._area):type(type):style(style),

				bar("┬", c[2].x, c[1].y),
				bar("┴", c[2].x, c[1].bottom - 1),
				bar("┬", c[2].right - 1, c[2].y),
				bar("┴", c[2].right - 1, c[2].bottom - 1),
			})
		else
			self._base = ya.list_merge(self._base or {}, {
				ui.Border(ui.Edge.ALL):area(self._area):type(type):style(style),

				bar("┬", c[1].right - 1, c[1].y),
				bar("┴", c[1].right - 1, c[1].bottom - 1),
				bar("┬", c[2].right, c[2].y),
				bar("┴", c[2].right, c[2].bottom - 1),
			})
		end

		old_build(self, ...)
	end
end

return { setup = setup }
