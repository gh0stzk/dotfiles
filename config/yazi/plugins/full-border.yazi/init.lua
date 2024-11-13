-- TODO: remove this once v0.4 is released
local v4 = function(typ, area, ...)
	if typ == "bar" then
		return ui.Table and ui.Bar(...):area(area) or ui.Bar(area, ...)
	else
		return ui.Table and ui.Border(...):area(area) or ui.Border(area, ...)
	end
end

local function setup(_, opts)
	local type = opts and opts.type or ui.Border.ROUNDED
	local old_build = Tab.build

	Tab.build = function(self, ...)
		local bar = function(c, x, y)
			if x <= 0 or x == self._area.w - 1 then
				return v4("bar", ui.Rect.default, ui.Bar.TOP)
			end

			return v4(
				"bar",
				ui.Rect { x = x, y = math.max(0, y), w = ya.clamp(0, self._area.w - x, 1), h = math.min(1, self._area.h) },
				ui.Bar.TOP
			):symbol(c)
		end

		local c = self._chunks
		self._chunks = {
			c[1]:padding(ui.Padding.y(1)),
			c[2]:padding(ui.Padding(c[1].w > 0 and 0 or 1, c[3].w > 0 and 0 or 1, 1, 1)),
			c[3]:padding(ui.Padding.y(1)),
		}

		local style = THEME.manager.border_style
		self._base = ya.list_merge(self._base or {}, {
			v4("border", self._area, ui.Border.ALL):type(type):style(style),
			v4("bar", self._chunks[1], ui.Bar.RIGHT):style(style),
			v4("bar", self._chunks[3], ui.Bar.LEFT):style(style),

			bar("┬", c[1].right - 1, c[1].y),
			bar("┴", c[1].right - 1, c[1].bottom - 1),
			bar("┬", c[2].right, c[2].y),
			bar("┴", c[2].right, c[2].bottom - 1),
		})

		old_build(self, ...)
	end
end

return { setup = setup }
