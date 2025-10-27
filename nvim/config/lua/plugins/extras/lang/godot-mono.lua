local projectfile = vim.fn.findfile("project.godot", vim.fn.getcwd())

if projectfile == "" then
  return { { import = "plugins.extras.lang.csharp-extended" } }
end

pcall(vim.fn.serverstart, "./godothost")

local function build_baked_files(raw_files)
  local files = {}
  for _, file in ipairs(raw_files) do
    files[file] = true
  end
  return files
end

local baked_list = { "project.godot", "godothost" }
local baked = build_baked_files(baked_list)

local byte = string.byte

local function build_index_from_list(ext_list)
  local allowed_by_len = {}
  for _, ext in ipairs(ext_list) do
    local s = ext
    local n = #s
    local bytes = {}
    for i = 1, n do
      bytes[i] = string.byte(ext, i)
    end
    allowed_by_len[n] = allowed_by_len[n] or {}
    table.insert(allowed_by_len[n], { bytes = bytes, s = s, len = n })
  end
  return allowed_by_len
end

local forbidden_list = { "csproj", "sln", "uid", "import" }
local forbidden_by_length = build_index_from_list(forbidden_list)

local compare_ext_no_alloc = function(name, start, candidate)
  local cb = candidate.bytes
  local clen = candidate.len
  for i = 1, clen do
    local nc = byte(name, start + i - 1)
    if nc ~= cb[i] then
      return false
    end
  end
  return true
end

-- 46 = '.'
local has_forbidden_ext = function(name)
  if baked[name] then
    return true
  end

  if byte(name, 1) == 46 then
    return true
  end

  local name_len = #name
  for i = name_len, 2, -1 do
    if byte(name, i) == 46 then
      local ext_len = name_len - i
      local bucket = forbidden_by_length[ext_len]
      if not bucket then
        return false
      end
      local start = i + 1
      for _, cand in ipairs(bucket) do
        if compare_ext_no_alloc(name, start, cand) then
          return true
        end
      end
      return false
    end
  end
  return false
end

_G.oil_config.view_options.show_hidden = false

_G.oil_config.view_options.is_hidden_file = function(name)
  return has_forbidden_ext(name)
end

return {
  { import = "plugins.extras.lang.csharp-extended" },
  {
    "RanMd/godot-mono.nvim",
    config = function(opts)
      local godot = require("godot-mono")
      godot.setup(opts)

      vim.keymap.set("n", "<leader>gf", "<cmd>GodotRun<CR>", { desc = "Select Godot scene" })

      vim.keymap.set("n", "<leader>gg", "<cmd>GodotRunLast<CR>", { desc = "Run last Godot scene" })

      vim.keymap.set("n", "<leader>gm", "<cmd>GodotRunMain<CR>", { desc = "Run main Godot scene" })
    end,
  },
}
