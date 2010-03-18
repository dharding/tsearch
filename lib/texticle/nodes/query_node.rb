class QueryNode < Treetop::Runtime::SyntaxNode
  def to_tquery
    buffer = []
    elements.each do |elem|
      buffer << elem.to_tquery if elem.respond_to?(:to_tquery)
    end
  end
end