# [mdpad](https://tshort.github.io/mdpad/) snippets and preview for the Atom editor

Here is an example of an [mdpad](https://tshort.github.io/mdpad/)
file where both the live preview and snippets are used.

![mdpad in action](https://github.com/tshort/atom-mdpad/raw/master/atom-mdpad.gif)


## Live preview

The live preview is adapted from the [atom-html-preview](https://atom.io/packages/atom-html-preview) package.

The default key mapping to toggle the preview is `ctrl-shift-j`.

The preview updates whenever the mdpad file is saved.

Note that the live preview assumes that the base html file is named "mdpad.html".
In the future, I may implement some way to customize that.

This generally works as well as using a local server along with a browser. One
situation that doesn't work is with Modelica models compiled with Emscripten.

Also, note that in your mdpad.html file, all URLs must either be relative
or direct. "Protocol-relative URLs" don't work. These are URLs that leave off
`http:` or `https:`. This is also true of other resources like css files. For
example, [this](http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css)
css file includes a protocol-relative URL.

Another alternative to the live preview is to use Atom to start a server. The
[local-server-express](https://atom.io/packages/local-server-express) package
works nicely for this. Once launched, this will open a browser. Enter a url
something like:

http://localhost:2000/mdpad.html?example.md

You can also use the [Browser Plus](https://atom.io/packages/browser-plus)
package to load this right in Atom. With the live refresh feature, it works much
like the Live Preview.

## Snippets

The following snippets can help fill in mdpad blocks:

- `js` -- JavaScript block
- `jsi` -- JavaScript init block
- `ya` -- YAML block
- `df` -- dForm YAML block
- `em` -- Emblem block
- `emn` -- Emblem normal block

Inside dForm YAML blocks, several additional snippets are available:

- `n` -- Number form element
- `s` -- Select form element
- `c` -- Checkbox form element
- `div` -- div element
- `row` -- div row element
- `col` -- div col element

When in JavaScript blocks, all of the [snippets](https://github.com/atom/language-javascript/blob/master/snippets/language-javascript.cson)
from the [language-javascript](https://github.com/atom/language-javascript) package
are available.

Likewise, when in Emblem blocks, all of the snippets from the [language-emblem](https://github.com/ghempton/language-emblem)
package are available.
