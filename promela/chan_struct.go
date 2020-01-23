package promela

import (
	"go/token"

	"git.cs.kent.ac.uk/nd315/gopology/promela/promela_ast"
)

type ChanStruct struct {
	Name   promela_ast.Ident
	Chan   token.Position
	Chans  []promela_ast.Chandef // the chans of the struct (in,out and closed)
	Closed bool                  // Does the channel get closed at some point ?

	Size     promela_ast.Ident
	Buffered bool
}
