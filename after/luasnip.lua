local ls = require('luasnip')

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),
    },
})

ls.add_snippets(nil, {
    cpp = {
        snip({
            trig = 'cp++',
            namr = 'CP Template',
            descr = "Cp template for c++",
        }, {
            [[
            #include <iostream>
            #include <vector>
            using namespace std;

            void solve() {

            }

            int main() {
                int t;
                cin >> t;
                while(t--) {
                    solve();
                }
                return 0;
            }
            ]]
        })
    }
})
