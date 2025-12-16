# resume

This repository contains Typst source code of my resume using a custom, minimal
Typst template.

The output is frequently uploaded to my personal web page and can be found
at <https://kirillbobyrev.com/resume.pdf>.

## Structure

- `template.typ` - The reusable resume template with styling and layout functions
- `resume.typ` - Your resume content (personal information and sections)

## Building

To compile the resume, you need to have [Typst](https://typst.app/) installed.

```bash
typst compile resume.typ
```