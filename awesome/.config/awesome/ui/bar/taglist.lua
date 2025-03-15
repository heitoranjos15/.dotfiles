local awful = require('awful')
local wibox = require('wibox')
local taglist_buttons = require('ui.bar.buttons').taglist

local create_taglist = function(s)
    awful.tag.add('1', {
        layout = awful.layout.suit.max.fullscreen,
        screen = s,
    })
    awful.tag.add('2', {
        layout = awful.layout.suit.max,
        screen = s,
    })
    awful.tag.add('3', {
        layout = awful.layout.suit.max,
        screen = s,
    })
    awful.tag.add('4', {
        layout = awful.layout.suit.max,
        screen = s,
    })
    awful.tag.add('5', {
        layout = awful.layout.suit.max,
        screen = s,
    })
    awful.tag.add('6', {
        layout = awful.layout.suit.max,
        screen = s,
    })
    awful.tag.add('7', {
        layout = awful.layout.suit.float,
        screen = s,
    })
    awful.tag.add('8', {
        layout = awful.layout.suit.max,
        screen = s,
    })

    return awful.widget.taglist {
        screen  = s,
        widget = wibox.container.margin,
        filter  = awful.widget.taglist.filter.all,
        layout = wibox.layout.fixed.horizontal,
        buttons = taglist_buttons
    }
end

return create_taglist
