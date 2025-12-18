{ config, pkgs, ... }:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = alpha-nvim;
      type = "lua";
      config = ''
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        
        -- Set custom highlight for dashboard header
        vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#a6e3a1", bg = "NONE", bold = true })
        
        -- Dashboard header 
        dashboard.section.header.val = {
          [[                                                                   ]],
          [[ ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ]],
          [[ ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ]],
          [[ ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ]],
          [[ ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ]],
          [[ ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ]],
          [[ ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ]],
          [[ ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ]],
          [[  ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ]],
          [[                                                                   ]],
        }
        
        -- Apply the custom highlight to the header
        dashboard.section.header.opts.hl = "DashboardHeader"
        
        -- Dashboard buttons
        dashboard.section.buttons.val = {
          dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
          dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
          dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
          dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
          dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
          dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }
        
        -- Center the content
        local function center_content()
          local stats = vim.api.nvim_list_uis()[1]
          local width = stats.width
          local height = stats.height
          
          -- Calculate margins
          local header_height = #dashboard.section.header.val
          local buttons_height = #dashboard.section.buttons.val * 2
          local total_height = header_height + buttons_height + 4
          
          dashboard.section.header.opts.position = "center"
          dashboard.section.buttons.opts.position = "center"
          
          -- Add padding to vertically center
          dashboard.config.layout = {
            { type = "padding", val = math.floor((height - total_height) / 2) },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
          }
        end
        
        center_content()
        
        -- Setup alpha with dashboard only
        alpha.setup(dashboard.opts)

	-- Force Refresh Highlight on ColorScheme Change
        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#a6e3a1", bg = "NONE", bold = true })
          end,
        })
      '';
    }
  ];
}
