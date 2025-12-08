# resume

This repository contains Typst source code of my resume using a custom, minimal
Typst template designed specifically for software/machine learning engineers.

The output is frequently uploaded to my personal web page and can be found
[there](https://kirillbobyrev.com/resume.pdf).

## Structure

- `template.typ` - The reusable resume template with styling and layout functions
- `resume.typ` - Your resume content (personal information and sections)

## Building

To compile the resume, you need to have [Typst](https://typst.app/) installed.

```bash
typst compile resume.typ
```

This will generate `resume.pdf` in the same directory.

## Customization

Edit `resume.typ` to update your personal information and resume content. The template provides these functions:

- `section(title)` - Create a new section heading
- `entry(title, organization, location, date, description)` - Add experience/education entries
- `skill(category, items)` - Add skills with categories
