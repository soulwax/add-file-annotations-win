# Project Structure Support

This document outlines which files and directories are processed or skipped by the path annotator in different project types.

## Core Project Files

```sh
project_root/
├── main.ps1              ✅ Entry point
├── comment-types.ps1     ✅ Language definitions
├── path-filters.ps1      ✅ Path filters
├── filter-utils.ps1      ✅ Utilities
├── package.json          ✅ Will be skipped
├── tsconfig.json         ✅ Will be skipped
└── README.md             ✅ Will be skipped
```

## Web Development

### React/Next.js/Vue

```sh
project_root/
├── src/                 ✅ Processed
│   ├── components/      ✅ Processed
│   ├── pages/           ✅ Processed
│   ├── hooks/           ✅ Processed
│   └── types/           ✅ Processed
├── public/              ❌ Skipped
├── .next/               ❌ Skipped
├── node_modules/        ❌ Skipped
└── dist/                ❌ Skipped
```

## Mobile Development

### React Native

```sh
project_root/
├── src/                ✅ Processed
├── android/             ❌ Skipped
│   ├── app/             ❌ Skipped
│   └── build/           ❌ Skipped
├── ios/                 ❌ Skipped
│   ├── Pods/            ❌ Skipped
│   └── build/           ❌ Skipped
└── node_modules/        ❌ Skipped
```

### Flutter

```sh
project_root/
├── lib/                 ✅ Processed
│   ├── screens/         ✅ Processed
│   ├── widgets/         ✅ Processed
│   └── models/          ✅ Processed
├── android/             ❌ Skipped
├── ios/                 ❌ Skipped
├── build/               ❌ Skipped
├── .dart_tool/          ❌ Skipped
└── pubspec.yaml         ✅ Will be skipped
```

## Backend Development

### Node.js/Python/Java

```sh
project_root/
├── src/                 ✅ Processed
│   ├── controllers/     ✅ Processed
│   ├── models/          ✅ Processed
│   ├── routes/          ✅ Processed
│   └── services/        ✅ Processed
├── tests/               ❌ Skipped
├── dist/                ❌ Skipped
├── build/               ❌ Skipped
└── node_modules/        ❌ Skipped
```

## Desktop Applications

### Electron/Qt/C++

```sh
project_root/
├── src/                 ✅ Processed
│   ├── main/            ✅ Processed
│   └── renderer/        ✅ Processed
├── include/             ✅ Processed
├── build/               ❌ Skipped
├── bin/                 ❌ Skipped
└── obj/                 ❌ Skipped
```

## Common Skipped Patterns

### Build & Output

- `build/`, `dist/`, `out/`
- `bin/`, `obj/`, `lib/`
- `.next/`, `.nuxt/`, `.output/`
- `release/`, `debug/`

### Dependencies

- `node_modules/`
- `vendor/`
- `packages/`
- `bower_components/`
- `pip-cache/`
- `cargo/`

### IDE & Editor

- `.idea/` (JetBrains)
- `.vs/` (Visual Studio)
- `.vscode/` (VS Code)
- `.eclipse/`
- `.settings/`

### Generated Files

- `*.min.*`
- `*.generated.*`
- `*.g.*`
- `*.designer.*`
- `*.bundle.*`
- `*.d.ts`
- `*.map`

### Testing

- `__tests__/`
- `__mocks__/`
- `coverage/`
- `cypress/`
- `playwright/`

### Mobile Specific

- `Pods/` (iOS)
- `*.xcworkspace/`
- `*.xcodeproj/`
- `*.gradle/`
- `Flutter/generated/`

### Documentation

- `docs/generated/`
- `api-docs/`
- `javadoc/`

For the complete list of patterns, see `path-filters.ps1`.
