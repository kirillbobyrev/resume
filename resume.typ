// Resume content
// Import the template
#import "template.typ": *

// Apply the resume template
#show: resume.with(
  name: "Kirill Bobyrev",
  position: "Machine Learning Engineer  ·  Software Engineer",
  address: "San Jose, CA, USA",
  phone: "(+1) 650-772-8428",
  email: "kirillbobyrev@gmail.com",
  website: "kirillbobyrev.com",
  github: "kirillbobyrev",
  linkedin: "kirillbobyrev",
  twitter: "kirillbobyrev",
)

// Content
#section("Experience")

#[
This is something about my experience.
]

#section("Education")

#entry(
  title: "Bachelor degree in Mathematics and Physics",
  organization: "Moscow Institute of Physics and Technology",
  location: "",
  date: "July 2019",
)
