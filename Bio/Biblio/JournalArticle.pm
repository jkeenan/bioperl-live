# $Id$
#
# BioPerl module for Bio::Biblio::JournalArticle
#
# Cared for by Heikki Lehvaslaiho <heikki@ebi.ac.uk>
#
# Copyright Heikki Lehvaslaiho
#
# You may distribute this module under the same terms as perl itself

# POD documentation - main docs before the code

=head1 NAME

Bio::Biblio::JournalArticle - A type of an author

=head1 SYNOPSIS

#

=head1 DESCRIPTION

#


=head1 FEEDBACK

=head2 Mailing Lists

User feedback is an integral part of the evolution of this and other
Bioperl modules. Send your comments and suggestions preferably to
the Bioperl mailing list.  Your participation is much appreciated.

  bioperl-l@bioperl.org              - General discussion
  http://bioperl.org/MailList.shtml  - About the mailing lists

=head2 Reporting Bugs

Report bugs to the Bioperl bug tracking system to help us keep track
of the bugs and their resolution. Bug reports can be submitted via
email or the web:

  bioperl-bugs@bioperl.org
  http://bioperl.org/bioperl-bugs/

=head1 AUTHOR - Heikki Lehvaslaiho

Email heikki@ebi.ac.uk

Describe contact details here

=head1 CONTRIBUTORS

Additional contributors names and emails here

=head1 APPENDIX

The rest of the documentation details each of the object methods.
Internal methods are usually preceded with a _

=cut


# Let the code begin...


package Bio::Biblio::JournalArticle;
use vars qw(@ISA);
use strict;

# Object preamble - inherits from Bio::Root::Root

use Bio::Biblio::RefI;

@ISA = qw( Bio::Biblio::Article Bio::Root::Root );

sub new {
    my($class,@args) = @_;
    my $self;
    $self = {};
    bless $self, $class;

    my ($id, $type, $title, $rights, $language, $format, $date, 
	$spatial_location, $temporal_period, $last_modified, 
	$repository_subset, $abstract, $abstract_type, $toc, 
	$toc_type, $publisher, $volume, $issue, $issue_supplement, $journal
	) =
	    $self->_rearrange([qw(ID
				  TYPE               
				  TITLE              
				  RIGHTS             
				  LANGUAGE           
				  FORMAT             
				  DATE               
				  SPATIAL_LOCATION   
				  TEMPORAL_PERIOD    
				  LAST_MODIFIED      
				  REPOSITORY_SUBSET  
				  ABSTRACT           
				  ABSTRACT_TYPE      
				  TOC 
				  TOC_TYPE           
				  PUBLISHER      
				  VOLUME
				  ISSUE
				  ISSUE_SUPPLEMENT
				  JOURNAL
				  )],
			      @args);

    $id && $self->id($id);
    $type && $self->type($type);
    $title && $self->title($title);
    $rights && $self->rights($rights);
    $language && $self->language($language);
    $format && $self->format($format);
    $date && $self->date($date);
    $spatial_location && $self->spatial_location($spatial_location);
    $temporal_period && $self->temporal_period($temporal_period);
    $last_modified && $self->last_modified($last_modified);
    $repository_subset && $self->repository_subset($repository_subset);
    $abstract && $self->abstract($abstract);
    $abstract_type && $self->abstract_type($abstract_type);
    $toc && $self->toc($toc);
    $toc_type && $self->toc_type($toc_type);
    $publisher && $self->publisher($publisher);

    $volume && $self->volume($volume);
    $issue && $self->issue($issue);
    $issue_supplement && $self->issue_supplement($issue_supplement);
    $journal && $self->journal($journal);

    return $self; # success - we hope!

}

=head2 volume

 Title   : volume
 Usage   : $obj->volume();
 Function: 

           Sets and returns the estimated volume of the resource in characters.
           [BiblioBook::docOffice]

 Example : 
 Returns : integer
 Args    : integer

=cut


sub volume {
    my ($self,$value) = @_;
    if ( defined $value) {
	$self->{'_volume'} = $value;
    }
    if ( ! exists $self->{'_volume'} ) {
	return 0;
    } 
    return $self->{'_volume'};
}

=head2 issue

 Title   : issue
 Usage   : $obj->issue();
 Function: 

           Sets and returns the name of the reference.
           [BibRefBook::docType]

 Example : 
 Returns : string
 Args    : string

=cut


sub issue {
    my ($self,$value) = @_;
    if ( defined $value) {
	$self->{'_issue'} = $value;
    }
    if ( ! exists $self->{'_issue'} ) {
	return 0;
    } 
    return $self->{'_issue'};
}

=head2 issue_supplement

 Title   : issue_supplement
 Usage   : $obj->issue_supplement();
 Function: 

           Sets and returns the name of the reference.
           [BibRefBook::docType]

 Example : 
 Returns : string
 Args    : string

=cut


sub issue_supplement {
    my ($self,$value) = @_;
    if ( defined $value) {
	$self->{'_issue_supplement'} = $value;
    }
    if ( ! exists $self->{'_issue_supplement'} ) {
	return 0;
    } 
    return $self->{'_issue_supplement'};
}


=head2 journal

 Title   : journal
 Usage   : $journal = $obj->journal();
 Function: Returns or sets the reference to a Bio::Biblio::Provider object.
           If there is no link, it will return undef
 Returns : an obj_ref or undef
 Args    : Bio::Biblio::Provider object

See L<Bio::Biblio::Provider> for more information.

=cut

sub journal {
  my ($self,$value) = @_;
  if (defined $value) {
      if( ! $value->isa('Bio::Biblio::Journal') ) {
	  $self->throw("Is not a Bio::Biblio::Journal object but a [$value]");
	  return (undef);
      }
      else {
	  $self->{'_journal'} = $value;
      }
  }
  unless (exists $self->{'_journal'}) {
      return (undef);
  } else {
      return $self->{'_journal'};
  }
}



1;
