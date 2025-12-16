#import "template.typ": *

#show: resume.with(
  name: "Kirill Bobyrev",
  position: "Software Engineer",
  address: "San Jose, CA",
  phone: "+1 650 772 8428",
  email: "kirillbobyrev@gmail.com",
  website: "kirillbobyrev.com",
  github: "kirillbobyrev",
  linkedin: "kirillbobyrev",
  twitter: "kirillbobyrev",
)

#section("Experience")

#entry(
  organization: "Waymo",
  title: "Software Engineer",
  location: "Mountain View, CA",
  date: "Jun 2022 - Present",
  description: [
    - Building Waymo's simulation platform for autonomous driving validation and testing.
    - Developed and deployed ML models using Diffusion Models and Transformers to generate realistic pedestrian behaviors, improving simulation fidelity.
    - Migrated Neural Network inference from CPU to TPU, achieving 70x latency reduction.
    - Designed distributed data processing pipelines running on thousands of nodes.
  ],
)

#entry(
  organization: "Google",
  title: "Software Engineer",
  location: "Mountain View, CA",
  date: "Nov 2019 - Jun 2022",
  description: [
    - Led development of clangd, the C++ Language Server Protocol implementation used by VS Code, Vim, and other IDEs.
    - Designed and implemented Include Cleaner for detecting unused and missing C++ headers.
    - Built and deployed Remote Index service on Google Cloud, handling 1.5M+ weekly requests with zero startup latency.
    - Drove product direction through user research, roadmap planning, and feature prioritization.
  ],
)

#entry(
  organization: "Handl (Y Combinator)",
  title: "Data Scientist",
  date: "Feb 2019 - Jun 2019",
  description: [
    - Secured contract with Mercedes-AMG by translating business requirements into ML solutions.
    - Built Deep Learning models for image segmentation, video classification, and OCR using PyTorch and TensorFlow.
  ],
)

#entry(
  organization: "Google",
  title: "Software Engineering Intern",
  date: "Jul 2018 - Sep 2018",
  description: [
    - Designed Dex, a search index achieving 15x-60x faster code completion (16ms → 1ms for 3M LOC codebase).
    - Implemented VByte compression reducing memory usage by 60% with no performance loss.
  ],
)

#entry(
  organization: "Google",
  title: "Software Engineering Intern",
  date: "Jun 2016 - Sep 2016",
  description: [
    - Improved Clang-Rename performance and added template class support.
    - Prototyped Clang-Refactor, which became Clang's official Refactoring Engine.
    - Initiated Language Server Protocol discussion that led to clangd creation.
  ],
)

#entry(
  organization: "Google Summer of Code",
  title: "Open Source Developer",
  date: "Jun 2015 - Sep 2015",
  description: [
    - Implemented Code Clone Detection in Clang Static Analyzer, detecting 400+ code duplicates across Git, Vim, and OpenSSL.
  ],
)

#section("Skills")

#skill("Languages", "C++, Python, Rust, SQL")
#skill(
  "ML/AI",
  "PyTorch, TensorFlow, Transformers, Diffusion Models, LLMs, TPU",
)
#skill(
  "Systems",
  "Distributed Systems, Compilers, Cloud Infrastructure (GCP), Linux",
)

#section("Publications")

#entry(
  organization: "LLVM Developers' Meeting",
  title: "Lightning Talk: Dex - Efficient Symbol Index for clangd",
  location: "San Jose, CA",
  date: "2018",
)

#entry(
  organization: "LLVM Developers' Meeting",
  title: "Poster: Code Clone Detection in Clang Static Analyzer",
  location: "San Jose, CA",
  date: "2015",
)

#section("Projects")

#entry(
  organization: "AGI House Hackathon",
  title: "Second Place Winner",
  date: "2025",
  description: [
    - Implemented most efficient Prefix Scan algorithm for ML accelerators using Mojo.
  ],
)

#entry(
  organization: "LLVM/Clang",
  title: "Open Source Contributor",
  date: "2015 - Present",
  description: [
    - Active contributor to clangd, Clang-Tidy, and Clang Static Analyzer. Featured in LLVM Weekly.
  ],
)

#section("Education")

#entry(
  organization: "Moscow Institute of Physics and Technology",
  title: "B.S. in Mathematics and Physics",
  date: "Sep 2014 - Jul 2019",
)
