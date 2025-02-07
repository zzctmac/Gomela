package promela_ast

import (
	"go/token"
)

// a send statement where chan is the channel that we want to send to and Rhs the expression we want to sent
type SendStmt struct {
	Send  token.Position
	Model string
	Chan  Expr // the chan that we want to send on
	Rhs   Expr // the value we want to send
}

func (s *SendStmt) GoNode() token.Position {
	return s.Send
}

func (s *SendStmt) Print(num_tabs int) string {

	comment := ""

	if s.Send.String() != "-" {
		comment = " /* " + s.Model + "\t" + s.Send.String() + " */"
	}
	return s.Chan.Print(num_tabs) + "!" + s.Rhs.Print(num_tabs) + comment
}

func (s *SendStmt) Clone() Stmt {
	s1 := &SendStmt{Send: s.Send, Chan: s.Chan.Clone(), Rhs: s.Rhs.Clone()}
	return s1
}
