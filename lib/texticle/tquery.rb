# Autogenerated from a Treetop grammar. Edits may be lost.


module TQuery
  include Treetop::Runtime

  def root
    @root || :query
  end

  module Query0
    def space1
      elements[0]
    end

    def expression
      elements[1]
    end

    def space2
      elements[3]
    end
  end

  def _nt_query
    start_index = index
    if node_cache[:query].has_key?(index)
      cached = node_cache[:query][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_space
    s0 << r1
    if r1
      r2 = _nt_expression
      s0 << r2
      if r2
        r4 = _nt_more_query
        if r4
          r3 = r4
        else
          r3 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r3
        if r3
          r5 = _nt_space
          s0 << r5
        end
      end
    end
    if s0.last
      r0 = instantiate_node(QueryNode,input, i0...index, s0)
      r0.extend(Query0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:query][start_index] = r0

    r0
  end

  module MoreQuery0
    def space1
      elements[0]
    end

    def query
      elements[1]
    end

    def space2
      elements[2]
    end
  end

  def _nt_more_query
    start_index = index
    if node_cache[:more_query].has_key?(index)
      cached = node_cache[:more_query][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_space
    s0 << r1
    if r1
      r2 = _nt_query
      s0 << r2
      if r2
        r3 = _nt_space
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(QueryNode,input, i0...index, s0)
      r0.extend(MoreQuery0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:more_query][start_index] = r0

    r0
  end

  module Expression0
    def space
      elements[1]
    end

    def more
      elements[2]
    end
  end

  def _nt_expression
    start_index = index
    if node_cache[:expression].has_key?(index)
      cached = node_cache[:expression][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      r2 = _nt_term
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      r3 = _nt_space
      s0 << r3
      if r3
        r5 = _nt_more_expression
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(ExpressionNode,input, i0...index, s0)
      r0.extend(Expression0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:expression][start_index] = r0

    r0
  end

  module MoreExpression0
    def space
      elements[0]
    end

    def expression
      elements[1]
    end
  end

  def _nt_more_expression
    start_index = index
    if node_cache[:more_expression].has_key?(index)
      cached = node_cache[:more_expression][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_space
    s0 << r1
    if r1
      r2 = _nt_expression
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(ExpressionNode,input, i0...index, s0)
      r0.extend(MoreExpression0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:more_expression][start_index] = r0

    r0
  end

  module GroupedTerm0
  end

  def _nt_grouped_term
    start_index = index
    if node_cache[:grouped_term].has_key?(index)
      cached = node_cache[:grouped_term][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('(', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('(')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        r3 = _nt_term
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        if has_terminal?(')', false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(')')
          r4 = nil
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(GroupedTermNode,input, i0...index, s0)
      r0.extend(GroupedTerm0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:grouped_term][start_index] = r0

    r0
  end

  module QuotedTerm0
    def quoted_stuff
      elements[1]
    end

  end

  def _nt_quoted_term
    start_index = index
    if node_cache[:quoted_term].has_key?(index)
      cached = node_cache[:quoted_term][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('"', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('"')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[^\\"]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        if has_terminal?('"', false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('"')
          r4 = nil
        end
        s0 << r4
      end
    end
    if s0.last
      r0 = instantiate_node(QuotedTermNode,input, i0...index, s0)
      r0.extend(QuotedTerm0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:quoted_term][start_index] = r0

    r0
  end

  module Term0
    def space1
      elements[0]
    end

    def space2
      elements[2]
    end
  end

  def _nt_term
    start_index = index
    if node_cache[:term].has_key?(index)
      cached = node_cache[:term][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_space
    s0 << r1
    if r1
      i2 = index
      r3 = _nt_boolean_term
      if r3
        r2 = r3
      else
        r4 = _nt_quoted_term
        if r4
          r2 = r4
        else
          r5 = _nt_word
          if r5
            r2 = r5
          else
            r6 = _nt_grouped_term
            if r6
              r2 = r6
            else
              @index = i2
              r2 = nil
            end
          end
        end
      end
      s0 << r2
      if r2
        r7 = _nt_space
        s0 << r7
      end
    end
    if s0.last
      r0 = instantiate_node(TermNode,input, i0...index, s0)
      r0.extend(Term0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:term][start_index] = r0

    r0
  end

  def _nt_word
    start_index = index
    if node_cache[:word].has_key?(index)
      cached = node_cache[:word][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      r1 = _nt_word_char
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(WordNode,input, i0...index, s0)
    end

    node_cache[:word][start_index] = r0

    r0
  end

  def _nt_word_char
    start_index = index
    if node_cache[:word_char].has_key?(index)
      cached = node_cache[:word_char][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_letter
    if r1
      r0 = r1
    else
      r2 = _nt_digit
      if r2
        r0 = r2
      else
        if has_terminal?('_', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('_')
          r3 = nil
        end
        if r3
          r0 = r3
        else
          if has_terminal?('&', false, index)
            r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('&')
            r4 = nil
          end
          if r4
            r0 = r4
          else
            if has_terminal?('.', false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure('.')
              r5 = nil
            end
            if r5
              r0 = r5
            else
              if has_terminal?('!', false, index)
                r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure('!')
                r6 = nil
              end
              if r6
                r0 = r6
              else
                @index = i0
                r0 = nil
              end
            end
          end
        end
      end
    end

    node_cache[:word_char][start_index] = r0

    r0
  end

  def _nt_letter
    start_index = index
    if node_cache[:letter].has_key?(index)
      cached = node_cache[:letter][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('\G[A-Za-z]', true, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:letter][start_index] = r0

    r0
  end

  def _nt_digit
    start_index = index
    if node_cache[:digit].has_key?(index)
      cached = node_cache[:digit][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    if has_terminal?('\G[0-9]', true, index)
      r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r0 = nil
    end

    node_cache[:digit][start_index] = r0

    r0
  end

  def _nt_space
    start_index = index
    if node_cache[:space].has_key?(index)
      cached = node_cache[:space][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[\\s]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

    node_cache[:space][start_index] = r0

    r0
  end

  def _nt_boolean_term
    start_index = index
    if node_cache[:boolean_term].has_key?(index)
      cached = node_cache[:boolean_term][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_and_term
    if r1
      r0 = r1
    else
      r2 = _nt_or_term
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:boolean_term][start_index] = r0

    r0
  end

  module AndTerm0
    def term
      elements[1]
    end
  end

  def _nt_and_term
    start_index = index
    if node_cache[:and_term].has_key?(index)
      cached = node_cache[:and_term][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i1 = index
    if has_terminal?('and', false, index)
      r2 = instantiate_node(SyntaxNode,input, index...(index + 3))
      @index += 3
    else
      terminal_parse_failure('and')
      r2 = nil
    end
    if r2
      r1 = r2
    else
      if has_terminal?('&&', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('&&')
        r3 = nil
      end
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      r4 = _nt_term
      s0 << r4
    end
    if s0.last
      r0 = instantiate_node(AndTermNode,input, i0...index, s0)
      r0.extend(AndTerm0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:and_term][start_index] = r0

    r0
  end

  module OrTerm0
    def term
      elements[1]
    end
  end

  def _nt_or_term
    start_index = index
    if node_cache[:or_term].has_key?(index)
      cached = node_cache[:or_term][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i1 = index
    if has_terminal?('or', false, index)
      r2 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('or')
      r2 = nil
    end
    if r2
      r1 = r2
    else
      if has_terminal?('||', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('||')
        r3 = nil
      end
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      r4 = _nt_term
      s0 << r4
    end
    if s0.last
      r0 = instantiate_node(OrTermNode,input, i0...index, s0)
      r0.extend(OrTerm0)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:or_term][start_index] = r0

    r0
  end

end

class TQueryParser < Treetop::Runtime::CompiledParser
  include TQuery
end
