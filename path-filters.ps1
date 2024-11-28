# path-filters.ps1
# Configuration file defining path inclusion and exclusion patterns

return @{
    # Exclude patterns - files/folders matching these patterns will be skipped
    exclude = @(
        # Package Management
        '\\node_modules\\',     # Node.js modules
        '\\vendor\\',           # PHP/Composer vendors
        '\\packages\\',         # NuGet packages
        '\\.pub-cache\\',       # Dart/Flutter pub cache
        '\\cocoapods\\',        # iOS CocoaPods
        '\\carthage\\',         # iOS Carthage
        '\\gradle\\',           # Android/Gradle dependencies
        '\\maven\\',            # Maven dependencies
        '\\pip-cache\\',        # Python pip cache
        '\\cargo\\',            # Rust cargo
        '\\bower_components\\', # Bower (legacy)
        
        # Build & Output
        '\\build\\',            # Generic build output
        '\\dist\\',            # Distribution files
        '\\out\\',             # Output directory
        '\\bin\\',             # Binary files
        '\\obj\\',             # Object files
        '\\.next\\',           # Next.js build
        '\\.nuxt\\',           # Nuxt.js build
        '\\.output\\',         # Generic output
        '\\target\\',          # Rust/Maven target
        '\\.dart_tool\\',      # Dart tools
        '\\android\\build\\',  # Android build
        '\\ios\\build\\',      # iOS build
        '\\web\\build\\',      # Web build
        '\\public\\build\\',   # Public assets build
        '\\release\\',         # Release builds
        '\\debug\\',           # Debug builds
        
        # IDE & Editor
        '\\.idea\\',           # JetBrains IDEs
        '\\.vs\\',             # Visual Studio
        '\\.vscode\\',         # VS Code
        '\\.eclipse\\',        # Eclipse
        '\\.settings\\',       # IDE settings
        '\\.project',          # Project files
        '\\.classpath',        # Java classpath
        '\\.metadata\\',       # IDE metadata
        '\\.sublime-*',        # Sublime Text
        
        # Version Control
        '\\.git\\',            # Git directory
        '\\.svn\\',            # SVN directory
        '\\.hg\\',             # Mercurial directory
        '\\.cvs\\',            # CVS directory
        
        # Mobile Development
        '\\Pods\\',            # iOS Pods
        '\\Flutter\\',         # Flutter generated
        '\\.gradle\\',         # Gradle files
        '\\xcuserdata\\',      # Xcode user data
        '\\*.xcworkspace\\',   # Xcode workspace
        '\\*.xcodeproj\\',     # Xcode project
        '\\*.pbxproj',         # Xcode project file
        
        # Generated Code & Assets
        '\\generated\\',       # Generated code directory
        '\\codegen\\',         # Code generation
        '\\autogen\\',         # Auto-generated code
        '\\swagger\\',         # Swagger generated
        '\\protobuf\\',        # Protocol Buffers generated
        '\\graphql\\gen\\',    # GraphQL generated
        '\\__generated__\\',   # Generic generated files
        '\\coverage\\',        # Test coverage reports
        '\\reports\\',         # Various reports
        '\\.sass-cache\\',     # Sass cache
        '\\.parcel-cache\\',   # Parcel bundler cache
        
        # Framework Specific
        '\\migrations\\',      # Database migrations
        '\\seeds\\',           # Database seeds
        '\\storybook-static\\', # Storybook build
        '\\.serverless\\',     # Serverless Framework
        '\\.webpack\\',        # Webpack output
        '\\.angular\\',        # Angular cache
        '\\.cache\\',          # Generic cache
        
        # File Patterns
        '\.min\.',            # Minified files
        '\.generated\.',      # Generated files
        '\.g\.',             # Generated files (alt)
        '\.designer\.',      # Designer files
        '\.Designer\.',      # Designer files (alt)
        '-min\.',            # Minified (alt)
        '\.[0-9]+\.',       # Versioned files
        '\.bundle\.',        # Bundled files
        '\.test\.',         # Test files
        '\.spec\.',         # Spec files
        '\.mock\.',         # Mock files
        '\.d\.ts$',         # TypeScript declaration files
        '\.map$',           # Source maps
        '\.lock$',          # Lock files
        '\.test\.',         # Test files
        '\.stories\.',      # Storybook stories
        '\.module\.css$',   # CSS modules
        '\.chunk\.',        # Chunk files
        '\.backup\.',       # Backup files
        '\.tmp\.',          # Temporary files
        '\.temp\.',         # Temporary files
        '\.bak\.',          # Backup files
        '\.swp$',           # Vim swap files
        '\.env\.',          # Environment files
        '\.local\.',        # Local configuration
        
        # Documentation
        '\\docs\\generated\\',  # Generated docs
        '\\api-docs\\',         # API documentation
        '\\javadoc\\',          # Java documentation
        '\\docfx\\',            # DocFX output
        '\\sphinx\\',           # Sphinx docs
        
        # Deployment & CI
        '\\deploy\\',           # Deployment files
        '\\k8s\\',              # Kubernetes configs
        '\\.github\\',          # GitHub specific
        '\\.gitlab\\',          # GitLab specific
        '\\.circleci\\',        # CircleCI configs
        '\\.jenkins\\',         # Jenkins configs
        '\\terraform\\',        # Terraform files
        '\\helm\\',             # Helm charts
        
        # Testing
        '\\__tests__\\',        # Test directories
        '\\__mocks__\\',        # Mock directories
        '\\__snapshots__\\',    # Jest snapshots
        '\\coverage\\',         # Coverage reports
        '\\test-results\\',     # Test results
        '\\cypress\\',          # Cypress tests
        '\\playwright\\',       # Playwright tests
        '\\selenium\\'          # Selenium tests
    )

    # Include patterns - only files matching these patterns will be processed
    # If empty, all files (except excluded ones) will be processed
    include = @(
        # Uncomment and modify these examples as needed:
        # '\\src\\',             # Source code
        # '\\lib\\',             # Library code
        # '\\app\\',             # Application code
        # '\\components\\',      # React/Vue components
        # '\\pages\\',           # Next.js/Nuxt pages
        # '\\layouts\\',         # Layout components
        # '\\utils\\',           # Utilities
        # '\\hooks\\',           # React hooks
        # '\\services\\',        # Services
        # '\\models\\',          # Data models
        # '\\controllers\\',     # Controllers
        # '\\middleware\\',      # Middleware
        # '\\api\\',             # API endpoints
        # '\\shared\\',          # Shared code
        # '\\common\\',          # Common utilities
        # '\\core\\',            # Core functionality
        # '\\features\\',        # Feature modules
        # '\\modules\\',         # Module system
        # '\\plugins\\',         # Plugin system
        # '\\themes\\',          # Theme system
        # '\\styles\\',          # Styling
        # '\\assets\\',          # Static assets
        # '\\config\\',          # Configuration
        # '\\constants\\',       # Constants
        # '\\types\\',           # TypeScript types
        # '\\interfaces\\',      # Interfaces
        # '\\migrations\\',      # Database migrations
        # '\\scripts\\',         # Build/utility scripts
    )

    # Override patterns - these patterns will be processed even if they match exclude patterns
    override = @(
        # Uncomment and modify these examples as needed:
        # '\\vendor\\our-company\\',     # Our company's vendor code
        # '\\generated\\models\\',        # Important generated models
        # '\\node_modules\\our-scope\\',  # Our scoped packages
        # '\\external\\internal-lib\\',   # Internal libraries
    )
}