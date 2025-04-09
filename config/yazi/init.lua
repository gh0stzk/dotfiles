require("full-border"):setup()
require("smart-enter"):setup {
	open_multi = true,
}

Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ui.Line {}
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("magenta")
end, 500, Header.LEFT)


