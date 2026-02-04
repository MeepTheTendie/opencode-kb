#!/bin/bash
# Usage: ./setup-tests.sh
# Sets up Vitest + React Testing Library in current directory

echo "Installing Vitest and Testing Library..."

bun add -D vitest @testing-library/react jsdom @testing-library/jest-dom

echo "Creating test setup file..."

mkdir -p src/test

cat > src/test/setup.ts << 'EOF'
import '@testing-library/jest-dom'
import { cleanup } from '@testing-library/react'
import { afterEach } from 'vitest'

afterEach(() => {
  cleanup()
})
EOF

echo "Creating vitest.config.ts..."

cat > vitest.config.ts << 'EOF'
import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'jsdom',
    setupFiles: ['./src/test/setup.ts'],
    include: ['**/*.test.{ts,tsx}'],
    globals: true,
  },
  resolve: {
    alias: {
      '@': resolve(__dirname, './src'),
    },
  },
})
EOF

echo "Updating package.json scripts..."

node -e "
const pkg = require('./package.json');
if (!pkg.scripts.test) {
  pkg.scripts.test = 'vitest';
  pkg.scripts['test:run'] = 'vitest run';
  require('fs').writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
}
"

echo "✅ Vitest setup complete!"
echo "Run: bun run test"
