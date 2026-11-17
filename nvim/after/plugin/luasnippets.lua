local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Global snippets
ls.add_snippets('all', {
    s('shebang', {
        t('#!/bin/sh'),
    }),
})

-- Lua snippets
ls.add_snippets('lua', {
    s('fun', {
        t('function '),
        i(1, 'name'),
        t('('),
        i(2, 'args'),
        t(')'),
        t({'', '\t'}),
        i(0),
        t({'', 'end'}),
    }),
})

-- C snippets
ls.add_snippets('cpp', {
    s('for', {
        t('for(uint32_t i = 0; i < '),
        i(1, 'n'),
        t('; i++){'),
        t({'', '\t'}),
        i(0),
        t({'', '}'}),
    }),
})

ls.add_snippets('c', {
    s('for', {
        t('for(uint32_t i = 0; i < '),
        i(1, 'n'),
        t('; i++){'),
        t({'', '\t'}),
        i(0),
        t({'', '}'}),
    }),
})
