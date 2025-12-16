// Professional Typst resume template
// Author: Kirill Bobyrev
// License: MIT

// Color scheme
#let accent-color = rgb("#C0392B")
#let header-color = rgb("#2C3E50")
#let text-color = rgb("#333333")
#let subtle-color = rgb("#7F8C8D")

// Section header with colored prefix
#let section(title) = {
  v(0.6em)
  block[
    #text(size: 14pt, weight: "bold", fill: header-color)[#title]
    #h(0.3em)
    #box(width: 1fr, line(length: 100%, stroke: 0.5pt + luma(200)))
  ]
  v(0.4em)
}

// Generic entry component (works for jobs, education, talks, projects)
#let entry(
  title: "",
  organization: "",
  location: "",
  date: "",
  description: none,
) = {
  v(0.3em)
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [
      #text(weight: "bold", fill: header-color)[#organization]#if title != "" [#text(fill: subtle-color)[#h(0.5em)#title]]#if location != "" [#h(1fr)#text(fill: subtle-color)[#location]]
    ],
    align(right, if date != "" { text(fill: subtle-color)[#date] }),
  )
  if description != none {
    v(0.15em)
    set text(size: 9.5pt)
    description
  }
  v(0.2em)
}

// Main resume template
#let resume(
  name: "",
  address: "",
  phone: "",
  email: "",
  website: "",
  github: "",
  linkedin: "",
  twitter: "",
  body,
) = {
  set document(author: name, title: name + " - Resume")

  set page(
    paper: "a4",
    margin: (left: 1.5cm, right: 1.5cm, top: 1cm, bottom: 1cm),
    footer: context {
      set text(8pt, fill: subtle-color)
      set align(center)
      text[#datetime.today().display()]
    },
  )

  set text(font: "Source Sans Pro", size: 10pt, fill: text-color)
  set par(justify: true, leading: 0.6em)
  show link: it => text(fill: header-color, it)

  // Header
  set align(center)
  text(size: 32pt, fill: header-color)[
    #text(weight: "light")[#name.split(" ").first()]
    #text(weight: "bold")[#name.split(" ").slice(1).join(" ")]
  ]

  linebreak()

  {
    let contacts = (
      (address, none, none),
      (phone, none, none),
      (email, "mailto:" + email, email),
      (website, "https://" + website, website),
      (github, "https://github.com/" + github, "GitHub"),
      (linkedin, "https://www.linkedin.com/in/" + linkedin, "LinkedIn"),
    )
    let render-contact(c) = if c.at(1) == none { c.at(0) } else {
      link(c.at(1), c.at(2))
    }
    contacts
      .filter(c => c.at(0) != "")
      .map(render-contact)
      .join[ #text(fill: luma(180))[|] ]
  }

  linebreak()

  set align(left)
  body
}
