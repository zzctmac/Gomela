package promela_ast

import (
	"go/token"

	"git.cs.kent.ac.uk/nd315/gopology/promela/utils"
)

// a cond statement is the real representation of an if statement in promela
// Primarly used for the async and sync proctypes
type CondStmt struct {
	Cond   token.Position
	Guards []GuardStmt
}

func (c *CondStmt) GoNode() token.Position {
	return c.Cond
}

func (c *CondStmt) Print(num_tabs int) (stmt string) {
	stmt = "if\n"
	for _, guard := range c.Guards {
		stmt += guard.Print(num_tabs) + "\n"
	}
	stmt += utils.GetTabs(num_tabs) + "fi"

	return stmt
}
