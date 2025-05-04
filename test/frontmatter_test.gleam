import frontmatter
import gleam/option
import gleeunit
import gleeunit/should

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn no_matter_test() {
  "Hello, Joe!"
  |> frontmatter.extract
  |> should.equal(frontmatter.Extracted(option.None, "Hello, Joe!"))
}

pub fn open_extra_test() {
  "----
too many - on first line
---
Hello, Joe!"
  |> frontmatter.extract
  |> should.equal(frontmatter.Extracted(
    option.None,
    "----
too many - on first line
---
Hello, Joe!",
  ))
}

pub fn only_open_test() {
  "---
Hello, Joe!"
  |> frontmatter.extract
  |> should.equal(frontmatter.Extracted(option.None, "---\nHello, Joe!"))
}

pub fn empty_test() {
  "---
---
Hello!"
  |> frontmatter.extract
  |> should.equal(frontmatter.Extracted(option.Some(""), "Hello!"))
}

pub fn extract_test() {
  "---
do
ray
me
---
one
two
three
"
  |> frontmatter.extract
  |> should.equal(frontmatter.Extracted(
    option.Some("do\nray\nme\n"),
    "one\ntwo\nthree\n",
  ))
}

pub fn windows_test() {
  "---\r\ndo\r\nray\r\n---\r\none\r\ntwo\r\n"
  |> frontmatter.extract
  |> should.equal(frontmatter.Extracted(
    option.Some("do\r\nray\r\n"),
    "one\r\ntwo\r\n",
  ))
}
