
require 'rubygems'
require 'rspec'

# Turn off verbose reporting here, since class definitions may be loaded multiple
# times here. That reports that constants have been already been initialized, which
# is true, but they are only "re-initialized" with the very same values.
v, $VERBOSE = $VERBOSE, nil
load 'lib/biointerchange/core.rb'
load 'lib/biointerchange/reader.rb'
load 'lib/biointerchange/textmining/text_mining_reader.rb'
load 'lib/biointerchange/textmining/pubannos_json_reader.rb'
load 'lib/biointerchange/textmining/document.rb'
load 'lib/biointerchange/textmining/content.rb'
load 'lib/biointerchange/textmining/process.rb'
$VERBOSE = v

describe BioInterchange::TextMining::PubannosJsonReader do
  describe 'deserialization of pubannos json text-mining documents' do
  
    describe 'IO check' do
      before :all do 
        @reader = BioInterchange::TextMining::PubannosJsonReader.new("Test", "http://test.com", "00-00-0000", BioInterchange::TextMining::Process::UNSPECIFIED, "0.0")
      end
      it 'read json from string' do
        model = @reader.deserialize('{"docurl":"http://example.org/test","text":""}')
      
        model.should be_an_instance_of BioInterchange::TextMining::Document
      end
      it 'read json from file' do
        model = @reader.deserialize(File.new('examples/pubannotation.10096561.json'))
      
        model.should be_an_instance_of BioInterchange::TextMining::Document
      end 
    end
  
    describe 'generated model check' do
  
      before :all do
        reader = BioInterchange::TextMining::PubannosJsonReader.new("Test", "http://test.com", "00-00-0000", BioInterchange::TextMining::Process::UNSPECIFIED, "0.0")
        
        @model = reader.deserialize('{ "name": "Peter Smith", "name_id": "<peter.smith@example.json>", "date": "2012-08-12", "version": "3", "docurl":"http://example.org/example_json", "text":"Some document text. With two annotations of type protein.\n", "catanns":[{"annset_id":1,"begin":0,"category":"Protein","doc_id":9,"end":10,"id":139},{"annset_id":1,"begin":20,"category":"Protein","doc_id":9,"end":42,"id":138}]}')
        
        #puts "Document Model: #{@model.uri}"
        #  @model.contents.each do |c|
        #  puts "\tContent: #{c.type}, #{c.offset}, #{c.length}"
        #end
      end
      
      it 'model is of type document' do
        @model.should be_an_instance_of BioInterchange::TextMining::Document
      end
      
      it 'document uri (job id read)' do
        @model.uri.should eql "http://example.org/example_json"
      end
      
      it 'document has content' do
        @model.contents.size.should eql 3
      end
      
      it 'document document' do 
        @model.contents[0].type.should eql BioInterchange::TextMining::Content::DOCUMENT and @model.contents[0].offset.should eql 0 and @model.contents[0].length.should eql 58
      end
      
      it 'document phrase' do
        @model.contents[1].type.should eql BioInterchange::TextMining::Content::PHRASE and @model.contents[1].offset.should eql 0 and @model.contents[1].length.should eql 10 and
        
        @model.contents[2].type.should eql BioInterchange::TextMining::Content::PHRASE and @model.contents[2].offset.should eql 20 and @model.contents[2].length.should eql 22
      end
    
    end

  end
  
end

