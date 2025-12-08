// Simple but elegant Typst resume template
// Author: Kirill Bobyrev
// License: MIT

#let header-color = rgb("#2C3E50")
#let section-color = rgb("#C0504D")
#let text-color = rgb("#2C3E50")
#let link-color = rgb("#2C3E50")
#let subtle-gray = rgb("#555555")

// Main resume function
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
  body
) = {
  // Set document properties
  set document(author: name, title: name + " - Resume")
  
  // Page setup
  set page(
    paper: "a4",
    margin: (left: 1cm, right: 1cm, top: 0.5cm, bottom: 0.5cm),
    footer: context [
      #set text(9pt, fill: text-color)
      #set align(center)
      #grid(
        columns: (1fr, 1fr, 1fr),
        align: (left, center, right),
        [#datetime.today().display("[day]/[month]/[year]")],
        [#name · Résumé],
        [#counter(page).display()]
      )
    ]
  )
  
  // Typography settings
  set text(
    font: ("Lato", "DejaVu Sans"),
    size: 11pt,
    fill: text-color,
    fallback: true
  )
  
  set par(
    justify: false,
    leading: 0.65em,
  )
  
  // Link styling - only underline, don't change color (we'll handle color per-link)
  show link: it => {
    set text(fill: link-color)
    it
  }
  
  // Header with name and contact info
  align(center)[
    #block(above: 0pt, below: 0pt)[
      #text(
        size: 32pt,
        weight: "bold",
        fill: header-color,
        name
      )
    ]
    
    #v(0.3em)
    
    #text(
      size: 14pt,
      fill: text-color,
      position
    )
    
    #v(0.2em)
    
    #text(
      size: 11pt,
      fill: text-color,
      address
    )
    
    #v(0.3em)
    
    #text(size: 9pt, fill: text-color)[
      #if phone != "" [
        📱 #link("tel:" + phone)[#phone]
      ]
      #if phone != "" and email != "" [ | ]
      #if email != "" [
        ✉ #link("mailto:" + email)[#email]
      ]
      #if (phone != "" or email != "") and website != "" [ | ]
      #if website != "" [
        🌐 #link("https://" + website)[#website]
      ]
      #if website != "" and github != "" [ | ]
      #if github != "" [
        💻 #link("https://github.com/" + github)[#github]
      ]
      #if github != "" and linkedin != "" [ | ]
      #if linkedin != "" [
        💼 #link("https://www.linkedin.com/in/" + linkedin)[#linkedin]
      ]
      #if linkedin != "" and twitter != "" [ | ]
      #if twitter != "" [
        𝕏 #link("https://x.com/" + twitter)[#twitter]
      ]
    ]
  ]
  
  v(0.6em)
  
  body
}

// Section heading
#let section(title) = {
  v(0.3em)
  block[
    #text(
      size: 16pt,
      weight: "bold",
      fill: section-color,
      title
    )
    #v(0.05em)
    #line(length: 100%, stroke: 0.8pt + section-color)
  ]
  v(0.15em)
}

// Entry for experience/education
#let entry(
  title: "",
  organization: "",
  location: "",
  date: "",
  description: none
) = {
  v(0.3em)
  grid(
    columns: (1fr, auto),
    gutter: 1em,
    [
      #text(size: 13pt, weight: "bold", fill: header-color, organization)
      #if title != "" [
        #linebreak()
        #text(size: 11pt, style: "italic", fill: text-color, title)
      ]
    ],
    [
      #align(right)[
        #text(size: 11pt, fill: text-color, location)
        #if title != "" [
          #linebreak()
          #text(size: 11pt, fill: text-color, date)
        ] else if date != "" [
          #linebreak()
          #text(size: 11pt, fill: text-color, date)
        ]
      ]
    ]
  )
  if description != none [
    #v(0.2em)
    #description
  ]
  v(0.3em)
}

// Skills entry
#let skill(category: "", items: "") = {
  grid(
    columns: (20%, 5%, 75%),
    [#text(weight: "bold", fill: header-color, category)],
    [],
    [#text(fill: text-color, items)]
  )
  v(0.2em)
}
