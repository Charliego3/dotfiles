package main

import (
	tea "github.com/charmbracelet/bubbletea"
	"os"

	"github.com/charmbracelet/lipgloss"
	"github.com/muesli/termenv"
)

func main() {
	lipgloss.SetColorProfile(termenv.NewOutput(os.Stderr).Profile)

	app := tea.NewProgram(NewInstaller(
		&ShowVersion{},
		&Second{},
	))

	_, err := app.Run()
	if err != nil {
		panic(err)
	}
}
