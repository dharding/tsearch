class AndTermNode < Treetop::Runtime::SyntaxNode
  def to_tquery
    " & #{term.to_tquery}"
  end
end