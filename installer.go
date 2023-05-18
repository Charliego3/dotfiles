package main

import (
	"fmt"

	tea "github.com/charmbracelet/bubbletea"
)

type Installer struct {
	stepper []Stepper
	current int
}

func NewInstaller(stepper ...Stepper) *Installer {
	return &Installer{stepper: stepper}
}

func (m Installer) IsEnd() bool {
	return len(m.stepper) <= m.current
}

func (m Installer) Init() tea.Cmd {
	return nil
}

func (m Installer) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch key := msg.(type) {
	case tea.WindowSizeMsg:
		return m, nil
	case tea.KeyMsg:
		if key.Type == tea.KeyCtrlC || m.IsEnd() {
			fmt.Println("current", m.current, "end", m.IsEnd())
			return m, tea.Quit
		}

		stepper := m.stepper[m.current]
		cmd := stepper.Update(msg)
		if stepper.Done() {
			m.current++
		}
		return m, cmd
	}
	return m, nil
}

func (m Installer) View() string {
	if m.IsEnd() {
		return ""
	}

	return m.stepper[m.current].View()
}
