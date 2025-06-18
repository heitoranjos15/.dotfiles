-- ~/.local/share/nvim/site/pack/schedule/start/schedlocal Popup = require("nui.popup")
--
local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local path_config = os.getenv("HOME") .. "/projects/perfecto.nvim/weekdays.json"

local function pad(str, len)
  return str .. string.rep(" ", len - #str)
end

local function write_json(path, data)
  local encoded = vim.fn.json_encode(data)
  local file = io.open(path, "w")
  if not file then
    vim.notify("Failed to write to " .. path, vim.log.levels.ERROR)
    return
  end
  file:write(encoded)
  file:close()
  vim.notify("Schedule saved to " .. path, vim.log.levels.INFO)
end

local function show_schedule_table(schedule_data)
  local weekdays = {
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  }

  -- Determine number of slots by checking the first day
  local num_slots = #schedule_data["Monday"] or 3

  local headers = {}
  vim.list_extend(headers, weekdays)

  -- Calculate column widths
  local col_widths = {}
  for i, h in ipairs(headers) do
    col_widths[i] = #h
  end

  -- Build rows
  local rows = {}
  for i = 1, num_slots do
    local row = {}
    for _, day in ipairs(weekdays) do
      local activity = schedule_data[day][i] or ""
      table.insert(row, activity)
    end
    table.insert(rows, row)

    -- Update column widths
    for j, val in ipairs(row) do
      col_widths[j] = math.max(col_widths[j], #val)
    end
  end

  -- Helper to build a padded row
  local function build_row(row)
    local parts = {}
    for i, val in ipairs(row) do
      table.insert(parts, pad(val, col_widths[i]))
    end
    return table.concat(parts, " | ")
  end

  -- Final content lines
  local lines = {}
  table.insert(lines, build_row(headers))
  table.insert(lines, string.rep("-", #build_row(headers)))
  for _, row in ipairs(rows) do
    table.insert(lines, build_row(row))
  end

  -- Create and show popup
  local popup = Popup({
    enter = true,
    border = {
      style = "rounded",
    },
    position = "50%",
    size = {
      width = math.max(70, #lines[1]),
      height = #lines + 2,
    },
    buf_options = {
      modifiable = true,
      readonly = false,
    },
  })

  popup:mount()
  local bufnr = popup.bufnr
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)


  local function save_changes()
    local edited_lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    if #edited_lines < 3 then return end

    local new_schedule = {}

    for i = 3, #edited_lines do
      local line = edited_lines[i]
      local columns = vim.split(line, "|", { trimempty = true }) -- trim columns
      if #columns >= 7 then
        for j = 1, 7 do
          local day = weekdays[j]
          new_schedule[day] = new_schedule[day] or {}
          local activity = vim.fn.trim(columns[j]) -- remove leading/trailing spaces
          new_schedule[day][i - 2] = activity ~= "" and activity or "Rest"
        end
      else
        print("Warning: Skipping malformed line " .. i .. ": " .. line)
      end
    end

    -- print("New schedule data:", vim.inspect(new_schedule))
    write_json(path_config, new_schedule)
  end


  vim.keymap.set("n", "<leader>w", save_changes, { buffer = bufnr, silent = true })
  popup:on(event.BufLeave, function()
    save_changes()
    popup:unmount()
  end)
end

local function read_json(path)
  local file = io.open(path, "r")
  if not file then return nil end
  local content = file:read("*a")
  file:close()
  return vim.fn.json_decode(content)
end


local schedule = read_json(path_config)

-- show_schedule_table(schedule)
vim.keymap.set("n", "<leader>ss", function()
  if not schedule then
    vim.notify("No schedule data found. Please create a schedule first.", vim.log.levels.WARN)
    return
  end
  show_schedule_table(schedule)
end, { desc = "Show Weekly Schedule" })
