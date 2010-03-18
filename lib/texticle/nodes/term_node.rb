class TermNode < Treetop::Runtime::SyntaxNode
# module TermNode
  def to_tquery
    terms = []
    
    return '' if elements.empty?
    
    elements.each do |child_elem|
      next if child_elem.elements.empty?
      if child_elem.respond_to?(:to_tquery)
        terms << child_elem.to_tquery
      else
        child_elem.elements.each do |grand_child_elem|
          if grand_child_elem.respond_to?(:to_tquery)
            terms << grand_child_elem.to_tquery
          end
        end
      end
    end

    terms.join(' ')
  end
end