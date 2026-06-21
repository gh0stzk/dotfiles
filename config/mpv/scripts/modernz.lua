-- ModernZ v0.3.3 (https://github.com/Samillion/ModernZ)
--
-- This script is a derivative of the original mpv-osc-modern by maoiscat
-- and subsequent forks:
--   * cyl0/ModernX
--   * dexeonify/ModernX
--
-- It is based on the official osc.lua from mpv, licensed under the
-- GNU Lesser General Public License v2.1 (LGPLv2.1).
-- Full license: https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html

local assdraw = require "mp.assdraw"
local msg = require "mp.msg"
local opt = require "mp.options"
local utils = require "mp.utils"
mp.set_property("osc", "no")

-- Parameters
-- default user option values
-- do not touch, change them in modernz.conf
local user_opts = {
    -- Language and display
    language = "default",                  -- set language
    layout = "default",                    -- set layout: default, compact, mini, seekbar
    icon_theme = "fluent",                 -- set icon theme. accepts "fluent" or "material"
    icon_style = "mixed",                  -- "mixed", "filled", "outline"
    font = "mpv-osd-symbols",              -- font for the OSC (default: mpv-osd-symbols or the one set in mpv.conf)

    idlescreen = true,                     -- show mpv logo when idle
    window_top_bar = "auto",               -- show OSC window top bar: "auto", "yes", or "no" (borderless/fullscreen)
    showwindowed = true,                   -- show OSC when windowed
    showfullscreen = true,                 -- show OSC when fullscreen
    showonselect = false,                  -- show OSC when a select menu is open
    showonpause = true,                    -- show OSC when paused
    keeponpause = "no",                    -- keep OSC visible while paused: "no", "bottombar", "both"
    greenandgrumpy = false,                -- disable Santa hat in December

    -- OSC behaviour and scaling
    hidetimeout = 1500,                    -- time (in ms) before OSC hides if no mouse movement
    keep_with_cursor = true,               -- keep OSC visible while cursor hovers over bottom or top bar
    fadeduration = 200,                    -- fade-out duration (in ms), set to 0 for no fade
    fadein = true,                         -- whether to enable fade-in effect
    minmousemove = 0,                      -- minimum mouse movement (in pixels) required to show OSC
    deadzonesize = 0.75,                   -- size of the deadzone (0.0 = whole screen, 1.0 = no deadzone)
    deadzone_hide = "instant",             -- hide behavior when cursor enters deadzone or leaves window: "instant" or "timeout"
    osc_on_seek = true,                    -- show OSC when seeking
    osc_on_start = "both",                 -- show OSC on start of every file ("no", "bottom", "top", "both")
    mouse_seek_pause = true,               -- pause video while seeking with mouse move (on button hold)
    force_seek_tooltip = false,            -- force show seekbar tooltip on mouse drag, even if not hovering seekbar

    vidscale = "auto",                     -- scale osc with the video
    scalewindowed = 1.0,                   -- osc scale factor when windowed
    scalefullscreen = 1.0,                 -- osc scale factor when fullscreen

    -- Elements display
    show_title = true,                     -- show title in the OSC
    title = "${media-title}",              -- title: "${media-title}" or "${filename}"
    title_font_size = 24,                  -- title font size
    truncate_title = false,                -- truncate title with ellipsis if it overflows
    chapter_title_font_size = 16,          -- chapter title font size

    cache_info = false,                    -- show cached time information
    cache_info_speed = false,              -- show cache speed per second
    cache_info_font_size = 12,             -- font size of the cache information

    show_chapter_title = true,             -- show chapter title
    chapter_above_title = false,           -- show chapter above title
    chapter_fmt = "%s",                    -- format for chapter display on seekbar hover (set to "no" to disable)

    timecurrent = true,                    -- show current time instead of remaining time
    timems = false,                        -- show timecodes with milliseconds
    unicodeminus = false,                  -- use the Unicode minus sign in remaining time
    time_format = "dynamic",               -- "dynamic" or "fixed". dynamic shows MM:SS when possible, fixed always shows HH:MM:SS
    time_font_size = 16,                   -- font size of the time display

    tooltip_font_size = 14,                -- tooltips font size
    speed_font_size = 16,                  -- speed button font size

    -- Title bar settings
    show_window_title = false,             -- show window title in borderless/fullscreen mode
    window_title_font_size = 26,           -- window title font size
    window_controls = true,                -- show window controls (close, minimize, maximize) in borderless/fullscreen
    windowcontrols_independent = true,     -- show window controls (top bar) and bottom bar independently on hover

    -- Subtitle and OSD display settings
    sub_margins = true,                    -- raise subtitles above the OSC when shown
    osd_margins = false,                   -- adjust OSD to not overlap with OSC
    dynamic_margins = true,                -- update margins dynamically with OSC visibility

    -- Buttons display and functionality
    subtitles_button = true,               -- show the subtitles menu button
    audio_tracks_button = true,            -- show the audio tracks menu button
    jump_buttons = true,                   -- show the jump backward and forward buttons
    jump_amount = 10,                      -- change the jump amount in seconds
    jump_more_amount = 60,                 -- change the jump amount in seconds on right click
    jump_icon_number = true,               -- show different icon when jump_amount is set to 5, 10, or 30
    jump_mode = "relative",                -- seek mode for jump buttons: "relative" or "exact"
    jump_softrepeat = true,                -- enable continuous jumping when holding down seek buttons
    chapter_skip_buttons = false,          -- show the chapter skip backward and forward buttons
    track_nextprev_buttons = true,         -- show next/previous playlist track buttons

    volume_control = true,                 -- show mute button and volume slider
    volume_control_type = "linear",        -- volume scale type: "linear" or "logarithmic"
    volumebar_unmute_on_click = false,     -- unmute audio when adjusting volume slider with left click
    playlist_button = true,                -- show playlist button
    hide_empty_playlist_button = false,    -- hide playlist button when no playlist exists
    gray_empty_playlist_button = false,    -- gray out the playlist button when no playlist exists

    fullscreen_button = true,              -- show fullscreen toggle button
    info_button = true,                    -- show info button
    ontop_button = true,                   -- show window on top button
    ontop_in_topbar = false,               -- move ontop button to top bar when ontop is active
    screenshot_button = true,              -- show screenshot button

    download_button = true,                -- show download button on web videos (requires yt-dlp and ffmpeg)
    download_path = "~~desktop/mpv",       -- default download directory for videos (https://mpv.io/manual/master/#paths)

    loop_button = true,                    -- show file loop button
    shuffle_button = false,                -- show shuffle button
    speed_button = true,                   -- show speed control button

    buttons_always_active = "none",        -- force buttons to always be active. can add: playlist_prev, playlist_next

    playpause_size = 28,                   -- icon size for the play/pause button
    midbuttons_size = 24,                  -- icon size for the middle buttons
    sidebuttons_size = 24,                 -- icon size for the side buttons

    zoom_control = true,                   -- show zoom controls in image viewer mode
    zoom_in_max = 4,                       -- maximum zoom in value
    zoom_out_min = -1,                     -- minimum zoom out value

    -- Colors and style
    osc_color = "#000000",                 -- accent color of the OSC and title bar
    window_title_color = "#FFFFFF",        -- color of the title in borderless/fullscreen mode
    window_controls_color = "#FFFFFF",     -- color of the window controls (close, minimize, maximize) in borderless/fullscreen mode
    windowcontrols_close_hover = "#F45C5B", -- color of close window control on hover
    windowcontrols_max_hover = "#F8BC3A",  -- color of maximize window controls on hover
    windowcontrols_min_hover = "#43CB44",  -- color of minimize window controls on hover
    title_color = "#FFFFFF",               -- color of the title
    cache_info_color = "#FFFFFF",          -- color of the cache information
    seekbar_cache_color = "#B1B1B1",       -- color of the cache ranges on the seekbar
    seekbarfg_color = "#FF8232",           -- color of the seekbar progress
    seekbarbg_color = "#999999",           -- color of the remaining seekbar
    seek_handle_color = "#C96508",         -- color of the seekbar handle
    seek_handle_border_color = "#FF8232",  -- inner border color drawn inside the seekbar handle (set to "disable" to disable)
    volumebar_match_seek_color = false,    -- match volume bar color with seekbar color (ignores side_buttons_color)
    time_color = "#FFFFFF",                -- color of the timestamps (below seekbar)
    chapter_title_color = "#FFFFFF",       -- color of the chapter title
    side_buttons_color = "#FFFFFF",        -- color of the side buttons (audio, subtitles, playlist, etc.)
    middle_buttons_color = "#FFFFFF",      -- color of the middle buttons (skip, jump, chapter, etc.)
    playpause_color = "#FFFFFF",           -- color of the play/pause button
    held_element_color = "#999999",        -- color of the element when held down (pressed)
    hover_effect_color = "#FF8232",        -- color of a hovered button when hover_effect includes "color"
    thumbnail_box_color = "#111111",       -- color of the background for thumbnail box
    thumbnail_box_outline = "#404040",     -- color of the border outline for thumbnail box
    nibble_color = "#FF8232",              -- color of chapter nibbles on the seekbar
    nibble_current_color = "#FFFFFF",      -- color of the current chapter nibble on the seekbar
    ab_loop_color = "#2596be",             -- color of the A/B loop range on the seekbar

    osc_fade_strength = 100,               -- strength of the OSC background fade (0 to disable)
    fade_blur_strength = 100,              -- blur strength for the OSC alpha fade. caution: high values can take a lot of CPU time to render
    fade_transparency_strength = 0,        -- use with "fade_blur_strength=0" to create a transparency box
    window_fade_strength = 100,            -- strength of the window title bar fade (0 to disable)
    window_fade_blur_strength = 100,       -- blur strength for the window title bar. caution: high values can take a lot of CPU time to render
    window_fade_transparency_strength = 0, -- use with "window_fade_blur_strength=0" to create a transparency box
    thumbnail_box_padding = 4.5,           -- thumbnail box padding around the image
    thumbnail_box_radius = 4,              -- round corner radius for thumbnail box border (0 to disable)
    thumbnail_box_outline_size = 1,        -- thumbnail box border outline size (thickness)

    -- Button interaction settings
    hover_effect = "size,glow,color,box",  -- active button hover effects: "glow", "size", "color", "box"; can use multiple separated by commas
    button_hover_size = 115,               -- relative size of a hovered button if "size" effect is active
    button_held_size = 100,                -- relative size of a button when held/pressed. below 100 shrinks button when held down
    button_held_box_alpha = 18,            -- alpha of the hover background box when a button is held down
    button_glow_amount = 5,                -- glow intensity when "glow" hover effect is active
    slider_hover_size = 100,               -- relative size of a hovered slider handle
    tooltip_hints = true,                  -- enable tooltips for most buttons. seek and volume tooltips are always enabled

    -- Progress bar settings
    seek_handle_size = 0.8,                -- size ratio of the seek handle (range: 0 ~ 1)
    seek_handle_border_size = 0.42,        -- border thickness as a fraction of the handle radius
    seek_handle_border_hover_size = 0.31,  -- border thickness when handle is hovered (set equal to seek_handle_border_size to disable)
    seekbar_height = "medium",             -- seekbar height preset: "small", "medium", "large", "xlarge"
    seekrange = true,                      -- show seek range overlay
    seekrangealpha = 150,                  -- transparency of the seek range
    livemarkers = true,                    -- update chapter markers on the seekbar when duration changes
    seekbarkeyframes = true,               -- use keyframes when dragging the seekbar
    slider_rounded_corners = true,         -- rounded corners seekbar slider

    nibbles_style = "gap",                 -- chapter nibble style: "gap", "triangle", "bar", or "single-bar"
    nibbles_top = true,                    -- top chapter nibbles above seekbar
    nibbles_bottom = true,                 -- bottom chapter nibbles below seekbar

    automatickeyframemode = true,          -- automatically set keyframes for the seekbar based on video length
    automatickeyframelimit = 600,          -- videos longer than this (in seconds) will have keyframes on the seekbar

    persistent_progress = false,           -- always show a small progress line at the bottom of the screen
    persistent_progress_height = 17,       -- height of the persistent progress bar
    persistent_buffer = false,             -- show cached buffer status in the persistent progress line

    -- Miscellaneous settings
    visibility = "auto",                   -- only used at init to set visibility_mode(...)
    visibility_modes = "never_auto_always",-- visibility modes to cycle through
    tick_delay = 1 / 60,                   -- minimum interval between OSC redraws (in seconds)
    tick_delay_follow_display_fps = false, -- use display FPS as the minimum redraw interval

    -- Elements Position
    -- Useful when adjusting font size or type
    title_offset = 20,                     -- title vertical offset relative to seekbar
    title_with_chapter_offset = 5,         -- title vertical offset if a chapter title is below it
    chapter_title_offset = 18,             -- chapter title vertical offset relative to seekbar
    chapter_above_title_offset = 3,        -- chapter offset when shown above title
    time_codes_offset = 0,                 -- time codes vertical offset relative to seekbar
    tooltip_height_offset = 5,             -- tooltip height position offset
    portrait_window_trigger = 950,         -- portrait window width trigger to move some elements
    hide_volume_bar_trigger = 1150,        -- hide volume bar trigger window width
    osc_height = 60,                       -- osc height

    -- Mouse commands
    -- customize the button function based on mouse action

    -- title mouse actions
    title_mbtn_left_command = "script-binding stats/display-page-5",
    title_mbtn_mid_command = "show-text ${path}",
    title_mbtn_right_command = "script-binding select/select-watch-history",

    -- chapter title mouse actions
    chapter_title_mbtn_left_command = "script-binding select/select-chapter",
    chapter_title_mbtn_right_command = "show-text ${chapter-list} 3000",

    -- seekbar wheel actions
    seekbar_wheel_up_command = "seek 10",
    seekbar_wheel_down_command = "seek -10",

    -- playlist button mouse actions
    playlist_mbtn_left_command = "script-binding select/select-playlist",
    playlist_mbtn_right_command = "script-binding select/menu",

    -- volume mouse actions
    vol_ctrl_mbtn_left_command = "no-osd cycle mute",
    vol_ctrl_mbtn_right_command = "script-binding select/select-audio-device",
    vol_ctrl_wheel_down_command = "osd-msg add volume -5",
    vol_ctrl_wheel_up_command = "osd-msg add volume 5",
    volumebar_wheel_down_command = "osd-msg add volume -5",
    volumebar_wheel_up_command = "osd-msg add volume 5",

    -- audio button mouse actions
    audio_track_mbtn_left_command = "script-binding select/select-aid",
    audio_track_mbtn_mid_command = "cycle audio down",
    audio_track_mbtn_right_command = "cycle audio",
    audio_track_wheel_down_command = "cycle audio",
    audio_track_wheel_up_command = "cycle audio down",

    -- subtitle button mouse actions
    sub_track_mbtn_left_command = "script-binding select/select-sid",
    sub_track_mbtn_mid_command = "cycle sub down",
    sub_track_mbtn_right_command = "cycle sub",
    sub_track_wheel_down_command = "cycle sub",
    sub_track_wheel_up_command = "cycle sub down",

    -- play/pause button mouse actions
    play_pause_mbtn_left_command = "cycle pause",
    play_pause_mbtn_mid_command = "cycle-values loop-playlist inf no",
    play_pause_mbtn_right_command = "cycle-values loop-file inf no",

    -- chapter skip buttons mouse actions
    chapter_prev_mbtn_left_command = "add chapter -1",
    chapter_prev_mbtn_mid_command = "show-text ${chapter-list} 3000",
    chapter_prev_mbtn_right_command = "script-binding select/select-chapter",

    chapter_next_mbtn_left_command = "add chapter 1",
    chapter_next_mbtn_mid_command = "show-text ${chapter-list} 3000",
    chapter_next_mbtn_right_command = "script-binding select/select-chapter",

    -- playlist skip buttons mouse actions
    playlist_prev_mbtn_left_command = "playlist-prev",
    playlist_prev_mbtn_mid_command = "show-text ${playlist} 3000",
    playlist_prev_mbtn_right_command = "script-binding select/select-playlist",

    playlist_next_mbtn_left_command = "playlist-next",
    playlist_next_mbtn_mid_command = "show-text ${playlist} 3000",
    playlist_next_mbtn_right_command = "script-binding select/select-playlist",

    -- fullscreen button mouse actions
    fullscreen_mbtn_left_command = "cycle fullscreen",
    fullscreen_mbtn_right_command = "cycle window-maximized",

    -- info button mouse actions
    info_mbtn_left_command = "script-binding stats/display-page-1-toggle",

    -- ontop (pin) button mouse actions
    ontop_mbtn_left_command = "osd-msg cycle ontop",

    -- screenshot button mouse actions
    screenshot_mbtn_left_command = "osd-msg screenshot video",

    -- loop file button mouse actions
    file_loop_mbtn_left_command = "osd-msg cycle-values loop-file inf no",
    file_loop_mbtn_right_command = "osd-msg cycle-values loop-playlist inf no",

    -- speed button mouse actions
    speed_mbtn_left_command = "osd-msg add speed 1",
    speed_mbtn_right_command = "osd-msg set speed 1",
    speed_wheel_down_command = "osd-msg add speed -0.25",
    speed_wheel_up_command = "osd-msg add speed 0.25",
}

local osc_param = {                  -- calculated by osc_init()
    playresy = 0,                    -- canvas size Y
    playresx = 0,                    -- canvas size X
    display_aspect = 1,
    unscaled_y = 0,
    areas = {},
    video_margins = {
        l = 0, r = 0, t = 0, b = 0,  -- left/right/top/bottom
    },
}

local icon_font = "modernz-icons"

local icon_themes = {
    fluent   = { prefix = "fluent_"   },
    material = { prefix = "material_" },
}

local function build_icons(theme_name, style)
    local theme = icon_themes[theme_name] or icon_themes["fluent"]
    local p = theme.prefix

    local filled_suffix  = (style ~= "outline") and "_filled" or ""
    local outline_suffix = (style == "filled")  and "_filled" or ""

    local function f(name) return p .. name .. filled_suffix  end
    local function o(name) return p .. name .. outline_suffix end

    return {
        iconfont = icon_font,
        window = {
            maximize   = "window_maximize",
            unmaximize = "window_unmaximize",
            minimize   = "window_minimize",
            close      = "window_close",
        },

        play     = f("play_arrow"),
        pause    = f("pause"),
        replay   = f("replay"),
        previous = f("skip_previous"),
        next     = f("skip_next"),
        rewind   = f("fast_rewind"),
        forward  = f("fast_forward"),
        jump = {
            [5]     = { f("replay_5"),   f("forward_5")   },
            [10]    = { f("replay_10"),  f("forward_10")  },
            [30]    = { f("replay_30"),  f("forward_30")  },
            default = { f("skip_back"),  f("skip_forward") },
        },

        audio        = o("surround_sound"),
        subtitle     = o("subtitles"),
        playlist     = o("playlist_play"),
        menu         = o("more_vert"),
        volume_mute  = o("no_sound"),
        volume_quiet = o("volume_mute"),
        volume_low   = o("volume_down"),
        volume_high  = o("volume_up"),

        download        = o("download"),
        downloading     = o("downloading"),
        speed           = o("speed"),
        shuffle_on      = o("shuffle_on"),
        shuffle_off     = o("shuffle"),
        loop_on         = o("repeat_on"),
        loop_off        = o("repeat"),
        screenshot      = o("photo_camera"),
        ontop_on        = o("pip"),
        ontop_off       = o("pip_exit"),
        info            = o("info"),
        fullscreen      = o("fullscreen"),
        fullscreen_exit = o("fullscreen_exit"),

        zoom_in         = o("zoom_in"),
        zoom_out        = o("zoom_out"),
    }
end

local function set_icon_theme()
    icons = build_icons(user_opts.icon_theme, user_opts.icon_style)
end

--- localization
local language = {
    ["default"] = {
        idle = "Drop files or URLs here to play",
        na = "Not available",
        unknown = "Unknown",
        video = "Video",
        audio = "Audio",
        subtitle = "Subtitle",
        no_subs = "No subtitles",
        no_audio = "No audio tracks",
        volume = "Volume",
        muted = "Muted",
        playlist = "Playlist",
        no_playlist = "Playlist empty",
        chapter = "Chapter",
        fullscreen = "Fullscreen",
        fullscreen_exit = "Exit fullscreen",
        ontop = "Pin window",
        ontop_disable = "Unpin window",
        file_loop_enable = "Loop file on",
        file_loop_disable = "Loop file off",
        playlist_loop_enable = "Loop playlist on",
        playlist_loop_disable = "Loop playlist off",
        shuffle = "Shuffle playlist on",
        unshuffle = "Shuffle playlist off",
        speed_control = "Playback speed",
        screenshot = "Screenshot",
        stats_info = "Statistics",
        cache = "Cache",
        buffering = "Buffering",
        zoom_in = "Zoom in",
        zoom_out = "Zoom out",
        download = "Download",
        download_in_progress = "Download in progress",
        downloading = "Downloading",
        downloaded = "Already downloaded",
        menu = "Menu",
    },
}

local bidi = {
    fsi = "\226\129\168",   -- U+2068 first strong isolate
    pdi = "\226\129\169",   -- U+2069 pop directional isolate
}

-- locale JSON file handler
local function get_locale_from_json(path)
    local expand_path = mp.command_native({'expand-path', path})

    local file_info = utils.file_info(expand_path)
    if not file_info or not file_info.is_file then
        return nil
    end

    local json_file = io.open(expand_path, 'r')
    if not json_file then
        return nil
    end

    local json = json_file:read('*all')
    json_file:close()

    local json_table, parse_error = utils.parse_json(json)
    if not json_table then
        mp.msg.error("JSON parse error:" .. parse_error)
    end
    return json_table
end

-- load external locales only when default language is not used
local locale_file_loaded = false
local function load_locale_file()
    if user_opts.language == "default" or locale_file_loaded then return end
    locale_file_loaded = true

    local external = get_locale_from_json("~~/script-opts/modernz-locale.json")
    if external then
        for lang, strings in pairs(external) do
            if lang == "default" then
                -- "default" is reserved
                mp.msg.warn("Locale JSON: 'default' is a reserved language key and cannot be overridden. Skipping.")
            elseif type(strings) == "table" then
                language[lang] = strings

                -- fill in any missing keys with the built-in defaults
                for key, value in pairs(language["default"]) do
                    if strings[key] == nil then
                        strings[key] = value
                    end
                end
            else
                mp.msg.warn("Locale data for language '" .. lang .. "' is not in the correct format.")
            end
        end
    end
end

local locale
local function set_osc_locale()
    locale = language[user_opts.language] or language["default"]
end

local function contains(list, item)
    local t
    if type(list) == "table" then
        t = list
    else
        t = {}
        for str in string.gmatch(list, '([^,]+)') do
            t[#t + 1] = str:match("^%s*(.-)%s*$") -- trim spaces
        end
    end
    for _, v in ipairs(t) do
        if v == item then return true end
    end
    return false
end

local thumbfast = {
    width = 0,
    height = 0,
    disabled = true,
    available = false
}

local platform = mp.get_property("platform")
local tick_delay = 1 / 60
local window_control_box_width = 150
local is_december = os.date("*t").month == 12
local UNICODE_MINUS = string.char(0xe2, 0x88, 0x92)  -- UTF-8 for U+2212 MINUS SIGN

local function osc_color_convert(color)
    return color:sub(6,7) .. color:sub(4,5) ..  color:sub(2,3)
end

local osc_styles
local seekbar_height_style
local hover_effects = { size = false, color = false, glow = false, box = false }

local function set_osc_styles()
    local playpause_size = user_opts.playpause_size
    local midbuttons_size = user_opts.midbuttons_size
    local sidebuttons_size = user_opts.sidebuttons_size

    hover_effects.size  = contains(user_opts.hover_effect, "size")
    hover_effects.color = contains(user_opts.hover_effect, "color")
    hover_effects.glow  = contains(user_opts.hover_effect, "glow")
    hover_effects.box   = contains(user_opts.hover_effect, "box")

    local seekbar_presets = {
        small  = { radius = 1, height = 2 },
        medium = { radius = 2, height = 4 },
        large  = { radius = 3, height = 6 },
        xlarge = { radius = 4, height = 8 }
    }
    seekbar_height_style = seekbar_presets[user_opts.seekbar_height] or seekbar_presets.medium

    osc_styles = {
        osc_fade_bg = "{\\blur" .. user_opts.fade_blur_strength .. "\\bord" .. user_opts.osc_fade_strength .. "\\1c&H0&\\3c&H" .. osc_color_convert(user_opts.osc_color) .. "&}",
        window_fade_bg = "{\\blur" .. user_opts.window_fade_blur_strength .. "\\bord" .. user_opts.window_fade_strength .. "\\1c&H0&\\3c&H" .. osc_color_convert(user_opts.osc_color) .. "&}",
        window_control = "{\\1c&H" .. osc_color_convert(user_opts.window_controls_color) .. "&\\fs25\\fn" .. icons.iconfont .. "}",
        window_title = "{\\bord1\\1c&H" .. osc_color_convert(user_opts.window_title_color) .. "&\\3c&H0&\\fs".. user_opts.window_title_font_size .."\\q2\\fn" .. user_opts.font .. "}",
        title = "{\\bord1\\1c&H" .. osc_color_convert(user_opts.title_color) .. "&\\3c&H0&\\fs".. user_opts.title_font_size .."\\q2\\fn" .. user_opts.font .. "}",
        chapter_title = "{\\bord1\\1c&H" .. osc_color_convert(user_opts.chapter_title_color) .. "&\\3c&H0&\\fs" .. user_opts.chapter_title_font_size .. "\\q2\\fn" .. user_opts.font .. "}",
        seekbar_bg = "{\\1c&H" .. osc_color_convert(user_opts.seekbarbg_color) .. "&}",
        seekbar_fg = "{\\blur1\\bord1\\1c&H" .. osc_color_convert(user_opts.seekbarfg_color) .. "&}",
        thumbnail = "{\\bord" .. user_opts.thumbnail_box_outline_size .. "\\1c&H" .. osc_color_convert(user_opts.thumbnail_box_color) .. "&\\3c&H" .. osc_color_convert(user_opts.thumbnail_box_outline) .. "&}",
        time = "{\\bord1\\1c&H" .. osc_color_convert(user_opts.time_color) .. "&\\3c&H0&\\fs" .. user_opts.time_font_size .. "\\fn" .. user_opts.font .. "}",
        cache = "{\\bord1\\1c&H" .. osc_color_convert(user_opts.cache_info_color) .. "&\\3c&H0&\\fs" .. user_opts.cache_info_font_size .. "\\fn" .. user_opts.font .. "}",
        tooltip = "{\\bord1\\1c&HFFFFFF&\\3c&H0&\\fs" .. user_opts.tooltip_font_size .. "\\fn" .. user_opts.font .. "}",
        tooltip_box = "{\\1c&H" .. osc_color_convert(user_opts.osc_color) .. "&}",
        speed = "{\\bord1\\1c&H" .. osc_color_convert(user_opts.side_buttons_color) .. "&\\3c&H0&\\fs" .. user_opts.speed_font_size .. "\\fn" .. user_opts.font .. "}",
        volumebar_bg = "{\\1c&H999999&}",
        volumebar_fg = "{\\blur1\\bord1\\1c&H" .. osc_color_convert(user_opts.side_buttons_color) .. "&}",
        control_1 = "{\\1c&H" .. osc_color_convert(user_opts.playpause_color) .. "&\\fs" .. playpause_size .. "\\fn" .. icons.iconfont .. "}",
        control_2 = "{\\1c&H" .. osc_color_convert(user_opts.middle_buttons_color) .. "&\\fs" .. midbuttons_size .. "\\fn" .. icons.iconfont .. "}",
        control_3 = "{\\1c&H" .. osc_color_convert(user_opts.side_buttons_color) .. "&\\fs" .. sidebuttons_size .. "\\fn" .. icons.iconfont .. "}",
        control_mini = "{\\1c&H" .. osc_color_convert(user_opts.side_buttons_color) .. "&\\fs16\\fn" .. icons.iconfont .. "}",
        element_down = "{\\1c&H" .. osc_color_convert(user_opts.held_element_color) .. "&" .. string.format("\\fscx%s\\fscy%s", user_opts.button_held_size, user_opts.button_held_size) .. "}",
        element_hover = "{" .. (hover_effects.color and "\\1c&H" .. osc_color_convert(user_opts.hover_effect_color) .. "&" or "") .. (hover_effects.size and string.format("\\fscx%s\\fscy%s", user_opts.button_hover_size, user_opts.button_hover_size) or "") .. "}",
        hover_bg = "{\\1c&H" .. osc_color_convert(user_opts.hover_effect_color) .. "&}",
    }
end

-- internal states, do not touch
local state = {
    showtime = nil,                         -- time of last invocation (last mouse move)
    wc_showtime = nil,                      -- time of last invocation for window controls
    wc_anistart = nil,                      -- time when the wc animation started
    wc_anitype = nil,                       -- current type of wc animation
    wc_animation = nil,                     -- current wc animation alpha
    touchtime = nil,                        -- time of last invocation (last touch event)
    touchpoints = {},                       -- current touch points
    osc_visible = false,                    -- osc visibility
    wc_visible = false,                     -- window controls visibility
    anistart = nil,                         -- time when the animation started
    anitype = nil,                          -- current type of animation
    animation = nil,                        -- current animation alpha
    mouse_down_counter = 0,                 -- used for softrepeat
    active_element = nil,                   -- nil = none, 0 = background, 1+ = see elements[]
    active_event_source = nil,              -- the "button" that issued the current event
    tc_left_rem = not user_opts.timecurrent,-- if the left timecode should display current or remaining time
    tc_ms = user_opts.timems,               -- Should the timecodes display their time with milliseconds
    screen_sizeX = nil, screen_sizeY = nil, -- last screen-resolution, to detect resolution changes to issue reINITs
    initREQ = false,                        -- is a re-init request pending?
    marginsREQ = false,                     -- is a margins update pending?
    last_mouseX = nil, last_mouseY = nil,   -- last mouse position, to detect significant mouse movement
    last_touchX = -1, last_touchY = -1,     -- last touch position
    mouse_in_window = false,
    fullscreen = false,
    tick_timer = nil,
    tick_last_time = 0,                     -- when the last tick() was run
    hide_timer = nil,
    demuxer_cache_state = nil,
    idle_active = false,
    audio_track_count = 0,
    sub_track_count = 0,
    playlist_count = 0,
    playlist_pos_1 = 0,
    pause = false,
    volume = 0,
    mute = false,
    osd_dimensions = {w = 0, h = 0, aspect = 0},
    osd_scale_by_window = false,
    file_loaded = false,                    -- flag to detect file load
    enabled = true,
    input_enabled = true,
    showhide_enabled = false,
    windowcontrols_buttons = false,
    windowcontrols_title = false,
    windowcontrols_ontop = false,
    dmx_cache = 0,
    border = true,
    window_maximized = false,
    osd = mp.create_osd_overlay("ass-events"),
    logo_osd = mp.create_osd_overlay("ass-events"),
    keeponpause_active = false,             -- keeponpause bottombar active state
    duration = nil,                         -- current file duration
    chapter_list = {},                      -- sorted by time
    chapter = -1,                           -- current chapter index
    visibility_modes = {},                  -- visibility_modes to cycle through
    eof_reached = false,
    ontop = false,
    speed = 1,
    file_loop = false,
    shuffled = false,
    sliderpos = 0,
    playing_and_seeking = false,
    playtime_hour_force_init = false,       -- used to force request_init() once
    persistent_seekbar_element = nil,
    seekbar_element = nil,
    persistent_progress_toggle = user_opts.persistent_progress,
    user_subpos = mp.get_property_number("sub-pos") or 100,
    osc_adjusted_subpos = nil,
    is_image = false,
    is_url = false,
    url_path = "",                           -- used for yt-dlp downloading
    downloaded_once = false,
    downloading = false,
    file_size_normalized = nil,
    title_max_w = nil,
    windowtitle_max_w = nil,
    chapter_title_max_w = nil,
}

local logo_lines = {
    -- White border
    "{\\c&HE5E5E5&\\p6}m 895 10 b 401 10 0 410 0 905 0 1399 401 1800 895 1800 1390 1800 1790 1399 1790 905 1790 410 1390 10 895 10 {\\p0}",
    -- Purple fill
    "{\\c&H682167&\\p6}m 925 42 b 463 42 87 418 87 880 87 1343 463 1718 925 1718 1388 1718 1763 1343 1763 880 1763 418 1388 42 925 42{\\p0}",
    -- Darker fill
    "{\\c&H430142&\\p6}m 1605 828 b 1605 1175 1324 1456 977 1456 631 1456 349 1175 349 828 349 482 631 200 977 200 1324 200 1605 482 1605 828{\\p0}",
    -- White fill
    "{\\c&HDDDBDD&\\p6}m 1296 910 b 1296 1131 1117 1310 897 1310 676 1310 497 1131 497 910 497 689 676 511 897 511 1117 511 1296 689 1296 910{\\p0}",
    -- Triangle
    "{\\c&H691F69&\\p6}m 762 1113 l 762 708 b 881 776 1000 843 1119 911 1000 978 881 1046 762 1113{\\p0}",
}

local santa_hat_lines = {
    -- Pompoms
    "{\\c&HC0C0C0&\\p6}m 500 -323 b 491 -322 481 -318 475 -311 465 -312 456 -319 446 -318 434 -314 427 -304 417 -297 410 -290 404 -282 395 -278 390 -274 387 -267 381 -265 377 -261 379 -254 384 -253 397 -244 409 -232 425 -228 437 -228 446 -218 457 -217 462 -216 466 -213 468 -209 471 -205 477 -203 482 -206 491 -211 499 -217 508 -222 532 -235 556 -249 576 -267 584 -272 584 -284 578 -290 569 -305 550 -312 533 -309 523 -310 515 -316 507 -321 505 -323 503 -323 500 -323{\\p0}",
    "{\\c&HE0E0E0&\\p6}m 315 -260 b 286 -258 259 -240 246 -215 235 -210 222 -215 211 -211 204 -188 177 -176 172 -151 170 -139 163 -128 154 -121 143 -103 141 -81 143 -60 139 -46 125 -34 129 -17 132 -1 134 16 142 30 145 56 161 80 181 96 196 114 210 133 231 144 266 153 303 138 328 115 373 79 401 28 423 -24 446 -73 465 -123 483 -174 487 -199 467 -225 442 -227 421 -232 402 -242 384 -254 364 -259 342 -250 322 -260 320 -260 317 -261 315 -260{\\p0}",
    -- Main cap
    "{\\c&H0000F0&\\p6}m 1151 -523 b 1016 -516 891 -458 769 -406 693 -369 624 -319 561 -262 526 -252 465 -235 479 -187 502 -147 551 -135 588 -111 1115 165 1379 232 1909 761 1926 800 1952 834 1987 858 2020 883 2053 912 2065 952 2088 1000 2146 962 2139 919 2162 836 2156 747 2143 662 2131 615 2116 567 2122 517 2120 410 2090 306 2089 199 2092 147 2071 99 2034 64 1987 5 1928 -41 1869 -86 1777 -157 1712 -256 1629 -337 1578 -389 1521 -436 1461 -476 1407 -509 1343 -507 1284 -515 1240 -519 1195 -521 1151 -523{\\p0}",
    -- Cap shadow
    "{\\c&H0000AA&\\p6}m 1657 248 b 1658 254 1659 261 1660 267 1669 276 1680 284 1689 293 1695 302 1700 311 1707 320 1716 325 1726 330 1735 335 1744 347 1752 360 1761 371 1753 352 1754 331 1753 311 1751 237 1751 163 1751 90 1752 64 1752 37 1767 14 1778 -3 1785 -24 1786 -45 1786 -60 1786 -77 1774 -87 1760 -96 1750 -78 1751 -65 1748 -37 1750 -8 1750 20 1734 78 1715 134 1699 192 1694 211 1689 231 1676 246 1671 251 1661 255 1657 248 m 1909 541 b 1914 542 1922 549 1917 539 1919 520 1921 502 1919 483 1918 458 1917 433 1915 407 1930 373 1942 338 1947 301 1952 270 1954 238 1951 207 1946 214 1947 229 1945 239 1939 278 1936 318 1924 356 1923 362 1913 382 1912 364 1906 301 1904 237 1891 175 1887 150 1892 126 1892 101 1892 68 1893 35 1888 2 1884 -9 1871 -20 1859 -14 1851 -6 1854 9 1854 20 1855 58 1864 95 1873 132 1883 179 1894 225 1899 273 1908 362 1910 451 1909 541{\\p0}",
    -- Brim and tip pompom
    "{\\c&HF8F8F8&\\p6}m 626 -191 b 565 -155 486 -196 428 -151 387 -115 327 -101 304 -47 273 2 267 59 249 113 219 157 217 213 215 265 217 309 260 302 285 283 373 264 465 264 555 257 608 252 655 292 709 287 759 294 816 276 863 298 903 340 972 324 1012 367 1061 394 1125 382 1167 424 1213 462 1268 482 1322 506 1385 546 1427 610 1479 662 1510 690 1534 725 1566 752 1611 796 1664 830 1703 880 1740 918 1747 986 1805 1005 1863 991 1897 932 1916 880 1914 823 1945 777 1961 725 1979 673 1957 622 1938 575 1912 534 1862 515 1836 473 1790 417 1755 351 1697 305 1658 266 1633 216 1593 176 1574 138 1539 116 1497 110 1448 101 1402 77 1371 37 1346 -16 1295 15 1254 6 1211 -27 1170 -62 1121 -86 1072 -104 1027 -128 976 -133 914 -130 851 -137 794 -162 740 -181 679 -168 626 -191 m 2051 917 b 1971 932 1929 1017 1919 1091 1912 1149 1923 1214 1970 1254 2000 1279 2027 1314 2066 1325 2139 1338 2212 1295 2254 1238 2281 1203 2287 1158 2282 1116 2292 1061 2273 1006 2229 970 2206 941 2167 938 2138 918{\\p0}",
}

--
-- Helper functions
--

local function kill_animation(anitype_key, anistart_key, animation_key)
    state[anitype_key]   = nil
    state[anistart_key]  = nil
    state[animation_key] = nil
end

local function set_osd(osd, res_x, res_y, text, z)
    if osd.res_x == res_x and osd.res_y == res_y and osd.data == text then
        return
    end
    osd.res_x = res_x
    osd.res_y = res_y
    osd.data = text
    osd.z = z
    osd:update()
end

local function set_time_styles(timecurrent_changed, timems_changed)
    if timecurrent_changed then
        state.tc_left_rem = not user_opts.timecurrent
    end
    if timems_changed then
        state.tc_ms = user_opts.timems
    end
end

local function observe_cached(property, callback)
    local key = property:gsub("-", "_")
    mp.observe_property(property, "native", function (_, value)
        state[key] = value
        callback()
    end)
end

-- scale factor for translating between real and virtual ASS coordinates
local function get_virt_scale_factor()
    if state.osd_dimensions.w == 0 or state.osd_dimensions.h == 0 then
        return 0, 0
    end
    return osc_param.playresx / state.osd_dimensions.w,
           osc_param.playresy / state.osd_dimensions.h
end

local function recently_touched()
    if state.touchtime == nil then
        return false
    end
    return state.touchtime + 1 >= mp.get_time()
end

-- return mouse position in virtual ASS coordinates (playresx/y)
local function get_virt_mouse_pos()
    if recently_touched() then
        local sx, sy = get_virt_scale_factor()
        return state.last_touchX * sx, state.last_touchY * sy
    elseif state.mouse_in_window then
        local sx, sy = get_virt_scale_factor()
        local x, y = mp.get_mouse_pos()
        return x * sx, y * sy
    else
        return -1, -1
    end
end

local function set_virt_mouse_area(x0, y0, x1, y1, name)
    local sx, sy = get_virt_scale_factor()
    mp.set_mouse_area(x0 / sx, y0 / sy, x1 / sx, y1 / sy, name)
end

local function scale_value(x0, x1, y0, y1, val)
    local m = (y1 - y0) / (x1 - x0)
    local b = y0 - (m * x0)
    return (m * val) + b
end

-- returns the position of an object on a one-dimensional axis,
-- from 0..1 (object to the "left") to 1..0 (object to the "right"), taking margin into account.
local function get_align(align, frame, obj, margin)
    return (frame / 2) + (((frame / 2) - margin - (obj / 2)) * align)
end

local text_measure_osd = mp.create_osd_overlay and mp.create_osd_overlay("ass-events") or nil
if text_measure_osd then
    text_measure_osd.hidden = true
    text_measure_osd.compute_bounds = true
end

local text_width_cache = {}

local function estimate_text_width(text, style)
    if text == nil then return 0 end
    text = tostring(text)
    if #text == 0 then return 0 end

    -- replace digits with '0' for consistency
    local measure_text = text:gsub("%d", "0")
    local cache_key = measure_text .. (style or "")
    local width = 0

    if text_width_cache[cache_key] then
        return text_width_cache[cache_key]
    end

    if text_measure_osd and text_measure_osd.update then
        text_measure_osd.res_x = osc_param.playresx
        text_measure_osd.res_y = osc_param.playresy
        text_measure_osd.data = (style or "") .. "{\\an7\\pos(0,0)}" .. measure_text

        local bounds = text_measure_osd:update()
        if bounds and bounds.x1 and bounds.x0 then
            -- subtract side-bearing padding that libass adds even at bord0
            local fs = tonumber((style or ""):match("\\fs(%d+%.?%d*)")) or 16
            local bearing_correction = fs * 0.08 * 2
            width = math.max(0, (bounds.x1 - bounds.x0) - bearing_correction)
        end
    end

    text_width_cache[cache_key] = width
    return width
end

-- width of the time codes element
local function get_time_codes_width()
    local dur = state.duration or 0
    local rt_sec = state.tc_left_rem and mp.get_property_number("playtime-remaining", 0) or mp.get_property_number("playback-time", 0)

    local function time_fmt(s)
        local has_h = (s >= 3600) or user_opts.time_format == "fixed"
        local base = has_h and (s >= 36000 and "88" or "8") .. ":88:88" or (s >= 600 and "88" or "8") .. ":88"
        return base .. (state.tc_ms and ".888" or "")
    end

    local prefix = state.tc_left_rem and (user_opts.unicodeminus and UNICODE_MINUS or "-") or ""
    local w = estimate_text_width(prefix .. time_fmt(rt_sec) .. " / " .. time_fmt(dur), osc_styles.time)
    return w ~= 0 and w or 120 + (state.tc_ms and 40 or 0)
end

-- returns hitbox spanning coordinates (top left, bottom right corner)
-- according to alignment
local function get_hitbox_coords(x, y, an, w, h)
    local alignments = {
      [1] = function () return x, y-h, x+w, y end,
      [2] = function () return x-(w/2), y-h, x+(w/2), y end,
      [3] = function () return x-w, y-h, x, y end,

      [4] = function () return x, y-(h/2), x+w, y+(h/2) end,
      [5] = function () return x-(w/2), y-(h/2), x+(w/2), y+(h/2) end,
      [6] = function () return x-w, y-(h/2), x, y+(h/2) end,

      [7] = function () return x, y, x+w, y+h end,
      [8] = function () return x-(w/2), y, x+(w/2), y+h end,
      [9] = function () return x-w, y, x, y+h end,
    }

    return alignments[an]()
end

local function get_element_hitbox(element)
    return element.hitbox.x1, element.hitbox.y1, element.hitbox.x2, element.hitbox.y2
end

local function mouse_hit_coords(bX1, bY1, bX2, bY2)
    local mX, mY = get_virt_mouse_pos()
    return (mX >= bX1 and mX <= bX2 and mY >= bY1 and mY <= bY2)
end

local function mouse_hit(element)
    return mouse_hit_coords(get_element_hitbox(element))
end

local function mouse_in_area(names)
    if type(names) == "string" then names = {names} end
    for _, name in ipairs(names) do
        for _, cords in ipairs(osc_param.areas[name] or {}) do
            if mouse_hit_coords(cords.x1, cords.y1, cords.x2, cords.y2) then
                return true
            end
        end
    end
    return false
end

local function limit_range(min, max, val)
    return math.max(min, math.min(max, val))
end

-- translate value into element coordinates
local function get_slider_ele_pos_for(element, val)
    local ele_pos = scale_value(
        element.slider.min.value, element.slider.max.value,
        element.slider.min.ele_pos, element.slider.max.ele_pos,
        val)

    return limit_range(element.slider.min.ele_pos, element.slider.max.ele_pos, ele_pos)
end

-- translates global (mouse) coordinates to value
local function get_slider_value_at(element, glob_pos)
    if element then
        local val = scale_value(
            element.slider.min.glob_pos, element.slider.max.glob_pos,
            element.slider.min.value, element.slider.max.value,
            glob_pos)

        return limit_range(element.slider.min.value, element.slider.max.value, val)
    end
    -- fall back incase of loading errors
    return 0
end

-- get value at current mouse position
local function get_slider_value(element)
    return get_slider_value_at(element, get_virt_mouse_pos())
end

-- multiplies two alpha values, formular can probably be improved
local function mult_alpha(alphaA, alphaB)
    return 255 - (((1-(alphaA/255)) * (1-(alphaB/255))) * 255)
end

local function add_area(name, x1, y1, x2, y2)
    -- create area if needed
    if osc_param.areas[name] == nil then
        osc_param.areas[name] = {}
    end
    table.insert(osc_param.areas[name], {x1=x1, y1=y1, x2=x2, y2=y2})
end

local function ass_append_alpha(ass, alpha, modifier, inverse, anim_override)
    local ar = {}

    for ai, av in ipairs(alpha) do
        av = mult_alpha(av, modifier)
        local animpos = anim_override or state.animation
        if animpos then
            if inverse then
                animpos = 255 - animpos
            end
            av = mult_alpha(av, animpos)
        end
        ar[ai] = av
    end

    ass:append(string.format("{\\1a&H%X&\\2a&H%X&\\3a&H%X&\\4a&H%X&}", ar[1], ar[2], ar[3], ar[4]))
end

-- draw tooltip background box and label
local function draw_tooltip(ass, tx, ty, width, style, label, alpha)
    local fs = user_opts.tooltip_font_size
    local ph, pv = 5, 3
    local box_h = fs + 2 * pv
    local min_w = box_h + 2 * ph
    local box_w = math.max(width + 2 * ph, min_w)
    -- draw tooltip box
    ass:new_event()
    ass:append("{\\rDefault\\alpha&H4D&}")
    ass:pos(tx - box_w / 2, ty - fs - pv)
    ass:an(7)
    ass:append(osc_styles.tooltip_box)
    ass:draw_start()
    ass:round_rect_cw(0, 0, box_w, box_h, box_h / 2)
    ass:draw_stop()
    -- add tooltip
    ass:new_event()
    ass:append("{\\rDefault}")
    ass:pos(tx, ty)
    ass:an(2)
    ass:append(style)
    if alpha then ass_append_alpha(ass, alpha, 0) end
    ass:append(label)
end

local function ass_draw_cir_cw(ass, x, y, r)
    ass:round_rect_cw(x-r, y-r, x+r, y+r, r)
end

local function ass_draw_rr_h_cw(ass, x0, y0, x1, y1, r1, hexagon, r2)
    if hexagon then
        ass:hexagon_cw(x0, y0, x1, y1, r1, r2)
    else
        ass:round_rect_cw(x0, y0, x1, y1, r1, r2)
    end
end

local function get_hidetimeout()
    if user_opts.visibility == "always" then
        return -1 -- disable autohide
    end
    return user_opts.hidetimeout
end

local function get_touchtimeout()
    if state.touchtime == nil then
        return 0
    end
    return state.touchtime + (get_hidetimeout() / 1000) - mp.get_time()
end

local function cache_enabled()
    return state.demuxer_cache_state and #state.demuxer_cache_state["seekable-ranges"] > 0
end

local function set_margin_offset(prop, offset)
    if offset > 0 then
        if not state[prop] then
            state[prop] = mp.get_property_number(prop)
        end
        mp.set_property_number(prop, state[prop] + offset)
    elseif state[prop] then
        mp.set_property_number(prop, state[prop])
        state[prop] = nil
    end
end

local function reset_margins()
    -- restore subtitle position if it was changed
    if state.osc_adjusted_subpos ~= nil then
        mp.set_property_number("sub-pos", state.user_subpos)
        state.osc_adjusted_subpos = nil
    end
    set_margin_offset("osd-margin-y", 0)
end

local function update_margins()
    local use_margins = get_hidetimeout() < 0 or user_opts.dynamic_margins
    local top_vis = state.wc_visible
    local bottom_vis = state.osc_visible
    local margins = {
        l = 0,
        r = 0,
        t = (use_margins and top_vis) and osc_param.video_margins.t or 0,
        b = (use_margins and bottom_vis) and osc_param.video_margins.b or 0,
    }

    -- raise amount is based on OSC height
    if user_opts.sub_margins and mp.get_property_native("sid") then
        if margins.b > 0 then
            local raise_percent = margins.b * 100
            -- only raise if subs are low enough that they would overlap the OSC
            if state.user_subpos >= (100 - raise_percent) then
                local adjusted = math.floor((1 - margins.b) * 100)
                if adjusted < 0 then adjusted = state.user_subpos end
                state.osc_adjusted_subpos = adjusted
                mp.set_property_number("sub-pos", adjusted)
            else
                -- sub pos is high; do nothing
                state.osc_adjusted_subpos = nil
            end
        else
            -- restore original sub position
            if state.osc_adjusted_subpos ~= nil then
                mp.set_property_number("sub-pos", state.user_subpos)
                state.osc_adjusted_subpos = nil
            end
        end
    end

    if user_opts.osd_margins then
        local align = mp.get_property("osd-align-y")
        local osd_margin = 0
        if align == "top" and top_vis then
            osd_margin = margins.t
        elseif align == "bottom" and bottom_vis then
            osd_margin = margins.b
        end
        set_margin_offset("osd-margin-y", osd_margin * osc_param.playresy)
    end

    mp.set_property_native("user-data/osc/margins", margins)
end

local tick

-- Request that tick() is called (which typically re-renders the OSC).
-- The tick is then either executed immediately, or rate-limited if it was
-- called a small time ago.
local function request_tick()
    if state.tick_timer == nil then
        state.tick_timer = mp.add_timeout(0, tick)
    end

    if not state.tick_timer:is_enabled() then
        local now = mp.get_time()
        local timeout = tick_delay - (now - state.tick_last_time)
        if timeout < 0 then
            timeout = 0
        end
        state.tick_timer.timeout = timeout
        state.tick_timer:resume()
    end
end

local function request_init()
    state.initREQ = true
    request_tick()
end

-- Like request_init(), but also request an immediate update
local function request_init_resize()
    request_init()
    -- ensure immediate update
    state.tick_timer:kill()
    state.tick_timer.timeout = 0
    state.tick_timer:resume()
end

local function render_wipe(osd)
    msg.trace("render_wipe()")
    osd.data = "" -- allows set_osd to immediately update on enable
    osd:remove()
end

local function show_bar(label, showtime_key, visible_key, anitype_key, set_visible)
    -- show when disabled can happen (e.g. mouse_move) due to async/delayed unbinding
    if not state.enabled then return end
    msg.trace("show_" .. label)
    state[showtime_key] = mp.get_time()
    if user_opts.fadeduration <= 0 then
        set_visible(true)
    elseif user_opts.fadein then
        if not state[visible_key] then
            state[anitype_key] = "in"
            request_tick()
        end
    else
        set_visible(true)
        state[anitype_key] = nil
    end
end

local function hide_bar(label, visible_key, anitype_key, set_visible)
    msg.trace("hide_" .. label)
    if not state.enabled then
        -- typically hide happens at render() from tick(), but now tick() is
        -- no-op and won't render again to remove the osc, so do that manually.
        state[visible_key] = false
        render_wipe(state.osd)
    elseif user_opts.fadeduration > 0 then
        if state[visible_key] then
            state[anitype_key] = "out"
            request_tick()
        end
    else
        set_visible(false)
    end
end

local function update_tracklist(_, track_list)
    state.audio_track_count = 0
    state.sub_track_count = 0

    for _, track in pairs(track_list) do
        if track.type == "audio" then
            state.audio_track_count = state.audio_track_count + 1
        elseif track.type == "sub" then
            state.sub_track_count = state.sub_track_count + 1
        end
    end

    request_init()
end

-- convert slider_pos to logarithmic depending on volume_control user_opts
local function set_volume(slider_pos)
    local volume = slider_pos
    if user_opts.volume_control_type == "logarithmic" then
        volume = slider_pos^2 / 100
    end
    return math.floor(volume)
end

-- WindowControl helpers
local function window_controls_enabled()
    local val = user_opts.window_top_bar
    if val == "auto" then
        return not state.border or not state.title_bar or (state.fullscreen and platform ~= "darwin")
    else
        return val ~= "no"
    end
end

--
-- Element Management
--
local elements = {}

local function prepare_elements()
    -- remove elements without layout or invisible
    local elements2 = {}
    for _, element in pairs(elements) do
        if element.layout ~= nil and element.visible then
            table.insert(elements2, element)
        end
    end
    elements = elements2

    local function elem_compare (a, b)
        return a.layout.layer < b.layout.layer
    end

    table.sort(elements, elem_compare)

    for _,element in pairs(elements) do

        local elem_geo = element.layout.geometry

        -- Calculate title and chapter hitbox
        local hitbox_w = elem_geo.w

        if (element.name == "title" or element.name == "chapter_title") and type(element.content) == "function" then
            local width = estimate_text_width(element.content(), osc_styles[element.name])
            if width > 0 then hitbox_w = math.min(width, hitbox_w) end
        end

        -- Calculate the hitbox
        local hitbox_h = elem_geo.h + ((element.name == "volumebar" or element.name == "zoom_control") and 14 or 0)
        local bX1, bY1, bX2, bY2 = get_hitbox_coords(elem_geo.x, elem_geo.y, elem_geo.an, hitbox_w, hitbox_h)
        element.hitbox = {x1 = bX1, y1 = bY1, x2 = bX2, y2 = bY2}

        local style_ass = assdraw.ass_new()

        -- prepare static elements
        style_ass:append("{}") -- hack to troll new_event into inserting a \n
        style_ass:new_event()
        style_ass:pos(elem_geo.x, elem_geo.y)
        style_ass:an(elem_geo.an)
        style_ass:append(element.layout.style)

        element.style_ass = style_ass

        local static_ass = assdraw.ass_new()

        if element.type == "box" then
            --draw box
            static_ass:draw_start()
            ass_draw_rr_h_cw(static_ass, 0, 0, elem_geo.w, elem_geo.h, element.layout.box.radius, element.layout.box.hexagon)
            static_ass:draw_stop()

        elseif element.type == "slider" then
            --draw static slider parts
            local slider_lo = element.layout.slider
            -- calculate positions of min and max points
            element.slider.min.ele_pos = user_opts.seek_handle_size > 0 and (user_opts.seek_handle_size * elem_geo.h / 2) or slider_lo.border
            element.slider.max.ele_pos = elem_geo.w - element.slider.min.ele_pos
            element.slider.min.glob_pos = element.hitbox.x1 + element.slider.min.ele_pos
            element.slider.max.glob_pos = element.hitbox.x1 + element.slider.max.ele_pos

            static_ass:draw_start()
            -- a hack which prepares the whole slider area to allow center placements such like an=5
            static_ass:rect_cw(0, 0, elem_geo.w, elem_geo.h)
            static_ass:rect_ccw(0, 0, elem_geo.w, elem_geo.h)
            -- marker nibbles are drawn dynamically in draw_seekbar_nibbles()
        end

        element.static_ass = static_ass

        -- if the element is supposed to be disabled,
        -- style it accordingly and kill the eventresponders
        if not element.enabled then
            if element.name ~= "seekbar" then
                element.layout.alpha[1] = 215
            end
            -- keep these to display tooltips
            if not (element.name == "sub_track" or element.name == "audio_track" or element.name == "playlist") then
                element.eventresponder = nil
            end
        end

        -- gray out the element if it is toggled off
        if element.off then
            element.layout.alpha[1] = 100
        end
    end
end

--
-- Element Rendering
--

-- returns nil or a chapter element from the native property chapter-list
local function get_chapter(possec)
    local cl = state.chapter_list  -- sorted, get latest before possec, if any

    for n=#cl,1,-1 do
        if possec >= cl[n].time then
            return cl[n]
        end
    end
end

-- Computes handle position and radius without drawing
-- Returns handle position, radius, and whether the handle is active (hovered or dragged)
local function get_seekbar_handle_pos(element)
    local pos = element.slider.posF()
    if not pos then return 0, 0, false end

    local elem_geo = element.layout.geometry
    local handle_radius = user_opts.seek_handle_size * elem_geo.h / 2
    local handle_x = get_slider_ele_pos_for(element, pos)
    local center_y = elem_geo.h / 2

    local mouse_over_handle = mouse_hit_coords(
        element.hitbox.x1 + handle_x - handle_radius,
        element.hitbox.y1 + center_y - handle_radius,
        element.hitbox.x1 + handle_x + handle_radius,
        element.hitbox.y1 + center_y + handle_radius
    ) and element.enabled

    local is_active = mouse_over_handle or element.state.handle_drag

    if handle_radius > 0 then
        if is_active then
            handle_radius = handle_radius * (user_opts.slider_hover_size / 100)
            handle_x = limit_range(handle_radius, elem_geo.w - handle_radius, handle_x)
        end
        return handle_x, handle_radius, is_active
    end

    return handle_x, 0, false
end

-- Prepares elem_ass for a new draw layer with the given color
local function begin_draw_layer(element, elem_ass, color, anim_override)
    elem_ass:draw_stop()
    elem_ass:merge(element.style_ass)
    ass_append_alpha(elem_ass, element.layout.alpha, 0, nil, anim_override)
    elem_ass:append("{\\blur0\\bord0\\1c&H" .. osc_color_convert(color) .. "&}")
    elem_ass:merge(element.static_ass)
end

-- Draws a handle on the seekbar using precomputed position and radius
local function draw_seekbar_handle(element, elem_ass, handle_x, handle_radius, anim_override, is_active)
    if handle_radius <= 0 then return end

    local center_y = element.layout.geometry.h / 2
    local slider_lo = element.layout.slider

    local fill_color = slider_lo.handle_color or user_opts.side_buttons_color
    local border_color = slider_lo.handle_border
    local border_thickness = is_active and user_opts.seek_handle_border_hover_size or user_opts.seek_handle_border_size
    local has_border = border_color and border_color ~= "" and border_thickness > 0

    if has_border then
        -- inner_radius is how far the fill circle extends inward from the outer edge
        local inner_radius = handle_radius * (1 - border_thickness)
        -- full circle in border color, then smaller circle in fill color on top
        begin_draw_layer(element, elem_ass, border_color, anim_override)
        ass_draw_cir_cw(elem_ass, handle_x, center_y, handle_radius)
        begin_draw_layer(element, elem_ass, fill_color, anim_override)
        ass_draw_cir_cw(elem_ass, handle_x, center_y, inner_radius)
    else
        -- no border configured, just draw a single solid circle
        begin_draw_layer(element, elem_ass, fill_color, anim_override)
        ass_draw_cir_cw(elem_ass, handle_x, center_y, handle_radius)
    end
end

-- Collects and sorts pixel-space cut positions for gap-style chapter markers, skipping the first marker
local function collect_gap_cuts(element)
    local cuts = {}
    if element.slider.markerF then
        for n, marker in ipairs(element.slider.markerF()) do
            if n > 1 and marker >= element.slider.min.value and marker <= element.slider.max.value then
                cuts[#cuts + 1] = get_slider_ele_pos_for(element, marker)
            end
        end
        table.sort(cuts)
    end
    return cuts
end

-- Draws bar segments split around chapter gaps, stopping at x_max (bar_w for bg, xp for fg).
local function draw_gap_segments(elem_ass, element, gap_half, x_max, slider_lo, elem_geo, radius)
    gap_half = gap_half or 1.5
    local cuts = collect_gap_cuts(element)
    -- clamp x_max back to the nearest gap boundary if it falls inside a gap
    for _, cut in ipairs(cuts) do
        if x_max > cut - gap_half and x_max < cut + gap_half then
            x_max = cut - gap_half
            break
        end
    end
    local seg_start = 0
    for _, cut in ipairs(cuts) do
        if cut >= x_max then break end
        local seg_end = cut - gap_half
        if seg_end > seg_start then
            elem_ass:round_rect_cw(seg_start, slider_lo.gap, seg_end, elem_geo.h - slider_lo.gap,
                (seg_start == 0) and radius or 0, 0)
        end
        seg_start = cut + gap_half
    end
    if x_max > seg_start then
        elem_ass:round_rect_cw(seg_start, slider_lo.gap, x_max, elem_geo.h - slider_lo.gap,
            (seg_start == 0) and radius or 0, (x_max == elem_geo.w) and radius or 0)
    end
end

-- Draws seekbar ranges according to user_opts
local function draw_seekbar_ranges(element, elem_ass, xp, rh, override_alpha, inverse)
    local handle = xp and rh and rh > 0
    xp = xp or 0
    rh = rh or 0
    local slider_lo = element.layout.slider
    local elem_geo = element.layout.geometry
    local seekRanges = element.slider.seekRangesF()
    if not seekRanges then return end
    elem_ass:draw_stop()
    elem_ass:merge(element.style_ass)
    ass_append_alpha(elem_ass, element.layout.alpha, override_alpha or user_opts.seekrangealpha, inverse)
    elem_ass:append("{\\1c&H" .. osc_color_convert(user_opts.seekbar_cache_color) .. "&}")
    elem_ass:merge(element.static_ass)

    local radius = slider_lo.radius
    local gap_half = 1.5
    local cuts = (slider_lo.nibbles_style == "gap" and element.name == "seekbar") and collect_gap_cuts(element) or {}

    for _, range in pairs(seekRanges) do
        local pstart = math.max(xp, get_slider_ele_pos_for(element, range["start"]) - slider_lo.gap)
        local pend = math.min(elem_geo.w, get_slider_ele_pos_for(element, range["end"]) + slider_lo.gap)

        -- round edge only when cache range reaches start/end
        local r_left = pstart < element.slider.min.ele_pos and radius or 0
        local r_right = pend > element.slider.max.ele_pos and radius or 0

        -- split around chapter gaps then around the handle
        local seg_start = pstart
        for _, cut in ipairs(cuts) do
            local gap_l, gap_r = cut - gap_half, cut + gap_half
            if gap_r > pstart and gap_l < pend then
                local sl, sr = seg_start, math.min(gap_l, pend)
                if handle and (sl < xp + rh and sr > xp - rh) then
                    if sl < xp - rh then elem_ass:round_rect_cw(sl, slider_lo.gap, xp - rh, elem_geo.h - slider_lo.gap, sl == pstart and r_left or 0, 0) end
                    if xp + rh < sr  then elem_ass:round_rect_cw(xp + rh, slider_lo.gap, sr, elem_geo.h - slider_lo.gap, 0, 0) end
                elseif sr > sl then
                    elem_ass:round_rect_cw(sl, slider_lo.gap, sr, elem_geo.h - slider_lo.gap, sl == pstart and r_left or 0, 0)
                end
                seg_start = math.max(gap_r, pstart)
            end
        end
        local sl, sr = seg_start, pend
        local rl = (sl == pstart) and r_left or 0
        if handle and (sl < xp + rh and sr > xp - rh) then
            if sl < xp - rh then elem_ass:round_rect_cw(sl, slider_lo.gap, xp - rh, elem_geo.h - slider_lo.gap, rl, 0) end
            if xp + rh < sr  then elem_ass:round_rect_cw(xp + rh, slider_lo.gap, sr, elem_geo.h - slider_lo.gap, 0, r_right) end
        else
            if sr > sl then elem_ass:round_rect_cw(sl, slider_lo.gap, sr, elem_geo.h - slider_lo.gap, rl, r_right) end
        end
    end
end

-- show visual indicator in seek ranges for ab loop
local function draw_ab_loop_range(element, elem_ass)
    if element.name ~= "seekbar" then return end
    local ab_a = mp.get_property_number("ab-loop-a")
    if not state.duration or not ab_a or ab_a < 0 then return end
    local ab_b = mp.get_property_number("ab-loop-b")
    local slider_lo = element.layout.slider
    local elem_geo = element.layout.geometry
    local ax = get_slider_ele_pos_for(element, ab_a / state.duration * 100)
    local bx = (ab_b and ab_b > ab_a and ab_b <= state.duration) and get_slider_ele_pos_for(element, ab_b / state.duration * 100) or elem_geo.w
    if ax >= bx then return end
    begin_draw_layer(element, elem_ass, user_opts.ab_loop_color)
    elem_ass:rect_cw(ax, slider_lo.gap, bx, elem_geo.h - slider_lo.gap)
end

local function draw_seekbar_nibbles(element, elem_ass)
    local slider_lo = element.layout.slider
    local elem_geo = element.layout.geometry

    if element.slider.markerF == nil or slider_lo.gap <= 0 then
        return
    end

    if slider_lo.nibbles_style == "gap" and element.name == "seekbar" then
        local radius = slider_lo.radius
        local bg_alpha = 128
        elem_ass:draw_stop()
        elem_ass:merge(element.style_ass)
        ass_append_alpha(elem_ass, element.layout.alpha, bg_alpha)
        elem_ass:append("{\\blur0\\bord0\\1c&H" .. osc_color_convert(user_opts.seekbarbg_color) .. "&}")
        elem_ass:merge(element.static_ass)
        draw_gap_segments(elem_ass, element, 1.5, elem_geo.w, slider_lo, elem_geo, radius)
        return
    end

    local markers = element.slider.markerF()

    if #markers == 0 then return end
    local current_chapter = state.chapter or -1

    -- draw a single nibble at position s
    local function draw_nibble(ass, s)
        if slider_lo.gap >= 5 then
            local bar_h = 3
            if slider_lo.nibbles_top then
                if slider_lo.nibbles_style == "triangle" then
                    ass:move_to(s - 3, slider_lo.gap - 5)
                    ass:line_to(s + 3, slider_lo.gap - 5)
                    ass:line_to(s, slider_lo.gap - 1)
                elseif slider_lo.nibbles_style == "bar" then
                    ass:rect_cw(s - 1, slider_lo.gap - bar_h, s + 1, slider_lo.gap)
                else
                    ass:rect_cw(s - 1, slider_lo.gap - bar_h, s + 1, elem_geo.h - slider_lo.gap)
                end
            end
            if slider_lo.nibbles_bottom then
                if slider_lo.nibbles_style == "triangle" then
                    ass:move_to(s - 3, elem_geo.h - slider_lo.gap + 5)
                    ass:line_to(s, elem_geo.h - slider_lo.gap + 1)
                    ass:line_to(s + 3, elem_geo.h - slider_lo.gap + 5)
                elseif slider_lo.nibbles_style == "bar" then
                    ass:rect_cw(s - 1, elem_geo.h - slider_lo.gap, s + 1, elem_geo.h - slider_lo.gap + bar_h)
                else
                    ass:rect_cw(s - 1, slider_lo.gap, s + 1, elem_geo.h - slider_lo.gap + bar_h)
                end
            end
        else
            if slider_lo.nibbles_top then
                ass:rect_cw(s - 1, 0, s + 1, slider_lo.gap)
            end
            if slider_lo.nibbles_bottom then
                ass:rect_cw(s - 1, elem_geo.h - slider_lo.gap, s + 1, elem_geo.h)
            end
        end
    end

    -- draw non-current chapter nibbles
    local has_non_current = false
    for n, marker in ipairs(markers) do
        if n > 1 and (n - 1) ~= current_chapter and marker >= element.slider.min.value and marker <= element.slider.max.value then
            if not has_non_current then
                begin_draw_layer(element, elem_ass, user_opts.nibble_color)
                has_non_current = true
            end
            draw_nibble(elem_ass, get_slider_ele_pos_for(element, marker))
        end
    end

    -- draw current chapter nibble on top
    if current_chapter > 0 and current_chapter < #markers then
        local marker = markers[current_chapter + 1]
        if marker >= element.slider.min.value and marker <= element.slider.max.value then
            begin_draw_layer(element, elem_ass, user_opts.nibble_current_color)
            draw_nibble(elem_ass, get_slider_ele_pos_for(element, marker))
        end
    end
end

-- Draw seekbar progress more accurately
local function draw_seekbar_progress(element, elem_ass)
    local pos = element.slider.posF()
    if not pos then
        return
    end
    local xp = get_slider_ele_pos_for(element, pos)
    local slider_lo = element.layout.slider
    local elem_geo = element.layout.geometry
    local radius = slider_lo.radius

    if slider_lo.nibbles_style == "gap" and element.name == "seekbar" then
        draw_gap_segments(elem_ass, element, 1.5, xp, slider_lo, elem_geo, radius)
    else
        elem_ass:round_rect_cw(0, slider_lo.gap, xp, elem_geo.h - slider_lo.gap, radius)
    end
end

local function render_elements(master_ass, osc_vis, wc_vis)
    local function render_element(n)
        local element = elements[n]

        -- skip elements whose group is not currently visible
        local is_top = element.layout.group == "top"
        if (is_top and not wc_vis) or (not is_top and not osc_vis) then return end

        -- use wc animation for top group elements
        -- use 0 to block fallback to state.animation when wc has no active animation
        local anim_override = nil
        if is_top then
            anim_override = state.wc_animation or 0
        end

        local style_ass = assdraw.ass_new()
        style_ass:merge(element.style_ass)
        ass_append_alpha(style_ass, element.layout.alpha, 0, nil, anim_override)

        if element.eventresponder and (state.active_element == n) then
            -- run render event functions
            if element.eventresponder.render ~= nil then
                element.eventresponder.render(element)
            end
            if mouse_hit(element) then
                -- mouse down styling
                if element.styledown then
                    local down_style = osc_styles.element_down
                    if element.name == "title" or element.name == "chapter_title" or element.name == "time_codes" or element.name == "speed" or element.name == "cache_info" then
                        down_style = down_style:gsub("\\fscx%d+\\fscy%d+", "")
                    end
                    style_ass:append(down_style)
                end
                if element.softrepeat and state.mouse_down_counter >= 15 and state.mouse_down_counter % 5 == 0 then
                    element.eventresponder[state.active_event_source.."_down"](element)
                end
                state.mouse_down_counter = state.mouse_down_counter + 1
            end
        end

        local elem_ass = assdraw.ass_new()

        -- Hover background box
        if element.type == "button" and hover_effects.box
            and element.name ~= "title"
            and element.name ~= "chapter_title"
            and element.name ~= "time_codes"
            and element.name ~= "cache_info" then
            local is_clickable = element.eventresponder and (
                element.eventresponder["mbtn_left_down"] ~= nil or
                element.eventresponder["mbtn_left_up"] ~= nil
            )
            local hb = element.hover_box
            if (hb and mouse_hit_coords(hb.x1, hb.y1, hb.x2, hb.y2) or mouse_hit(element)) and is_clickable and element.enabled then
                local hx1, hy1, hx2, hy2
                if hb then hx1, hy1, hx2, hy2 = hb.x1, hb.y1, hb.x2, hb.y2
                else hx1, hy1, hx2, hy2 = get_element_hitbox(element) end
                local pad = element.hover_pad ~= nil and element.hover_pad or 6
                elem_ass:append("{}")
                elem_ass:new_event()
                elem_ass:pos(0, 0)
                elem_ass:an(7)
                local hover_base_alpha = state.mouse_down_counter > 0 and (255 - math.floor(math.max(0, math.min(100, user_opts.button_held_box_alpha)) * 2.55)) or (element.hover_alpha or 0xE6)
                ass_append_alpha(elem_ass, {[1] = hover_base_alpha, [2] = 255, [3] = 255, [4] = 255}, element.layout.alpha[1], nil, anim_override)
                local hover_style = element.hover_color
                    and "{\\blur0\\bord0\\1c&H" .. osc_color_convert(element.hover_color) .. "&}"
                    or osc_styles.hover_bg
                elem_ass:append(hover_style)
                elem_ass:draw_start()
                local hover_radius = element.hover_radius ~= nil and element.hover_radius or 4
                elem_ass:round_rect_cw(hx1 - pad, hy1 - pad, hx2 + pad, hy2 + pad, hover_radius)
                elem_ass:draw_stop()
            end
        end

        elem_ass:merge(style_ass)

        if element.type ~= "button" then
            elem_ass:merge(element.static_ass)
        end

        if element.type == "slider" then
            if element.name ~= "persistent_seekbar" then
                local slider_lo = element.layout.slider
                local elem_geo = element.layout.geometry
                local s_min = element.slider.min.value
                local s_max = element.slider.max.value

                draw_seekbar_nibbles(element, elem_ass)

                -- reset context so handle/progress render on top of nibbles
                elem_ass:draw_stop()
                elem_ass:merge(element.style_ass)
                ass_append_alpha(elem_ass, element.layout.alpha, 0, nil, anim_override)
                elem_ass:merge(element.static_ass)

                local handle_x, handle_radius, is_active = get_seekbar_handle_pos(element) -- get handle position/radius
                draw_seekbar_progress(element, elem_ass)
                draw_seekbar_ranges(element, elem_ass, handle_x, handle_radius)
                draw_ab_loop_range(element, elem_ass)
                draw_seekbar_handle(element, elem_ass, handle_x, handle_radius, anim_override, is_active) -- draw handle on top of progress

                elem_ass:draw_stop()

                if element.slider and element.slider.tooltipF ~= nil and element.enabled then
                    local force_seek_tooltip = user_opts.force_seek_tooltip
                        and element.name == "seekbar"
                        and element.eventresponder["mbtn_left_down"]
                        and element.state.mbtnleft
                        and state.mouse_down_counter > 0
                        and state.playing_and_seeking

                    if mouse_hit(element) or force_seek_tooltip then
                        local sliderpos = get_slider_value(element)
                        local tooltiplabel = element.slider.tooltipF(sliderpos)
                        local an = slider_lo.tooltip_an
                        local ty
                        if an == 2 then
                            local seekbar = state.seekbar_element
                            local ref_el = (element.name == "volumebar" and seekbar and seekbar.hitbox) and seekbar or element
                            local image_mode_offset = (ref_el == element) and 10 or 0
                            local anchor_offset = (ref_el == element) and (elem_geo.h / 2) or 0
                            ty = ref_el.hitbox.y1 + anchor_offset - user_opts.tooltip_height_offset - image_mode_offset
                        else
                            ty = element.hitbox.y1 + elem_geo.h / 2 - user_opts.tooltip_height_offset
                        end

                        local tx = get_virt_mouse_pos()
                        local osd_w = mp.get_property_number("osd-width")
                        local r_w, r_h = get_virt_scale_factor()

                        local tooltip_width = estimate_text_width(tooltiplabel, slider_lo.tooltip_style)

                        local chapter_text = nil
                        local chapter_width = 0

                        if osd_w and r_w > 0 then
                            -- Only attempt to fetch and measure chapter logic if this is the seekbar
                            if element.name == "seekbar" and user_opts.chapter_fmt ~= "no" then
                                local dur = state.duration or 0
                                if dur > 0 then
                                    local ch = get_chapter(sliderpos * dur / 100)
                                    if ch and ch.title and ch.title ~= "" then
                                        chapter_text = string.format(user_opts.chapter_fmt, ch.title)
                                        chapter_width = estimate_text_width(chapter_text, slider_lo.tooltip_style)
                                    end
                                end
                            end

                            -- Clamping layer ensures horizontal boundaries are strictly respected
                            if slider_lo.adjust_tooltip or (element.thumbnailable and not thumbfast.disabled) then
                                local max_text_width = math.max(tooltip_width, chapter_width)
                                local margin = 10 * r_w
                                local half_width = max_text_width / 2
                                local min_x = margin + half_width
                                local max_x = osc_param.playresx - margin - half_width
                                tx = math.min(max_x, math.max(min_x, tx))
                            end
                        end

                        if element.name == "seekbar" then
                            state.sliderpos = sliderpos
                        end

                        local tooltip_fs = user_opts.tooltip_font_size
                        local pad_v = 3
                        local gap = 5

                        -- Anchor above tooltip: ty (baseline) - fs (height) - pad_v (tooltip padding) - gap
                        local current_y = ty - tooltip_fs - pad_v - gap

                        -- Thumbfast logic
                        if element.thumbnailable and not thumbfast.disabled and osd_w then
                            local thumb_pad = user_opts.thumbnail_box_padding
                            local thumb_radius = user_opts.thumbnail_box_radius > 0 and user_opts.thumbnail_box_radius or 0

                            local hover_sec = 0
                            if state.duration then hover_sec = state.duration * sliderpos / 100 end

                            local margin_x = 18 / r_w
                            local thumb_x = math.min(osd_w - thumbfast.width - margin_x, math.max(margin_x, tx / r_w - thumbfast.width / 2))
                            thumb_x = math.floor(thumb_x + 0.5)

                            local thumb_y_px = current_y - (thumb_pad * r_h) - (thumbfast.height * r_h)

                            if state.anitype == nil then
                                elem_ass:new_event()
                                elem_ass:append("{\\rDefault}")
                                elem_ass:pos(thumb_x * r_w, thumb_y_px)
                                elem_ass:an(7)
                                elem_ass:append(osc_styles.thumbnail)
                                elem_ass:draw_start()
                                elem_ass:round_rect_cw(-thumb_pad * r_w, -thumb_pad * r_h, (thumbfast.width + thumb_pad) * r_w, (thumbfast.height + thumb_pad) * r_h, thumb_radius)
                                elem_ass:draw_stop()

                                mp.commandv("script-message-to", "thumbfast", "thumb", hover_sec, thumb_x, math.floor(thumb_y_px / r_h + 0.5))
                            end

                            -- Keep tooltips anchored to the thumbnail center even at window edges
                            tx = (thumb_x + thumbfast.width / 2) * r_w
                            an = 2

                            -- Advance anchor above the thumbnail
                            current_y = thumb_y_px - (thumb_pad * r_h) - gap
                        end

                        if chapter_text and r_w > 0 then
                            local chapter_y = current_y - pad_v
                            draw_tooltip(elem_ass, tx, chapter_y, chapter_width, slider_lo.tooltip_style, chapter_text, slider_lo.alpha)
                        end

                        draw_tooltip(elem_ass, tx, ty, tooltip_width, slider_lo.tooltip_style, tooltiplabel, slider_lo.alpha)
                    elseif element.thumbnailable and thumbfast.available then
                        mp.commandv("script-message-to", "thumbfast", "clear")
                    end
                end
            end
        elseif element.type == "button" then
            local buttontext
            if type(element.content) == "function" then
                buttontext = element.content() -- function objects
            elseif element.content ~= nil then
                buttontext = element.content -- text objects
            end

            -- add hover effects
            local button_lo = element.layout.button
            local is_clickable = element.eventresponder and (element.eventresponder["mbtn_left_down"] ~= nil or element.eventresponder["mbtn_left_up"] ~= nil)
            local hovered = mouse_hit(element) and is_clickable and element.enabled and state.mouse_down_counter == 0
            local hoverstyle = button_lo.hoverstyle
            if hovered and (hover_effects.size or hover_effects.color) then
                -- remove font scale tags for these elements, it looks out of place
                if element.name == "title" or element.name == "time_codes" or element.name == "chapter_title" or element.name == "cache_info" or element.name == "speed" then
                    hoverstyle = hoverstyle:gsub("\\fscx%d+\\fscy%d+", "")
                end
                elem_ass:append(hoverstyle .. buttontext)
            else
                elem_ass:append(buttontext)
            end

            -- apply blur effect if "glow" is in hover effects
            if hovered and hover_effects.glow then
                local shadow_ass = assdraw.ass_new()
                shadow_ass:merge(style_ass)
                shadow_ass:append("{\\blur" .. user_opts.button_glow_amount .. "}" .. hoverstyle .. buttontext)
                elem_ass:merge(shadow_ass)
            end

            -- add tooltip for button elements
            local seeking_with_force_tooltip = user_opts.force_seek_tooltip and state.mouse_down_counter > 0 and state.playing_and_seeking

            if element.tooltipF ~= nil and element.enabled and not seeking_with_force_tooltip and user_opts.tooltip_hints then
                local hb = element.hover_box
                if (hb and mouse_hit_coords(hb.x1, hb.y1, hb.x2, hb.y2) or mouse_hit(element)) then
                    local tooltiplabel

                    -- tooltip label
                    if element.enabled then
                        if type(element.tooltipF) == "function" then
                            tooltiplabel = element.tooltipF()
                        else
                            tooltiplabel = element.tooltipF
                        end
                    else
                        tooltiplabel = element.nothingavailable
                    end

                    local tx = hb and (hb.x1 + hb.x2) / 2 or (element.hitbox.x1 + element.hitbox.x2) / 2
                    local seekbar_ref = (state.seekbar_element and state.seekbar_element.hitbox) and state.seekbar_element or element
                    local image_mode_offset = (seekbar_ref == element) and 10 or 0
                    local ty = seekbar_ref.hitbox.y1 - user_opts.tooltip_height_offset - image_mode_offset

                    local osd_w = mp.get_property_number("osd-width")
                    local r_w = get_virt_scale_factor()
                    local tooltip_width = estimate_text_width(tooltiplabel, element.tooltip_style)
                    if osd_w and r_w > 0 then
                        local margin = 10 * r_w
                        tx = math.min(osc_param.playresx - margin - tooltip_width / 2, math.max(margin + tooltip_width / 2, tx))
                    end

                    if tooltiplabel then
                        draw_tooltip(elem_ass, tx, ty, tooltip_width, element.tooltip_style, bidi.fsi .. tooltiplabel .. bidi.pdi)
                    end
                end
            end
        end

        master_ass:merge(elem_ass)
    end

    for n = 1, #elements do render_element(n) end
end

local function render_persistent_progress(master_ass)
    local element = state.persistent_seekbar_element
    if not element or not element.layout then return end
    local style_ass = assdraw.ass_new()
    style_ass:merge(element.style_ass)
    if state.animation or not state.osc_visible then
        ass_append_alpha(style_ass, element.layout.alpha, 0, true)

        local elem_ass = assdraw.ass_new()
        elem_ass:merge(style_ass)
        elem_ass:merge(element.static_ass)

        -- draw pos marker
        local pos = element.slider.posF and element.slider.posF()
        local xp = pos and get_slider_ele_pos_for(element, pos) or 0

        draw_seekbar_progress(element, elem_ass)

        if user_opts.persistent_buffer then
            draw_seekbar_ranges(element, elem_ass, xp, 0, nil, true)
        end

        elem_ass:draw_stop()
        master_ass:merge(elem_ass)
    end
end

--
-- Initialisation and Layout
--
local function is_image()
    local t = mp.get_property_native("current-tracks/video")
    state.is_image = t ~= nil and t.image == true and t.albumart ~= true
end

local function get_ytdl_format()
    local fmt = mp.get_property("file-local-options/ytdl-format") or mp.get_property("ytdl-format") or ""
    return fmt ~= "" and ("-f " .. fmt) or "-f bestvideo+bestaudio/best"
end

local function exec(args, callback)
    for i = #args, 1, -1 do
        if args[i] == nil or args[i] == "" then table.remove(args, i) end
    end
    msg.info("Executing: " .. table.concat(args, " "))
    mp.command_native_async({
        name = "subprocess",
        args = args,
        capture_stdout = true,
        capture_stderr = true
    }, callback)
end

local function check_path_url()
    state.is_url = false
    state.downloading = false

    local path = mp.get_property("path")
    if not path then return end

    -- normalize ytdl:// prefix: ytdl://https://... > https://..., ytdl://... > https://...
    path = path:gsub("^ytdl://https?://", "https://"):gsub("^ytdl://", "https://")

    local scheme = path:match("^([%w][%w+%-%.]*)://")
    local online_schemes = {
        http=true, https=true,
        ftp=true, ftps=true,
        rtmp=true, rtmps=true,
        rtsp=true, rtsps=true,
        mms=true, mmsh=true, mmst=true,
    }

    if scheme and online_schemes[scheme:lower()] then
        state.is_url = true
        state.url_path = path
        msg.info("URL detected.")

        if user_opts.download_button then
            msg.info("Approximating file size...")
            state.file_size_normalized = "Approximating file size..."
            exec({
                "yt-dlp",
                state.is_image and "" or get_ytdl_format(),
                "--no-download",
                "-O", "%(filesize,filesize_approx)s",
                path
            }, function(_, result)
                local bytes = tonumber(result.stdout)
                if bytes then
                    state.file_size_normalized = utils.format_bytes_humanized(bytes)
                    msg.info("Download size: " .. state.file_size_normalized)
                else
                    local fs_prop = mp.get_property_osd("file-size")
                    if fs_prop and fs_prop ~= "" then
                        state.file_size_normalized = fs_prop
                        msg.info("Download size: " .. fs_prop)
                    else
                        state.file_size_normalized = "Unknown"
                        msg.info("Unable to retrieve file size.")
                    end
                end
                request_tick()
            end)
        end
    end
end

local function download_done(success, _, error)
    if success then
        local path = mp.command_native({"expand-path", user_opts.download_path})
        mp.commandv("show-text", "Download saved to " .. path, "-1", "1")
        state.downloaded_once = true
        msg.info("Download completed")
    else
        mp.commandv("show-text", "Download failed - " .. (error or "Unknown error"), "-1", "1")
        msg.info("Download failed")
    end
    state.downloading = false
end

local function new_element(name, type)
    elements[name] = {}
    elements[name].type = type
    elements[name].name = name

    -- add default stuff
    elements[name].eventresponder = {}
    elements[name].visible = true
    elements[name].enabled = true
    elements[name].softrepeat = false
    elements[name].styledown = (type == "button")
    elements[name].state = {}

    if type == "button" then
        elements[name].tooltip_style = osc_styles.tooltip
    elseif type == "slider" then
        elements[name].slider = {min = {value = 0}, max = {value = 100}}
        elements[name].thumbnailable = false
    end

    return elements[name]
end

local function add_layout(name)
    if elements[name] ~= nil then
        -- new layout
        elements[name].layout = {}

        -- set layout defaults
        elements[name].layout.layer = 50
        elements[name].layout.alpha = {[1] = 0, [2] = 255, [3] = 255, [4] = 255}
        elements[name].layout.group = "bottom"

        if elements[name].type == "button" then
            elements[name].layout.button = {
                hoverstyle = osc_styles.element_hover,
            }
        elseif elements[name].type == "slider" then
            -- slider defaults
            elements[name].layout.slider = {
                border = 1,
                gap = 1,
                radius = 0,
                nibbles_top = user_opts.nibbles_top,
                nibbles_bottom = user_opts.nibbles_bottom,
                nibbles_style = user_opts.nibbles_style,
                adjust_tooltip = true,
                tooltip_style = osc_styles.tooltip,
                tooltip_an = 2,
                alpha = {[1] = 0, [2] = 255, [3] = 88, [4] = 255},
                hoverstyle = osc_styles.element_hover:gsub("\\fscx%d+\\fscy%d+", ""), -- font scales messes with handle positions in werid ways
            }
        elseif elements[name].type == "box" then
            elements[name].layout.box = {radius = 0, hexagon = false}
        end

        return elements[name].layout
    else
        msg.error("Can't add_layout to element '"..name.."', doesn't exist.")
    end
end

-- Window Controls
local function window_controls()
    local wc_geo = {
        x = 0,
        y = 50,
        an = 1,
        w = osc_param.playresx,
        h = 50,
    }

    local lo
    local ontop_active = user_opts.ontop_button and window_controls_enabled() and user_opts.ontop_in_topbar and state.ontop
    local controlbox_w = (user_opts.window_controls and window_control_box_width or 0)
    local controlbox_left = wc_geo.w - controlbox_w
    local titlebox_left = ontop_active and 50 or wc_geo.x
    local button_y = wc_geo.y - (wc_geo.h / 2)
    local first_geo  = {x = controlbox_left + 25,  y = button_y, an = 5, w = 50, h = wc_geo.h}
    local second_geo = {x = controlbox_left + 75, y = button_y, an = 5, w = 49, h = wc_geo.h}
    local third_geo  = {x = controlbox_left + 125, y = button_y, an = 5, w = 50, h = wc_geo.h}

    -- Window controls
    if user_opts.window_controls then
        local size_hover = hover_effects.size and
            string.format("\\fscx%s\\fscy%s", user_opts.button_hover_size, user_opts.button_hover_size) or ""
        local function wc_hoverstyle(color)
            return "{\\c&H" .. osc_color_convert(color) .. "&" .. size_hover .. "}"
        end

        local function wc_button(name, geom, hover_color)
            lo = add_layout(name)
            lo.geometry = geom
            lo.style = osc_styles.window_control
            lo.group = "top"
            lo.button.hoverstyle = wc_hoverstyle(hover_color)
        end

        wc_button("close", third_geo, user_opts.windowcontrols_close_hover) -- Close: 🗙
        wc_button("maximize", second_geo, user_opts.windowcontrols_max_hover) -- Maximize: 🗖/🗗
        wc_button("minimize", first_geo, user_opts.windowcontrols_min_hover) -- Minimize: 🗕
    end

    -- ontop button in top bar when ontop is active
    if ontop_active then
        elements["ontop"].visible = osc_param.playresx >= controlbox_w + 35
        elements["ontop"].hover_radius = 0
        elements["ontop"].hover_pad = 0
        lo = add_layout("ontop")
        lo.geometry = {x = 25, y = button_y, an = 5, w = 50, h = wc_geo.h}
        lo.style = osc_styles.window_control
        lo.group = "top"
        lo.button.hoverstyle = osc_styles.element_hover
    end

    -- Window Title
    if user_opts.show_window_title then
        lo = add_layout("windowtitle")
        lo.geometry = {x = math.max(20, titlebox_left + 4), y = button_y + 14, an = 1, w = osc_param.playresx - 50, h = wc_geo.h}
        lo.group = "top"
        lo.alpha[3] = 0
        lo.style = string.format("%s{\\clip(%f,%f,%f,%f)}", osc_styles.window_title, titlebox_left, wc_geo.y - wc_geo.h, controlbox_left, wc_geo.y + wc_geo.h)
        state.windowtitle_max_w = controlbox_left - math.max(20, titlebox_left + 4)
    end

    -- only add top areas and margin if one of the elements is enabled
    if (user_opts.show_window_title or user_opts.window_controls or ontop_active) then
        -- deadzone below window controls
        local sh_area_y1 = wc_geo.y + get_align(1 - (2 * user_opts.deadzonesize), osc_param.playresy - wc_geo.y, 0, 0)
        add_area("showhide_wc", wc_geo.x, 0, wc_geo.w, sh_area_y1)
        add_area("window-controls", get_hitbox_coords(controlbox_left, wc_geo.y, wc_geo.an, controlbox_w, wc_geo.h))
        if ontop_active then add_area("window-controls-ontop", 0, 0, 50, wc_geo.h) end
        add_area("window-controls-title", titlebox_left, 0, controlbox_left, wc_geo.h)
        -- top bar margins
        osc_param.video_margins.t = wc_geo.h / osc_param.playresy
    end
end

--
-- ModernZ Layouts
--

local layouts = {}

-- create the OSC fade background box and window bar alpha box
local function setup_bg_elements(posX, posY, osc_w, osc_h, osc_alpha3, wc_alpha3)
    new_element("osc_fade_bg", "box")
    local lo = add_layout("osc_fade_bg")
    lo.geometry = {x = posX, y = posY, an = 7, w = osc_w, h = osc_h}
    lo.style = osc_styles.osc_fade_bg
    lo.layer = 10
    lo.alpha[3] = osc_alpha3

    if window_controls_enabled() and (user_opts.show_window_title or user_opts.window_controls) then
        new_element("window_bar_alpha_bg", "box")
        lo = add_layout("window_bar_alpha_bg")
        lo.geometry = {x = posX, y = -100, an = 7, w = osc_w, h = -1}
        lo.style = osc_styles.window_fade_bg
        lo.layer = 10
        lo.group = "top"
        lo.alpha[3] = wc_alpha3
    end
end

-- Default layout
layouts["default"] = function ()
    local no_title = not user_opts.show_title
    local no_chapter = not user_opts.show_chapter_title
    local chapter_index = user_opts.show_chapter_title and (state.chapter or -1) >= 0
    local chapter_h = (no_chapter or not chapter_index) and 0 or user_opts.chapter_title_font_size
    local chapter_offset = (no_chapter or not chapter_index) and 0 or user_opts.chapter_title_offset
    chapter_offset = user_opts.chapter_above_title and user_opts.chapter_above_title_offset or chapter_offset
    local title_h = no_title and 0 or user_opts.title_font_size
    local title_offset = (no_chapter or not chapter_index or user_opts.chapter_above_title) and user_opts.title_offset or user_opts.title_with_chapter_offset
    title_offset = no_title and 0 or title_offset
    local title_and_chapter_h_with_offset = chapter_h + chapter_offset + title_h + title_offset

    if title_and_chapter_h_with_offset == 0 then
        -- add some top padding if both title and chapter aren't displayed
        local ch_skip = user_opts.chapter_skip_buttons and type(state.chapter_list) == "table" and next(state.chapter_list)
        local outer = (ch_skip and 0 or 100) + (user_opts.jump_buttons and 0 or 100)
        local timecodes_above = osc_param.playresx < (user_opts.portrait_window_trigger - outer
            - (user_opts.playlist_button and (not user_opts.hide_empty_playlist_button or state.playlist_count > 1) and 0 or 100)
            - (state.sub_track_count > 0 and 0 or 100)
            - (state.audio_track_count > 0 and 0 or 100))
        title_and_chapter_h_with_offset = timecodes_above
            and math.max(user_opts.osc_height * 0.2, user_opts.time_codes_offset + user_opts.title_offset + user_opts.time_font_size)
            or user_opts.osc_height * 0.2
    end

    local osc_geo = {
        w = osc_param.playresx,
        h = user_opts.osc_height + title_and_chapter_h_with_offset
    }

    -- update bottom margin
    osc_param.video_margins.b = osc_geo.h / osc_param.playresy

    -- origin of the controllers, left/bottom corner
    local posX = 0
    local posY = osc_param.playresy

    osc_param.areas = {} -- delete areas

    -- area for active mouse input
    add_area("input", get_hitbox_coords(posX, posY, 1, osc_geo.w, osc_geo.h))

    -- area for show/hide
    local osc_top = posY - osc_geo.h
    add_area("showhide", 0, get_align(-1 + (2 * user_opts.deadzonesize), osc_top, 0, 0), osc_param.playresx, osc_param.playresy)

    -- fetch values
    local osc_w = osc_geo.w
    local lo, geo, ne

    -- osc background
    setup_bg_elements(posX, posY, osc_w, osc_geo.h, user_opts.fade_transparency_strength, user_opts.window_fade_transparency_strength)

    local refX = osc_w / 2
    local refY = posY

    -- seekbar
    ne = new_element("seekbarbg", "box")
    ne.visible = user_opts.nibbles_style ~= "gap"
    lo = add_layout("seekbarbg")
    local seekbar_bg_h = seekbar_height_style.height
    lo.geometry = {x = refX, y = refY - user_opts.osc_height, an = 5, w = osc_geo.w - 30, h = seekbar_bg_h}
    lo.layer = 15
    lo.style = osc_styles.seekbar_bg
    lo.box.radius = user_opts.slider_rounded_corners and seekbar_height_style.radius or 0
    lo.alpha[1] = 128

    lo = add_layout("seekbar")
    local seekbar_h = 18
    lo.geometry = {x = refX, y = refY - user_opts.osc_height, an = 5, w = osc_geo.w - 30, h = seekbar_h}
    lo.layer = 49
    lo.style = osc_styles.seekbar_fg
    lo.slider.handle_color = user_opts.seek_handle_color
    lo.slider.handle_border = user_opts.seek_handle_border_color
    lo.slider.gap = (seekbar_h - seekbar_bg_h) / 2.0
    lo.slider.radius = user_opts.slider_rounded_corners and seekbar_height_style.radius or 0
    lo.slider.tooltip_an = 2

    if user_opts.persistent_progress or state.persistent_progress_toggle then
        lo = add_layout("persistent_seekbar")
        lo.geometry = {x = refX, y = refY, an = 5, w = osc_geo.w, h = user_opts.persistent_progress_height}
        lo.style = osc_styles.seekbar_fg
        lo.slider.gap = (seekbar_h - seekbar_bg_h) / 2.0
        lo.slider.tooltip_an = 0
    end

    local audio_track = state.audio_track_count > 0
    local subtitle_track = state.sub_track_count > 0
    local chapter_skip_buttons = user_opts.chapter_skip_buttons and type(state.chapter_list) == "table" and next(state.chapter_list)
    local ontop_button = user_opts.ontop_button and not (window_controls_enabled() and user_opts.ontop_in_topbar and state.ontop)
    local playlist_button = user_opts.playlist_button and (not user_opts.hide_empty_playlist_button or state.playlist_count > 1)

    local offset = user_opts.jump_buttons and 60 or 0
    local outeroffset = (chapter_skip_buttons and 0 or 100) + (user_opts.jump_buttons and 0 or 100)
    local narrow_win = osc_param.playresx < (
        user_opts.portrait_window_trigger
        - outeroffset
        - (playlist_button and 0 or 100)
        - (subtitle_track and 0 or 100)
        - (audio_track and 0 or 100)
    )

    local time_codes_width = get_time_codes_width()
    local chapter_title_y, title_y
    if user_opts.chapter_above_title then
        title_y = user_opts.osc_height + title_offset
        chapter_title_y = title_y + title_h + chapter_offset
    else
        chapter_title_y = user_opts.osc_height + chapter_offset
        title_y = (no_chapter or not chapter_index) and (user_opts.osc_height + title_offset) or (chapter_title_y + chapter_h + user_opts.title_with_chapter_offset)
    end

    -- osc title
    local title_w = (no_chapter or not chapter_index or user_opts.chapter_above_title) and (osc_geo.w - 60 - time_codes_width) or (osc_geo.w - 50)
    state.title_max_w = title_w
    if title_w < 0 then title_w = 0 end
    elements["title"].visible = not no_title
    geo = {x = 25, y = refY - title_y, an = 1, w = title_w, h = user_opts.title_font_size}
    lo = add_layout("title")
    lo.geometry = geo
    lo.layer = 48
    lo.alpha[3] = 0
    lo.style = string.format("%s{\\clip(%f,%f,%f,%f)}", osc_styles.title, 0, 0, geo.x + geo.w, geo.y + geo.h)

    -- chapter title
    if user_opts.show_chapter_title then
        elements["chapter_title"].visible = not no_chapter and chapter_index
        local chapter_title_w = narrow_win and (osc_geo.w - time_codes_width - 60) or (osc_geo.w - 60)
        geo = {x = 26, y = refY - chapter_title_y, an = 1, w = chapter_title_w, h = user_opts.chapter_title_font_size}
        lo = add_layout("chapter_title")
        lo.geometry = geo
        lo.layer = 48
        lo.alpha[3] = 0
        lo.style = string.format("%s{\\clip(%f,%f,%f,%f)}", osc_styles.chapter_title, 0, 0, geo.x + geo.w, geo.y + geo.h)
        state.chapter_title_max_w = geo.w
    end

    -- left side buttons
    local start_x = 37
    local function left_side_button(name, min_w, w, step)
        local vis = osc_param.playresx >= min_w
        elements[name].visible = vis
        if vis then
            lo = add_layout(name)
            lo.geometry = {x = start_x, y = refY - (user_opts.osc_height / 2), an = 5, w = w or 24, h = 24}
            lo.style = osc_styles.control_3
            start_x = start_x + (step or 45)
        end
    end

    if playlist_button then left_side_button("playlist", 550) end
    if audio_track and user_opts.audio_tracks_button then left_side_button("audio_track", 650) end
    if subtitle_track and user_opts.subtitles_button then left_side_button("sub_track", 750) end

    if audio_track and user_opts.volume_control then
        -- volume button
        left_side_button("vol_ctrl", 850)
        start_x = start_x - 25 -- vol_ctrl uses a narrower step (+20 not +45)

        -- volume bar
        local vol_vis = (osc_param.playresx >= user_opts.hide_volume_bar_trigger - outeroffset)
        ne = new_element("volumebarbg", "box")
        ne.visible = vol_vis
        lo = add_layout("volumebarbg")
        lo.geometry = {x = start_x, y = refY - (user_opts.osc_height / 2), an = 4, w = 55, h = 4}
        lo.layer = 15
        lo.alpha[1] = 128
        lo.style = user_opts.volumebar_match_seek_color and osc_styles.seekbar_bg or osc_styles.volumebar_bg
        lo.box.radius = user_opts.slider_rounded_corners and 2 or 0

        elements["volumebar"].visible = vol_vis
        lo = add_layout("volumebar")
        lo.geometry = {x = start_x, y = refY - (user_opts.osc_height / 2), an = 4, w = 55, h = 10}
        lo.style = user_opts.volumebar_match_seek_color and osc_styles.seekbar_fg or osc_styles.volumebar_fg
        lo.slider.handle_color = user_opts.volumebar_match_seek_color and user_opts.seekbarfg_color or user_opts.side_buttons_color
        lo.slider.gap = 3
        lo.slider.radius = user_opts.slider_rounded_corners and 2 or 0
        lo.slider.tooltip_an = 2
        start_x = start_x + 75
        -- vol_ctrl center = bar_start - 20; bar_start = start_x - 75; left edge = center - 12
        local vc_left = start_x - 107
        local osc_mid = refY - (user_opts.osc_height / 2)
        elements["vol_ctrl"].hover_box = vol_vis and {x1 = vc_left, y1 = osc_mid - 12, x2 = vc_left + 87, y2 = osc_mid + 12} or nil
    end

    -- time codes
    local auto_hide_volbar = (audio_track and user_opts.volume_control) and osc_param.playresx < (user_opts.hide_volume_bar_trigger - outeroffset)
    local time_codes_x = start_x
        - (auto_hide_volbar and 67 or 0) -- window width with audio track and elements
        - (audio_track and not user_opts.volume_control and 12 or 0) -- audio track with no elements
        - (not audio_track and 12 or 0) -- remove excess space
    local time_codes_y = user_opts.time_codes_offset + (user_opts.osc_height / 2)
    if narrow_win then
        -- try to vertically align time codes to the baseline of title/chapter
        if not user_opts.show_title and not user_opts.show_chapter_title then
            time_codes_y = user_opts.time_codes_offset + user_opts.osc_height + user_opts.title_offset
        elseif no_chapter or not chapter_index or user_opts.chapter_above_title then
            time_codes_y = title_y + ((title_h - user_opts.time_font_size) * 0.25)
        else
            time_codes_y = chapter_title_y
            if chapter_h ~= user_opts.time_font_size then
                time_codes_y = time_codes_y - ((user_opts.time_font_size - chapter_h) * 0.25)
            end
        end
    end
    elements["time_codes"].visible = (state.duration or 0) > 0
    lo = add_layout("time_codes")
    lo.geometry = {x = (narrow_win and (osc_geo.w - 25) or time_codes_x), y = refY - time_codes_y, an = (narrow_win and 3 or 4), w = time_codes_width, h = user_opts.time_font_size}
    lo.layer = 48
    lo.alpha[3] = 0
    lo.style = osc_styles.time

    -- center buttons
    if user_opts.track_nextprev_buttons then
        elements["playlist_prev"].visible = (state.playlist_count > 1 or contains(user_opts.buttons_always_active, "playlist_prev")) and (osc_param.playresx >= 500 - outeroffset)
        lo = add_layout("playlist_prev")
        lo.geometry = {x = refX - (60 + (chapter_skip_buttons and 60 or 0)) - offset, y = refY - (user_opts.osc_height / 2), an = 5, w = 30, h = 24}
        lo.style = osc_styles.control_2
    end

    if chapter_skip_buttons then
        elements["chapter_prev"].visible = osc_param.playresx >= 400 - outeroffset
        lo = add_layout("chapter_prev")
        lo.geometry = {x = refX - 60 - offset, y = refY - (user_opts.osc_height / 2), an = 5, w = 30, h = 24}
        lo.style = osc_styles.control_2
    end

    if user_opts.jump_buttons then
        lo = add_layout("jump_backward")
        lo.geometry = {x = refX - 60, y = refY - (user_opts.osc_height / 2), an = 5, w = 30, h = 24}
        lo.style = osc_styles.control_2
    end

    lo = add_layout("play_pause")
    lo.geometry = {x = refX, y = refY - (user_opts.osc_height / 2), an = 5, w = 45, h = 28}
    lo.style = osc_styles.control_1

    if user_opts.jump_buttons then
        lo = add_layout("jump_forward")
        lo.geometry = {x = refX + 60, y = refY - (user_opts.osc_height / 2), an = 5, w = 30, h = 24}
        lo.style = osc_styles.control_2
    end

    if chapter_skip_buttons then
        elements["chapter_next"].visible = osc_param.playresx >= 400 - outeroffset
        lo = add_layout("chapter_next")
        lo.geometry = {x = refX + 60 + offset, y = refY - (user_opts.osc_height / 2), an = 5, w = 30, h = 24}
        lo.style = osc_styles.control_2
    end

    if user_opts.track_nextprev_buttons then
        elements["playlist_next"].visible = (state.playlist_count > 1 or contains(user_opts.buttons_always_active, "playlist_next")) and (osc_param.playresx >= 500 - outeroffset)
        lo = add_layout("playlist_next")
        lo.geometry = {x = refX + (60 + (chapter_skip_buttons and 60 or 0)) + offset, y = refY - (user_opts.osc_height / 2), an = 5, w = 30, h = 24}
        lo.style = osc_styles.control_2
    end

    -- right side buttons
    local end_x = osc_geo.w - 37
    local function right_side_button(name, min_w, vis_extra, style, w)
        local vis = (osc_param.playresx >= min_w - outeroffset) and (vis_extra == nil or vis_extra)
        elements[name].visible = vis
        if vis then
            lo = add_layout(name)
            lo.geometry = {x = end_x, y = refY - (user_opts.osc_height / 2), an = 5, w = (w or 24), h = 24}
            lo.style = style or osc_styles.control_3
            end_x = end_x - 45
        end
    end

    right_side_button("fullscreen", 550, user_opts.fullscreen_button)
    right_side_button("info", 650, user_opts.info_button)
    right_side_button("ontop", 750, user_opts.ontop_button and not (window_controls_enabled() and user_opts.ontop_in_topbar and state.ontop))
    right_side_button("screenshot", 850, user_opts.screenshot_button)
    right_side_button("file_loop", 950, user_opts.loop_button)
    right_side_button("shuffle", 1050, user_opts.shuffle_button)
    right_side_button("speed", 1150, user_opts.speed_button, osc_styles.speed, 42)
    right_side_button("download", 1150, state.is_url and user_opts.download_button)

    if user_opts.cache_info then
        right_side_button("cache_info", 1250, user_opts.cache_info, osc_styles.cache, user_opts.cache_info_speed and 70 or 45)
        lo.geometry.x  = lo.geometry.x + 7
        lo.geometry.an = 6
        lo.alpha[3] = 0
    end
end

layouts["compact"] = function ()
    local chapter_index = (state.chapter or -1) >= 0
    local no_title = not user_opts.show_title
    local no_chapter = not user_opts.show_chapter_title
    local chapter_h = (no_chapter or not chapter_index) and 0 or user_opts.chapter_title_font_size
    local chapter_offset = (no_chapter or not chapter_index) and 0 or user_opts.chapter_title_offset
    chapter_offset = user_opts.chapter_above_title and user_opts.chapter_above_title_offset or chapter_offset
    local title_h = no_title and 0 or user_opts.title_font_size
    local title_offset = (no_chapter or not chapter_index or user_opts.chapter_above_title) and user_opts.title_offset or user_opts.title_with_chapter_offset
    title_offset = no_title and 0 or title_offset
    local title_and_chapter_h_with_offset = chapter_h + chapter_offset + title_h + title_offset

    if title_and_chapter_h_with_offset == 0 then
        -- add some top padding if both title and chapter aren't displayed
        title_and_chapter_h_with_offset = user_opts.osc_height * 0.2
    end

    local osc_geo = {
        w = osc_param.playresx,
        h = user_opts.osc_height + title_and_chapter_h_with_offset
    }

    -- update bottom margin
    osc_param.video_margins.b = osc_geo.h / osc_param.playresy

    -- origin of the controllers, left/bottom corner
    local posX = 0
    local posY = osc_param.playresy

    osc_param.areas = {} -- delete areas

    -- area for active mouse input
    add_area("input", get_hitbox_coords(posX, posY, 1, osc_geo.w, osc_geo.h))

    -- area for show/hide
    local osc_top = posY - osc_geo.h
    add_area("showhide", 0, get_align(-1 + (2 * user_opts.deadzonesize), osc_top, 0, 0), osc_param.playresx, osc_param.playresy)

    -- fetch values
    local osc_w = osc_geo.w
    local lo, geo, ne
    -- osc background
    setup_bg_elements(posX, posY, osc_w, osc_geo.h, user_opts.fade_transparency_strength, user_opts.window_fade_transparency_strength)

    local refX = osc_w / 2
    local refY = posY

    -- seekbar
    ne = new_element("seekbarbg", "box")
    ne.visible = user_opts.nibbles_style ~= "gap"
    lo = add_layout("seekbarbg")
    local seekbar_bg_h = seekbar_height_style.height
    lo.geometry = {x = refX, y = refY - user_opts.osc_height, an = 5, w = osc_geo.w - 30, h = seekbar_bg_h}
    lo.layer = 15
    lo.style = osc_styles.seekbar_bg
    lo.box.radius = user_opts.slider_rounded_corners and seekbar_height_style.radius or 0
    lo.alpha[1] = 128

    lo = add_layout("seekbar")
    local seekbar_h = 18
    lo.geometry = {x = refX, y = refY - user_opts.osc_height, an = 5, w = osc_geo.w - 30, h = seekbar_h}
    lo.layer = 49
    lo.style = osc_styles.seekbar_fg
    lo.slider.handle_color = user_opts.seek_handle_color
    lo.slider.handle_border = user_opts.seek_handle_border_color
    lo.slider.gap = (seekbar_h - seekbar_bg_h) / 2.0
    lo.slider.radius = user_opts.slider_rounded_corners and seekbar_height_style.radius or 0
    lo.slider.tooltip_an = 2

    if user_opts.persistent_progress or state.persistent_progress_toggle then
        lo = add_layout("persistent_seekbar")
        lo.geometry = {x = refX, y = refY, an = 5, w = osc_geo.w, h = user_opts.persistent_progress_height}
        lo.style = osc_styles.seekbar_fg
        lo.slider.gap = (seekbar_h - seekbar_bg_h) / 2.0
        lo.slider.tooltip_an = 0
    end

    local time_codes_width = get_time_codes_width()
    local chapter_title_y, title_y
    if user_opts.chapter_above_title then
        title_y = user_opts.osc_height + title_offset
        chapter_title_y = title_y + title_h + chapter_offset
    else
        chapter_title_y = user_opts.osc_height + chapter_offset
        title_y = (no_chapter or not chapter_index) and (user_opts.osc_height + title_offset) or (chapter_title_y + chapter_h + user_opts.title_with_chapter_offset)
    end

    -- osc title
    local title_w = osc_geo.w - 50
    state.title_max_w = title_w
    if title_w < 0 then title_w = 0 end
    elements["title"].visible = not no_title
    geo = {x = 25, y = refY - title_y, an = 1, w = title_w, h = user_opts.title_font_size}
    lo = add_layout("title")
    lo.geometry = geo
    lo.layer = 48
    lo.alpha[3] = 0
    lo.style = string.format("%s{\\clip(%f,%f,%f,%f)}", osc_styles.title, 0, 0, geo.x + geo.w, geo.y + geo.h)

    -- chapter title
    if user_opts.show_chapter_title then
        elements["chapter_title"].visible = not no_chapter and chapter_index
        geo = {x = 25, y = refY - chapter_title_y, an = 1, w = osc_geo.w - 60, h = user_opts.chapter_title_font_size}
        lo = add_layout("chapter_title")
        lo.geometry = geo
        lo.layer = 48
        lo.alpha[3] = 0
        lo.style = string.format("%s{\\clip(%f,%f,%f,%f)}", osc_styles.chapter_title, 0, 0, geo.x + geo.w, geo.y + geo.h)
        state.chapter_title_max_w = geo.w
    end

    -- left side buttons
    local start_x = 37
    local function left_side_button(name, min_w, w, step)
        local vis = osc_param.playresx >= min_w
        elements[name].visible = vis
        if vis then
            lo = add_layout(name)
            lo.geometry = {x = start_x, y = refY - (user_opts.osc_height / 2), an = 5, w = w or 24, h = 24}
            lo.style = osc_styles.control_2
            start_x = start_x + (step or 45)
        end
    end

    elements["play_pause"].visible = osc_param.playresx >= 200
    lo = add_layout("play_pause")
    lo.geometry = {x = start_x, y = refY - (user_opts.osc_height / 2), an = 5, w = 24, h = 24}
    lo.style = osc_styles.control_2
    start_x = start_x + 45

    local pl_count = state.playlist_count
    local pl_pos = state.playlist_pos_1

    if user_opts.track_nextprev_buttons then
        local prev_vis = pl_pos > 1 and osc_param.playresx >= 550
        elements["playlist_prev"].visible = prev_vis
        if prev_vis then
            lo = add_layout("playlist_prev")
            lo.geometry = {x = start_x, y = refY - (user_opts.osc_height / 2), an = 5, w = 24, h = 24}
            lo.style = osc_styles.control_2
            start_x = start_x + 45
        end

        local next_vis = pl_pos < pl_count and osc_param.playresx >= 550
        elements["playlist_next"].visible = next_vis
        if next_vis then
            lo = add_layout("playlist_next")
            lo.geometry = {x = start_x, y = refY - (user_opts.osc_height / 2), an = 5, w = 24, h = 24}
            lo.style = osc_styles.control_2
            start_x = start_x + 45
        end
    end

    if user_opts.jump_buttons then
        left_side_button("jump_backward", 700, 30)
        left_side_button("jump_forward", 700, 30)
    end

    if state.audio_track_count > 0 and user_opts.volume_control then
        left_side_button("vol_ctrl", 800, nil, 20)

        local vol_vis = osc_param.playresx >= 900
        ne = new_element("volumebarbg", "box")
        ne.visible = vol_vis
        elements["volumebar"].visible = vol_vis
        if vol_vis then
            lo = add_layout("volumebarbg")
            lo.geometry = {x = start_x, y = refY - (user_opts.osc_height / 2), an = 4, w = 55, h = 4}
            lo.layer = 15
            lo.alpha[1] = 128
            lo.style = user_opts.volumebar_match_seek_color and osc_styles.seekbar_bg or osc_styles.volumebar_bg
            lo.box.radius = user_opts.slider_rounded_corners and 2 or 0

            lo = add_layout("volumebar")
            lo.geometry = {x = start_x, y = refY - (user_opts.osc_height / 2), an = 4, w = 55, h = 10}
            lo.style = user_opts.volumebar_match_seek_color and osc_styles.seekbar_fg or osc_styles.volumebar_fg
            lo.slider.handle_color = user_opts.volumebar_match_seek_color and user_opts.seekbarfg_color or user_opts.side_buttons_color
            lo.slider.gap = 3
            lo.slider.radius = user_opts.slider_rounded_corners and 2 or 0
            lo.slider.tooltip_an = 2
            start_x = start_x + 75
            -- vol_ctrl center = bar_start - 20; bar_start = start_x - 75; left edge = center - 12
            local vc_left = start_x - 107
            local osc_mid = refY - (user_opts.osc_height / 2)
            elements["vol_ctrl"].hover_box = {x1 = vc_left, y1 = osc_mid - 12, x2 = vc_left + 87, y2 = osc_mid + 12}
        else
            elements["vol_ctrl"].hover_box = nil
        end
    end

    -- right side buttons
    local end_x = osc_geo.w - 37
    local function right_side_button(name, min_w, vis_extra, style, w)
        local vis = (osc_param.playresx >= min_w) and (vis_extra == nil or vis_extra)
        elements[name].visible = vis
        if vis then
            lo = add_layout(name)
            lo.geometry = {x = end_x, y = refY - (user_opts.osc_height / 2), an = 5, w = (w or 24), h = 24}
            lo.style = style or osc_styles.control_2
            end_x = end_x - 45
        end
    end

    right_side_button("fullscreen", 300, user_opts.fullscreen_button)
    right_side_button("ontop", 400, user_opts.ontop_button and not (window_controls_enabled() and user_opts.ontop_in_topbar and state.ontop))
    right_side_button("sub_track", 500, user_opts.subtitles_button and state.sub_track_count > 0)
    right_side_button("audio_track", 600, user_opts.audio_tracks_button and state.audio_track_count > 0)
    right_side_button("playlist", 300, user_opts.playlist_button)
    right_side_button("download", 800, state.is_url and user_opts.download_button)
    right_side_button("speed", 800, user_opts.speed_button, osc_styles.speed, 42)

    -- time codes
    local time_codes_width = get_time_codes_width()
    elements["time_codes"].visible = (state.duration or 0) > 0
    lo = add_layout("time_codes")
    lo.geometry = {x = end_x + 20, y = refY - (user_opts.osc_height / 2), an = 6, w = time_codes_width, h = 20}
    lo.layer = 48
    lo.alpha[3] = 0
    lo.style = osc_styles.time
end

layouts["mini"] = function ()
    local osc_height = 30
    local first_row_y = 25
    local second_row_y = 25
    local osc_offset = first_row_y + second_row_y

    local osc_geo = {
        w = osc_param.playresx,
        h = osc_height + osc_offset
    }

    -- update bottom margin
    osc_param.video_margins.b = osc_geo.h / osc_param.playresy

    -- origin of the controllers, left/bottom corner
    local posX = 0
    local posY = osc_param.playresy

    osc_param.areas = {} -- delete areas

    -- area for active mouse input
    add_area("input", get_hitbox_coords(posX, posY, 1, osc_geo.w, osc_geo.h))

    -- area for show/hide
    local osc_top = posY - osc_geo.h
    add_area("showhide", 0, get_align(-1 + (2 * user_opts.deadzonesize), osc_top, 0, 0), osc_param.playresx, osc_param.playresy)

    local lo, ne

    -- osc background
    setup_bg_elements(posX, posY, osc_geo.w, osc_geo.h, user_opts.fade_transparency_strength, user_opts.window_fade_transparency_strength)

    local refX = osc_geo.w / 2
    local refY = posY

    -- seekbar
    ne = new_element("seekbarbg", "box")
    ne.visible = user_opts.nibbles_style ~= "gap"
    lo = add_layout("seekbarbg")
    local seekbar_bg_h = seekbar_height_style.height
    lo.geometry = {x = refX, y = refY - first_row_y - second_row_y, an = 5, w = osc_geo.w - 30, h = seekbar_bg_h}
    lo.layer = 15
    lo.style = osc_styles.seekbar_bg
    lo.box.radius = user_opts.slider_rounded_corners and seekbar_height_style.radius or 0
    lo.alpha[1] = 128

    lo = add_layout("seekbar")
    local seekbar_h = 18
    lo.geometry = {x = refX, y = refY - first_row_y - second_row_y, an = 5, w = osc_geo.w - 30, h = seekbar_h}
    lo.layer = 49
    lo.style = osc_styles.seekbar_fg
    lo.slider.handle_color = user_opts.seek_handle_color
    lo.slider.handle_border = user_opts.seek_handle_border_color
    lo.slider.gap = (seekbar_h - seekbar_bg_h) / 2.0
    lo.slider.radius = user_opts.slider_rounded_corners and seekbar_height_style.radius or 0
    lo.slider.tooltip_an = 2

    if user_opts.persistent_progress or state.persistent_progress_toggle then
        lo = add_layout("persistent_seekbar")
        lo.geometry = {x = refX, y = refY, an = 5, w = osc_geo.w, h = user_opts.persistent_progress_height}
        lo.style = osc_styles.seekbar_fg
        lo.slider.gap = (seekbar_h - seekbar_bg_h) / 2.0
        lo.slider.tooltip_an = 0
    end

    -- left side buttons
    local start_x = 37
    local function left_side_button(name, min_w, w, step)
        local vis = osc_param.playresx >= min_w
        elements[name].visible = vis
        if vis then
            lo = add_layout(name)
            lo.geometry = {x = start_x, y = refY - first_row_y, an = 5, w = w or 24, h = 20}
            lo.style = osc_styles.control_mini
            start_x = start_x + (step or 35)
        end
    end

    elements["play_pause"].visible = osc_param.playresx >= 200
    lo = add_layout("play_pause")
    lo.geometry = {x = start_x, y = refY - first_row_y, an = 5, w = 24, h = 20}
    lo.style = osc_styles.control_mini
    start_x = start_x + 35

    local pl_count = state.playlist_count
    local pl_pos = state.playlist_pos_1

    if user_opts.track_nextprev_buttons then
        local prev_vis = pl_pos > 1 and osc_param.playresx >= 350
        elements["playlist_prev"].visible = prev_vis
        if prev_vis then
            lo = add_layout("playlist_prev")
            lo.geometry = {x = start_x, y = refY - first_row_y, an = 5, w = 24, h = 20}
            lo.style = osc_styles.control_mini
            start_x = start_x + 35
        end

        local next_vis = pl_pos < pl_count and osc_param.playresx >= 350
        elements["playlist_next"].visible = next_vis
        if next_vis then
            lo = add_layout("playlist_next")
            lo.geometry = {x = start_x, y = refY - first_row_y, an = 5, w = 24, h = 20}
            lo.style = osc_styles.control_mini
            start_x = start_x + 35
        end
    end

    if user_opts.jump_buttons then
        left_side_button("jump_backward", 450, 30)
        left_side_button("jump_forward", 450, 30)
    end

    if state.audio_track_count > 0 and user_opts.volume_control then
        left_side_button("vol_ctrl", 500, nil, 20)

        local vol_vis = osc_param.playresx >= 650
        ne = new_element("volumebarbg", "box")
        ne.visible = vol_vis
        elements["volumebar"].visible = vol_vis
        if vol_vis then
            lo = add_layout("volumebarbg")
            lo.geometry = {x = start_x, y = refY - first_row_y, an = 4, w = 55, h = 4}
            lo.layer = 15
            lo.alpha[1] = 128
            lo.style = user_opts.volumebar_match_seek_color and osc_styles.seekbar_bg or osc_styles.volumebar_bg
            lo.box.radius = user_opts.slider_rounded_corners and 2 or 0

            lo = add_layout("volumebar")
            lo.geometry = {x = start_x, y = refY - first_row_y, an = 4, w = 55, h = 10}
            lo.style = user_opts.volumebar_match_seek_color and osc_styles.seekbar_fg or osc_styles.volumebar_fg
            lo.slider.handle_color = user_opts.volumebar_match_seek_color and user_opts.seekbarfg_color or user_opts.side_buttons_color
            lo.slider.gap = 3
            lo.slider.radius = user_opts.slider_rounded_corners and 2 or 0
            lo.slider.tooltip_an = 2
            start_x = start_x + 75
            -- vol_ctrl center = bar_start - 20; bar_start = start_x - 75; left edge = center - 10
            local vc_left = start_x - 107
            local osc_mid = refY - first_row_y
            elements["vol_ctrl"].hover_box = {x1 = vc_left, y1 = osc_mid - 10, x2 = vc_left + 87, y2 = osc_mid + 10}
        else
            elements["vol_ctrl"].hover_box = nil
        end
    end

    -- right side buttons
    local end_x = osc_geo.w - 37
    local function right_side_button(name, min_w, vis_extra, style, w)
        local vis = (osc_param.playresx >= min_w) and (vis_extra == nil or vis_extra)
        elements[name].visible = vis
        if vis then
            lo = add_layout(name)
            lo.geometry = {x = end_x, y = refY - first_row_y, an = 5, w = (w or 24), h = 20}
            lo.style = style or osc_styles.control_mini
            end_x = end_x - 35
        end
    end

    right_side_button("fullscreen", 250, user_opts.fullscreen_button)
    right_side_button("ontop", 300, user_opts.ontop_button and not (window_controls_enabled() and user_opts.ontop_in_topbar and state.ontop))
    right_side_button("sub_track", 400, user_opts.subtitles_button and state.sub_track_count > 0)
    right_side_button("audio_track", 500, user_opts.audio_tracks_button and state.audio_track_count > 0)
    right_side_button("playlist", 600, user_opts.playlist_button)
    right_side_button("download", 700, state.is_url and user_opts.download_button)
    right_side_button("speed", 700, user_opts.speed_button, osc_styles.speed, 42)

    -- time codes
    local time_codes_width = get_time_codes_width()
    elements["time_codes"].visible = (state.duration or 0) > 0
    lo = add_layout("time_codes")
    lo.geometry = {x = end_x, y = refY - first_row_y, an = 6, w = time_codes_width, h = 20}
    lo.layer = 48
    lo.alpha[3] = 0
    lo.style = osc_styles.time
end

layouts["seekbar"] = function ()
    local osc_height = 30
    local first_row_y = 25
    local second_row_y = 15
    local osc_offset = first_row_y + second_row_y

    local osc_geo = {
        w = osc_param.playresx,
        h = osc_height + osc_offset
    }

    -- update bottom margin
    osc_param.video_margins.b = osc_geo.h / osc_param.playresy

    -- origin of the controllers, left/bottom corner
    local posX = 0
    local posY = osc_param.playresy

    osc_param.areas = {} -- delete areas

    -- area for active mouse input
    add_area("input", get_hitbox_coords(posX, posY, 1, osc_geo.w, osc_geo.h))

    -- area for show/hide
    local osc_top = posY - osc_geo.h
    add_area("showhide", 0, get_align(-1 + (2 * user_opts.deadzonesize), osc_top, 0, 0), osc_param.playresx, osc_param.playresy)

    local lo, ne

    -- osc background
    setup_bg_elements(posX, posY, osc_geo.w, osc_geo.h, user_opts.fade_transparency_strength, user_opts.window_fade_transparency_strength)

    local refX = osc_geo.w / 2
    local refY = posY

    -- seekbar
    ne = new_element("seekbarbg", "box")
    ne.visible = user_opts.nibbles_style ~= "gap"
    lo = add_layout("seekbarbg")
    local seekbar_bg_h = seekbar_height_style.height
    lo.geometry = {x = refX, y = refY - first_row_y, an = 5, w = osc_geo.w - 30, h = seekbar_bg_h}
    lo.layer = 15
    lo.style = osc_styles.seekbar_bg
    lo.box.radius = user_opts.slider_rounded_corners and seekbar_height_style.radius or 0
    lo.alpha[1] = 128

    lo = add_layout("seekbar")
    local seekbar_h = 18
    lo.geometry = {x = refX, y = refY - first_row_y, an = 5, w = osc_geo.w - 30, h = seekbar_h}
    lo.layer = 49
    lo.style = osc_styles.seekbar_fg
    lo.slider.handle_color = user_opts.seek_handle_color
    lo.slider.handle_border = user_opts.seek_handle_border_color
    lo.slider.gap = (seekbar_h - seekbar_bg_h) / 2.0
    lo.slider.radius = user_opts.slider_rounded_corners and seekbar_height_style.radius or 0
    lo.slider.tooltip_an = 2

    if user_opts.persistent_progress or state.persistent_progress_toggle then
        lo = add_layout("persistent_seekbar")
        lo.geometry = {x = refX, y = refY, an = 5, w = osc_geo.w, h = user_opts.persistent_progress_height}
        lo.style = osc_styles.seekbar_fg
        lo.slider.gap = (seekbar_h - seekbar_bg_h) / 2.0
        lo.slider.tooltip_an = 0
    end

    -- time codes
    local time_codes_width = get_time_codes_width()
    elements["time_codes"].visible = (state.duration or 0) > 0
    lo = add_layout("time_codes")
    lo.geometry = {x = osc_geo.w - 25, y = refY - first_row_y - second_row_y, an = 3, w = time_codes_width, h = user_opts.time_font_size}
    lo.layer = 48
    lo.alpha[3] = 0
    lo.style = osc_styles.time
end

layouts["modern-image"] = function ()
    local osc_geo = {
        w = osc_param.playresx,
        h = 50
    }

    -- update bottom margin
    osc_param.video_margins.b = osc_geo.h / osc_param.playresy

    -- origin of the controllers, left/bottom corner
    local posX = 0
    local posY = osc_param.playresy

    osc_param.areas = {} -- delete areas

    -- area for active mouse input
    add_area("input", get_hitbox_coords(posX, posY, 1, osc_geo.w, osc_geo.h))

    -- area for show/hide
    local osc_top = posY - osc_geo.h
    add_area("showhide", 0, get_align(-1 + (2 * user_opts.deadzonesize), osc_top, 0, 0), osc_param.playresx, osc_param.playresy)

    -- fetch values
    local osc_w = osc_geo.w
    local lo, ne
    -- osc background
    setup_bg_elements(posX, posY, osc_w, osc_geo.h, user_opts.fade_transparency_strength, user_opts.window_fade_transparency_strength)

    local refX = osc_w / 2
    local refY = posY

    local track_nextprev_buttons = user_opts.track_nextprev_buttons and state.playlist_count > 1
    local fullscreen_button = user_opts.fullscreen_button
    local info_button = user_opts.info_button
    local ontop_button = user_opts.ontop_button and not (window_controls_enabled() and user_opts.ontop_in_topbar and state.ontop)
    local playlist_button = user_opts.playlist_button and (not user_opts.hide_empty_playlist_button or state.playlist_count > 1)
    local zoom_control = user_opts.zoom_control

    local function left_side_button(name, x, min_w, w, style)
        elements[name].visible = osc_param.playresx >= min_w
        lo = add_layout(name)
        lo.geometry = {x = x, y = refY - (user_opts.osc_height / 2), an = 5, w = w or 24, h = 24}
        lo.style = style or osc_styles.control_2
    end

    local end_x = osc_geo.w - 37
    local function right_side_button(name, min_w, vis_extra)
        elements[name].visible = (osc_param.playresx >= min_w) and (vis_extra == nil or vis_extra)
        lo = add_layout(name)
        lo.geometry = {x = end_x, y = refY - (user_opts.osc_height / 2), an = 5, w = 24, h = 24}
        lo.style = osc_styles.control_3
        end_x = end_x - 45
    end

    -- left side
    if playlist_button then left_side_button("playlist", 25, 250, nil, osc_styles.control_3) end

    if track_nextprev_buttons then
        left_side_button("playlist_prev", 60 - (playlist_button and 0 or 25), 250)
        left_side_button("playlist_next", 90 - (playlist_button and 0 or 25), 250)
    end

    if zoom_control then
        local zoom_vis = osc_param.playresx >= 300
        local zx = 130 - (playlist_button and 0 or 25) - (track_nextprev_buttons and 0 or 70)

        left_side_button("zoom_out_icon", zx, 300, 30)

        ne = new_element("zoom_control_bg", "box")
        ne.visible = zoom_vis
        lo = add_layout("zoom_control_bg")
        lo.geometry = {x = zx + 25, y = refY - (user_opts.osc_height / 2), an = 4, w = 80, h = 4}
        lo.layer = 15
        lo.alpha[1] = 128
        lo.style = osc_styles.volumebar_bg
        lo.box.radius = user_opts.slider_rounded_corners and 2 or 0

        elements["zoom_control"].visible = zoom_vis
        lo = add_layout("zoom_control")
        lo.geometry = {x = zx + 25, y = refY - (user_opts.osc_height / 2), an = 4, w = 80, h = 10}
        lo.style = osc_styles.volumebar_fg
        lo.slider.handle_color = user_opts.side_buttons_color
        lo.slider.radius = user_opts.slider_rounded_corners and 2 or 0
        lo.slider.gap = 3
        lo.slider.tooltip_an = 2

        left_side_button("zoom_in_icon", zx + 130, 300, 30)
    end

    -- right side
    if fullscreen_button then right_side_button("fullscreen", 350) end
    if info_button then right_side_button("info", 400) end
    if ontop_button then right_side_button("ontop", 450) end
    if user_opts.download_button then right_side_button("download", 500, state.is_url) end
end

local function set_bar_visible(visible_key, visible)
    if state[visible_key] ~= visible then
        state[visible_key] = visible
        update_margins()
    end
    request_tick()
end

local function osc_visible(visible)
    set_bar_visible("osc_visible", visible)
end

local function wc_visible(visible)
    set_bar_visible("wc_visible", visible)
end

-- use_down: if true, uses _down instead of _up (for softrepeat buttons)
local function bind_buttons(element_name, use_down)
    local ev = use_down and "_down" or "_up"
    for _, button in ipairs({"mbtn_left", "mbtn_right"}) do
        local command = user_opts[element_name .. "_" .. button .. "_command"]
        if command ~= nil and command ~= "" and command ~= "ignore" then
            elements[element_name].eventresponder[button .. ev] = function() mp.command(command) end
        end
    end
    local command = user_opts[element_name .. "_mbtn_mid_command"]
    if command ~= nil and command ~= "" and command ~= "ignore" then
        elements[element_name].eventresponder["shift+mbtn_left_down"] = function() mp.command(command) end
    end
    for _, button in ipairs({"wheel_up", "wheel_down"}) do
        local command = user_opts[element_name .. "_" .. button .. "_command"]
        if command ~= nil and command ~= "" and command ~= "ignore" then
            elements[element_name].eventresponder[button .. "_press"] = function() mp.command(command) end
        end
    end
end

-- format seconds into a time string
local function format_time(seconds)
    if not seconds then return "--:--" end

    local hours   = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs    = math.floor(seconds % 60)
    local show_hours = hours > 0 or user_opts.time_format == "fixed"

    if state.tc_ms then
        local ms = math.floor((seconds % 1) * 1000)
        if show_hours then
            return string.format("%d:%02d:%02d.%03d", hours, minutes, secs, ms)
        else
            return string.format("%d:%02d.%03d", minutes, secs, ms)
        end
    else
        if show_hours then
            return string.format("%d:%02d:%02d", hours, minutes, secs)
        else
            return string.format("%d:%02d", minutes, secs)
        end
    end
end

local function build_cache_seek_ranges()
    if not user_opts.seekrange or not cache_enabled() then return nil end
    if not state.duration then return nil end
    local nranges = {}
    for _, range in ipairs(state.demuxer_cache_state["seekable-ranges"]) do
        nranges[#nranges + 1] = {
            ["start"] = 100 * range["start"] / state.duration,
            ["end"]   = 100 * range["end"]   / state.duration,
        }
    end
    return nranges
end

local function osc_init()
    msg.debug("osc_init")

    -- set canvas resolution according to display aspect and scaling setting
    local baseResY = 720
    local display_h = state.osd_dimensions.h
    local display_aspect = state.osd_dimensions.aspect
    local scale

    if state.fullscreen then
        scale = user_opts.scalefullscreen
    else
        scale = user_opts.scalewindowed
    end

    local scale_with_video
    if user_opts.vidscale == "auto" then
        scale_with_video = state.osd_scale_by_window
    else
        scale_with_video = user_opts.vidscale == "yes"
    end

    if scale_with_video then
        osc_param.unscaled_y = baseResY
    else
        osc_param.unscaled_y = display_h
    end
    osc_param.playresy = osc_param.unscaled_y / scale
    if display_aspect > 0 then
        osc_param.display_aspect = display_aspect
    end
    osc_param.playresx = osc_param.playresy * osc_param.display_aspect

    -- stop seeking with the slider to prevent skipping files
    state.active_element = nil
    state.playing_and_seeking = false

    -- reset margins and text width
    text_width_cache = {}
    osc_param.video_margins = {l = 0, r = 0, t = 0, b = 0}

    elements = {}

    -- some often needed stuff
    local pl_count = state.playlist_count
    local have_pl = pl_count > 1
    local pl_pos = state.playlist_pos_1
    local have_ch = #state.chapter_list > 0
    local loop = mp.get_property("loop-playlist", "no")

    local function make_escaped_title(source)
        local title = mp.command_native({"expand-text", source})
        title = title:gsub("\n", " ")
        return title ~= "" and mp.command_native({"escape-ass", title}) or "mpv"
    end

    local ne

    -- Window controls
    -- Close: 🗙
    ne = new_element("close", "button")
    ne.hover_color = user_opts.windowcontrols_close_hover
    ne.hover_radius = 0
    ne.hover_pad = 0
    ne.content = icons.window.close
    ne.eventresponder["mbtn_left_up"] = function () mp.commandv("quit") end

    -- Minimize: 🗕
    ne = new_element("minimize", "button")
    ne.hover_color = user_opts.windowcontrols_min_hover
    ne.hover_radius = 0
    ne.hover_pad = 0
    ne.content = icons.window.minimize
    ne.eventresponder["mbtn_left_up"] = function () mp.commandv("cycle", "window-minimized") end

    -- Maximize: 🗖 /🗗
    ne = new_element("maximize", "button")
    ne.hover_color = user_opts.windowcontrols_max_hover
    ne.hover_radius = 0
    ne.hover_pad = 0
    ne.content = (state.window_maximized or state.fullscreen) and icons.window.unmaximize or icons.window.maximize
    ne.eventresponder["mbtn_left_up"] = function () mp.commandv("cycle", (state.fullscreen and "fullscreen" or "window-maximized")) end

    local function truncate_title(title, max_w, style)
        if not max_w or max_w <= 0 or estimate_text_width(title, style) <= max_w then return title end
        local ell_w = estimate_text_width("…", style)
        -- map each UTF-8 character to its last byte offset (avoids slicing mid-char)
        local char_ends, pos = {}, 1
        while pos <= #title do
            local b = title:byte(pos)
            local char_len = b >= 0xF0 and 4 or b >= 0xE0 and 3 or b >= 0xC0 and 2 or 1
            char_ends[#char_ends + 1] = pos + char_len - 1
            pos = pos + char_len
        end
        -- binary search over character count
        local low, high, fit = 1, #char_ends, 0
        while low <= high do
            local mid = math.floor((low + high) / 2)
            if estimate_text_width(title:sub(1, char_ends[mid]), style) <= max_w - ell_w then
                fit = mid; low = mid + 1
            else
                high = mid - 1
            end
        end
        return title:sub(1, fit > 0 and char_ends[fit] or 0) .. "…"
    end

    -- Window Title
    ne = new_element("windowtitle", "button")
    ne.content = function ()
        local t = make_escaped_title(mp.get_property("title"))
        return user_opts.truncate_title and truncate_title(t, state.windowtitle_max_w, osc_styles.window_title) or t
    end

    -- OSC title
    ne = new_element("title", "button")
    ne.content = function ()
        local t = make_escaped_title(user_opts.title)
        return user_opts.truncate_title and truncate_title(t, state.title_max_w, osc_styles.title) or t
    end
    bind_buttons("title")

    -- Chapter title
    ne = new_element("chapter_title", "button")
    ne.content = function()
        local chapter_index = state.chapter or -1
        if user_opts.chapter_fmt == "no" or chapter_index < 0 then return "" end
        local chapter_data = state.chapter_list[chapter_index + 1]
        local chapter_title = mp.command_native({"escape-ass",
            chapter_data and chapter_data.title ~= "" and chapter_data.title
            or string.format("%s: %d/%d", locale.chapter, chapter_index + 1, #state.chapter_list)})
        local t = string.format(user_opts.chapter_fmt, chapter_title)
        return user_opts.truncate_title and truncate_title(t, state.chapter_title_max_w, osc_styles.chapter_title) or t
    end
    bind_buttons("chapter_title")

    -- playlist buttons
    -- prev
    ne = new_element("playlist_prev", "button")
    ne.content = icons.previous
    ne.enabled = (pl_pos > 1) or (loop ~= "no") or contains(user_opts.buttons_always_active, "playlist_prev")
    bind_buttons("playlist_prev")

    --next
    ne = new_element("playlist_next", "button")
    ne.content = icons.next
    ne.enabled = (have_pl and (pl_pos < pl_count)) or (loop ~= "no") or contains(user_opts.buttons_always_active, "playlist_next")
    bind_buttons("playlist_next")

    --play control buttons
    --play_pause
    ne = new_element("play_pause", "button")
    ne.content = function () return state.eof_reached and icons.replay or (state.pause and not state.playing_and_seeking and icons.play) or icons.pause end
    bind_buttons("play_pause")
    ne.eventresponder["mbtn_left_up"] = function ()
        if state.eof_reached then
            mp.commandv("seek", 0, "absolute-percent")
            mp.commandv("set", "pause", "no")
        else
            mp.command(user_opts.play_pause_mbtn_left_command)
        end
    end

    local jump_amount = user_opts.jump_amount
    local jump_more_amount = user_opts.jump_more_amount
    local jump_mode = user_opts.jump_mode
    local jump_icon = user_opts.jump_icon_number and icons.jump[jump_amount] or icons.jump.default

    --jump_backward
    ne = new_element("jump_backward", "button")
    ne.softrepeat = user_opts.jump_softrepeat
    ne.content = jump_icon[1]
    ne.eventresponder["mbtn_left_down"] = function () mp.commandv("seek", -jump_amount, jump_mode) end
    ne.eventresponder["mbtn_right_down"] = function () mp.commandv("seek", -jump_more_amount, jump_mode) end
    ne.eventresponder["shift+mbtn_left_down"] = function () mp.commandv("frame-back-step") end

    --jump_forward
    ne = new_element("jump_forward", "button")
    ne.softrepeat = user_opts.jump_softrepeat
    ne.content = jump_icon[2]
    ne.eventresponder["mbtn_left_down"] = function () mp.commandv("seek", jump_amount, jump_mode) end
    ne.eventresponder["mbtn_right_down"] = function () mp.commandv("seek", jump_more_amount, jump_mode) end
    ne.eventresponder["shift+mbtn_left_down"] = function () mp.commandv("frame-step") end

    --chapter_prev
    ne = new_element("chapter_prev", "button")
    ne.content = icons.rewind
    ne.enabled = have_ch -- disables button when no chapters available.
    bind_buttons("chapter_prev", true)

    --chapter_next
    ne = new_element("chapter_next", "button")
    ne.content = icons.forward
    ne.enabled = have_ch -- disables button when no chapters available.
    bind_buttons("chapter_next", true)

    --playlist
    ne = new_element("playlist", "button")
    ne.enabled = have_pl or not user_opts.hide_empty_playlist_button
    ne.off = not have_pl and user_opts.gray_empty_playlist_button
    ne.content = icons.playlist
    ne.tooltipF = function() return have_pl and locale.playlist .. " [" .. pl_pos .. "/" .. pl_count .. "]" or locale.playlist .. " / " .. locale.menu end
    ne.nothingavailable = locale.no_playlist
    bind_buttons("playlist")

    -- track tooltip helper
    local function track_tooltip(label, track_type, id_prop, count)
        local prop = mp.get_property("current-tracks/" .. track_type .. "/title") or mp.get_property("current-tracks/" .. track_type .. "/lang") or locale.unknown
        return label .. " [" .. mp.get_property_number(id_prop, "-") .. "/" .. count .. "] [" .. prop .. "]"
    end

    --audio_track
    ne = new_element("audio_track", "button")
    ne.enabled = state.audio_track_count > 0
    ne.off = state.audio_track_count == 0 or not mp.get_property_native("aid")
    ne.content = icons.audio
    ne.tooltipF = function () return track_tooltip(locale.audio, "audio", "aid", state.audio_track_count) end
    ne.nothingavailable = locale.no_audio
    bind_buttons("audio_track")

    --sub_track
    ne = new_element("sub_track", "button")
    ne.enabled = state.sub_track_count > 0
    ne.off = state.sub_track_count == 0 or not mp.get_property_native("sid")
    ne.content = icons.subtitle
    ne.tooltipF = function () return track_tooltip(locale.subtitle, "sub", "sid", state.sub_track_count) end
    ne.nothingavailable = locale.no_subs
    bind_buttons("sub_track")

    -- vol_ctrl
    ne = new_element("vol_ctrl", "button")
    ne.enabled = state.audio_track_count > 0
    ne.off = state.audio_track_count == 0
    ne.content = function ()
        local volume = state.volume
        return state.mute and icons.volume_mute or (volume >= 75 and icons.volume_high) or (volume >= 25 and icons.volume_low) or icons.volume_quiet
    end
    ne.tooltipF = function ()
        local volume = state.volume
        -- show only one decimal, if decimals exist
        local volume_str = (volume % 1 == 0) and string.format("%.0f", volume) or string.format("%.1f", volume)
        return locale.volume .. ": " .. volume_str .. (state.mute and " (" .. locale.muted .. ")" or "")
    end
    bind_buttons("vol_ctrl")

    --volumebar
    local volume_max_prop = mp.get_property_number("volume-max") or 0
    local volume_max = volume_max_prop > 0 and volume_max_prop or 100
    ne = new_element("volumebar", "slider")
    ne.enabled = state.audio_track_count > 0
    ne.slider = {min = {value = 0}, max = {value = volume_max}}
    ne.slider.markerF = function () return {} end
    ne.slider.seekRangesF = function() return nil end
    ne.slider.posF = function ()
        if user_opts.volume_control_type ~= "logarithmic" then return state.volume end
        return state.volume and math.sqrt(state.volume * 100) or 0
    end
    ne.eventresponder["mouse_move"] = function (element)
        local pos = get_slider_value(element)
        local setvol = set_volume(pos)
        if element.state.lastseek == nil or element.state.lastseek ~= setvol then
                mp.commandv("set", "volume", setvol)
                element.state.lastseek = setvol
        end
    end
    ne.eventresponder["mbtn_left_down"] = function (element)
        element.state.mbtnleft = true
        local pos = get_slider_value(element)
        if user_opts.volumebar_unmute_on_click then
            mp.set_property_bool("mute", false)
        end
        mp.commandv("set", "volume", set_volume(pos))
    end
    ne.eventresponder["mbtn_left_up"] = function (element)
        element.state.mbtnleft = false
        element.state.handle_drag = false
    end
    ne.eventresponder["reset"] = function (element)
        element.state.lastseek = nil
        element.state.mbtnleft = false
    end
    bind_buttons("volumebar")

    -- zoom in/out helper
    local function zoom_step(delta)
        local z = mp.get_property_number("video-zoom", 0)
        mp.commandv("osd-msg", "set", "video-zoom", math.max(user_opts.zoom_out_min, math.min(user_opts.zoom_in_max, z + delta)))
    end

    -- zoom out icon
    ne = new_element("zoom_out_icon", "button")
    ne.content = icons.zoom_out
    ne.tooltipF = locale.zoom_out
    ne.eventresponder["mbtn_left_up"] = function () zoom_step(-0.05) end
    ne.eventresponder["mbtn_right_up"] = function () mp.commandv("osd-msg", "set", "video-zoom", 0) end
    ne.eventresponder["wheel_up_press"] = function () zoom_step(0.05) end
    ne.eventresponder["wheel_down_press"] = function () zoom_step(-0.05) end

    -- zoom slider
    ne = new_element("zoom_control", "slider")
    ne.slider = {min = {value = user_opts.zoom_out_min}, max = {value = user_opts.zoom_in_max}}
    ne.slider.markerF = function () return {} end
    ne.slider.seekRangesF = function() return nil end
    ne.slider.posF = function () return mp.get_property_number("video-zoom") end
    ne.slider.tooltipF = function (pos) return string.format("%.3f", pos):gsub("%.?0*$", "") end
    ne.eventresponder["mouse_move"] = function (element)
        local pos = get_slider_value(element)
        if element.state.lastseek == nil or element.state.lastseek ~= pos then
                mp.commandv("osd-msg", "set", "video-zoom", pos)
                element.state.lastseek = pos
        end
    end
    ne.eventresponder["mbtn_left_down"] = function (element) mp.commandv("osd-msg", "set", "video-zoom", get_slider_value(element)) end
    ne.eventresponder["reset"] = function (element) element.state.lastseek = nil end
    ne.eventresponder["mbtn_right_up"] = function () mp.commandv("osd-msg", "set", "video-zoom", 0) end
    ne.eventresponder["wheel_up_press"] = function () zoom_step(0.05) end
    ne.eventresponder["wheel_down_press"]= function () zoom_step(-0.05) end

    -- zoom in icon
    ne = new_element("zoom_in_icon", "button")
    ne.content = icons.zoom_in
    ne.tooltipF = locale.zoom_in
    ne.eventresponder["mbtn_left_up"] = function () zoom_step(0.05) end
    ne.eventresponder["mbtn_right_up"] = function () mp.commandv("osd-msg", "set", "video-zoom", 0) end
    ne.eventresponder["wheel_up_press"] = function () zoom_step(0.05) end
    ne.eventresponder["wheel_down_press"]= function () zoom_step(-0.05) end

    --fullscreen
    ne = new_element("fullscreen", "button")
    ne.content = function() return state.fullscreen and icons.fullscreen_exit or icons.fullscreen end
    ne.tooltipF = function() return state.fullscreen and locale.fullscreen_exit or locale.fullscreen end
    bind_buttons("fullscreen")

    --info
    ne = new_element("info", "button")
    ne.content = icons.info
    ne.tooltipF = locale.stats_info
    bind_buttons("info")

    --ontop
    ne = new_element("ontop", "button")
    ne.content = function () return not state.ontop and icons.ontop_on or icons.ontop_off end
    ne.tooltipF = function ()
        if user_opts.ontop_in_topbar and window_controls_enabled() and state.ontop then return nil end
        return state.ontop and locale.ontop_disable or locale.ontop
    end
    bind_buttons("ontop")

    --screenshot
    ne = new_element("screenshot", "button")
    ne.content = icons.screenshot
    ne.tooltipF = locale.screenshot
    bind_buttons("screenshot")

    --file_loop
    ne = new_element("file_loop", "button")
    ne.content = function() return state.file_loop and icons.loop_on or icons.loop_off end
    ne.tooltipF = function() return state.file_loop and locale.file_loop_enable or locale.file_loop_disable end
    bind_buttons("file_loop")

    --shuffle
    ne = new_element("shuffle", "button")
    ne.content = function() return state.shuffled and icons.shuffle_on or icons.shuffle_off end
    ne.tooltipF = function() return state.shuffled and locale.shuffle or locale.unshuffle end
    ne.eventresponder["mbtn_left_up"] = function()
        mp.commandv("show-text", state.shuffled and locale.unshuffle or locale.shuffle, "-1", "1")
        state.shuffled = not state.shuffled
        mp.command("playlist-" .. (state.shuffled and "shuffle" or "unshuffle"))
    end

    --speed
    ne = new_element("speed", "button")
    ne.content = function() return string.format(state.speed % 1 == 0 and "%.1f×" or "%g×", state.speed) end
    ne.tooltipF = locale.speed_control
    bind_buttons("speed")

    --download
    ne = new_element("download", "button")
    ne.content = function () return state.downloading and icons.downloading or icons.download end
    ne.tooltipF = function () return state.downloading and locale.downloading .. "..." or locale.download .. " (" .. state.file_size_normalized .. ")" end
    ne.eventresponder["mbtn_left_up"] = function ()
        local localpath = mp.command_native({"expand-path", user_opts.download_path})

        if state.downloaded_once then
            mp.commandv("show-text", locale.downloaded, "-1", "1")
        elseif state.downloading then
            mp.commandv("show-text", locale.download_in_progress, "-1", "1")
        else
            mp.commandv("show-text", locale.downloading .. "...", "-1", "1")
            state.downloading = true
            local command = {
                "yt-dlp",
                state.is_image and "" or get_ytdl_format(),
                "--add-metadata",
                "--embed-subs",
                "-o", "%(title)s.%(ext)s",
                "-P", localpath,
                state.url_path
            }

            exec(command, download_done)
        end
    end

    -- cache info
    ne = new_element("cache_info", "button")
    ne.content = function ()
        if not cache_enabled() then return "" end
        local dcs = state.demuxer_cache_state
        local dmx_cache = state.dmx_cache
        local cache_state = dcs and dcs["cache-duration"]
        local thresh = math.min(dmx_cache * 0.05, 5)
        if cache_state and math.abs(cache_state - dmx_cache) >= thresh then
            dmx_cache = cache_state
            state.dmx_cache = cache_state
        end
        local min = math.floor(dmx_cache / 60)
        local sec = math.floor(dmx_cache % 60)
        local cache_time = (min > 0) and string.format("%sm%02ds", min, sec) or string.format("%3ds", sec)
        local cache_info = (mp.get_property_bool("paused-for-cache") == true) and (locale.buffering .. ": " .. (mp.get_property("cache-buffering-state") or 0) .. "%") or cache_time
        if not user_opts.cache_info_speed then return cache_info end
        local dmx_speed = (dcs and dcs["raw-input-rate"]) or 0
        local number, unit = utils.format_bytes_humanized(dmx_speed):match("([%d%.]+)%s*(%S+)")
        return cache_info .. "\\N" .. string.format("%8s %4s/s", number or 0, unit or "B")
    end
    ne.tooltipF = function() return cache_enabled() and locale.cache or nil end
    ne.eventresponder["mbtn_left_up"] = function() mp.command("script-binding stats/display-page-3") end

    --seekbar
    ne = new_element("seekbar", "slider")
    ne.enabled = mp.get_property("percent-pos") ~= nil
    ne.thumbnailable = true
    ne.slider.markerF = function ()
        if state.duration then
            local chapters = state.chapter_list
            local markers = {}
            for n = 1, #chapters do
                markers[n] = (chapters[n].time / state.duration * 100)
            end
            return markers
        else
            return {}
        end
    end
    ne.slider.posF = function ()
        if state.eof_reached then return 100 end
        return mp.get_property_number("percent-pos")
    end
    ne.slider.tooltipF = function (pos)
        if state.duration ~= nil and pos ~= nil then return format_time(state.duration * (pos / 100)) end
        return ""
    end
    ne.slider.seekRangesF = build_cache_seek_ranges
    ne.eventresponder["mouse_move"] = function (element)
        if not element.state.mbtnleft then return end -- allow drag for mbtnleft only!
        state.playing_and_seeking = true
        if not mp.get_property_bool("pause") and user_opts.mouse_seek_pause then
            mp.commandv("cycle", "pause")
        end
        local seekto = get_slider_value(element)
        if element.state.lastseek == nil or element.state.lastseek ~= seekto then
            local flags = "absolute-percent"
            if not user_opts.seekbarkeyframes then
                flags = flags .. "+exact"
            end
            mp.commandv("seek", seekto, flags)
            element.state.lastseek = seekto
        end
    end
    ne.eventresponder["mbtn_left_down"] = function (element)
        element.state.mbtnleft = true
        element.state.was_paused = mp.get_property_bool("pause")
        state.playing_and_seeking = false
        mp.commandv("seek", get_slider_value(element), "absolute-percent+exact")
    end
    ne.eventresponder["shift+mbtn_left_down"] = function (element)
        element.state.mbtnleft = true
        element.state.was_paused = mp.get_property_bool("pause")
        state.playing_and_seeking = false
        mp.commandv("seek", get_slider_value(element), "absolute-percent")
    end
    ne.eventresponder["mbtn_left_up"] = function (element)
        element.state.mbtnleft = false
        if state.playing_and_seeking then
            -- only unpause if the video was playing before the drag started
            if not element.state.was_paused and not mp.get_property_bool("eof-reached") and user_opts.mouse_seek_pause then
                mp.commandv("cycle", "pause")
            end
            state.playing_and_seeking = false
        end
    end
    ne.eventresponder["mbtn_right_down"] = function (element)
        local chapter
        local pos = get_slider_value(element)
        local diff = math.huge

        for i, marker in ipairs(element.slider.markerF()) do
            if math.abs(pos - marker) < diff then
                diff = math.abs(pos - marker)
                chapter = i
            end
        end

        if chapter then
            mp.set_property("chapter", chapter - 1)
        end
    end
    ne.eventresponder["reset"] = function (element)
        element.state.lastseek = nil
        if element.state.mbtnleft then
            element.state.mbtnleft = false
            if state.playing_and_seeking then
                if not element.state.was_paused and not mp.get_property_bool("eof-reached") and user_opts.mouse_seek_pause then
                    mp.commandv("cycle", "pause")
                end
                state.playing_and_seeking = false
            end
        end
    end
    bind_buttons("seekbar")

    --persistent seekbar
    ne = new_element("persistent_seekbar", "slider")
    ne.enabled = mp.get_property("percent-pos") ~= nil
    ne.slider.markerF = function () return {} end
    ne.slider.posF = function ()
        if state.eof_reached then return 100 end
        return mp.get_property_number("percent-pos")
    end
    ne.slider.tooltipF = function() return "" end
    ne.slider.seekRangesF = function()
        if user_opts.persistent_buffer then return build_cache_seek_ranges() end
        return nil
    end

    -- Time codes display
    ne = new_element("time_codes", "button")
    ne.content = function()
        local playback_time = mp.get_property_number("playback-time", 0)
        if not state.duration then return "--:--" end

        local playtime_remaining = state.tc_left_rem and mp.get_property_number("playtime-remaining", 0) or playback_time
        local prefix = state.tc_left_rem and (user_opts.unicodeminus and UNICODE_MINUS or "-") or ""

        -- call request_init() only when needed to update time code width
        if user_opts.time_format ~= "fixed" and playback_time then
            local hour_or_more = playback_time >= 3600
            if hour_or_more ~= state.playtime_hour_force_init then
                request_init()
                state.playtime_hour_force_init = hour_or_more
            end
        end

        return prefix .. format_time(playtime_remaining) .. " / " .. format_time(state.duration)
    end
    ne.eventresponder["mbtn_left_up"] = function()
        state.tc_left_rem = not state.tc_left_rem
        request_init()
    end
    ne.eventresponder["mbtn_right_up"] = function()
        state.tc_ms = not state.tc_ms
        request_init()
    end

    -- load layout
    if state.is_image then
        layouts["modern-image"]()
    elseif layouts[user_opts.layout] then
        layouts[user_opts.layout]()
    else
        layouts["default"]()
    end

    -- load window controls
    if window_controls_enabled() then
        window_controls()
    end

    -- cache seekbar elements
    state.persistent_seekbar_element = elements["persistent_seekbar"]
    state.seekbar_element = elements["seekbar"]

    prepare_elements()
    update_margins()
end

local function show_wc()
    show_bar("wc", "wc_showtime", "wc_visible", "wc_anitype", wc_visible)
end

local function hide_wc()
    hide_bar("wc", "wc_visible", "wc_anitype", wc_visible)
end

local function show_osc()
    if state.idle_active then return end
    show_bar("osc", "showtime", "osc_visible", "anitype", osc_visible)
end

local function hide_osc()
    -- clear any pending thumbnail before hiding
    if thumbfast.width ~= 0 and thumbfast.height ~= 0 then
        mp.commandv("script-message-to", "thumbfast", "clear")
    end
    -- clear input area immediately so clicks pass through while the bar is
    -- hidden, rather than waiting for the next render tick to do it
    set_virt_mouse_area(0, 0, 0, 0, "input")
    -- reset margins before hide_bar wipes the overlay
    if not state.enabled then
        reset_margins()
    end
    hide_bar("osc", "osc_visible", "anitype", osc_visible)
end

local function mouse_leave()
    if get_hidetimeout() >= 0 and get_touchtimeout() <= 0 then
        if user_opts.deadzone_hide == "timeout" then
            local now = mp.get_time()
            if state.osc_visible and not state.keeponpause_active then
                state.showtime = now
            end
            if state.wc_visible then
                state.wc_showtime = now
            end
            request_tick()
        else
            if not state.keeponpause_active then hide_osc() end
            hide_wc()
        end
    end
    -- reset mouse position
    state.last_mouseX, state.last_mouseY = nil, nil
    state.mouse_in_window = false
end

local function handle_touch(_, touchpoints)
    --remember last touch points
    if touchpoints then
        state.touchpoints = touchpoints
        if #touchpoints > 0 then
            --remember last time of invocation (touch event)
            state.touchtime = mp.get_time()
            state.last_touchX = touchpoints[1].x
            state.last_touchY = touchpoints[1].y
        end
    end
end

--
-- Event handling
--
local function reset_timeout()
    local now = mp.get_time()
    if window_controls_enabled() and user_opts.windowcontrols_independent then
        -- only reset the timer for the bar the event belongs to
        if mouse_in_area({"window-controls", "window-controls-title", "window-controls-ontop"}) then
            state.wc_showtime = now
        else
            state.showtime = now
        end
    else
        state.showtime = now
        state.wc_showtime = now
    end
end

local function element_has_action(element, action)
    return element and element.eventresponder and element.eventresponder[action]
end

-- dynamically sets the "input" mouse area to only the hovered element
local click_keys = {
    "mbtn_left_up", "mbtn_left_down", "mbtn_left_press",
    "mbtn_right_up", "mbtn_right_down", "mbtn_right_press",
    "wheel_up_press", "wheel_down_press",
}
local function has_click_action(e)
    if not e.eventresponder then return false end
    for _, k in ipairs(click_keys) do
        if e.eventresponder[k] then return true end
    end
    return false
end

local function refresh_input_area()
    if not state.osc_visible then
        set_virt_mouse_area(0, 0, 0, 0, "input")
        return
    end

    -- during an active drag, keep the input area locked to the held element
    if state.active_element and elements[state.active_element] then
        local e = elements[state.active_element]
        set_virt_mouse_area(e.hitbox.x1, e.hitbox.y1, e.hitbox.x2, e.hitbox.y2, "input")
        return
    end

    -- bail early if the cursor isn't inside the bottom bar zone at all
    if not mouse_in_area("input") then
        set_virt_mouse_area(0, 0, 0, 0, "input")
        return
    end

    -- find the topmost element with direct click handlers under the cursor;
    -- layer order matches process_event's dispatch priority
    local hovered = nil
    for n = 1, #elements do
        local e = elements[n]
        if e.hitbox and has_click_action(e) and mouse_hit(e) then
            hovered = e
        end
    end

    if hovered then
        set_virt_mouse_area(hovered.hitbox.x1, hovered.hitbox.y1, hovered.hitbox.x2, hovered.hitbox.y2, "input")
    else
        set_virt_mouse_area(0, 0, 0, 0, "input")
    end
end

local function process_event(source, what)
    local action = string.format("%s%s", source, what and ("_" .. what) or "")

    if what == "down" or what == "press" then
        reset_timeout() -- clicking resets the hideosc timer

        for n = 1, #elements do
            if mouse_hit(elements[n]) and
                elements[n].eventresponder and
                (elements[n].eventresponder[source .. "_up"] or
                    elements[n].eventresponder[action]) then

                if what == "down" then
                    state.active_element = n
                    state.active_event_source = source
                end
                -- fire the down or press event if the element has one
                if element_has_action(elements[n], action) then
                    elements[n].eventresponder[action](elements[n])
                end
            end
        end
    elseif what == "up" then
        if elements[state.active_element] then
            local n = state.active_element

            if n == 0 then
                --click on background (does not work)
            elseif element_has_action(elements[n], action) and
                mouse_hit(elements[n]) then

                elements[n].eventresponder[action](elements[n])
            end

            --reset active element
            if element_has_action(elements[n], "reset") then
                elements[n].eventresponder["reset"](elements[n])
            end
        end
        state.active_element = nil
        state.mouse_down_counter = 0
    elseif source == "mouse_move" then
        state.mouse_in_window = true

        local mouseX, mouseY = get_virt_mouse_pos()
        if user_opts.minmousemove == 0 or
            ((state.last_mouseX ~= nil and state.last_mouseY ~= nil) and
                (math.abs(mouseX - state.last_mouseX) >= user_opts.minmousemove or
                 math.abs(mouseY - state.last_mouseY) >= user_opts.minmousemove)) then
            if window_controls_enabled() and user_opts.windowcontrols_independent then
                if mouse_in_area("showhide_wc") then
                    show_wc()
                elseif user_opts.visibility ~= "always" and user_opts.deadzone_hide ~= "timeout" then
                    hide_wc()
                end
                if mouse_in_area("showhide") then
                    show_osc()
                elseif user_opts.visibility ~= "always" and not state.keeponpause_active and user_opts.deadzone_hide ~= "timeout" then
                    hide_osc()
                end
            else
                show_osc()
                if window_controls_enabled() then show_wc() end
            end
        end
        state.last_mouseX, state.last_mouseY = mouseX, mouseY

        local n = state.active_element
        if element_has_action(elements[n], action) then
            elements[n].eventresponder[action](elements[n])
        end

        -- update input area to follow the cursor so only the element
        -- currently under it captures clicks; empty space passes through
        refresh_input_area()
    end

    -- ensure rendering after any (mouse) event - icons could change etc
    request_tick()
end

local function do_enable_keybindings()
    if state.enabled then
        if not state.showhide_enabled then
            mp.enable_key_bindings("showhide", "allow-vo-dragging+allow-hide-cursor")
            mp.enable_key_bindings("showhide_wc", "allow-vo-dragging+allow-hide-cursor")
        end
        state.showhide_enabled = true
    end
end

local function enable_osc(enable)
    state.enabled = enable
    if enable then
        do_enable_keybindings()
    else
        hide_osc() -- acts immediately when state.enabled == false
        hide_wc()
        if state.showhide_enabled then
            mp.disable_key_bindings("showhide")
            mp.disable_key_bindings("showhide_wc")
        end
        state.showhide_enabled = false
    end
end

local function render()
    msg.trace("rendering")
    local current_screen_sizeX = state.osd_dimensions.w
    local current_screen_sizeY = state.osd_dimensions.h
    local mouseX, mouseY = get_virt_mouse_pos()
    local now = mp.get_time()

    -- check if display changed, if so request reinit
    if state.screen_sizeX ~= current_screen_sizeX or state.screen_sizeY ~= current_screen_sizeY then
        request_init_resize()

        state.screen_sizeX = current_screen_sizeX
        state.screen_sizeY = current_screen_sizeY
    end

    -- init management
    if state.active_element then
        -- mouse is held down on some element - keep ticking and ignore initReq
        -- till it's released, or else the mouse-up (click) will misbehave or
        -- get ignored. that's because osc_init() recreates the osc elements,
        -- but mouse handling depends on the elements staying unmodified
        -- between mouse-down and mouse-up (using the index active_element).
        request_tick()
    elseif state.initREQ then
        osc_init()
        state.initREQ = false

        -- store initial mouse position
        if (state.last_mouseX == nil or state.last_mouseY == nil) and not (mouseX == nil or mouseY == nil or mouseX == -1 or mouseY == -1) then
            state.last_mouseX, state.last_mouseY = mouseX, mouseY
        end
    end

    -- fade animation
    local function run_fade(anitype_key, anistart_key, animation_key, set_visible)
        local anitype = state[anitype_key]
        if anitype == nil then
            kill_animation(anitype_key, anistart_key, animation_key)
            return
        end
        if state[anistart_key] == nil then state[anistart_key] = now end
        local fadelen = user_opts.fadeduration / 1000
        if now < state[anistart_key] + fadelen then
            if anitype == "in" then
                set_visible(true)
                state[animation_key] = scale_value(state[anistart_key],
                    state[anistart_key] + fadelen, 255, 0, now)
            elseif anitype == "out" then
                state[animation_key] = scale_value(state[anistart_key],
                    state[anistart_key] + fadelen, 0, 255, now)
            end
        else
            if anitype == "out" then set_visible(false) end
            kill_animation(anitype_key, anistart_key, animation_key)
        end
    end
    run_fade("anitype",    "anistart",    "animation",    osc_visible)
    run_fade("wc_anitype", "wc_anistart", "wc_animation", wc_visible)

    --mouse show/hide area
    for _, cords in pairs(osc_param.areas["showhide"]) do
        set_virt_mouse_area(cords.x1, cords.y1, cords.x2, cords.y2, "showhide")
    end
    if osc_param.areas["showhide_wc"] then
        for _, cords in pairs(osc_param.areas["showhide_wc"]) do
            set_virt_mouse_area(cords.x1, cords.y1, cords.x2, cords.y2, "showhide_wc")
        end
    else
        set_virt_mouse_area(0, 0, 0, 0, "showhide_wc")
    end
    do_enable_keybindings()

    --mouse input area
    local function update_input_area(area_name, visible, enabled_key, enable_fn)
        local areas = osc_param.areas[area_name]
        if not areas then return end
        for _, cords in ipairs(areas) do
            if visible then
                set_virt_mouse_area(cords.x1, cords.y1, cords.x2, cords.y2, area_name)
            end
            if visible ~= state[enabled_key] then
                if visible then enable_fn() else mp.disable_key_bindings(area_name) end
                state[enabled_key] = visible
            end
        end
    end

    -- sync input area to cursor position
    if state.osc_visible ~= state.input_enabled then
        if state.osc_visible then
            mp.enable_key_bindings("input")
        else
            mp.disable_key_bindings("input")
        end
        state.input_enabled = state.osc_visible
    end
    refresh_input_area()

    update_input_area("window-controls", state.wc_visible, "windowcontrols_buttons", function() mp.enable_key_bindings("window-controls") end)
    update_input_area("window-controls-title", state.wc_visible, "windowcontrols_title", function() mp.enable_key_bindings("window-controls-title", "allow-vo-dragging") end)
    update_input_area("window-controls-ontop", state.wc_visible, "windowcontrols_ontop", function() mp.enable_key_bindings("window-controls-ontop") end)

    -- autohide
    local function run_autohide(showtime_key, hide_fn, input_areas)
        local hide_timeout = get_hidetimeout()
        if state[showtime_key] == nil or hide_timeout < 0 then return end
        local timeout = state[showtime_key] + (hide_timeout / 1000) - now
        if timeout <= 0 and get_touchtimeout() <= 0 then
            -- a hold in the bottom bar should not prevent the top bar from hiding, and vice versa.
            local element_blocks_hide = state.active_element ~= nil and mouse_in_area(input_areas)
            if not element_blocks_hide and (not user_opts.keep_with_cursor or not mouse_in_area(input_areas)) then
                hide_fn()
            end
        else
            if not state.hide_timer then
                state.hide_timer = mp.add_timeout(0, tick)
            end
            if timeout < state.hide_timer.timeout then
                state.hide_timer.timeout = timeout
                state.hide_timer:kill()
                state.hide_timer:resume()
            end
        end
    end

    local osc_areas = {"input"}
    local wc_areas  = {"window-controls", "window-controls-title", "window-controls-ontop"}
    if not user_opts.windowcontrols_independent then
        osc_areas = {"input", "window-controls", "window-controls-title", "window-controls-ontop"}
        wc_areas = osc_areas
    end

    if state.hide_timer then state.hide_timer.timeout = math.huge end
    if not state.keeponpause_active then
        run_autohide("showtime", hide_osc, osc_areas)
    end
    run_autohide("wc_showtime", hide_wc, wc_areas)

    -- actual rendering
    local ass = assdraw.ass_new()

    if state.osc_visible or state.wc_visible then
        render_elements(ass, state.osc_visible, state.wc_visible)
    end

    if user_opts.persistent_progress or state.persistent_progress_toggle then
        render_persistent_progress(ass)
    end

    -- submit
    set_osd(state.osd, osc_param.playresy * osc_param.display_aspect, osc_param.playresy, ass.text, 1000)
end

-- called by mpv on every frame
tick = function()
    if state.marginsREQ == true then
        update_margins()
        state.marginsREQ = false
    end

    if not state.enabled then return end

    if state.idle_active then
        msg.trace("idle message")
        if user_opts.idlescreen then
            local display_aspect = state.osd_dimensions.aspect
            if display_aspect == 0 then return end
            local display_h = 360
            local display_w = display_h * display_aspect
            -- logo is rendered at 2^(6-1) = 32 times resolution with size 1800x1800
            local icon_x, icon_y = (display_w - 1800 / 32) / 2, 140
            local line_prefix = ("{\\rDefault\\an7\\1a&H00&\\bord0\\shad0\\pos(%f,%f)}"):format(icon_x, icon_y)

            local ass = assdraw.ass_new()
            -- mpv logo
            for _, line in ipairs(logo_lines) do
                ass:new_event()
                ass:append(line_prefix .. line)
            end

            -- Santa hat
            if is_december and not user_opts.greenandgrumpy then
                for _, line in ipairs(santa_hat_lines) do
                    ass:new_event()
                    ass:append(line_prefix .. line)
                end
            end

            ass:new_event()
            ass:pos(display_w / 2, icon_y + 65)
            ass:an(8)
            ass:append("{\\fs24\\1c&HFFFFFF&}" .. locale.idle)
            set_osd(state.logo_osd, display_w, display_h, ass.text, -1000)
        end

        if state.osc_visible then
            osc_visible(false)
        end

        if window_controls_enabled() then
            render()
        else
            render_wipe(state.osd)
            if state.showhide_enabled then
                mp.disable_key_bindings("showhide")
                mp.disable_key_bindings("showhide_wc")
                state.showhide_enabled = false
            end
        end
    elseif (state.fullscreen and user_opts.showfullscreen) or (not state.fullscreen and user_opts.showwindowed) then
        render_wipe(state.logo_osd)
        render()
    else
        -- Flush OSD
        render_wipe(state.osd)
        render_wipe(state.logo_osd)
    end

    state.tick_last_time = mp.get_time()

    local function tick_animation(anitype_key, anistart_key, animation_key, allow_idle)
        if state[anitype_key] ~= nil then
            if (allow_idle or not state.idle_active) and
               (not state[anistart_key] or
                mp.get_time() < 1 + state[anistart_key] + user_opts.fadeduration / 1000)
            then
                request_tick()
            else
                kill_animation(anitype_key, anistart_key, animation_key)
            end
        end
    end
    tick_animation("anitype",    "anistart",    "animation")
    tick_animation("wc_anitype", "wc_anistart", "wc_animation", window_controls_enabled())
end

local function set_tick_delay(_, display_fps)
    -- may be nil if unavailable or 0 fps is reported
    if not display_fps or not user_opts.tick_delay_follow_display_fps then
        tick_delay = user_opts.tick_delay
        return
    end
    tick_delay = 1 / display_fps
end

mp.register_event("shutdown", function()
    reset_margins()
    mp.del_property("user-data/osc")
end)
mp.register_event("file-loaded", function()
    is_image() -- check if file is an image
    state.file_loaded = true
    check_path_url()
    local oos = user_opts.osc_on_start
    if oos == "bottom" or oos == "both" then show_osc() end
    if oos == "top" or oos == "both" then show_wc() end
end)
mp.register_event("start-file", function()
    -- reset ab loop on new file start
    mp.set_property("ab-loop-a", "no")
    mp.set_property("ab-loop-b", "no")
    request_init()
end)
mp.observe_property("track-list", "native", update_tracklist)
observe_cached("playlist-count", request_init)
observe_cached("playlist-pos-1", request_init)
observe_cached("chapter-list", function ()
    state.chapter_list = state.chapter_list or {}
    table.sort(state.chapter_list, function(a, b) return a.time < b.time end)
    request_init()
end)
observe_cached("duration", function ()
    if user_opts.automatickeyframemode then
        user_opts.seekbarkeyframes = (state.duration or 0) > user_opts.automatickeyframelimit
    end
    if user_opts.livemarkers and state.chapter_list[1] then
        request_init()
    end
end)
mp.register_event("seek", function()
    if state.file_loaded then
        state.file_loaded = false
        return
    end
    if user_opts.osc_on_seek and not (state.file_loop and mp.get_property_number("time-pos", -1) == 0) then
        show_osc()
    end
end)
mp.observe_property("seeking", "native", function(_, seeking)
    if user_opts.osc_on_seek then
        reset_timeout()
    end
end)
observe_cached("fullscreen", function ()
    state.marginsREQ = true
    request_init_resize()
end)
observe_cached("border", request_init_resize)
observe_cached("title-bar", request_init_resize)
observe_cached("window-maximized", request_init_resize)
observe_cached("idle-active", request_tick)
mp.observe_property("user-data/mpv/console/open", "bool", function(_, val)
    if val and user_opts.visibility == "auto" and not user_opts.showonselect and not state.keeponpause_active then
        -- clear pending thumbnail
        if thumbfast.width ~= 0 and thumbfast.height ~= 0 then
            mp.commandv("script-message-to", "thumbfast", "clear")
        end
        osc_visible(false)
        wc_visible(false)
    end
end)
mp.observe_property("display-fps", "number", set_tick_delay)
observe_cached("demuxer-cache-state", request_tick)
mp.observe_property("vo-configured", "bool", request_tick)
mp.observe_property("playback-time", "number", request_tick)
observe_cached("osd-dimensions", request_init_resize)
observe_cached("osd-scale-by-window", request_init_resize)
mp.observe_property("touch-pos", "native", handle_touch)
observe_cached("volume", request_tick)
observe_cached("mute", request_tick)
observe_cached("eof-reached", request_tick)
observe_cached("ontop", request_init)
observe_cached("speed", request_tick)
observe_cached("chapter", request_tick)
-- ensure compatibility with auto loop scripts
mp.observe_property("loop-file", "bool", function(_, val)
    state.file_loop = (val ~= false)
end)
mp.observe_property("sub-pos", "native", function(_, value)
    if value == nil then return end
    if state.osc_adjusted_subpos == nil or value ~= state.osc_adjusted_subpos then
        state.user_subpos = value
    end
end)

-- mouse show/hide bindings
mp.set_key_bindings({
    {"mouse_move",              function() process_event("mouse_move", nil) end},
    {"mouse_leave",             mouse_leave},
}, "showhide", "force")
mp.set_key_bindings({
    {"mouse_move",              function() process_event("mouse_move", nil) end},
    {"mouse_leave",             mouse_leave},
}, "showhide_wc", "force")
do_enable_keybindings()

--mouse input bindings
mp.set_key_bindings({
    {"mbtn_left",           function() process_event("mbtn_left", "up") end,
                            function() process_event("mbtn_left", "down")  end},
    {"shift+mbtn_left",     function() process_event("shift+mbtn_left", "up") end,
                            function() process_event("shift+mbtn_left", "down")  end},
    {"mbtn_right",          function() process_event("mbtn_right", "up") end,
                            function() process_event("mbtn_right", "down")  end},
    {"shift+mbtn_right",    function() process_event("shift+mbtn_right", "up") end,
                            function() process_event("shift+mbtn_right", "down")  end},
    -- alias to shift_mbtn_left for single-handed mouse use
    {"mbtn_mid",            function() process_event("shift+mbtn_left", "up") end,
                            function() process_event("shift+mbtn_left", "down")  end},
    {"wheel_up",            function() process_event("wheel_up", "press") end},
    {"wheel_down",          function() process_event("wheel_down", "press") end},
    {"mbtn_left_dbl",       "ignore"},
    {"shift+mbtn_left_dbl", "ignore"},
    {"mbtn_right_dbl",      "ignore"},
}, "input", "force")
mp.enable_key_bindings("input")

mp.set_key_bindings({
    {"mbtn_left",           function() process_event("mbtn_left", "up") end,
                            function() process_event("mbtn_left", "down")  end},
}, "window-controls", "force")
mp.enable_key_bindings("window-controls")

mp.set_key_bindings({
    {"mbtn_left",           function() process_event("mbtn_left", "up") end,
                            function() process_event("mbtn_left", "down")  end},
}, "window-controls-ontop", "force")
set_virt_mouse_area(0, 0, 0, 0, "window-controls-ontop")

local function always_on(val)
    if state.enabled then
        if val then
            show_osc()
            show_wc()
        else
            hide_osc()
            hide_wc()
        end
    end
end

-- mode can be auto/always/never/cycle
-- the modes only affect internal variables and not stored on its own.
local function visibility_mode(mode, no_osd)
    if mode == "cycle" then
        for i, allowed_mode in ipairs(state.visibility_modes) do
            if i == #state.visibility_modes then
                mode = state.visibility_modes[1]
                break
            elseif user_opts.visibility == allowed_mode then
                mode = state.visibility_modes[i + 1]
                break
            end
        end
    end

    if mode == "auto" then
        always_on(false)
        enable_osc(true)
    elseif mode == "always" then
        enable_osc(true)
        always_on(true)
    elseif mode == "never" then
        enable_osc(false)
    else
        msg.warn("Ignoring unknown visibility mode '" .. mode .. "'")
        return
    end

    user_opts.visibility = mode
    mp.set_property_native("user-data/osc/visibility", mode)

    if not no_osd and tonumber(mp.get_property("osd-level")) >= 1 then
        mp.osd_message("OSC visibility: " .. mode)
    end

    -- Reset the input state on a mode change. The input state will be
    -- recalculated on the next render cycle, except in 'never' mode where it
    -- will just stay disabled.
    mp.disable_key_bindings("input")
    mp.disable_key_bindings("window-controls")
    mp.disable_key_bindings("window-controls-title")
    mp.disable_key_bindings("window-controls-ontop")
    state.input_enabled = false
    state.windowcontrols_buttons = false
    state.windowcontrols_title = false
    state.windowcontrols_ontop = false

    update_margins()
    request_tick()
end

local function idlescreen_visibility(mode, no_osd)
    if mode == "cycle" then
        mode = user_opts.idlescreen and "no" or "yes"
    end

    user_opts.idlescreen = (mode == "yes")

    mp.set_property_native("user-data/osc/idlescreen", user_opts.idlescreen)

    if not no_osd and tonumber(mp.get_property("osd-level")) >= 1 then
        mp.osd_message("OSC logo visibility: " .. tostring(mode))
    end

    request_tick()
end

mp.observe_property("pause", "bool", function(_, enabled)
    state.pause = (enabled == true)
    request_tick()
    if user_opts.showonpause and user_opts.visibility ~= "never" then
        state.enabled = enabled
        if enabled then
            if user_opts.keeponpause == "both" then
                -- save mode and set visibility to "always" temporarily
                if not state.keeponpause_restore and user_opts.visibility ~= "always" then
                    state.keeponpause_restore = user_opts.visibility
                end
                visibility_mode("always", true)
            elseif user_opts.keeponpause == "bottombar" then
                state.keeponpause_active = true
                show_osc()
            else
                show_osc()
            end
        else
            -- clear keeponpause bottombar active state
            state.keeponpause_active = false
            -- restore mode if it was changed by keeponpause=both
            if state.keeponpause_restore then
                visibility_mode(state.keeponpause_restore, true)
                state.keeponpause_restore = nil
            else
                -- respect "always" mode on unpause
                visibility_mode(user_opts.visibility, true)
            end
            -- reset timers so both bars get a fresh hidetimeout on unpause
            local now = mp.get_time()
            if state.osc_visible then state.showtime = now end
            if state.wc_visible then state.wc_showtime = now end
        end
    end
end)

mp.register_script_message("osc-visibility", visibility_mode)
mp.register_script_message("osc-show", show_osc)
mp.register_script_message("osc-hide", function()
    if user_opts.visibility == "auto" then
        hide_osc()
        hide_wc()
    end
end)
mp.add_key_binding(nil, "visibility", function() visibility_mode("cycle") end)
mp.add_key_binding(nil, "progress-toggle", function()
    user_opts.persistent_progress = not user_opts.persistent_progress
    state.persistent_progress_toggle = user_opts.persistent_progress
    request_init()
end)
mp.register_script_message("osc-idlescreen", idlescreen_visibility)
mp.register_script_message("thumbfast-info", function(json)
    local data = utils.parse_json(json)
    if type(data) ~= "table" or not data.width or not data.height then
        msg.error("thumbfast-info: received json didn't produce a table with thumbnail information")
    else
        thumbfast = data
    end
end)

-- validate string type user options
local function validate_user_opts()
    if not language[user_opts.language] then
       msg.warn("language '" .. user_opts.language .. "' not found. Ignoring.")
       user_opts.language = "default"
       if not language["default"] then
          msg.warn("ERROR: can't find the default language or the one set by user_opts.")
       end
    end

    if user_opts.seek_handle_size < 0 then
        msg.warn("seek_handle_size must be 0 or higher. Setting it to 0 (minimum).")
        user_opts.seek_handle_size = 0
    end

    local function validate_string_opt(key, valid, default)
        for _, v in ipairs(valid) do
            if user_opts[key] == v then return end
        end
        msg.warn(key .. " value '" .. tostring(user_opts[key]) .. "' is invalid. Resetting to '" .. default .. "'.")
        user_opts[key] = default
    end
    validate_string_opt("window_top_bar", {"auto", "yes", "no"}, "auto")
    validate_string_opt("volume_control_type", {"linear", "logarithmic"}, "linear")
    validate_string_opt("keeponpause",  {"no", "bottombar", "both"}, "no")
    validate_string_opt("deadzone_hide", {"instant", "timeout"}, "instant")

    local hbc = user_opts.seek_handle_border_color
    if hbc == "disable" then
        hbc = ""
    elseif hbc ~= "" and hbc:find("^#%x%x%x%x%x%x$") == nil then
        msg.warn("'" .. hbc .. "' is not a valid color for seek_handle_border_color, border disabled")
        hbc = ""
    end
    user_opts.seek_handle_border_color = hbc

    local colors = {
        user_opts.osc_color, user_opts.seekbarfg_color, user_opts.seekbarbg_color, user_opts.title_color, user_opts.time_color,
        user_opts.side_buttons_color, user_opts.middle_buttons_color, user_opts.playpause_color, user_opts.window_title_color,
        user_opts.window_controls_color, user_opts.held_element_color, user_opts.thumbnail_box_color, user_opts.chapter_title_color,
        user_opts.seekbar_cache_color, user_opts.hover_effect_color, user_opts.windowcontrols_close_hover, user_opts.windowcontrols_max_hover,
        user_opts.windowcontrols_min_hover, user_opts.cache_info_color, user_opts.thumbnail_box_outline, user_opts.nibble_color,
        user_opts.nibble_current_color, user_opts.seek_handle_color, user_opts.ab_loop_color,
    }

    for _, color in pairs(colors) do
        if color:find("^#%x%x%x%x%x%x$") == nil then
            msg.warn("'" .. color .. "' is not a valid color")
        end
    end

    state.visibility_modes = {}
    for str in string.gmatch(user_opts.visibility_modes, "([^_]+)") do
        if str ~= "auto" and str ~= "always" and str ~= "never" then
            msg.warn("Ignoring unknown visibility mode '" .. str .."' in list")
        else
            table.insert(state.visibility_modes, str)
        end
    end

    if user_opts.keeponpause ~= "no" and not user_opts.showonpause then
        msg.warn("keeponpause requires showonpause. Setting showonpause=yes.")
        user_opts.showonpause = true
    end

    local watch_later = "," .. ((mp.get_property("options/watch-later-options") or ""):gsub("%s+", "")) .. ","
    if user_opts.sub_margins and watch_later:find(",sub-pos,", 1, true) then
        msg.warn("sub_margins conflict: add watch-later-options-remove=sub-pos to mpv.conf")
    end
    if user_opts.osd_margins and watch_later:find(",osd-margin-y,", 1, true) then
        msg.warn("osd_margins conflict: add watch-later-options-remove=osd-margin-y to mpv.conf")
    end
end

-- read options from config and command-line
opt.read_options(user_opts, "modernz", function(changed)
    if changed.language then load_locale_file() end
    validate_user_opts()
    if changed.language then set_osc_locale() end
    set_icon_theme()
    set_osc_styles()
    set_time_styles(changed.timecurrent, changed.timems)
    if changed.tick_delay or changed.tick_delay_follow_display_fps then
        set_tick_delay("display_fps", mp.get_property_number("display_fps"))
    end
    request_tick()
    if changed.visibility then
        visibility_mode(user_opts.visibility, true)
    end
    request_init()
end)

load_locale_file()
validate_user_opts()
set_osc_locale()
set_icon_theme()
set_osc_styles()
set_time_styles(true, true)
set_tick_delay()
visibility_mode(user_opts.visibility, true)

set_virt_mouse_area(0, 0, 0, 0, "input")
set_virt_mouse_area(0, 0, 0, 0, "window-controls")
set_virt_mouse_area(0, 0, 0, 0, "window-controls-title")
