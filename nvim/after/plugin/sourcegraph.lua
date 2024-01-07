local telescope = require('sg.extensions.telescope');
-- local sg = require('sg');
local cody_commands = require('sg.cody.commands');

vim.keymap.set('n', '<Leader>ss', function() telescope.fuzzy_search_results() end)
vim.keymap.set('n', '<Leader>ca', function() cody_commands.toggle() end)

local endpoint = "https://sourcegraph.com/"
local token = os.getenv("SOURCE_GRAPH_TOKEN")
require("sg.auth").set(endpoint, token)
