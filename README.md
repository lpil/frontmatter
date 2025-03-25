# frontmatter

Extract frontmatter from text documents!

[![Package Version](https://img.shields.io/hexpm/v/frontmatter)](https://hex.pm/packages/frontmatter)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/frontmatter/)

```sh
gleam add frontmatter@1
```
Extract frontmatter from a text document. That is, some content a the very
start of the document that begins and ends with a `---` line.

Here's an example showing what a document with frontmatter could look like.

```markdown
---
# Here is some frontmatter.
# It can contain any format, but in this example TOML is used.
title = "My document"
---
# Hello!

Here is the rest of the document. It can also use any format, but in this
example _markdown_ is used.
```

Both UNIX and Windows style line endings are supported.

Further documentation can be found at <https://hexdocs.pm/frontmatter>.
