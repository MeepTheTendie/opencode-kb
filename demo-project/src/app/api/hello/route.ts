import { NextResponse } from 'next/server'

export async function GET() {
  return NextResponse.json({ 
    message: 'Deployment Automation Demo API',
    timestamp: new Date().toISOString(),
    status: 'operational'
  })
}
