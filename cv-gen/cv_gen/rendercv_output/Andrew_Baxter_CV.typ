
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Andrew Baxter"
#let locale-catalog-page-numbering-style = context { "Andrew Baxter - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Mar 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-full-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Andrew Baxter

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Cirencester, UK],
  [#box(original-link("mailto:andrew.baxter@ajbtech.io")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)andrew.baxter\@ajbtech.io])],
  [#box(original-link("tel:+44-7825-980301")[#fa-icon("phone", size: 0.9em) #h(0.05cm)07825 980301])],
  [#box(original-link("https://ajbtech.io/")[#fa-icon("link", size: 0.9em) #h(0.05cm)ajbtech.io])],
  [#box(original-link("https://linkedin.com/in/andrewbaxter1")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)andrewbaxter1])],
  [#box(original-link("https://github.com/abax1")[#fa-icon("github", size: 0.9em) #h(0.05cm)abax1])],
)
#connections(connections-list)



== Profile


#one-col-entry(
  content: [A full stack software engineer with 20 years of experience, including business analysis and product management. Passionate about building software solutions from concept to implementation using React for frontend, and Python, Kotlin, Corda, Java, TypeScript and Rust for backend development over a RESTful API. Proficient in deployment using Docker, Kubernetes, AWS, Azure and GCP. Experience with blockchain, machine learning, and IoT. Adept at Agile development practices.]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BSc]],
  middle-content: [
    #strong[Bournemouth University], Business Information Technology
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Sponsored by Panasonic],)
  ],
  right-content: [
    Bournemouth, UK

Sept 1995 – July 1999
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming:] Proficient with #strong[Python], #strong[Kotlin], #strong[Java], #strong[C], #strong[TypeScript], #strong[JavaScript], #strong[Rust], #strong[C\#] and #strong[SQL]]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Frameworks:] React, React Native \(Expo\), FastAPI, Django, Flask, Corda, Dagster, Springboot, Next.JS, Firebase]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[DevOps:] Docker, Kubernetes, AWS, Azure, GCP, Git, GitHub Actions, GitLab, Jenkins, Buildkite]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Blockchain:] Corda, Ethereum, Hyperledger]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Databases:] Postgres, MySQL, MongoDB, DynamoDB, Firestore]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Tools:] Lucidchart, Balsmiq, Linear, Jira]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Languages:] English \(native\)]
)


== Portfolio


#two-col-entry(
  left-content: [
    #strong[Jefferies Bank]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [DevOps Engineer, migrating 200 repositories to GitHub Enterprise.  Building CI\/CD pipelines using GitHub Actions and AWS.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Github Actions, Python, Java, Docker, Kubernetes, AWS],)
  ],
  right-content: [
    London, UK

May 2025 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Commodities Intelligence AI Data Platform \(Armakuni\)]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [AI commodities data platform for the UAE])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Dagster, Python, C\#, TypeScript, Docker, Kubernetes, Azure, and Postgres.],)
  ],
  right-content: [
    London, UK

Nov 2024 – Apr 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Auth0\/AWS Cognito Embedded Single Sign-On]
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Federated identity solution for embedding Sage product])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed federated identity solution for embedding Sage product.],)
  ],
  right-content: [
    Brighton, UK

2022 – 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Telco Roaming Reconciliation \(BCE\) Platform]
  ],
  right-content: [
    London, UK
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Built production-grade solution for roaming reconciliation using Corda blockchain.],[Built React Native mobile app for user interaction with the blockchain.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Secure Contacts Application \(Harper Collins\)]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed secure author contacts database using React, FastAPI, and MongoDB.],)
  ],
  right-content: [
    London, UK

2021 – 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Identity Management Layer \(NCSC CyberFirst\)]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed identity management platform using React, Python, and AWS Cognito.],)
  ],
  right-content: [
    London, UK

2020 – 2021
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Jefferies Bank], Senior DevOps Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Github Actions, Python, Java, Docker, Kubernetes, AWS, Postgres],)
  ],
  right-content: [
    London, UK

Mar 2025 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Armakuni], Senior Software Engineer
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Fullstack developer for an AI commodities intelligence data platform for the UAE.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Dagster, Python, C\#, JavaScript, Docker, Kubernetes, Azure, Postgres],)
  ],
  right-content: [
    London, UK

Nov 2024 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Tandem Technology Solutions], Senior Software Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Led development for blockchain-based data reconciliation platform.],[Technologies: React, Python, Kotlin, JavaScript, Docker, Kubernetes, GCP],[Migrated from Azure to AWS and then to GCP over the lifetime of this project on the client's request],)
  ],
  right-content: [
    London, UK

2022 – 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Sage], Senior Software Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed secure single sign-on embedded capability.],[Technologies: React, Python, FastAPI, Django, Postgres, AWS Cognito],)
  ],
  right-content: [
    Brighton, UK

2022 – 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Harper Collins], Senior Software Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed a secure author contacts database.],[Technologies: React, Python, FastAPI, MongoDB, OAuth 2.0, OpenID Connect, Docker],)
  ],
  right-content: [
    London, UK

2021 – 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Zaizi Ltd], Senior Software Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Led development for identity management software for NCSC CyberFirst.],[Technologies: React, Python, Flask, AWS Cognito, MySQL, DynamoDB, Lambda],)
  ],
  right-content: [
    London, UK

2020 – 2021
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Fifth9 Ltd], Senior Consultant - Full Stack Developer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed blockchain projects and consulted for telco and GDPR teams.],[Technologies: React, Python, Kotlin, Java, AWS, Docker, Kubernetes],)
  ],
  right-content: [
    London, UK

2017 – 2020
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Vodafone], IoT Business Analyst
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Managed business requirements for Vodafone’s IoT product portfolio.],)
  ],
  right-content: [
    Newbury, Berkshire, UK

2013 – 2017
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Nokia], Product Owner
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Managed the Social Phonebook software product and led technical discussions with Facebook and Twitter.],)
  ],
  right-content: [
    Farnborough, UK

2009 – 2011
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Nokia], Nokia S40 Camera Software Team Leader
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Led a team responsible for camera software driver development.],)
  ],
  right-content: [
    Farnborough, UK

2008 – 2009
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Nokia], Embedded Software Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed embedded software for the IrDA protocol stack and S40 camera systems.],)
  ],
  right-content: [
    Farnborough, UK

2003 – 2008
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Panasonic], Embedded Software Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed LLC layer for the GPRS protocol stack.],)
  ],
  right-content: [
    Thatcham, Berkshire, UK

1999 – 2003
  ],
)



