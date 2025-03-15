local wibox = require("wibox")
local awful = require "awful"
local tasklist_buttons = require('ui.bar.buttons').tasklist


-- update currently focused client name
local update_widget = function (widget)
  local c = client.focus
  if c ~= nil then
    widget.text =  c.text or ""
  else
    widget.text = ""
  end
end

-- create client_name widget instance
local create_widget = function ()
  local widget = wibox.widget {
    widget = wibox.widget.textbox,
    text = "",
    valign = "center",
    align = "center",
  }

  client.connect_signal("focus", function (c)
    update_widget(widget)
  end)
  client.connect_signal("unfocus", function (c)
    update_widget(widget)
  end)
  client.connect_signal("property::name", function (c)
    update_widget(widget)
  end)

  return widget
end

return function (screen)
    return awful.widget.tasklist {
        screen = screen,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        layout = {
            spacing = 5,
            forced_num_cols = 1,
            layout = wibox.layout.grid.horizontal,
        },
        widget_template = {
        {
            {
                {
                    {
                        id     = 'icon_role',
                        widget = wibox.widget.imagebox,
                    },
                    margins = 2,
                    widget  = wibox.container.margin,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 10,
            right = 10,
            widget = wibox.container.margin
        },
        id     = 'background_role',
        widget = wibox.container.background,
    },
}
end

