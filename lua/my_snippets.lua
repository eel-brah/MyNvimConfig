local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node

ls.add_snippets("cpp", {
	s(
		"class",
		fmt(
			[[
  class {} {{
    private:
      {}
    public:
      {}();
      {}({}{});
      ~{}();
      {}(const {}& other);
      {}& operator=(const {}& other);
      {}
  }};
  ]],
			{
				i(1, "className"),
				i(2),
				rep(1, "className"),
				rep(1, "className"),
				c(3, { t("const "), t("") }),
				i(4, "std::string& name"),
				rep(1, "className"),
				rep(1, "className"),
				rep(1, "className"),
				rep(1, "className"),
				rep(1, "className"),
				i(5),
			}
		)
	),

	-- t('class '), i(1, 'className') , t(' {'),
	-- t({'', '\tprivate:'}),
	-- t({'', '\t\t'}), i(2),
	-- t({'', '\tpublic:'}),
	-- t({'', '\t\t'}), rep(1, 'className'), t('();'),
	-- t({'', '\t\t'}), rep(1, 'className'), t('(const std::string& name);'),
	-- t({'', '\t\t~'}), rep(1, 'className'), t('();'),
	-- t({'', '\t\t'}), rep(1, 'className'), t('(const classname& other);'),
	-- t({'', '\t\t'}), rep(1, 'className'), t('& operator=(const '), rep(1, 'className'), t('& other);'),
	-- t({'', '\t\t'}), i(3),
	-- t({'','};'})
})
