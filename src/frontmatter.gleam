import gleam/option.{type Option}
import gleam/string

pub type Extracted {
  Extracted(frontmatter: Option(String), content: String)
}

/// Extract frontmatter from a text document. That is, some content a the very
/// start of the document that begins and ends with a `---` line.
///
/// Here's an example showing what a document with frontmatter could look like.
///
/// ```markdown
/// ---
/// # Here is some frontmatter.
/// # It can contain any format, but in this example TOML is used.
/// title = "My document"
/// ---
/// # Hello!
///
/// Here is the rest of the document. It can also use any format, but in this
/// example _markdown_ is used.
/// ```
///
/// Both UNIX and Windows style line endings are supported.
///
pub fn extract(input: String) -> Extracted {
  case input {
    "---\n" <> rest ->
      case string.split_once(rest, on: "\n---\n") {
        Ok(#(frontmatter, content)) ->
          Extracted(frontmatter: option.Some(frontmatter <> "\n"), content:)
        Error(_) -> Extracted(frontmatter: option.None, content: input)
      }
    "---\r\n" <> rest ->
      case string.split_once(rest, on: "\r\n---\r\n") {
        Ok(#(frontmatter, content)) ->
          Extracted(frontmatter: option.Some(frontmatter <> "\r\n"), content:)
        Error(_) -> Extracted(frontmatter: option.None, content: input)
      }
    _ -> Extracted(frontmatter: option.None, content: input)
  }
}
