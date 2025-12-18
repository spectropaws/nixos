{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = bufferline-nvim;
      type = "lua";
      config = ''
        require("bufferline").setup({
          options = {
            offsets = {
              {
                filetype = "neo-tree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
              }
            },
            show_close_icon = true,
            show_buffer_close_icons = true,
            separator_style = "thin", 
          },
          highlights = {
            fill = { bg = "NONE" },
            background = { bg = "NONE" },
            
            -- Active Buffer
            buffer_selected = {
              bg = "NONE",
              bold = true,
              italic = false,
            },
            
            -- Visible (but inactive) Buffers
            buffer_visible = { bg = "NONE" },

            -- Separators (The lines between tabs)
            separator = { bg = "NONE" },
            separator_selected = { bg = "NONE" },
            separator_visible = { bg = "NONE" },
            
            -- The "Indicator" (The vertical bar on the left of the active tab)
            indicator_selected = { bg = "NONE" },
            indicator_visible = { bg = "NONE" },

            -- The "X" Close Button on each tab
            close_button = { bg = "NONE" },
            close_button_selected = { bg = "NONE" },
            close_button_visible = { bg = "NONE" },

            -- The "Modified" circle (if file is unsaved)
            modified = { bg = "NONE" },
            modified_selected = { bg = "NONE" },
            modified_visible = { bg = "NONE" },

	    -- Duplicate File Paths (e.g., services/default.nix)
            duplicate_selected = { bg = "NONE" },
            duplicate_visible = { bg = "NONE" },
            duplicate = { bg = "NONE" },

            -- Pick Mode (If you use <leader>bp)
            pick_selected = { bg = "NONE", bold = true },
            pick_visible = { bg = "NONE" },
            pick = { bg = "NONE" },
            
            -- Truncated markers
            trunc_marker = { bg = "NONE" },

            -- The close button on the far right of the bar
            tab_close = { bg = "NONE" },
          },
        })
        
	-- white underline for bufferline
	vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
	  vim.api.nvim_set_hl(0, "BufferLineFill", { 
                bg = "NONE", 
                fg = "#D0D0D0", -- Color of the underline
                underline = true, -- This draws the line
                sp = "#D0D0D0" -- Special color (needed for underline in some GUIs)
            })
	  end,
	})

        -- Keymaps
        vim.keymap.set('n', '<S-h>', ':BufferLineCyclePrev<CR>', { desc = "Go to previous buffer", silent = true })
        vim.keymap.set('n', '<S-l>', ':BufferLineCycleNext<CR>', { desc = "Go to next buffer", silent = true })
        vim.keymap.set('n', '<S-c>', ':bdelete<CR>', { desc = "Close current buffer", silent = true })
      '';
    }
  ];
}
