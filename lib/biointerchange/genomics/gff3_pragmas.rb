
module BioInterchange::Genomics

# Represents a named region, a.k.a. landmark, which is defined by the pragma statement 'sequence-region'.
class GFF3Landmark

  # Create a new instance of a named region.
  #
  # +seqid+:: unique identifier (in the GFF3 file context) that identifies this region
  # +start_coordinate+:: genomic start coordinate of the region
  # +end_coordinate+:: genomic end coordinate of the region
  def initialize(seqid, start_coordinate = nil, end_coordinate = nil)
    @seqid = seqid
    @start_coordinate = start_coordinate
    @end_coordinate = end_coordinate
  end

  # Returns the unique identifier (based on a GFF3 file context) of the region.
  def seqid
    @seqid
  end

  # Returns the start coordinate of the region.
  def start_coordinate
    @start_coordinate
  end

  # Returns the end coordinate of the region.
  def end_coordinate
    @end_coordinate
  end

end

end
