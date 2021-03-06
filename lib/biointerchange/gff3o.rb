require 'rdf'
module BioInterchange

class GFF3O

  # Establishes the landmark (e.g. a chromosome) on which a feature is located.
  # (http://www.biointerchange.org/gff3o#GFF3_0004)
  def self.seqid
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0004')
  end

  # Either:
  #   Strand of the feature.
  #   (http://www.biointerchange.org/gff3o#GFF3_0010)
  # Or:
  #   Strand of a target -- if applicable.
  #   (http://www.biointerchange.org/gff3o#GFF3_0045)
  def self.strand
    return [ RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0010'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0045') ]
  end

  # Tag name/value pair attributes of a feature that are not covered by object-/data-properties of the ontology. Tags that are represented as object-/data-properties are: ID, Name, Alias, Parent, Target, Gap, Derives_from, Dbxref, Ontology_term, Ontology_term, or Is_circular
  # (http://www.biointerchange.org/gff3o#GFF3_0012)
  def self.attributes
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0012')
  end

  # Link out to the parent feature.
  # (http://www.biointerchange.org/gff3o#GFF3_0014)
  def self.parent
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0014')
  end

  # Relationship that describes which features belong to a feature set.
  # (http://www.biointerchange.org/gff3o#GFF3_0015)
  def self.contains
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0015')
  end

  # Either:
  #   FALDO "Region" instance replacement for a feature's start, stop, strand properties.
  #   (http://www.biointerchange.org/gff3o#GFF3_0021)
  # Or:
  #   FALDO "Region" instance replacement for a target's start, stop, strand  properties.
  #   (http://www.biointerchange.org/gff3o#GFF3_0050)
  def self.region
    return [ RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0021'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0050') ]
  end

  # NCBI Taxonomy Ontology "NCBITaxon_1" (or sub-classes) instance that denotes the species for a feature set.
  # (http://www.biointerchange.org/gff3o#GFF3_0023)
  def self.species
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0023')
  end

  # Either:
  #   Properties that are directly associated with Set class instances.
  #   (http://www.biointerchange.org/gff3o#GFF3_0025)
  # Or:
  #   Properties that are directly associated with Set class instances.
  #   (http://www.biointerchange.org/gff3o#GFF3_0027)
  def self.set_properties
    return [ RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0025'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0027') ]
  end

  # Either:
  #   Properties that are directly associated with Feature class instances.
  #   (http://www.biointerchange.org/gff3o#GFF3_0026)
  # Or:
  #   Properties that are directly associated with Feature class instances.
  #   (http://www.biointerchange.org/gff3o#GFF3_0028)
  def self.feature_properties
    return [ RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0026'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') ]
  end

  # Identifies the target that the features aligns to.
  # (http://www.biointerchange.org/gff3o#GFF3_0039)
  def self.target
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0039')
  end

  # Either:
  #   Properties that are directly associated with Target class instances.
  #   (http://www.biointerchange.org/gff3o#GFF3_0044)
  # Or:
  #   Properties that are directly associated with Target class instances.
  #   (http://www.biointerchange.org/gff3o#GFF3_0040)
  def self.target_properties
    return [ RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0044'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0040') ]
  end

  # Describes a temporal relationship between two features, where the object denotes the subjects origin.
  # (http://www.biointerchange.org/gff3o#GFF3_0047)
  def self.derives_from
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0047')
  end

  # Explicit link-out to one or more ontologies that have been used for describing features. This is a meta comment about the URIs that link out to SO/SOFA or other ontologies.
  # (http://www.biointerchange.org/gff3o#GFF3_0056)
  def self.feature_ontology
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0056')
  end

  # A free text qualifier that describes the algorithm or operating procedure that generated this feature.  For example, the name of the software that generated this feature or a database name.
  # (http://www.biointerchange.org/gff3o#GFF3_0005)
  def self.source
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0005')
  end

  # Type of the feature, which is either an entry the "lite" version of the Sequence Ontology (SOFA) or a child entry of sequence_feature (SO:0000110) of the full Sequence Ontology (SO).
  # (http://www.biointerchange.org/gff3o#GFF3_0006)
  def self.type
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0006')
  end

  # Either:
  #   Start coordinate of the feature on the seqid landmark.
  #   (http://www.biointerchange.org/gff3o#GFF3_0007)
  # Or:
  #   Start coordinate of the target.
  #   (http://www.biointerchange.org/gff3o#GFF3_0042)
  # Or:
  #   Genomic start coordinate of the landmark.
  #   (http://www.biointerchange.org/gff3o#GFF3_0054)
  def self.start
    return [ RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0007'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0042'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0054') ]
  end

  # Either:
  #   End coordinate of the feature on the seqid landmark.
  #   (http://www.biointerchange.org/gff3o#GFF3_0008)
  # Or:
  #   End coordinate of the target.
  #   (http://www.biointerchange.org/gff3o#GFF3_0043)
  # Or:
  #   Genomic end coordinate of the landmark.
  #   (http://www.biointerchange.org/gff3o#GFF3_0055)
  def self.end
    return [ RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0008'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0043'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0055') ]
  end

  # Score of the feature. For example, an E-value for sequence similarity features or a P-value for ab initio gene prediction features.
  # (http://www.biointerchange.org/gff3o#GFF3_0009)
  def self.score
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0009')
  end

  # Phase for "CDS" features. It indicates where the feature begins with reference to the reading frame. For forward strand features, phase is counted from the start field, whilst for reverse strand features, phase is counted from the end field.
  # (http://www.biointerchange.org/gff3o#GFF3_0011)
  def self.phase
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0011')
  end

  # Tag name of a feature attribute.
  # (http://www.biointerchange.org/gff3o#GFF3_0013)
  def self.tag
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0013')
  end

  # Version of the GFF3 specification that defines the feature set contents.
  # (http://www.biointerchange.org/gff3o#GFF3_0022)
  def self.version
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0022')
  end

  # Name of a genome assembly build that denotes the provenance of features in a feature set. For example, 'NCBI 36' or 'FlyBase r4.1'.
  # (http://www.biointerchange.org/gff3o#GFF3_0024)
  def self.build
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0024')
  end

  # Properties that are directly associated with Attribute class instances.
  # (http://www.biointerchange.org/gff3o#GFF3_0029)
  def self.attribute_properties
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0029')
  end

  # A database cross-reference to associate a sequence alteration to its representation in another database.
  # (http://www.biointerchange.org/gff3o#GFF3_0034)
  def self.dbxref
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0034')
  end

  # A cross-reference to an ontology term that is associated with a feature.
  # (http://www.biointerchange.org/gff3o#GFF3_0035)
  def self.ontology_term
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0035')
  end

  # Name of a feature, which can be used for display purposes. The name is not a unique property among features.
  # (http://www.biointerchange.org/gff3o#GFF3_0036)
  def self.name
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0036')
  end

  # An alternative name for a feature. This can be another descriptive name of a feature, such as a locus name or accession number.
  # (http://www.biointerchange.org/gff3o#GFF3_0037)
  def self.alias
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0037')
  end

  # ID or accession of the target alignment.
  # (http://www.biointerchange.org/gff3o#GFF3_0041)
  def self.target_id
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0041')
  end

  # Gap describing the feature/target alignment if the sequences are not collinear. The formal description of this property has been lost due to a dead link in the GFF3 specification.
  # (http://www.biointerchange.org/gff3o#GFF3_0046)
  def self.gap
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0046')
  end

  # A free text note.
  # (http://www.biointerchange.org/gff3o#GFF3_0048)
  def self.note
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0048')
  end

  # Describes whether a feature is circular or not.
  # (http://www.biointerchange.org/gff3o#GFF3_0049)
  def self.is_circular
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0049')
  end

  # Properties that are directly associated with Landmark class instances.
  # (http://www.biointerchange.org/gff3o#GFF3_0052)
  def self.landmark_properties
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0052')
  end

  # ID that uniquely establishes the Landmark's identity within a Set.
  # (http://www.biointerchange.org/gff3o#GFF3_0053)
  def self.id
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0053')
  end

  # Either:
  #   Sequence associated with this feature, if it has been specified using a FASTA string.
  #   (http://www.biointerchange.org/gff3o#GFF3_0057)
  # Or:
  #   Sequence associated with this feature, if it has been specified using a FASTA string.
  #   (http://www.biointerchange.org/gff3o#GFF3_0058)
  def self.sequence
    return [ RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0057'), RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0058') ]
  end

  # Set of genomic sequence features, whose identifiers are unique within the set.
  # (http://www.biointerchange.org/gff3o#GFF3_0001)
  def self.Set
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0001')
  end

  # A genomic sequence feature.
  # (http://www.biointerchange.org/gff3o#GFF3_0002)
  def self.Feature
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0002')
  end

  # Describes additional feature attributes besides ID, Name, Alias, Parent, Target, Gap, Derives_from, Dbxref, Ontology_term, Ontology_term, or Is_circular.
  # (http://www.biointerchange.org/gff3o#GFF3_0003)
  def self.Attribute
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0003')
  end

  # Class describing a genomic strand. Instances of the class (individuals) are used to denote forward-/reverse-strands, etc.
  # (http://www.biointerchange.org/gff3o#GFF3_0016)
  def self.Strand
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0016')
  end

  # Indicates a feature's "target" of a nucleotide-to-nucleotide or protein-to-nucleotide alignment.
  # (http://www.biointerchange.org/gff3o#GFF3_0038)
  def self.Target
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0038')
  end

  # A landmark that establishes the coordinate system for features.
  # (http://www.biointerchange.org/gff3o#GFF3_0051)
  def self.Landmark
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0051')
  end

  # Location on the positive (forward) strand.
  # (http://www.biointerchange.org/gff3o#GFF3_0017)
  def self.Positive
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0017')
  end

  # Location on the negative (reverse) strand.
  # (http://www.biointerchange.org/gff3o#GFF3_0018)
  def self.Negative
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0018')
  end

  # Strand was not determined, which leaves it open whether the location is on the positive (forward) or negative (reverse) strand.
  # (http://www.biointerchange.org/gff3o#GFF3_0019)
  def self.UnknownStrand
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0019')
  end

  # Strand is not applicable.
  # (http://www.biointerchange.org/gff3o#GFF3_0020)
  def self.NotStranded
    return RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0020')
  end

  # Determines whether the given URI is an object property.
  #
  # +uri+:: URI that is tested for being an object property
  def self.is_object_property?(uri)
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0004') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0010') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0012') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0014') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0015') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0021') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0023') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0025') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0026') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0039') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0044') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0045') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0047') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0050') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0056') then
      return true
    end
    return false
  end

  # Determines whether the given URI is a datatype property.
  #
  # +uri+:: URI that is tested for being a datatype property
  def self.is_datatype_property?(uri)
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0005') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0006') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0007') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0008') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0009') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0011') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0013') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0022') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0024') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0027') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0029') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0034') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0035') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0036') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0037') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0040') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0041') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0042') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0043') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0046') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0048') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0049') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0052') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0053') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0054') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0055') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0057') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0058') then
      return true
    end
    return false
  end

  # Determines whether the given URI is a class.
  #
  # +uri+:: URI that is tested for being a class
  def self.is_class?(uri)
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0001') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0002') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0003') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0016') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0038') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0051') then
      return true
    end
    return false
  end

  # Determines whether the given URI is a named individual.
  #
  # +uri+:: URI that is tested for being a named individual
  def self.is_named_individual?(uri)
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0017') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0018') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0019') then
      return true
    end
    if uri == RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0020') then
      return true
    end
    return false
  end

  # Returns only those URIs that fall under a designated parent URI.
  #
  # +uris+:: Set of URIs that are tested whether they have the given parent URI.
  # +parent+:: Parent URI.
  def self.with_parent(uris, parent)
    return uris.select { |uri| has_parent?(uri, parent) }
  end

  # Recursively tries to determine the parent for a given URI.
  #
  # +uri+:: URI that is tested for whether it has the given parent URI.
  # +parent+:: Parent URI.
  def self.has_parent?(uri, parent)
    if @@parent_properties.has_key?(uri) then
      if @@parent_properties[uri] == parent then
        return true
      end
      return has_parent?(@@parent_properties[uri], parent)
    end
    return false
  end

private
  @@parent_properties = { RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0004') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0026') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0010') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0026') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0012') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0026') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0014') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0026') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0015') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0025') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0021') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0026') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0023') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0025') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0039') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0026') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0045') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0044') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0047') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0026') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0050') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0044') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0056') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0025') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0005') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0006') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0007') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0008') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0009') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0011') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0013') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0029') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0022') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0027') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0024') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0027') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0034') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0035') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0036') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0037') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0041') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0040') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0042') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0040') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0043') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0040') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0046') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0048') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0049') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0053') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0052') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0054') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0052') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0055') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0052') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0057') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0028') , RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0058') => RDF::URI.new('http://www.biointerchange.org/gff3o#GFF3_0052') }

end

end
