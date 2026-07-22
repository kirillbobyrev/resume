// Color scheme
#let accent-color = rgb("#C0392B")
#let header-color = rgb("#2C3E50")
#let text-color = rgb("#333333")
#let subtle-color = rgb("#7F8C8D")

// Spacing
#let section-gap-before = 0.6em
#let section-gap-after = 0.4em
#let entry-gap = 0.3em
#let desc-gap = 0.15em
#let entry-gap-after = 0.2em

#let section(title) = {
  v(section-gap-before)
  block[
    #text(size: 14pt, weight: "bold", fill: header-color)[#title]
    #h(0.3em)
    #box(width: 1fr, line(length: 100%, stroke: 0.5pt + accent-color))
  ]
  v(section-gap-after)
}

#let entry(
  title: "",
  organization: "",
  location: "",
  date: "",
  description: none,
) = {
  v(entry-gap)
  grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [
      #text(weight: "bold", fill: header-color)[#organization]#if title != "" [#text(fill: subtle-color)[#h(0.5em)#title]]#if location != "" [#h(1fr)#text(fill: subtle-color)[#location]]
    ],
    align(right, if date != "" { text(fill: subtle-color)[#date] }),
  )
  if description != none {
    v(desc-gap)
    set text(size: 9.5pt)
    description
  }
  v(entry-gap-after)
}

#let resume(
  name: "",
  address: "",
  phone: "",
  email: "",
  website: "",
  github: "",
  linkedin: "",
  body,
) = {
  set document(author: name, title: name + " - Resume")

  set page(
    paper: "a4",
    margin: (left: 1.5cm, right: 1.5cm, top: 1cm, bottom: 1cm),
  )

  set text(font: "Inter", size: 10pt, fill: text-color)
  set par(justify: true, leading: 0.6em)
  set list(marker: [•], indent: 0.4em, spacing: 0.5em)
  show link: it => text(fill: header-color, it)

  // Header
  set align(center)
  text(size: 27pt, fill: header-color)[
    #text(weight: "light")[#name.split(" ").first()]
    #text(weight: "bold")[#name.split(" ").slice(1).join(" ")]
  ]

  linebreak()

  {
    let contacts = (
      (text: address),
      (text: phone),
      (text: email, url: "mailto:" + email),
      (text: website, url: "https://" + website),
      (text: "GitHub", url: "https://github.com/" + github),
      (text: "LinkedIn", url: "https://www.linkedin.com/in/" + linkedin),
    )
    contacts
      .filter(c => c.text != "")
      .map(c => if "url" in c { link(c.url, c.text) } else { c.text })
      .join[ #text(fill: luma(180))[|] ]
  }

  linebreak()

  set align(left)
  show link: underline
  body
}
