module BioInterchange

  # Custom Exceptions and Errors
  require 'biointerchange/exceptions'

  # Ontologies (besides the ones from the 'rdf' gem)
  require 'biointerchange/gff3o'
  require 'biointerchange/gvf1o'
  require 'biointerchange/sio'
  require 'biointerchange/sofa'

  # Reader/writer interfaces
  require 'biointerchange/reader'
  require 'biointerchange/writer'

  #
  # TEXT MINING
  #

  # Text mining readers
  require 'biointerchange/textmining/text_mining_reader'
  require 'biointerchange/textmining/pubannos_json_reader'
  require 'biointerchange/textmining/pdfx_xml_reader'

  # Text mining model
  require 'biointerchange/textmining/document'
  require 'biointerchange/textmining/content'
  require 'biointerchange/textmining/content_connection'
  require 'biointerchange/textmining/process'
  
  # Text mining writers
  require 'biointerchange/textmining/text_mining_rdf_ntriples'
  
  #
  # GENOMICS
  #

  # GFF3 reader
  require 'biointerchange/genomics/gff3_reader'

  # Feature base model
  require 'biointerchange/genomics/gff3_feature_set'
  require 'biointerchange/genomics/gff3_feature'

  # GFF3 writer
  require 'biointerchange/genomics/gff3_rdf_ntriples'
  
  #
  # ACTUAL COMMAND LINE IMPLEMENTATION
  #

  # Option parsing 
  require 'getopt/long'

  def self.cli
    begin
      opt = Getopt::Long.getopts(
        ["--help", "-h", Getopt::BOOLEAN],
        ["--debug", "-d", Getopt::BOOLEAN],  # set debug mode => print stack traces
        ["--input", "-i", Getopt::REQUIRED], # input file format
        ["--rdf", "-r", Getopt::REQUIRED], # output file format
        ["--name", Getopt::OPTIONAL], # name of resourcce/tool/person
        ["--name_id", Getopt::OPTIONAL], # uri of resource/tool/person
        ["--date", "-t", Getopt::OPTIONAL], # date of processing/annotation
        ["--version", "-v", Getopt::OPTIONAL], # version number of resource
        ["--file", "-f", Getopt::OPTIONAL], # file to read, will read from STDIN if not supplied
        ["--out", "-o", Getopt::OPTIONAL] # output file, will out to STDOUT if not supplied
      )
      
      if opt['help'] or not opt['input'] or not opt['rdf'] then
        puts "Usage: ruby #{$0} -i <format> -r <format> [options]"
        puts 'Supported input formats (--input <format>/-i <format>):'
        puts '  biointerchange.gff3                : GFF3'
        puts '  dbcls.catanns.json                 : PubAnnotation JSON'
        puts '  uk.ac.man.pdfx                     : PDFx XML'
        puts 'Supported output formats (--rdf <format>/-r <format>)'
        puts '  rdf.biointerchange.gff3            : RDF N-Triples for input'
        puts '    biointerchange.gff3'
        puts '  rdf.bh12.sio                       : RDF N-Triples for inputs'
        puts '    dbcls.catanns.json'
        puts '    uk.ac.man.pdfx'
        puts 'I/O options:'
        puts '  -f <file>/--file <file>            : file to read; STDIN used if not supplied'
        puts '  -o <file>/--out <file>             : output file; STDOUT used if not supplied'
        puts 'Input-/RDF-format specific options:'
        puts '  Input: dbcls.catanns.json, uk.ac.man.pdfx'
        puts '  Output: rdf.bh12.sio'
        puts '  Options:'
        puts '    -t <date>/--date <date>          : date of processing/annotation (optional)'
        puts '    -v <version>/--version <version> : version number of resource (optional)'
        puts '    --name <name>                    : name of resource/tool/person (required)'
        puts '    --name_id <id>                   : URI of resource/tool/person (required)'
        puts 'Input-/RDF-format specific options:'
        puts '  Input: biointerchange.gff3'
        puts '  Output: rdf.biointerchange.gff3'
        puts '  Options:'
        puts '    -t <date>/--date <date>          : date when the GFF3 file was created (optional)'
        puts '    --name <name>                    : name of the GFF3 file creator (optional)'
        puts '    --name_id <id>                   : email address of the GFF3 file creator (optional)'
        puts 'Other options:'
        puts '  -d / --debug                       : turn on debugging output (for stacktraces)'
        puts '  -h  --help                         : this message'
      
        exit 1
      end
      
      if opt['input'] == 'dbcls.catanns.json' or opt['input'] == 'uk.ac.man.pdfx' then
        if opt['rdf'] == 'rdf.bh12.sio' then
          raise ArgumentError, 'Require --name and --name_id options to specify source of annotations (e.g., a manual annotators name, or software tool name) and their associated URI (e.g., email address, or webaddress).' unless opt['name'] and opt['name_id']
        else
          unsupported_combination
        end
      elsif opt['input'] == 'biointerchange.gff3' then
        if opt['rdf'] == 'rdf.biointerchange.gff3' then
          # Okay. No further arguments required.
        else
          unsupported_combination
        end
      else
        unsupported_combination
      end

      
      opt['date'] = nil unless opt['date']
      opt['version'] = nil unless opt['version']
      
      # generate model from file (deserialise)
      reader = nil
      if opt['input'] == 'dbcls.catanns.json' then
        reader = BioInterchange::TextMining::PubannosJsonReader.new(opt['name'], opt['name_id'], opt['date'], BioInterchange::TextMining::Process::UNSPECIFIED, opt['version'])
      elsif opt['input'] == 'uk.ac.man.pdfx' then
        reader = BioInterchange::TextMining::PdfxXmlReader.new(opt['name'], opt['name_id'], opt['date'], BioInterchange::TextMining::Process::UNSPECIFIED, opt['version'])
      elsif opt['input'] == 'biointerchange.gff3' then
        reader = BioInterchange::Genomics::GFF3Reader.new(opt['name'], opt['name_id'], opt['date'])
      end
    
      model = nil
      if opt["file"]
        model = reader.deserialize(File.new(opt["file"],'r'))
      else
        model = reader.deserialize(STDIN)
      end
    
      # generate rdf from model (serialise)
      writer = nil
      if opt['rdf'] == 'rdf.bh12.sio' then
        writer = BioInterchange::TextMining::RDFWriter.new(File.new(opt['out'], 'w')) if opt['out']
        writer = BioInterchange::TextMining::RDFWriter.new(STDOUT) unless opt['out']
      end
      if opt['rdf'] == 'rdf.biointerchange.gff3' then
        writer = BioInterchange::Genomics::RDFWriter.new(File.new(opt['out'], 'w')) if opt['out']
        writer = BioInterchange::Genomics::RDFWriter.new(STDOUT) unless opt['out']
      end
      
      writer.serialize(model)

    rescue ArgumentError => e
      $stderr.puts e.message
      $stderr.puts e.backtrace if opt['debug']
      exit 1
    rescue Getopt::Long::Error => e
      $stderr.puts e.message
      #$stderr.puts e.backtrace if opt['debug']
      exit 1
    rescue BioInterchange::Exceptions::InputFormatError => e
      $stderr.puts e.message
      $stderr.puts e.backtrace if opt['debug']
      exit 2
    end
  end

  #
  # Helper functions
  #

  # Returns the values of several named parameters.
  #
  # +map+:: a map of named parameters and their values
  # +parameters+:: the names of the parameter values we are interested in
  def self.get_parameters(map, parameters)
    parameters.map { |parameter|
      if parameter.instance_of? Array then
        parameter[0].call(*BioInterchange::get_parameters(map, parameter[1..-1]))
      else
        map[parameter]
      end
    }
  end

private

  def self.unsupported_combination
    raise ArgumentError, 'This input/output format combination is not supported.'
  end

end

