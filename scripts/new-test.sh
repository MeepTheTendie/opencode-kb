#!/bin/bash
# Usage: ./new-test.sh <test-name>
# Creates a new test file with Vitest + React Testing Library template

TEST_NAME=${1:-"test"}
FILE_NAME="src/app/${TEST_NAME}.test.tsx"

cat > "$FILE_NAME" << 'EOF'
import { render, screen } from '@testing-library/react'
import { describe, it, expect } from 'vitest'

describe('TEST_NAME', () => {
  it('renders successfully', () => {
    render(<div>TEST_NAME works</div>)
    expect(screen.getByText('TEST_NAME works')).toBeInTheDocument()
  })
})
EOF

echo "Created: $FILE_NAME"
