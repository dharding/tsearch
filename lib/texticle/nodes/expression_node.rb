class ExpressionNode < Treetop::Runtime::SyntaxNode
  def to_tquery
    buffer = []
    elements[0].elements.each do |elem|
      if elem.respond_to?(:to_tquery)
        t = elem.to_tquery
        if t =~ /^\s+(\||&).*$/ || buffer.empty?
          buffer << t
        else
          buffer << " | " + t
        end
      end
    end
    
    buffer.join(' ')
  end
end