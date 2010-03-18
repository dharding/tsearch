class WordNode < Treetop::Runtime::SyntaxNode
  def to_tquery
    word
  end
  
  def word
    text_value
  end
end