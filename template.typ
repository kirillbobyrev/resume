// Professional Typst resume template
// Author: Kirill Bobyrev
// License: MIT

// Color scheme
#let accent-color = rgb("#C0392B")
#let header-color = rgb("#2C3E50")
#let text-color = rgb("#333333")
#let subtle-color = rgb("#7F8C8D")

// Section header with colored prefix
#let section(title, prefix-len: 3) = {
  v(0.6em)
  block[
    #text(size: 14pt, weight: "bold")[
      #text(fill: accent-color)[#title.slice(0, calc.min(
        prefix-len,
        title.len(),
      ))]#text(fill: header-color)[#title.slice(calc.min(
        prefix-len,
        title.len(),
      ))]
    ]
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
      #text(weight: "bold", fill: header-color)[#organization]
      #if location != "" [ #h(1fr) #text(
          style: "italic",
          fill: accent-color,
        )[#location]]
      #if title != "" [
        #linebreak()
        #text(
          size: 9pt,
          tracking: 0.05em,
          fill: subtle-color,
        )[#smallcaps[#title]]
      ]
    ],
    align(right, if date != "" { text(size: 9pt, fill: subtle-color)[#date] }),
  )
  if description != none {
    v(0.15em)
    set text(size: 9.5pt)
    description
  }
  v(0.2em)
}

// Skill entry
#let skill(category, items) = {
  grid(
    columns: (22%, 78%),
    column-gutter: 0.5em,
    align(right, text(weight: "bold", fill: header-color)[#category]),
    text(fill: text-color)[#items],
  )
  v(0.15em)
}

// Main resume template
#let resume(
  name: "",
  position: "",
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
      smallcaps[#name · Résumé]
      h(1fr)
      counter(page).display("1 / 1", both: true)
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
      (website, "https://" + website, "Website"),
      (github, "https://github.com/" + github, "GitHub"),
      (linkedin, "https://www.linkedin.com/in/" + linkedin, "LinkedIn"),
      (twitter, "https://x.com/" + twitter, "X"),
    )
    let render-contact(c) = if c.at(1) == none { c.at(0) } else {
      link(c.at(1), c.at(2))
    }
    contacts.filter(c => c.at(0) != "").map(render-contact).join[#text)[|] ]
  }

  linebreak()

  set align(left)
  body
}
