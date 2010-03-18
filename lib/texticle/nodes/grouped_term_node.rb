class GroupedTermNode < Treetop::Runtime::SyntaxNode
  def to_tquery
    buffer = []
    elements[1].elements.each do |elem|
      t = elem.to_tquery
      if t =~ /^\s+(\||&).*$/ || buffer.empty?
        buffer << t
      else
        buffer << " | " + t
      end
    end

    '(' + buffer.join(' ') + ')'
  end
end