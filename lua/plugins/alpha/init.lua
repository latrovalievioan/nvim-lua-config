local M = {
	"goolord/alpha-nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
}

function M.config()
	local headers = require("plugins.alpha.headers")
	local quotes = require("plugins.alpha.quotes")
	local theme = require("alpha.themes.theta")

	-- Header
	local function apply_gradient_hl(text)
		local gradient = require("plugins.alpha.utils").create_gradient("#DCA561", "#658594", #text)

		local lines = {}
		for i, line in ipairs(text) do
			local tbl = {
				type = "text",
				val = line,
				opts = {
					hl = "HeaderGradient" .. i,
					shrink_margin = false,
					position = "center",
				},
			}
			table.insert(lines, tbl)

			-- create hl group
			vim.api.nvim_set_hl(0, "HeaderGradient" .. i, { fg = gradient[i] })
		end

		return {
			type = "group",
			val = lines,
			opts = { position = "center" },
		}
	end

	local function get_header(headers)
		local header_text = headers[math.random(#headers)]
		return apply_gradient_hl(header_text)
	end

	-- Footer
	local function get_footer(quotes)
		local quote_text = quotes[math.random(#quotes)]
		return apply_gradient_hl(quote_text)
	end

	-- MRU
	local function get_mru(max_shown)
		local tbl = {
			{ type = "text", val = "Recent Files", opts = { hl = "SpecialComment", position = "center" } },
		}

		local mru_list = theme.mru(1, "", max_shown)
		for _, file in ipairs(mru_list.val) do
			table.insert(tbl, file)
		end

		return { type = "group", val = tbl, opts = {} }
	end

	-- Layout
	theme.config.layout = {
		{ type = "padding", val = 18 },
		get_header({ headers.panda }),
		{ type = "padding", val = 2 },
		get_mru(7),
		{ type = "padding", val = 3 },
		get_footer({
			quotes.a,
			quotes.b,
			quotes.c,
			quotes.d,
			quotes.e,
			quotes.f,
			quotes.g,
			quotes.h,
			quotes.i,
			quotes.j,
		}),
	}
	require("alpha").setup(theme.config)
end

return M
