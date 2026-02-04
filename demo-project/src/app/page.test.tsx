import { render, screen, fireEvent } from '@testing-library/react'
import { describe, it, expect, vi } from 'vitest'
import Home from './page'

describe('Home', () => {
  it('renders the title', () => {
    render(<Home />)
    expect(screen.getByText('Deployment Automation Demo')).toBeInTheDocument()
  })

  it('renders task input', () => {
    render(<Home />)
    expect(screen.getByPlaceholderText('Add a new task')).toBeInTheDocument()
    expect(screen.getByText('Add')).toBeInTheDocument()
  })

  it('adds a new task', () => {
    render(<Home />)
    const input = screen.getByPlaceholderText('Add a new task')
    const button = screen.getByText('Add')
    
    fireEvent.change(input, { target: { value: 'Test Task' } })
    fireEvent.click(button)
    
    expect(screen.getByText('Test Task')).toBeInTheDocument()
  })

  it('toggles task completion', () => {
    render(<Home />)
    const input = screen.getByPlaceholderText('Add a new task')
    const addButton = screen.getByText('Add')
    
    fireEvent.change(input, { target: { value: 'Toggle Test' } })
    fireEvent.click(addButton)
    
    const checkbox = screen.getByRole('checkbox')
    fireEvent.click(checkbox)
    
    expect(screen.getByText('Toggle Test')).toHaveStyle({ textDecoration: 'line-through' })
  })

  it('deletes a task', () => {
    render(<Home />)
    const input = screen.getByPlaceholderText('Add a new task')
    const addButton = screen.getByText('Add')
    
    fireEvent.change(input, { target: { value: 'Delete Me' } })
    fireEvent.click(addButton)
    
    expect(screen.getByText('Delete Me')).toBeInTheDocument()
    
    const deleteButton = screen.getByText('Delete')
    fireEvent.click(deleteButton)
    
    expect(screen.queryByText('Delete Me')).not.toBeInTheDocument()
  })

  it('displays task count', () => {
    render(<Home />)
    expect(screen.getByText('Tasks: 0')).toBeInTheDocument()
  })
})
