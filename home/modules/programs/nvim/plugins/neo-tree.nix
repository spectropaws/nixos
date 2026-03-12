{ pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    nui-nvim
    plenary-nvim
    {
      plugin = neo-tree-nvim;
      type = "lua";
      config = ''
        -- Open neo-tree when nvim is opened with a directory
        vim.api.nvim_create_autocmd("BufEnter", {
          group = vim.api.nvim_create_augroup("NeoTreeStartDir", { clear = true }),
          desc = "Start Neo-tree with directory",
          once = true,
          callback = function()
            local stats = vim.uv.fs_stat(vim.fn.argv(0))
            if stats and stats.type == "directory" then
              require("neo-tree")
            end
          end,
        })

        require("neo-tree").setup({
          sources = { "filesystem", "buffers", "git_status" },
          open_files_do_not_replace_types = { "terminal", "qf" },
          window = {
            position = "left",
            width = 35,
            mappings = {
              ["<space>"] = "none",
              ["l"] = "open",
              ["h"] = "close_node",
              ["Y"] = {
                function(state)
                  local node = state.tree:get_node()
                  vim.fn.setreg("+", node:get_id(), "c")
                end,
                desc = "Copy path to clipboard",
              },
            },
          },
          filesystem = {
            bind_to_cwd = false,
            follow_current_file = { enabled = true },  -- v3 style (table, not bool)
            use_libuv_file_watcher = true,
            filtered_items = {
              hide_dotfiles = false,
              hide_gitignored = true,
            },
          },
        })

         -- White vertical separator line for neo-tree
    	vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { fg = "#D0D0D0", bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#D0D0D0", bg = "NONE" })
            vim.api.nvim_set_hl(0, "VertSplit", { fg = "#D0D0D0", bg = "NONE" })
            vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#D0D0D0", bg = "NONE" })
          end,
	    })


        vim.keymap.set("n", "<leader>e",  "<cmd>Neotree toggle left<CR>",       { desc = "Toggle file tree" })
        vim.keymap.set("n", "<leader>ge", "<cmd>Neotree git_status toggle<CR>", { desc = "Git status tree" })
        vim.keymap.set("n", "<leader>be", "<cmd>Neotree buffers toggle<CR>",    { desc = "Buffer tree" })
      '';
    }
  ];
}
