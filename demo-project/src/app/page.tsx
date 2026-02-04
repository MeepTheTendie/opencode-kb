'use client'

import { useState, useEffect } from 'react'

interface Task {
  id: number
  title: string
  completed: boolean
}

export default function Home() {
  const [tasks, setTasks] = useState<Task[]>([])
  const [newTask, setNewTask] = useState('')
  const taskCount = tasks.length

  useEffect(() => {
    const checkApi = async () => {
      try {
        const res = await fetch(`${window.location.origin}/api/hello`)
        const data = await res.json()
        console.log('API Response:', data)
      } catch (err) {
        console.error('API Error (expected in test env):', err)
      }
    }
    checkApi()
  }, [])

  const addTask = () => {
    if (newTask.trim()) {
      setTasks([...tasks, { id: Date.now(), title: newTask, completed: false }])
      setNewTask('')
    }
  }

  const toggleTask = (id: number) => {
    setTasks(tasks.map(task => 
      task.id === id ? { ...task, completed: !task.completed } : task
    ))
  }

  const deleteTask = (id: number) => {
    setTasks(tasks.filter(task => task.id !== id))
  }

  return (
    <main style={{ padding: '2rem', maxWidth: '600px', margin: '0 auto' }}>
      <h1>Deployment Automation Demo</h1>
      <p>Proving opencode capabilities work as specified.</p>
      
      <div style={{ marginBottom: '1rem' }}>
        <span>Tasks: {taskCount}</span>
      </div>
      
      <div style={{ marginTop: '1rem' }}>
        <input
          type="text"
          value={newTask}
          onChange={(e) => setNewTask(e.target.value)}
          placeholder="Add a new task"
          style={{ padding: '0.5rem', width: '70%' }}
        />
        <button onClick={addTask} style={{ padding: '0.5rem 1rem', marginLeft: '0.5rem' }}>
          Add
        </button>
      </div>

      <ul style={{ marginTop: '2rem', listStyle: 'none', padding: 0 }}>
        {tasks.map(task => (
          <li key={task.id} style={{ 
            display: 'flex', 
            alignItems: 'center', 
            gap: '0.5rem',
            padding: '0.5rem 0',
            borderBottom: '1px solid #eee'
          }}>
            <input
              type="checkbox"
              checked={task.completed}
              onChange={() => toggleTask(task.id)}
            />
            <span style={{ 
              textDecoration: task.completed ? 'line-through' : 'none',
              flex: 1
            }}>
              {task.title}
            </span>
            <button 
              onClick={() => deleteTask(task.id)}
              style={{ background: '#ff4444', color: 'white', border: 'none', padding: '0.25rem 0.5rem', borderRadius: '4px', cursor: 'pointer' }}
            >
              Delete
            </button>
          </li>
        ))}
      </ul>

      {tasks.length === 0 && (
        <p style={{ textAlign: 'center', color: '#666', marginTop: '2rem' }}>
          No tasks yet. Add one above!
        </p>
      )}
    </main>
  )
}
