local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets('all', {
  -- Client-side snippets
  s('$:', {
    t '$: ',
    i(1, 'variable'),
    t ' = ',
    i(2, 'expression'),
    t ';',
  }, {
    description = 'Create a variable declaration',
    usage = 'Client-side',
  }),

  s('if', {
    t '{#if ',
    i(1, 'condition'),
    t '}',
    t { '', '\t' },
    i(2),
    t { '', '{/if}' },
  }, {
    description = 'Create an if statement',
    usage = 'Client-side',
  }),

  s('each', {
    t '{#each ',
    i(1, 'array'),
    t ' as ',
    i(2, 'item'),
    t '}',
    t { '', '\t' },
    i(3),
    t { '', '{/each}' },
  }, {
    description = 'Create an each loop',
    usage = 'Client-side',
  }),

  s('prop', {
    t 'export let ',
    i(1, 'propName'),
    t ' = ',
    i(2, 'defaultValue'),
    t ';',
  }, {
    description = 'Create a component prop',
    usage = 'Client-side',
  }),

  s('data', {
    t '<script lang="ts">',
    t { '', '\timport type { ' },
    i(1, 'ActionData, PageData'),
    t { ' } from "./$types";', '' },
    t '\texport let ',
    i(2, 'data: PageData;'),
    t { '', '\texport let ' },
    i(3, 'form: ActionData;'),
    t { '', '\tconsole.log(' },
    i(4, 'data, form'),
    t { ');', '' },
    t '</script>',
    t { '', '' },
    i(0),
  }, {
    description = 'Create a component data block',
    usage = 'Client-side',
  }),

  -- Server-side snippets
  s('layoutserver', {
    t "import type { LayoutServerLoad } from './$types';",
    t { '', 'export const load: LayoutServerLoad = async () => {', '\t' },
    i(1, '// Add your logic here'),
    t { '', '\treturn {' },
    i(2),
    t { '};', '};' },
    t { '', '' },
    i(0),
  }, {
    description = 'Create a layout server load function',
    usage = 'Server-side',
  }),

  s('pageload', {
    t "import type { PageLoad } from './$types';",
    t { '', 'export const load: PageLoad = async () => {', '\t' },
    i(1, '// Add your logic here'),
    t { '', '\treturn {' },
    i(2),
    t { '};', '};' },
    t { '', '' },
    i(0),
  }, {
    description = 'Create a page load function',
    usage = 'Server-side',
  }),

  s('api', {
    t "import type { RequestHandler } from './$types';",
    t { '', 'export const ' },
    c(1, {
      t 'GET',
      t 'POST',
      t 'PUT',
      t 'DELETE',
      i(nil, 'METHOD'),
    }),
    t ': RequestHandler = async ({ ',
    i(2, 'request'),
    t ' }) => {',
    t { '', '\t' },
    i(3, 'const body = await request.json();'),
    t { '', '\t// Process the request data' },
    t { '', '\treturn new Response(JSON.stringify({ ' },
    i(4, "success: true, message: 'Data received'"),
    t ' }), { status: ',
    i(5, '200'),
    t ' });',
    t { '', '};' },
    t { '', '' },
    i(0),
  }, {
    description = 'Create a server-side handler',
    usage = 'Server-side',
  }),

  s('actions', {
    t "import type { Actions } from './$types';",
    t { '', '', 'export const actions: Actions = {' },
    t { '', '\tdefault: async ({ request }) => {' },
    t { '', '\t\tconst formData = await request.formData();' },
    t { '', '\t\tconst ' },
    i(1, 'name'),
    t " = formData.get('",
    i(2, 'name'),
    t "');",
    t { '', '', '\t\tconsole.log(`Received ' },
    i(3, 'name'),
    t ': ${',
    i(4, 'name'),
    t '}`);',
    t { '', '', '\t\treturn { success: true, message: `Thank you, ${' },
    i(5, 'name'),
    t '}` };',
    t { '', '\t}' },
    t { '', '};' },
    t { '', '' },
    i(0),
  }, {
    description = 'Create a page server with actions',
    usage = 'Server-side',
  }),
})
