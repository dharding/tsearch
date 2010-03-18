require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'texticle/parser'

describe Texticle::Parser do
  before(:each) do
    @parser = Texticle::Parser.new
  end
  
  it "should return nil for empty search terms" do
    @parser.parse("").should be_nil
  end
  
  it "should return nil for search terms that are blank" do
    @parser.parse("  ").should be_nil
  end
  
  it "should parse a single, bare word as a single bare word" do
    @parser.parse('bareword').should == 'bareword'
  end
  
  it "should parse multiple barewords into a list of or'd terms" do
    @parser.parse('bareword anotherword yetanotherword').should =~ /bareword\s+|\s+anotherword\s+|\s+yetanotherword/
  end
  
  it "should parse a quoted phrase as that phrase" do
    @parser.parse('"quoted phrase"').should == "'quoted phrase'"
  end
  
  it "should parse a quoted phrase along with unquoted terms to be the quoted phrase or the other terms" do
    @parser.parse('"quoted phrase" aword anotherword').should =~ /'quoted phrase'\s+|\s+aword\s+|\s+anotherword/
  end
  
  it "should allow words to be and'd" do
    @parser.parse("word and anotherword").should =~ /word\s+&\s+anotherword/
  end
  
  it "should allow a quoted phrase and words to be and'd" do
    @parser.parse('word and anotherword and "this phrase"').should =~ /word\s+&\s+anotherword\s+&\s+'this phrase'/
  end
  
  it "should ignore boolean indicators in quoted phrases" do
    @parser.parse('"this phrase has and and or in it"').should == "'this phrase has and and or in it'"
  end
  
  it "should allow terms to be grouped and consider them or'd" do
    @parser.parse("(word anotherword)").should =~ /\(word\s+|\s+anotherword\)/
  end
  
  it "should allow grouped terms to be and'd" do
    @parser.parse("(word and anotherword)").should =~ /\(word\s+&\s+anotherword\)/
  end
  
  it "should allow grouped terms to contain quoted phrases" do
    @parser.parse('(word "quoted and stillquoted" anotherword)').should =~ /\(word\s+|\s+'quoted and stillquoted'\s+|\s+anotherword\)/
  end

  it "should allow grouped terms to be or'd with other terms" do
    @parser.parse('(word group) anotherword').should =~ /\(word\s+|\s+group\)\s+|\s+anotherword/
    @parser.parse('(word group) or anotherword').should =~ /\(word\s+|\s+group\)\s+|\s+anotherword/
  end
  
  it "should allow grouped terms to be and'd with other terms" do
    @parser.parse('(word group) and anotherword').should =~ /\(word\s+|\s+group\)\s+&\s+anotherword/
  end
  
  it "should allow grouped terms to or'd with other grouped terms" do
    @parser.parse('(word group) (anotherword anothergroup)').should =~ /\(word\s+|\s+group\)\s+|\s+\(anotherword\s+|\s+anothergroup\)/
    @parser.parse('(word group) (anotherword anothergroup)').should =~ /\(word\s+|\s+group\)\s+|\s+\(anotherword\s+|\s+anothergroup\)/
  end
  
  it "should allow grouped terms to and'd with other grouped terms" do
    @parser.parse('(word group) and (anotherword anothergroup)').should =~ /\(word\s+|\s+group\)\s+&\s+\(anotherword\s+|\s+anothergroup\)/
  end
  
  it "should fall back to a punctuation free search when the term is malformed (escape clause)" do
    @parser.parse('"unterminated quote" see "it?').should =~ /unterminated\s+|\s+quote\s+|\s+see\s+|\s+it/
    @parser.parse('()').should be_nil
    @parser.parse('(and').should be_nil
    @parser.parse('or)').should be_nil
    @parser.parse('and or)').should be_nil
    @parser.parse('or "or or').should be_nil
  end
  
  it "should not allow empty quoted terms" do
    @parser.parse('""').should be_nil
    @parser.parse('"  "').should be_nil
  end
end