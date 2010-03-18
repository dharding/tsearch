require 'treetop'
require File.dirname(__FILE__) + '/tquery'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'nodes','**','*.rb'))].each {|f| require f}

module Texticle
  class Parser
    attr_accessor :parse_tree, :tquery
  
    def parse(str)
      s = str.strip
      p = TQueryParser.new
      @parse_tree = nil
      @tquery = nil
      return @tquery if s.blank?
      failed = false
      while @parse_tree.nil?
        begin
          @parse_tree = p.parse(s)
          raise p.failure_reason if @parse_tree.nil?
          result = parser_tree_to_tquery(@parse_tree)
          break if effectively_empty?(result)
          @tquery = result
        rescue
          raise $! if failed
          failed = true
          s = s.gsub(/[^A-Za-z0-9\s]/, '').strip
          break if effectively_empty?(s)
        end
      end
      @tquery
    end
  
  private
    # the search string is effectively empty (meaning tsearch will see it as blank)
    def effectively_empty?(str)
      s = str.gsub(/[^A-Za-z0-9\s]/, '').strip
      unique_terms = s.downcase.split(/\s+/).uniq
      s.blank? || unique_terms.reject {|e| e == 'and' || e == 'or'}.empty?
    end
    
    def parser_tree_to_tquery(parse_tree)
      results = if parse_tree.expression.nil?
        ''
      else
        parse_tree.expression.to_tquery
      end
      unless results.nil?
        results.gsub(/^\s+(\||\&)/, '')
      end
    end
  end
end