// Simple but elegant Typst resume template
// Author: Kirill Bobyrev
// License: MIT

#let header-color = rgb("#2C3E50")
#let section-color = rgb("#C0504D")
#let text-color = rgb("#2C3E50")
#let link-color = rgb("#2C3E50")
#let subtle-gray = rgb("#555555")

// Helper function to build contact links
#let contact-link(icon, url, text, show-separator) = {
  if text != "" [
    #if show-separator [ | ]
    #icon #link(url)[#text]
  ]
}

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
  
  // Typography settings - using Roboto
  set text(
    font: ("Roboto", "DejaVu Sans"),
    size: 11pt,
    fill: text-color,
    fallback: true
  )
  
  set par(
    justify: false,
    leading: 0.65em,
  )
  
  // Link styling
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
      #let items = (
        (icon: "📱", url: "tel:" + phone, text: phone),
        (icon: "✉", url: "mailto:" + email, text: email),
        (icon: "🌐", url: "https://" + website, text: website),
        (icon: "💻", url: "https://github.com/" + github, text: github),
        (icon: "💼", url: "https://www.linkedin.com/in/" + linkedin, text: linkedin),
        (icon: "𝕏", url: "https://x.com/" + twitter, text: twitter),
      ).filter(item => item.text != "")
      
      #items.map(item => [#item.icon #link(item.url)[#item.text]]).join([ | ])
    ]
  ]
  
  v(0.4em)
  
  body
}

// Section heading - tighter spacing
#let section(title) = {
  v(0.2em)
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
  v(0.1em)
}

// Entry for experience/education - tighter spacing
#let entry(
  title: "",
  organization: "",
  location: "",
  date: "",
  description: none
) = {
  v(0.2em)
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
    #v(0.15em)
    #description
  ]
  v(0.2em)
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
