local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local tag_list = require("ui.bar.taglist")
local task_list = require("ui.bar.tasklist")

awful.screen.connect_for_each_screen(function (s)
    s.mywibox = awful.wibar({ position = "top", screen = s })

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)))

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand="none",
        {
            tag_list(s),
            layout = wibox.layout.fixed.horizontal,
            spacing = 10
        },
        {
            task_list(s),
            layout = wibox.layout.fixed.horizontal,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end
)
