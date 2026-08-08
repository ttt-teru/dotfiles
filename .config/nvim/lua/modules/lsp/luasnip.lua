local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require('luasnip.util.events')
local ai = require('luasnip.nodes.absolute_indexer')
local fmt = require('luasnip.extras.fmt').fmt
local extras = require('luasnip.extras')
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require('luasnip.extras.postfix').postfix

ls.add_snippets('html', {
    s({
        trig = 'html:5',
        name = 'HTML5 Templete',
        dscr = 'Templates for HTML5',
    }, {
        t({
            '<!DOCTYPE html>',
            '<html>',
            '\t<head>',
            '\t\t<meta charset="utf-8">',
            '\t\t<meta name="viewport" content="width=device-width, initial-scale=1">',
            '\t\t<title>',
        }),
        i(1, 'Title'),
        t({ '</title>', '\t</head>', '\t<body>', '\t\t' }),
        i(0),
        t({ '', '\t</body>', '</html>' }),
    }),
    s({
        trig = 'html:react',
        name = 'HTML React Templete',
        dscr = 'HTML Template for React',
    }, {
        t({
            '<!DOCTYPE html>',
            '<html>',
            '\t<head>',
            '\t\t<meta charset="utf-8">',
            '\t\t<meta name="viewport" content="width=device-width, initial-scale=1">',
            '\t\t<title>',
        }),
        i(1, 'Title'),
        t({
            '</title>',
            '\t</head>',
            '\t<body>',
            '\t\t<noscript>You need to enable JavaScript to run this app.</noscript>',
            '\t\t<div id="root"></div>',
            '\t\t<script src="',
        }),
        i(0, './path'),
        t({ '"/>', '\t</body>', '</html>' }),
    }),
})

ls.add_snippets('json', {
    s({
        trig = 'prettier:config',
        name = 'General config for prettier',
        dscr = '',
    }, {
        t({
            '{',
            '\t"arrowParens": "avoid",',
            '\t"bracketSpacing": true,',
            '\t"endOfLine": "lf",',
            '\t"semi": false,',
            '\t"singleQuote": true,',
            '\t"tabWidth": 2,',
            '\t"trailingComma": "none"',
            '}',
        }),
    }),
    s({
        trig = 'eslint:nextjs:config',
        name = 'General eslint config in Next.js',
        dscr = '',
    }, {
        t({
            '{',
            '\t"root": true,',
            '\t"extends": "next",',
            '\t"rules": {',
            '\t\t"no-unused-vars": [',
            '\t\t\t"error",',
            '\t\t\t{',
            '\t\t\t\t"argsIgnorePattern": "^_",',
            '\t\t\t\t"varsIgnorePattern": "^_"',
            '\t\t\t}',
            '\t\t]',
            '\t}',
            '}',
        }),
    }),
})
