# wadah-templates

A monorepo of production-ready templates for modern web and backend development. This repository provides ready-to-use templates for various frameworks and languages, designed to accelerate project setup and enforce best practices.

## Project Structure

```
wadah-templates/
├── apps/
│   ├── backend/
│   │   ├── template-fastapi-ai/      # FastAPI + AI backend template
│   │   ├── template-golang/         # Golang backend template
│   │   └── template-strapi/         # Strapi backend template
│   └── frontend/
│       ├── template-astro/          # Astro frontend template
│       ├── template-nextjs/         # Next.js frontend template
│       ├── template-react-app/      # React SPA template
│       └── template-react-ssr/      # React SSR template
├── configs/                         # Shared configuration files (Docker, CI, linters, etc.)
├── .github/                         # GitHub workflows and issue templates
├── degit.json                       # Template configuration for degit
├── tsconfig.json                    # Shared TypeScript config
└── ...
```

## Usage

1. **Clone this repository**
   ```sh
   git clone https://github.com/raizora/wadah-templates.git
   cd wadah-templates
   ```
2. **Pick a template**
   - Navigate to `apps/backend` or `apps/frontend` and copy the desired template directory to start a new project.
   - Or use tools like [degit](https://github.com/Rich-Harris/degit) with `degit.json` for scaffolding.

3. **Follow the template's README**
   - Each template contains its own `README.md` with specific setup and usage instructions.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute to this repository.

## License

Distributed under the MIT License. See `LICENSE` for more information.

---

_Last updated: May 6, 2025_
