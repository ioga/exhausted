-- Exhausted, the battery status widget for Awesome WM.
--
-- Author: Ilia Glazkov

local io = {popen = io.popen}
local math = {random = math.random, max = math.max, min = math.min}
local string = string
local tonumber = tonumber

local capi = {timer = timer}
local wibox = require('wibox')

module('exhausted')

local function colorize(s, color)
  return string.format('<span foreground="%s"> ↯%s%%</span>', color, s)
end

local function get_battery_percent_left()
  local f = io.popen('acpi -b')
  local data = f:read('*all')
  f:close()

  local state, percent = data:match('Battery 0: ([%a]+), ([%d]+)%%')
  if state ~= 'Discharging' then return end
  return tonumber(percent)
end

local function get_color(percent)
  local color_max = 255
  local green = math.min(percent / 50, 1) * color_max
  local red = (1 - math.max(percent / 50 - 1, 0)) * color_max
  return string.format('#%02x%02x00', red, green)
end

function widget()
  local w = wibox.widget.textbox()

  local timer = capi.timer({timeout = math.random(5, 15)})
  timer:connect_signal('timeout', function()
    local text, percent = '', get_battery_percent_left()
    if percent then
      text = colorize(percent, get_color(percent))
    end

    w:set_markup(text)
  end)
  timer:start()
  timer:emit_signal('timeout')

  return w
end
