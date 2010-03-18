class QuotedTermNode < Treetop::Runtime::SyntaxNode
  def to_tquery
    "'" + elements[1].text_value + "'"
  end
end