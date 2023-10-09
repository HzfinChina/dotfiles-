local status_ok, luasnip= pcall(require, 'luasnip')
if not status_ok then
    return
end



luasnip.setup({
  require("luasnip.loaders.from_vscode").lazy_load(),
  require("luasnip.loaders.from_lua").lazy_load({paths="~/.config/nvim/lua/snippets",})
}
)

-- 注意这个必须要在luasnip.setup之后
-- Somewhere in your Neovim startup, e.g. init.lua
luasnip.config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  -- store_selection_keys = "<Tab>",
})
