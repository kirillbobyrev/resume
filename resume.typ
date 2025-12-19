#import "template.typ": *

#show: resume.with(
  name: "Kirill Bobyrev",
  address: "San Jose, CA",
  phone: "+1 650 772 8428",
  email: "kirillbobyrev@gmail.com",
  website: "kirillbobyrev.com",
  github: "kirillbobyrev",
  linkedin: "kirillbobyrev",
)

#section("Experience")

#entry(
  organization: "Waymo",
  title: "Software Engineer",
  date: "Jun 2022 - Present",
  description: [
    - Building Waymo's simulation platform for autonomous driving simulation,
      which enables training and testing the software in safety-critical scenarios
      and conditions.
    - Developed and deployed Diffusion and Transformer-based models to generate
      realistic pedestrian and vehicle appearance, improving simulation fidelity.
    - Migrated and maintained Neural Network inference from CPU to TPU,
      achieving 70x latency reduction.
    - Designed distributed data processing pipelines running on thousands of
      nodes to efficiently handle petabytes of simulation data.
  ],
)

#entry(
  organization: "Google",
  title: "Software Engineer",
  date: "Nov 2019 - Jun 2022",
  description: [
    - Led development of multiple
      #link("https://clangd.llvm.org/features")[clangd] (C++ Language Server
      Protocol implementation) features (code completion, renaming, refactoring
      support).  clangd is used by *millions of Open Source developers* in IDEs
      like VSCode (2.3 million downloads), CLion, and all of Google's internal
      users (50k+ developers).
    - Designed and implemented Include Cleaner for detecting unused and missing
      C++ headers. This is notoriously difficult problem in C++ and has been a
      long-standing issue in the C++ community. Solving it has helped Google
      save *millions of dollars* by significantly reducing the build times.
    - Built and deployed
      #link("https://linux.clangd-index.chromium.org/")[clangd Remote Index] on
      for Chrome developers, handling 1.5M+ weekly requests with zero startup
      latency and accelerating the development cycle for 1000+ developers.
    - Drove product direction through user research, roadmap planning, and
      feature prioritization.
  ],
)

#entry(
  organization: "Handl (YC-backed)",
  title: "Data Scientist",
  date: "Feb 2019 - Jun 2019",
  description: [
    - Secured contract with Mercedes-AMG by translating business requirements into ML solutions.
    - Built Deep Learning models for image segmentation, video classification,
      and OCR using PyTorch.
  ],
)

#entry(
  organization: "Google / LLVM",
  title: "Software Engineering Intern / Open Source maintainer and developer",
  date: "Jun 2015 - Sep 2018",
  description: [
    - Designed Dex, a search index achieving *15x-60x faster code completion*
      (critical path, 16ms → 1ms for 3M lines of code codebase).
    - Implemented VByte compression reducing *memory usage by 60%*
      with no performance loss.
    - Improved
      #link("https://releases.llvm.org/10.0.0/tools/clang/tools/extra/docs/clang-rename.html")[Clang-Rename]
      performance and added support for complicated C++ features.
    - Prototyped
      #link("https://clang.llvm.org/docs/RefactoringEngine.html")[Clang-Refactor],
      which became Clang's official Refactoring Engine.
    - Designed and implemented Code Clone Detection tooling, finding
      #link("https://github.com/kirillbobyrev/code-clone-detection-llvm-devmtg15-poster?tab=readme-ov-file#similar-pieces-of-code-found-using-proposed-technique")[400+
        code duplicates] across Git, Vim, and OpenSSL.
  ],
)

#section("Publications and Talks")

#entry(
  organization: "Zapusk Zavtra",
  title: [
    Podcast episode:
    #link(
      "https://podcasts.apple.com/ru/podcast/%D0%B2%D0%B0%D1%88-%D1%80%D0%BE%D0%B1%D0%BE%D0%B2%D0%BE%D0%B4%D0%B8%D1%82%D0%B5%D0%BB%D1%8C-%D0%BF%D1%80%D0%B8%D0%B1%D1%8B%D0%BB-%D0%BA%D0%B0%D0%BA-%D1%83%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%BE-%D0%B1%D0%B5%D1%81%D0%BF%D0%B8%D0%BB%D0%BE%D1%82%D0%BD%D0%BE%D0%B5-%D1%82%D0%B0%D0%BA%D1%81%D0%B8/id1488945593?i=1000737534976&l=en-GB",
    )["The
      future of Self-Driving Cars"]
  ],
  date: "2025",
  description: [
    Discussing self-driving industry as an expert guest in the episode of the
    #link("https://libolibo.ru/zapuskzavtra")[most popular Tech podcast] in
    Russian language.
  ],
)

#entry(
  organization: "LLVM Developers' Meeting",
  title: [
    Lightning Talk:
    #link("https://youtu.be/VhxrFor3VyQ?si=MVBHQzfQhSmzTF7K")["Dex - Efficient
      Symbol Index for clangd"]
  ],
  date: "2018",
)

#entry(
  organization: "LLVM Developers' Meeting",
  title: [
    Poster:
    #link("https://github.com/kirillbobyrev/code-clone-detection-llvm-devmtg15-poster/blob/main/poster.pdf")["Code
      Clone Detection in Clang Static Analyzer"]
  ],
  date: "2015",
)

#section("Projects")

#entry(
  organization: [
    #link("https://app.agihouse.org/events/modular-hackathon-20250510")[Modular
      GPU Kernel Hackathon] at #link("https://app.agihouse.org/")[AGI House]
  ],
  title: "Second Place Winner",
  date: "2025",
  description: [
    Implemented efficient Prefix Scan algorithm in Mojo, received an award
    from Chris Lattner, the CEO of Modular and LLVM creator.
  ],
)

#entry(
  organization: "LLVM/Clang",
  title: "Open Source Maintainer",
  date: "2015 - Present",
  description: [
    Active maintainer of clangd and Clang-Tidy modules. Regularly featured in
    LLVM Weekly, which covers important contributions.
  ],
)

#section("Education")

#entry(
  organization: "Moscow Institute of Physics and Technology",
  title: "B.S. in Mathematics and Physics",
  date: "Sep 2014 - Jul 2019",
)
