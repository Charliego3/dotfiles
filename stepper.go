package main

import tea "github.com/charmbracelet/bubbletea"

type Stepper interface {
	View() string
	Update(msg tea.Msg) tea.Cmd
	Done() bool
}

type ShowVersion struct {
	count int
}

func (v *ShowVersion) View() string {
	return "this is show version stepper"
}

func (v *ShowVersion) Update(msg tea.Msg) tea.Cmd {
	v.count++
	if key, ok := msg.(tea.KeyMsg); ok && key.Type == tea.KeyCtrlA {
		return tea.Println("this is show version update returned Cmd: ", v.count)
	}
	return nil
}

func (v *ShowVersion) Done() bool {
	if v.count >= 3 {
		return true
	}
	return false
}

type Second struct {
	count int
}

func (v *Second) View() string {
	return "this is Second stepper"
}

func (v *Second) Update(msg tea.Msg) tea.Cmd {
	v.count++
	if key, ok := msg.(tea.KeyMsg); ok && key.Type == tea.KeyCtrlA {
		return tea.Println("this is Second update returned Cmd: ", v.count)
	}
	return nil
}

func (v *Second) Done() bool {
	if v.count >= 3 {
		return true
	}
	return false
}
