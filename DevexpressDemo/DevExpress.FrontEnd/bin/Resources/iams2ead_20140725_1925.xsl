<?xml version="1.0" encoding="utf-8"?>
<!--
  
  IAMS(XML) to EAD XSL Stylesheet
  
  Author: Richard Boulderstone, initial version released by Richard
  Modified: v0.08-20130419            
            v0.09-20130424             Released by Markus
            v0.10-20130429             Released by Markus
            v0.21-20130503             Released by Markus
            v0.23-20130513             Released by Markus
            v0.24-20130703             Released by Markus
            v0.30-20130705             Released by Markus
            v0.31-20130708             Released by Markus
            v0.32-20130708             Released by Markus
            v0.33-20130709             Released by Markus
            v0.34-20130709             Released by Markus
            v0.35-20130710             Released by Markus
            v0.36-20130712             Released by Markus
            v0.37-20130716             Released by Markus
            v0.38-20130729             Released by Markus
            v0.39-20130806             Released by Markus
            v0.40-20130918             Released by Markus
            v0.41-20130924             Released by Markus
            v0.42-20140130             Released by Markus
            v0.43-20140507             Released by Markus
            v0.44-20140725             Released by Markus
            
  Date: 25 July 2014
  
  Version: 0.01 Inital version
  Version: 0.02 Convert all select xpath statements /root/File/StartDate | /root/Item/StartDate
                    to /root/*/StartDate; 
               Put ead: prefix infront of repository element
               Modified <ead:archdesc level="files"> so that it used element name from xml
                    <ead:archdesc level="{name(/root/*[1])}">
           0.03 Changed long text parsing to ensure output contains 'p' rather than 'P' and
               included xmlns="ead" in ead:ead tag
           0.04 Supress empty namespace in imported 'long text' items
           0.05 Put {LoadDate} into date loaded field so that XmlWriter can put current date into field
           0.06 Make all related field references relative to the record selected
           0.07 Included lastmodified date which gets extracted by QatarMets
           0.08 Corrected IAMS-path for DecimalCoordinates and ScaleDesignator;
               added namespace information to <p> elements; they now become <ead:p>
           0.09 Changed namespace for ead:item to urn:isbn:1-931666-22-9
               Added <ead:date type="modified">
               Deleted lastmodifieddate from ead:ead root element
               Added <ead:unitid identifier="ARK">
               
            0.10   - put export/access time into <ead:date type="exported">
                   - get value from eadid from /root/*/Reference instead of
                   /root's attribute
                   - Store MDARK in same ead:unitid as the reference number
                   - ead:langmaterial not hard wired anymore; getting values from
                   the IAMS record
                   - value for "authfilenumber" now gathered from @RecordID
                   attribute for <ead:geogname> and <ead:subject> and
                   <ead:person>
                   - <item> is not <ead:item>; removed namespace definition for
                   <item> as well
                   - support of the following elements within <p>: <ead:title>,
                   <ead:emph>, <ead:date>
                    - maps IAMS specific levels to ead-compliant levels in
                    <ead:archdesc>
                    
            0.11 - changed ead:unitid - now contains all three identifiers: the MD-ARK, the iams-ID
                   and the reference number
                   
            0.21 - changes ead:unitid again :-(
                 - maps CreationDateCalendar, if available - otherwise uses default value
                 "gregorian"
                 - uses CreationDateEra; era no longer set with default value "ce"
                 - takes value for language and script of the description from IAMS record, no longer uses the
                 default
                 - maps FrmIntReference (previous element was always created as empty element
                - corrected path to CorporateBody
                - added mapping for Orientation element
                - updated level-mapping from IAMS to EAD
                
           0.23 - updated level-mapping using the correct capitalization of terms
                - Added @role to geogname  with fixed value
                - Added @role to CorporateBodies; value taken from relationship
                - Added text-values for CorporateBodies
                - Updated ArchiveDescriptionRelationships
                - <emph> within <item> is now transformed correctly
                - only italic, sub and sup values of <emph> element's render attribute are
                transformed; they are mapped correctly to ead's attribute values
                
           0.24 - value for CPF are now changed according to Bill's proposal.
                   ___ finally authorities are now changed according to proposal from Qatar, see
                   email 1st july.
                - Added String of script in <ead:langmaterial>
                - Subject Type now stored in "altrender" attribute
                - Decimal coordinates are now expressed as georss: This requires an XSLT1 capable
                XSLT processor. Code for XSLT2 is also included, but needs to be uncommented.
                - Uses "altrender" attribute to store Name-type for Corporate-, Family- and
                Personnames.
                - Fixed <RelatedMaterial> Bug
                - Added <p> element to <relatedmaterial> for ArchiveDescriptionRelationships as the
                element must not be empty. However this mapping is not yet called, as there is an
                outstanding issue with the id-attribute (of the relatedmaterial) element.
                
           0.30 - moved stylesheet to XSLT 2.0; tokenization of strings requires XSLT 2.0
                -  /root/*/ArchiveDescriptionRelationships/RelatedArchDesc is used to record
                   identifiers of all related archival descriptions (in altrender attribute).
                   
           0.31 - Bugfix: changed relative path to other style sheets
           0.32 - Bugfix: defined "ms" prefix.
           0.33 - Bugfix: multiple personnames for the same person but with different "name types" 
                  names are now transformed correctly.
           0.34 - <emph> within title now handled correctly
                - value for ead's calendar attribute doesn't contain any spaces anymore; all space
                  characters are deleted in order to match ead's NMTOKEN requirements. This is
                  currently used for IAMS' CreationDateCalendar.
                - supports lists within paragraphs; and items within lists.
           0.35 - support of list, p, and note elements as direct chidlren for RelatedMaterial, CustodialHistory
                  FindingAids,OrigInfo,ImmSourceAcquistion,PhysicalCharacteristics.      
                  Previously only <note> and <list> within <p> were supported.
                  (Bug fix of Bug reported by Bill, 10.07.2013)
                - Bugfix: bug fixes of mixed content fields: text and <p> may now occur
                  on the same level (as siblings) and the text gets wrapped into a paragraph as well.
                - Bugfix: IAMS Title element with embedded <P> elements correctly transformed to EAD:
                  getting rid of <P> elements and just have a single <ead:title> element
                - Changed XPath for corporate bodies to /root/RelatedAuthorities/RelatedAuthority/Corporation/CorporationNames/CorporationName
                  had incorrect path before.
           0.36 - values of @role attribute are now all lower-case
                - <ead:archdesc> uses correct values for OTHERLEVEL attribute
                - <ead:famname>: position of ROLE and AUTHFILENUMBER attribute switched

           0.37 - corrected value for "level" attribute archdesc for subsubfonds and subsubsubfonds
                - The following source elements will only have an output, if they exist (they don't
                seem to exist in all cases, not even as an empyt element):
                    AdministrativeContext
                    Appraisal
                    Arrangement
                    CopiesInformation
                    Accurals
                -   StartDate/EndDate values of "-9999" (default value) are now replaced by "0000" for
                    ead:unitdate/@normal as the attribute doesn't allow for negativ values.  
           0.38 -  Bugfix: <ead:title> element without <p> element, but embedded <emph> element is
                   now outputted correctly; bug had been introduced in 0.35
                -  Changes to long text fields: support additional combinations of unstructured text
                
                fields:
                
                1) Source: Test Record one
                   Target: <ead:p>TestRecord one</ead:p>
                
                2) Source: <P>Test Record two</P>
                   Target: <ead:p>Test Record two</ead:p>
                
                3) Source:  <p>Test <emph render = 'italic'>Record</emph> three</p>
                   Target:  <ead:p>Test<ead:emph render="italic">Record</ead:emph> three</ead:p>
                   
                4) Source: Test <emph render = 'italic'>Record</emph> four 
                   Target: <ead:p>Test<ead:emph render="italic">Record</ead:emph> four</ead:p>
                
                5) Source: <emph render = 'italic'>Test Record</emph> five
                   Target: <ead:p><ead:emph render="italic">Test Record</ead:emph> five</ead:p>
                
                6) Source: <p><emph render = 'italic'>Test Record</emph></p><p>six</p>
                   Target: <ead:p><ead:emph render="italic">Test Record</ead:emph>
                           </ead:p>
                           <ead:p>six</ead:p>
                           
                7) Source:  <p><emph render = 'italic'>Test</emph></p>Record<p> seven</p>
                   Target:   <ead:p><ead:emph render="italic">Test</ead:emph></ead:p>
                             <ead:p>Record</ead:p>
                             <ead:p> seven</ead:p>
                
                8) Source: Test<p><emph render = 'italic'>Record</emph></p>eight
                   Target: <ead:p>Test</ead:p>
                           <ead:p><ead:emph render="italic">Record</ead:emph></ead:p>
                           <ead:p>eight</ead:p>
                
                The following fields had been changed:
                - PublicationNote
                - PhysicalCharacteristics
                - OrigInfo
                - ImmSourceAcquistion
                - FindingAids
                - ScopeContent
                - CustodialHistory
  
          0.39  - <ead:title> element: Bugfix in template /root/*/Title
                  Title without any elements is now transformed correctly
                  
          0.40  - <ead:title> element: another bugifx:
          Values of <p><emph> combination had been duplicated.
          
          0.41  - <ead:title> element:
                   normalize spaces, add double space between two <p>/<P> elements; add single space
                   between <emph> and <p> element.
                   
          0.41a - comment outputs correct version number of style sheet    
             
          0.42 - transform PrivateNotes field to <odd> attribute
             
          0.43 - fixed bug to transform "CopiesInformation" field to
          <ead:altformavail>; internal structure of field is now copied as well.
          Output is now valid
          
          0.44 - fixed bug with items and list in ScopeContent element; may have
          affected items and list within other elements as well.
          
-->

<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ead="urn:isbn:1-931666-22-9"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:ms="urn:schemas-microsoft-com:xslt"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:str="http://exslt.org/strings"
  extension-element-prefixes="str ms"
  xsi:schemaLocation="urn:isbn:1-931666-22-9 http://www.loc.gov/ead/ead.xsd">
  <!-- Import style sheets -->
  <xsl:import
    href="./functions/tokenize/str.tokenize.template.xsl" />

  <!--
  IAMS to EAD XSL Stylesheet 
    -->
  <xsl:output
    method="xml"
    indent="yes" />
  <xsl:variable
    name="stylesheetversion">0.44, 25.07.2014</xsl:variable>

  <!--
  eadheader
-->
  <xsl:template
    match="/root">

    <ead:ead>

      <xsl:comment>
        EAD Transformation was performed by: <xsl:choose>
                    <xsl:when test="system-property('xsl:vendor') = 'Microsoft'">
                        <xsl:text>Microsoft </xsl:text>
                        <xsl:variable name="ms-version" select="system-property('ms:version')" />
                        <xsl:choose>
                            <xsl:when test="$ms-version = ''">XslTransform</xsl:when>
                            <xsl:when test="starts-with($ms-version, 'v')">XslCompiledTransform</xsl:when>
                            <xsl:otherwise>
                                MSXML
                                <xsl:value-of select="$ms-version" />
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise> Unrecognized XSLT engine from '<xsl:value-of select="system-property('xsl:vendor')" />'
                    </xsl:otherwise>
         </xsl:choose>
         Version of XSLT that is supported: <xsl:value-of select="system-property('xsl:version')" />
         Style sheet version <xsl:value-of select="$stylesheetversion" />
        
      </xsl:comment>
      <!-- <xsl:attribute name="lastmodifieddate">
          <xsl:value-of select="@LastModifiedDate" />
      </xsl:attribute>
      -->
      <!--
          eadheader
      -->

      <ead:eadheader>
        <ead:eadid>
          <xsl:value-of
            select="/root/*/Reference" />
          <!-- <xsl:value-of select="@iamsref" /> -->
        </ead:eadid>
        <ead:filedesc>
          <ead:titlestmt>
            <ead:titleproper />
          </ead:titlestmt>
        </ead:filedesc>
        <ead:profiledesc>
          <ead:creation>
            <ead:date
              type="exported">
              <xsl:value-of
                select="/root/@AccessTime" />
            </ead:date>
            <ead:date
              type="modified">
              <xsl:value-of
                select="/root/@LastModifiedDate" />
            </ead:date>
          </ead:creation>
          <ead:langusage>
            <ead:language>
              <xsl:attribute
                name="langcode">
                <xsl:value-of
                  select="/root/*/DescriptionLanguage/@LanguageIsoCode" />
              </xsl:attribute>
              <xsl:attribute
                name="scriptcode">
                <xsl:value-of
                  select="/root/*/DescriptionScript/@ScriptIsoCode" />
              </xsl:attribute>
              <xsl:value-of
                select="/root/*/DescriptionLanguage" />
            </ead:language>
          </ead:langusage>
        </ead:profiledesc>
      </ead:eadheader>
      <!--
        archdesc  
      -->

      <ead:archdesc>

        <xsl:choose>
          <xsl:when
            test="name(/root/*[1]) = 'Collection'">
            <xsl:attribute
              name="level">
              <xsl:text>collection</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:when
            test="name(/root/*[1]) = 'Fonds'">
            <xsl:attribute
              name="level">
              <xsl:text>fonds</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:when
            test="name(/root/*[1]) = 'SubFonds'">
            <xsl:attribute
              name="level">
              <xsl:text>subfonds</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:when
            test="name(/root/*[1]) = 'Series'">
            <xsl:attribute
              name="level">
              <xsl:text>series</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:when
            test="name(/root/*[1]) = 'SubSeries'">
            <xsl:attribute
              name="level">
              <xsl:text>subseries</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:when
            test="name(/root/*[1]) = 'File'">
            <xsl:attribute
              name="level">
              <xsl:text>file</xsl:text>
            </xsl:attribute>
          </xsl:when>
          <xsl:when
            test="name(/root/*[1]) = 'Item'">
            <xsl:attribute
              name="level">
              <xsl:text>item</xsl:text>
            </xsl:attribute>
          </xsl:when>

          <xsl:when
            test="name(/root/*[1]) = 'SubSubFonds'">
            <xsl:attribute
              name="level">
              <xsl:text>otherlevel</xsl:text>
            </xsl:attribute>
            <xsl:attribute
              name="otherlevel">
              <xsl:text>subsubfonds</xsl:text>
            </xsl:attribute>
          </xsl:when>

          <xsl:when
            test="name(/root/*[1]) = 'SubSubSubFonds'">
            <xsl:attribute
              name="level">
              <xsl:text>otherlevel</xsl:text>
            </xsl:attribute>
            <xsl:attribute
              name="otherlevel">
              <xsl:text>subsubsubfonds</xsl:text>
            </xsl:attribute>
          </xsl:when>

          <xsl:when
            test="name(/root/*[1]) = 'SubSubSeries'">
            <xsl:attribute
              name="level">
              <xsl:text>otherlevel</xsl:text>
            </xsl:attribute>
            <xsl:attribute
              name="otherlevel">
              <xsl:text>subsubseries</xsl:text>
            </xsl:attribute>
          </xsl:when>

          <xsl:when
            test="name(/root/*[1]) = 'SubSubSubSeries'">
            <xsl:attribute
              name="level">
              <xsl:text>otherlevel</xsl:text>
            </xsl:attribute>
            <xsl:attribute
              name="otherlevel">
              <xsl:text>subsubsubseries</xsl:text>
            </xsl:attribute>
          </xsl:when>

          <xsl:when
            test="name(/root/*[1]) = 'SubItem'">
            <xsl:attribute
              name="level">
              <xsl:text>otherlevel</xsl:text>
            </xsl:attribute>
            <xsl:attribute
              name="otherlevel">
              <xsl:text>subitem</xsl:text>
            </xsl:attribute>
          </xsl:when>

          <xsl:when
            test="name(/root/*[1]) = 'SubSubItem'">
            <xsl:attribute
              name="level">
              <xsl:text>otherlevel</xsl:text>
            </xsl:attribute>
            <xsl:attribute
              name="otherlevel">
              <xsl:text>subsubitem</xsl:text>
            </xsl:attribute>
          </xsl:when>

          <xsl:when
            test="name(/root/*[1]) = 'SubSubSubItem'">
            <xsl:attribute
              name="level">
              <xsl:text>otherlevel</xsl:text>
            </xsl:attribute>
            <xsl:attribute
              name="otherlevel">
              <xsl:text>subsubsubitem</xsl:text>
            </xsl:attribute>
          </xsl:when>

          <xsl:otherwise>
            <xsl:attribute
              name="level">
              <xsl:text>otherlevel</xsl:text>
            </xsl:attribute>
            <xsl:attribute
              name="otherlevel">
              <xsl:value-of
                select="name(/root/*[1])" />
            </xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>


        <!-- <ead:archdesc level="{name(/root/*[1])}"> -->
        <ead:did>
          <ead:repository>
            <xsl:value-of
              select="/root/*/Repository" />
            <xsl:text>: </xsl:text>
            <xsl:value-of
              select="/root/*/CollectionArea" />
          </ead:repository>

          <ead:unitid>
            <xsl:attribute
              name="label">
              <xsl:value-of
                select="/root/*/@RecordID" />
            </xsl:attribute>
            <xsl:attribute
              name="identifier">
              <xsl:value-of
                select="/root/*/MDARK" />
            </xsl:attribute>
            <xsl:value-of
              select="/root/*/Reference" />
          </ead:unitid>


          <!--  <xsl:apply-templates select="/root/*/Title" mode="lt_title" /> -->
          <xsl:apply-templates
            select="/root/*/Title" />


          <ead:unittitle
            label="Former external reference">
            <xsl:value-of
              select="/root/*/FrmExtReference" />
          </ead:unittitle>

          <ead:unittitle
            label="Former internal reference">
            <xsl:value-of
              select="/root/*/FrmIntReference" />
          </ead:unittitle>
          <ead:unitdate
            datechar="Creation">

            <!-- set calendar to default value, if it doesn't exist -->
            <xsl:choose>
              <xsl:when
                test="/root/*/CreationDateCalendar">
                <xsl:attribute
                  name="calendar">

                  <!-- delete any spaces -->
                  <xsl:if
                    test="system-property('xsl:version')='1'">
                    <xsl:call-template
                      name="search-and-replace">
                      <xsl:with-param
                        name="input"
                        select="/root/*/CreationDateCalendar" />
                      <xsl:with-param
                        name="search-string"
                        select="'&#x20;'" />
                      <xsl:with-param
                        name="replace-string"
                        select="''" />
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if
                    test="system-property('xsl:version')='2.0'">
                    <xsl:variable
                      name="text"
                      select="replace(/root/*/CreationDateCalendar,'&#x20;','')" />
                    <xsl:value-of
                      select="$text" />
                  </xsl:if>
                  <!-- <xsl:value-of select="/root/*/CreationDateCalendar"/> -->
                </xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute
                  name="calendar">
                  <xsl:text>gregorian</xsl:text>
                </xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>

            <xsl:attribute
              name="era">
              <xsl:value-of
                select="/root/*/CreationDateEra" />
            </xsl:attribute>
            <xsl:attribute
              name="normal">
              <xsl:if
                test="/root/*/StartDate != -9999">
                <xsl:value-of
                  select="/root/*/StartDate" />
              </xsl:if>
              <xsl:if
                test="/root/*/StartDate = -9999">
                <xsl:text>0000</xsl:text>
              </xsl:if>
              <xsl:text>/</xsl:text>
              <xsl:if
                test="/root/*/EndDate != -9999">
                <xsl:value-of
                  select="/root/*/EndDate" />
              </xsl:if>
              <xsl:if
                test="/root/*/EndDate = -9999">
                <xsl:text>0000</xsl:text>
              </xsl:if>
            </xsl:attribute>
            <xsl:value-of
              select="/root/*/DateRange" />
          </ead:unitdate>

          <!-- set the ISO code for language and script -->
          <ead:langmaterial>
            <xsl:for-each
              select="/root/*/MaterialLanguages/MaterialLanguage">
              <ead:language>
                <xsl:attribute
                  name="langcode">
                  <xsl:value-of
                    select="./@LanguageIsoCode" />
                </xsl:attribute>
                <xsl:value-of
                  select="." />
              </ead:language>
            </xsl:for-each>
          </ead:langmaterial>
          <ead:langmaterial>
            <xsl:for-each
              select="/root/*/MaterialScripts/MaterialScript">
              <ead:language>
                <xsl:attribute
                  name="scriptcode">
                  <xsl:value-of
                    select="./@ScriptIsoCode" />
                </xsl:attribute>
                <xsl:value-of
                  select="." />
              </ead:language>
            </xsl:for-each>
          </ead:langmaterial>
          <ead:physdesc>
            <ead:extent>
              <xsl:value-of
                select="/root/*/Extent" />
            </ead:extent>
          </ead:physdesc>
          <xsl:if
            test="/root/*/Scale/text()">
            <ead:materialspec
              type="scale">
              <xsl:value-of
                select="/root/*/Scale" />
            </ead:materialspec>
          </xsl:if>

          <xsl:if
            test="/root/*/ScaleDesignator/text()">
            <ead:materialspec
              type="scale designator">
              <xsl:value-of
                select="/root/*/ScaleDesignator" />
            </ead:materialspec>
          </xsl:if>

          <xsl:if
            test="/root/*/Projection/text()">
            <ead:materialspec
              type="projection">
              <xsl:value-of
                select="/root/*/Projection" />
            </ead:materialspec>
          </xsl:if>

          <!-- create coordinates -->
          <xsl:if
            test="/root/*/DecimalCoordinates/text()">
            <ead:materialspec
              type="coordinates">
              <xsl:attribute
                name="label">
                <xsl:text>decimal</xsl:text>
              </xsl:attribute>
              <xsl:call-template
                name="reorderGeoCoordinates">
                <xsl:with-param
                  name="geocoordinates"
                  select="/root/*/DecimalCoordinates" />
              </xsl:call-template>
              <!--<xsl:value-of select="/root/*/DecimalCoordinates"/> -->

            </ead:materialspec>
          </xsl:if>
          <xsl:if
            test="/root/*/Orientation/text()">
            <ead:materialspec
              type="orientation">
              <xsl:value-of
                select="/root/*/Orientation" />
            </ead:materialspec>
          </xsl:if>
        </ead:did>

        <ead:accessrestrict>
          <xsl:if
            test="/root/*/AccessCondition != ''">
            <xsl:apply-templates
              select="/root/*/AccessCondition"
              mode="lt" />
          </xsl:if>
          <xsl:if
            test="/root/*/AccessDate != ''">
            <xsl:apply-templates
              select="/root/*/AccessDate"
              mode="lt" />
          </xsl:if>
        </ead:accessrestrict>

        <ead:accessrestrict>
          <ead:legalstatus>
            <xsl:value-of
              select="/root/*/LegalStatus" />
          </ead:legalstatus>
        </ead:accessrestrict>

        <xsl:if
          test="/root/*/Accruals">
          <ead:accruals>
            <xsl:apply-templates
              select="/root/*/Accruals"
              mode="lt" />
          </ead:accruals>
        </xsl:if>

        <xsl:if
          test="/root/*/AdministrativeContext">
          <ead:bioghist>
            <xsl:apply-templates
              select="/root/*/AdministrativeContext"
              mode="lt" />
          </ead:bioghist>
        </xsl:if>

        <xsl:if
          test="/root/*/Appraisal">
          <ead:appraisal>
            <xsl:apply-templates
              select="/root/*/Appraisal"
              mode="lt" />
          </ead:appraisal>
        </xsl:if>

        <xsl:if
          test="/root/*/Arrangement">
          <ead:arrangement>
            <xsl:apply-templates
              select="/root/*/Arrangement"
              mode="lt" />
          </ead:arrangement>
        </xsl:if>

        <xsl:if
          test="/root/*/CopiesInformation">
            <xsl:apply-templates
              select="/root/*/CopiesInformation" />         
        </xsl:if>

        <!-- <ead:custodhist> -->
        <xsl:apply-templates
          select="/root/*/CustodialHistory" />

        <!-- <ead:otherfindaid> -->
        <xsl:apply-templates
          select="/root/*/FindingAids" />

        <!-- <ead:acqinfo> -->
        <xsl:apply-templates
          select="/root/*/ImmSourceAcquisition" />

        <!-- <ead:originalsloc> -->
        <xsl:apply-templates
          select="/root/*/OrigInfo" />

        <!-- <ead:phystech> -->
        <xsl:apply-templates
          select="/root/*/PhysicalCharacteristics" />

        <!-- <ead:bibliography> -->
        <xsl:apply-templates
          select="/root/*/PublicationNote" />

        <!-- <ead:relatedmaterial type="text"> -->
        <xsl:apply-templates
          select="/root/*/RelatedMaterial" />
        <xsl:apply-templates
          select="/root/*/ArchiveDescriptionRelationships/RelatedArchDesc" />

        <xsl:if
          test="/root/*/RelatedMaterial/@RecordID != ''">
          <ead:relatedmaterial
            type="fixed relation">
            <xsl:attribute
              name="id">
              <xsl:value-of
                select="/root/*/RelatedMaterial/@RecordID" />
            </xsl:attribute>
          </ead:relatedmaterial>
        </xsl:if>

        <!-- <ead:scopecontent> -->
        <xsl:apply-templates
          select="/root/*/ScopeContent" />

        <ead:userestrict>
          <xsl:apply-templates
            select="/root/*/UserConditions"
            mode="lt" />
        </ead:userestrict>
        <ead:odd>
          <xsl:apply-templates
            select="/root/*/Note"
            mode="lt" />
        </ead:odd>
        <!--
          Control Access
        -->
        <ead:controlaccess>
          <ead:genreform
            source="IAMS">
            <xsl:value-of
              select="/root/*/MaterialType" />
          </ead:genreform>
          <xsl:for-each
            select="/root/RelatedAuthorities/RelatedAuthority/Person/PersonNames/PersonName">
            <!-- Format of the string is: 
                 <Surname>, <Pre Title> <FirstName>, <AdditionalInformation>, <DateRange>, <Title>, <Epithet> -->
            <ead:persname>
              <xsl:attribute
                name="authfilenumber">
                <xsl:value-of
                  select="../../MDARK" />
              </xsl:attribute>
              <xsl:attribute
                name="role">
                <xsl:value-of
                  select="lower-case(../../../@relationship)" />
              </xsl:attribute>
              <xsl:attribute
                name="source">
                <xsl:text>IAMS</xsl:text>
              </xsl:attribute>

              <xsl:attribute
                name="altrender">
                <xsl:value-of
                  select="./NameType" />
              </xsl:attribute>
              <xsl:if
                test="./FirstName/text()">
                <xsl:value-of
                  select="./FirstName" />
                <xsl:text> </xsl:text>
              </xsl:if>

              <xsl:if
                test="./Surname/text()">
                <xsl:value-of
                  select="./Surname" />
              </xsl:if>

            </ead:persname>
          </xsl:for-each>
          <xsl:for-each
            select="/root/RelatedAuthorities/RelatedAuthority/Family/FamilyNames/FamilyName">
            <!-- Format of the string is: 
              <FamilySurname>, <AdditionalInformation>, <FamilyEpithet>,<TerritorialDesignation >, <TitleOccupation >, <DateRange> -->
            <ead:famname>
              <xsl:attribute
                name="authfilenumber">
                <xsl:value-of
                  select="../../MDARK" />
              </xsl:attribute>
              <xsl:attribute
                name="role">
                <xsl:value-of
                  select="lower-case(../../../@relationship)" />
              </xsl:attribute>
              <xsl:attribute
                name="source">
                <xsl:text>IAMS</xsl:text>
              </xsl:attribute>
              <xsl:attribute
                name="altrender">
                <xsl:value-of
                  select="./NameType" />
              </xsl:attribute>

              <xsl:if
                test="./FamilySurname/text()">
                <xsl:value-of
                  select="./FamilySurname" />
              </xsl:if>

              <xsl:if
                test="./FamilyEpithet/text()">
                <xsl:text> (</xsl:text>
                <xsl:value-of
                  select="./FamilyEpithet" />
                <xsl:text>)</xsl:text>
              </xsl:if>

            </ead:famname>
          </xsl:for-each>

          <xsl:for-each
            select="/root/RelatedAuthorities/RelatedAuthority/Corporation/CorporationNames/CorporationName">
            <!-- Format of the string is: 
              <Jurisdiction>, <Name>, <AdditionalQualifiers>, <DateRange> -->
            <ead:corpname>
              <xsl:attribute
                name="authfilenumber">
                <xsl:value-of
                  select="../../MDARK" />
              </xsl:attribute>
              <xsl:attribute
                name="role">
                <xsl:value-of
                  select="lower-case(../../../@relationship)" />
              </xsl:attribute>
              <xsl:attribute
                name="source">
                <xsl:text>IAMS</xsl:text>
              </xsl:attribute>
              <xsl:attribute
                name="altrender">
                <xsl:value-of
                  select="./NameType" />
              </xsl:attribute>

              <xsl:value-of
                select="./CorporateName" />
            </ead:corpname>
          </xsl:for-each>
          <xsl:for-each
            select="/root/RelatedPlaces/RelatedPlace/Place">
            <!-- Format of the string is: 
              <Name>, <CivilParish>, <LocalAdminUnit>, <WiderAdminUnit>, <Country>
            -->
            <ead:geogname>
              <xsl:attribute
                name="authfilenumber">
                <xsl:value-of
                  select="./MDARK" />
              </xsl:attribute>
              <xsl:attribute
                name="role">
                <xsl:text>subject</xsl:text>
              </xsl:attribute>
              <xsl:attribute
                name="source">
                <xsl:text>IAMS</xsl:text>
              </xsl:attribute>
              <xsl:value-of
                select="./Name" />
            </ead:geogname>
          </xsl:for-each>
          <xsl:for-each
            select="/root/RelatedSubjects/RelatedSubject/Subject">
            <ead:subject>
              <xsl:attribute
                name="authfilenumber">
                <!-- <xsl:value-of select="./authfilenumber"/> -->
                <xsl:value-of
                  select="./MDARK" />
              </xsl:attribute>
              <xsl:attribute
                name="altrender">
                <xsl:value-of
                  select="./Type" />
              </xsl:attribute>
              <xsl:attribute
                name="source">
                <xsl:text>IAMS</xsl:text>
              </xsl:attribute>
              <xsl:value-of
                select="./Entry" />
            </ead:subject>
          </xsl:for-each>
          <xsl:for-each
            select="/root/*/ProjectCollections/ProjectCollection">
            <ead:note
              type="project/collection">
              <ead:p>
                <xsl:value-of
                  select="." />
              </ead:p>
            </ead:note>
          </xsl:for-each>
        </ead:controlaccess>

        <!-- the private notes field -->
        <xsl:for-each
          select="/root/*/ProjectCollection">
        
        
        </xsl:for-each>

      </ead:archdesc>
    </ead:ead>
  </xsl:template>
  <!--
  Process Long Text Fields:
  
  If field does not contain elements - just use text
  If field does contain elements - just copy field as is
  
  -->
  <xsl:template
    match="*"
    mode="lt">
    <xsl:choose>
      <xsl:when
        test="not(*)">
        <ead:p>
          <xsl:value-of
            select="." />
        </ead:p>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each
          select="./*">
          <xsl:if
            test="name(.)='P' or name(.)='p'">
            <xsl:element
              name="ead:p">
              <xsl:for-each
                select="node()">
                <xsl:copy-of
                  select="." />
              </xsl:for-each>
            </xsl:element>
          </xsl:if>
          <xsl:if
            test="name(.)='list'">
            <xsl:element
              name="ead:list">
              <xsl:for-each
                select="item">
                <xsl:apply-templates
                  select="." />
              </xsl:for-each>
            </xsl:element>
          </xsl:if>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!--
  Process Long Text Fields for Titles:
  
  If field does not contain elements - just use text with <ead:title> tags
  If field does contain elements - replace <ead:p> with <ead:title>
  
  -->
  <xsl:template
    match="*"
    mode="lt_title">
    <xsl:choose>
      <xsl:when
        test="not(*)">
        <ead:title>
          <xsl:value-of
            select="." />
        </ead:title>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each
          select="./*">
          <xsl:if
            test="name(.)='P' or name(.)='p' or name(.)='title' or name(.)='Title'">
            <xsl:element
              xmlns="ead"
              name="ead:title">
              <xsl:for-each
                select="node()">
                <xsl:choose>
                  <!-- in case the node is an emph node: -->
                  <xsl:when
                    test="name(.)='emph'">
                    <xsl:apply-templates
                      select="self::node()" />
                  </xsl:when>
                  <!-- else -->
                  <xsl:otherwise>
                    <xsl:copy-of
                      select="." />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </xsl:element>
          </xsl:if>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <!-- 
    The title field:
    - may contain just text
    - may contain <p> element with text embedded in <p>
    - in both cases the text may contain <emph> and <date> elements for tagging
      specific sections
  -->


  <xsl:template
    match="/root/*/Title">

    <!-- check, it has child nodes -->
    <xsl:if
      test="child::node()">

      <ead:unittitle
        label="Title">
        <ead:title>

          <!-- iterate over all child nodes -->
          <xsl:for-each
            select="./child::node()">
            <xsl:choose>

              <!-- child node is a P element  -->
              <xsl:when
                test="self::node()/name() ='P' or          self::node()/name()='p'">

                <!-- if the preceeding element was a <p> or <P> element, then we add a double space -->
                <xsl:if
                  test="preceding-sibling::P">
                  <xsl:text>  </xsl:text>
                </xsl:if>

                <xsl:if
                  test="preceding-sibling::p">
                  <xsl:text>  </xsl:text>
                </xsl:if>

                <xsl:apply-templates
                  select="self::node()"
                  mode="notags" />

              </xsl:when>
              <!-- child node is an emph-->
              <!-- just emph -->
              <xsl:when
                test="self::node()/name() ='emph'">

                <!-- if the preceeding element was a <p> or <P> element, then we add a single space -->
                <xsl:if
                  test="preceding-sibling::P">
                  <xsl:text> </xsl:text>
                </xsl:if>

                <xsl:if
                  test="preceding-sibling::p">
                  <xsl:text> </xsl:text>
                </xsl:if>

                <xsl:apply-templates
                  select="self::node()" />
              </xsl:when>

              <!-- child node is just text  -->
              <xsl:otherwise>

                <!-- delete line breaks
          and normalize the spaces
         -->

                <xsl:call-template
                  name="search-and-replace">
                  <xsl:with-param
                    name="input"
                    select="normalize-space(self::node())" />
                  <xsl:with-param
                    name="search-string"
                    select="'&#10;'" />
                  <xsl:with-param
                    name="replace-string"
                    select="''" />
                </xsl:call-template>

              </xsl:otherwise>

            </xsl:choose>
          </xsl:for-each>

        </ead:title>
      </ead:unittitle>

    </xsl:if>

  </xsl:template>

  <!-- ScopeContent to ead:scopecontent -->
  <xsl:template
    match="/root/*/ScopeContent">

    <xsl:if
      test="node()">
      <xsl:choose>

        <xsl:when
          test="self::node()/child::* and (self::node()/child::*/name() ='P' or
          self::node()/child::*/name()='p' or
          self::node()/child::*/name()='list')">
          <ead:scopecontent>

            <xsl:for-each
              select="./child::node()">
              <xsl:if
                test="self::* and name() ='P' or name()='p' or name()='list' or
                name()='note' or name()='scopecontent'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>
              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputTextAsParagraph">
                  <xsl:with-param
                    name="text"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </ead:scopecontent>
        </xsl:when>

        <xsl:otherwise>
          <ead:scopecontent>
            <xsl:call-template
              name="outputParsedTextAsParagraph">
              <xsl:with-param
                name="text"
                select="self::node()/child::node()" />
            </xsl:call-template>
          </ead:scopecontent>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:if>
  </xsl:template>


  <xsl:template
    match="/root/*/CopiesInformation">
    
    <xsl:if
      test="node()">
      <xsl:choose>
        
        <xsl:when
          test="self::node()/child::* and (self::node()/child::*/name() ='P' or
          self::node()/child::*/name()='p' or
          self::node()/child::*/name()='list')">
          <ead:altformavail>
            
            <xsl:for-each
              select="./child::node()">
              <xsl:if
                test="self::* and name() ='P' or name()='p' or name()='list' or
                name()='note' or name()='acqinfo'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>
              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputTextAsParagraph">
                  <xsl:with-param
                    name="text"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
            </ead:altformavail>
        </xsl:when>
        
        <xsl:otherwise>
          <ead:altformavail>
            <xsl:call-template
              name="outputParsedTextAsParagraph">
              <xsl:with-param
                name="text"
                select="self::node()/child::node()" />
            </xsl:call-template>
            </ead:altformavail>
        </xsl:otherwise>
      </xsl:choose>
      
    </xsl:if>
  </xsl:template>

  <xsl:template
    match="/root/*/CustodialHistory">

    <xsl:if
      test="node()">
      <xsl:choose>

        <xsl:when
          test="self::node()/child::* and (self::node()/child::*/name() ='P' or
          self::node()/child::*/name()='p' or
          self::node()/child::*/name()='list')">
          <ead:custodhist>

            <xsl:for-each
              select="./child::node()">
              <xsl:if
                test="self::* and name() ='P' or name()='p' or name()='list' or
                name()='note' or name()='acqinfo'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>
              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputTextAsParagraph">
                  <xsl:with-param
                    name="text"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </ead:custodhist>
        </xsl:when>

        <xsl:otherwise>
          <ead:custodhist>
            <xsl:call-template
              name="outputParsedTextAsParagraph">
              <xsl:with-param
                name="text"
                select="self::node()/child::node()" />
            </xsl:call-template>
          </ead:custodhist>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:if>
  </xsl:template>

  <!-- FindingAids to <ead:otherfindaid> -->

  <xsl:template
    match="/root/*/FindingAids">

    <xsl:if
      test="node()">
      <xsl:choose>

        <xsl:when
          test="self::node()/child::* and (self::node()/child::*/name() ='P' or
          self::node()/child::*/name()='p' or
          self::node()/child::*/name()='list')">
          <ead:otherfindaid>

            <xsl:for-each
              select="./child::node()">
              <xsl:if
                test="self::* and name() ='P' or name()='p' or name()='list' or
                name()='note'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>
              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputTextAsParagraph">
                  <xsl:with-param
                    name="text"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </ead:otherfindaid>
        </xsl:when>

        <xsl:otherwise>
          <ead:otherfindaid>
            <xsl:call-template
              name="outputParsedTextAsParagraph">
              <xsl:with-param
                name="text"
                select="self::node()/child::node()" />
            </xsl:call-template>
          </ead:otherfindaid>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:if>
  </xsl:template>

  <!-- ImmSourceAcquisition to <ead:acqinfo> -->

  <xsl:template
    match="/root/*/ImmSourceAcquisition">

    <xsl:if
      test="node()">
      <xsl:choose>

        <xsl:when
          test="self::node()/child::* and (self::node()/child::*/name() ='P' or
          self::node()/child::*/name()='p' or
          self::node()/child::*/name()='list')">
          <ead:acqinfo>

            <xsl:for-each
              select="./child::node()">
              <xsl:if
                test="self::* and name() ='P' or name()='p' or name()='list' or
                name()='note'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>
              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputTextAsParagraph">
                  <xsl:with-param
                    name="text"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </ead:acqinfo>
        </xsl:when>

        <xsl:otherwise>
          <ead:acqinfo>
            <xsl:call-template
              name="outputParsedTextAsParagraph">
              <xsl:with-param
                name="text"
                select="self::node()/child::node()" />
            </xsl:call-template>
          </ead:acqinfo>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:if>
  </xsl:template>

  <!-- OrigInfo to  <ead:originalsloc>  -->

  <xsl:template
    match="/root/*/OrigInfo">

    <xsl:if
      test="node()">
      <xsl:choose>

        <xsl:when
          test="self::node()/child::* and (self::node()/child::*/name() ='P' or
          self::node()/child::*/name()='p' or
          self::node()/child::*/name()='list')">
          <ead:originalsloc>

            <xsl:for-each
              select="./child::node()">
              <xsl:if
                test="self::* and name() ='P' or name()='p' or name()='list' or
                name()='note'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>
              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputTextAsParagraph">
                  <xsl:with-param
                    name="text"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </ead:originalsloc>
        </xsl:when>

        <xsl:otherwise>
          <ead:originalsloc>
            <xsl:call-template
              name="outputParsedTextAsParagraph">
              <xsl:with-param
                name="text"
                select="self::node()/child::node()" />
            </xsl:call-template>
          </ead:originalsloc>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:if>
  </xsl:template>

  <!-- PhysicalCharacteristics to  <ead:phystech>  
  
  <p>text()</p>
  <p>text()</p>text()<p>text()</p>
  text()
  <emph>ss</emph>text()<p>text()</p>
  
  -->


  <xsl:template
    match="/root/*/PhysicalCharacteristics">
    <xsl:if
      test="node()">
      <xsl:choose>

        <xsl:when
          test="self::node()/child::* and (self::node()/child::*/name() ='P' or
          self::node()/child::*/name()='p' or
          self::node()/child::*/name()='list')">
          <ead:phystech>

            <xsl:for-each
              select="./child::node()">
              <xsl:if
                test="self::* and name() ='P' or name()='p' or name()='list' or
                name()='note'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>
              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputTextAsParagraph">
                  <xsl:with-param
                    name="text"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </ead:phystech>
        </xsl:when>

        <xsl:otherwise>
          <ead:phystech>
            <xsl:call-template
              name="outputParsedTextAsParagraph">
              <xsl:with-param
                name="text"
                select="self::node()/child::node()" />
            </xsl:call-template>
          </ead:phystech>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:if>
  </xsl:template>

  <!-- <xsl:template match="/root/*/PhysicalCharacteristics/p">
    <xsl:if test="node()">
      <ead:p>
        <xsl:copy-of select="@*[local-name()= 'render' or local-name()=
          'audience' or local-name()= 'id']"/> 
        <xsl:for-each select="./child::node()">
          <xsl:if test="name() ='emph' or name()='note' or name()='date' or name()='' or name()='list'">
            <xsl:apply-templates select="self::node()"/>    
          </xsl:if>  
        </xsl:for-each>
      </ead:p> 
    </xsl:if>
  </xsl:template> -->



  <!-- PublicationNote to <ead:bibliography>  -->

  <xsl:template
    match="/root/*/PublicationNote">

    <xsl:if
      test="node()">
      <xsl:choose>

        <xsl:when
          test="self::node()/child::* and (self::node()/child::*/name() ='P' or
          self::node()/child::*/name()='p' or
          self::node()/child::*/name()='list')">
          <ead:bibliography>

            <xsl:for-each
              select="./child::node()">
              <xsl:if
                test="self::* and name() ='P' or name()='p' or name()='list' or
                name()='note'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>
              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputTextAsParagraph">
                  <xsl:with-param
                    name="text"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>
            </xsl:for-each>
          </ead:bibliography>
        </xsl:when>

        <xsl:otherwise>
          <ead:bibliography>
            <xsl:call-template
              name="outputParsedTextAsParagraph">
              <xsl:with-param
                name="text"
                select="self::node()/child::node()" />
            </xsl:call-template>
          </ead:bibliography>
        </xsl:otherwise>
      </xsl:choose>

    </xsl:if>
  </xsl:template>

  <!-- RelatedMaterial to <ead:relatedmaterial>  -->

  <xsl:template
    match="/root/*/RelatedMaterial">
    <xsl:if
      test="node()">
      <ead:relatedmaterial>
        <xsl:attribute
          name="type">
          <xsl:text>text</xsl:text>
        </xsl:attribute>
        <xsl:choose>
          <xsl:when
            test="not(*)">
            <ead:p>
              <xsl:value-of
                select="." />
            </ead:p>
          </xsl:when>
          <xsl:otherwise>
            <!-- has element -->
            <xsl:for-each
              select="./child::node()">
              <xsl:if
                test="self::* and name() ='P' or name()='p' or name()='list' or name()='' or
                name()='note'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>

              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputTextAsParagraph">
                  <xsl:with-param
                    name="text"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>

            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </ead:relatedmaterial>
    </xsl:if>
  </xsl:template>

  <!-- Is this the correct structure???
      <ArchiveDescriptionRelationships >
        <RelatedArchDesc>
            <RelationshipType></RelationshipType>
            <TargetRecordId></TargetRecordId>
        </RelatedArchDesc>
    </ArchiveDescriptionRelationships>
  -->

  <xsl:template
    match="/root/*/ArchiveDescriptionRelationships/RelatedArchDesc">
    <xsl:if
      test="node()">
      <ead:relatedmaterial>
        <xsl:attribute
          name="type">
          <xsl:text>fixed relation</xsl:text>
        </xsl:attribute>
        <!-- ID may be incorrect, check! -->
        <xsl:attribute
          name="altrender">
          <xsl:value-of
            select="./TargetRecordId" />
        </xsl:attribute>
        <xsl:if
          test="./NatureRelationshipTargetDescription/text()">
          <ead:p>
            <xsl:value-of
              select="./NatureRelationshipTargetDescription" />
          </ead:p>
        </xsl:if>
      </ead:relatedmaterial>
    </xsl:if>
  </xsl:template>

  <!-- all elements within the <P> element -->

  <xsl:template
    match="P">
    <ead:p>
      <xsl:copy-of
        select="@*[local-name()= 'render' or local-name()=             'audience' or local-name()=
        'id']" />

      <!-- has element -->
      <xsl:for-each
        select="./child::node()">
        <xsl:if
          test="name() ='emph' or name()='note' or name()='date' or name()='' or
          name()='list'">
          <xsl:apply-templates
            select="self::node()" />
        </xsl:if>
      </xsl:for-each>
    </ead:p>
  </xsl:template>

  <xsl:template
    match="P"
    mode="notags">
    <xsl:copy-of
      select="@*[local-name()= 'render' or local-name()=         'audience' or local-name()= 'id']" />

    <!-- has element -->
    <xsl:for-each
      select="./child::node()">
      <xsl:if
        test="name() ='emph' or name()='note' or name()='date' or name()='' or
        name()='list'">
        <xsl:apply-templates
          select="self::node()" />
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template
    match="p">
    <ead:p>
      <xsl:copy-of
        select="@*[local-name()= 'render' or local-name()=         'audience' or local-name()=
        'id']" />
      <xsl:for-each
        select="./child::node()">
        <xsl:if
          test="name() ='emph' or name()='note' or name()='date' or name()='' or name()='list'">
          <xsl:apply-templates
            select="self::node()" />
        </xsl:if>
      </xsl:for-each>
    </ead:p>
  </xsl:template>

  <xsl:template
    match="p"
    mode="notags">

    <xsl:copy-of
      select="@*[local-name()= 'render' or local-name()=         'audience' or local-name()= 'id']" />
    <xsl:for-each
      select="./child::node()">
      <xsl:if
        test="name() ='emph' or name()='note' or name()='date' or name()='' or name()='list'">
        <xsl:apply-templates
          select="self::node()" />
      </xsl:if>
    </xsl:for-each>

  </xsl:template>


  <xsl:template
    match="list">
    <ead:list>
      <xsl:copy-of
        select="@*[local-name()= 'render' or local-name()=         'audience' or local-name()=
        'id']" />
      <xsl:for-each
        select="./child::node()">
        <xsl:if
          test="name() ='item'">
          <xsl:apply-templates
            select="self::node()" />
        </xsl:if>
      </xsl:for-each>
    </ead:list>
  </xsl:template>

  <xsl:template
    match="item">
    <ead:item>
      <xsl:copy-of
        select="@*[local-name()= 'render' or local-name()=         'audience' or local-name()=
        'id']" />
      <xsl:for-each
        select="./child::node()">
        <xsl:choose>
          <xsl:when test="name() ='emph' or name()=''">
            <xsl:apply-templates
              select="self::node()" />
          </xsl:when>
          <xsl:otherwise> 
            <xsl:value-of
            select="." />
          </xsl:otherwise>
        </xsl:choose>
        <!-- <xsl:if
          test="name() ='emph' or name()='' ">
          <xsl:apply-templates
            select="self::node()" />
        </xsl:if> -->
        
      </xsl:for-each>
    </ead:item>
  </xsl:template>

  <xsl:template
    match="emph">
    <!-- only copy render attribute, if it has certain values -->
    <ead:emph>

      <xsl:if
        test="attribute::render = 'italic'">
        <xsl:attribute
          name="render">
          <xsl:text>italic</xsl:text>
        </xsl:attribute>
      </xsl:if>

      <xsl:if
        test="attribute::render = 'sup'">
        <xsl:attribute
          name="render">
          <xsl:text>super</xsl:text>
        </xsl:attribute>
      </xsl:if>

      <xsl:if
        test="attribute::render = 'sub'">
        <xsl:attribute
          name="render">
          <xsl:text>sub</xsl:text>
        </xsl:attribute>
      </xsl:if>

      <xsl:for-each
        select="./child::node()">
        <xsl:if
          test="name() ='emph' or name()='' ">
          <xsl:apply-templates
            select="self::node()" />
        </xsl:if>
      </xsl:for-each>
    </ead:emph>
  </xsl:template>

  <xsl:template
    match="title">
    <ead:title>
      <xsl:copy-of
        select="@*[local-name()= 'actuate' or local-name()=         'altrender' or local-name()=
        'id' or local-name()= 'arcrole' or local-name()= 'audience' or         local-name()=
        'authfilenumber' or local-name()= 'encodinganalog' or         local-name()= 'entityref' or
        local-name()= 'href' or local-name()=         'linktype' or local-name()= 'normal' or
        local-name()= 'render' or         local-name()= 'role' or local-name()= 'rules' or
        local-name()= 'show' or         local-name()= 'source' or local-name()= 'title'         or
        local-name()= 'type' or local-name()= 'xpointer']" />

      <xsl:if
        test="node()">

        <xsl:choose>
          <xsl:when
            test="not(*)">
            <xsl:value-of
              select="." />
          </xsl:when>
          <xsl:otherwise>
            <!-- has element -->
            <xsl:for-each
              select="./child::node()">

              <xsl:if
                test="self::* and name()='emph' or name()='title' or                 name()='date'">
                <xsl:apply-templates
                  select="self::node()" />
              </xsl:if>

              <!-- paragraphs are not allowed -->
              <xsl:if
                test="self::* and name() ='P' or name()='p'">
                <xsl:call-template
                  name="outputParagraphWithoutPTags">
                  <xsl:with-param
                    name="p"
                    select="." />
                </xsl:call-template>
              </xsl:if>

              <xsl:if
                test="self::text()">
                <!-- sub node is a text -->
                <xsl:call-template
                  name="outputParagraphWithoutPTags">
                  <xsl:with-param
                    name="p"
                    select="self::text()" />
                </xsl:call-template>
              </xsl:if>

            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>

      </xsl:if>

    </ead:title>
  </xsl:template>

  <!-- any text node -->

  <xsl:template
    match="text()">
    <xsl:call-template
      name="outputTextAsText">
      <xsl:with-param
        name="text"
        select="." />
    </xsl:call-template>
  </xsl:template>

  <xsl:template
    match="note">
    <ead:note>
      <xsl:copy-of
        select="@*[local-name()= 'actuate' or local-name()=         'altrender' or local-name()=
        'id' or local-name()= 'audience' or         local-name()= 'encodinganalog' or local-name()=
        'label' or local-name()=         'show' or local-name()= 'type']" />
      <xsl:for-each
        select="./child::node()">
        <xsl:if
          test="name() ='p' or name()='P' or name()='' ">
          <xsl:apply-templates
            select="self::node()" />
        </xsl:if>
      </xsl:for-each>
    </ead:note>
  </xsl:template>

  <xsl:template
    match="date">
    <ead:note>
      <xsl:copy-of
        select="@*[local-name()=         'altrender' or local-name()= 'id' or local-name()=
        'audience' or         local-name()= 'encodinganalog' or local-name()= 'certainty' or
        local-name()=         'era' or local-name()= 'type' or local-name()= 'calendar' or
        local-name()= 'normal']" />
      <xsl:for-each
        select="./child::node()">
        <xsl:if
          test="name() ='emph' or name()='' ">
          <xsl:apply-templates
            select="self::node()" />
        </xsl:if>
      </xsl:for-each>
    </ead:note>
  </xsl:template>

  <!-- 
  use the georss standard for the coordinates 
            (example taken is: IOR/X/3204)
            source is : <DecimalCoordinates>31.97,12.43,59.98,30.96</DecimalCoordinates>
                        <DegreeCoordinates>E 31°58’12”-E 59°58’48”/N 30°57’36”-N 12°25’48”</DegreeCoordinates>
            target is:    georss:box     specification      
            A bounding box is a rectangular region, often used to define the extents of a map or a
            rough area of interest. A box contains two space seperate latitude-longitude pairs, with each pair separated by whitespace.
            The first pair is the lower corner, the second is the upper corner.
            
            <ead:materialspec type="coordinates">12.43 31.97 30.96 59.98</ead:materialspec>
          -->
  <!-- This is for XSLT 1.0 - e.g. MSXML, Saxon Version 6 etc. 
 
 <xsl:template name="reorderGeoCoordinates"> 
    <xsl:param name="geocoordinates"/>
    
    <xsl:if test="system-property('xsl:version')='1.0'">
      <xsl:variable name="coordinate" select="str:tokenize($geocoordinates,',')" />
      <xsl:value-of select="$coordinate[2]"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$coordinate[1]"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$coordinate[4]"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="$coordinate[3]"/>
    </xsl:if>
  </xsl:template>
-->

  <xsl:template
    name="reorderGeoCoordinates">
    <xsl:param
      name="geocoordinates" />
    <xsl:if
      test="system-property('xsl:version')='1'">
      <xsl:call-template
        name="reorderGeoCoordinates1">
        <xsl:with-param
          name="geocoordinates"
          select="$geocoordinates" />
      </xsl:call-template>
    </xsl:if>
    <xsl:if
      test="system-property('xsl:version')='2.0'">
      <xsl:call-template
        name="reorderGeoCoordinates2">
        <xsl:with-param
          name="geocoordinates"
          select="$geocoordinates" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <!-- This is for XSLT 2.0 - e.g. Saxon Version 9 etc. -->


  <xsl:template
    name="reorderGeoCoordinates2">
    <xsl:param
      name="geocoordinates" />

    <xsl:variable
      name="coordinate"
      select="tokenize($geocoordinates,',')" />

    <xsl:value-of
      select="$coordinate[2]" />
    <xsl:text> </xsl:text>
    <xsl:value-of
      select="$coordinate[1]" />
    <xsl:text> </xsl:text>
    <xsl:value-of
      select="$coordinate[4]" />
    <xsl:text> </xsl:text>
    <xsl:value-of
      select="$coordinate[3]" />

  </xsl:template>

  <xsl:template
    name="reorderGeoCoordinates1">
    <xsl:param
      name="geocoordinates" />

    <xsl:variable
      name="tokens">
      <xsl:call-template
        name="str:tokenize">
        <xsl:with-param
          name="string"
          select="$geocoordinates" />
        <xsl:with-param
          name="delimiters"
          select="','" />
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable
      name="xtokens"
      select="$tokens[1]" />
    <xsl:apply-templates
      select="$xtokens" />
  </xsl:template>

  <xsl:template
    match="token[1]">
    <xsl:if
      test="../token[last()]">
      <xsl:value-of
        select="../token[2]" />
      <xsl:text> </xsl:text>
      <xsl:value-of
        select="../token[1]" />
      <xsl:text> </xsl:text>
      <xsl:value-of
        select="../token[4]" />
      <xsl:text> </xsl:text>
      <xsl:value-of
        select="../token[3]" />
    </xsl:if>
  </xsl:template>

  <xsl:template
    match="token">
    <xsl:text />
  </xsl:template>

  <!-- General: output paragraph without paragraph tags
      but allow emph and date inside paragraph.
      
      This is required for the ead:unittitle element
  -->

  <xsl:template
    name="outputParagraphWithoutPTags">
    <xsl:param
      name="p" />

    <xsl:for-each
      select="$p/child::node()">
      <xsl:if
        test="self::* and name() ='emph' or name()='date'">
        <xsl:apply-templates
          select="self::node()" />
      </xsl:if>

      <xsl:if
        test="self::text()">
        <!-- sub node is a text -->
        <xsl:value-of
          select="self::text()" />
      </xsl:if>

    </xsl:for-each>

  </xsl:template>


  <!-- General: Output text in paragraph, all spaces at the beginning and end as well as all
    linefeeds and carriage returns are deleted
  -->

  <xsl:template
    name="outputTextAsParagraph">
    <xsl:param
      name="text" />
    <xsl:variable
      name="output">
      <xsl:call-template
        name="search-and-replace">
        <xsl:with-param
          name="input"
          select="$text" />
        <xsl:with-param
          name="search-string"
          select="'&#10;'" />
        <xsl:with-param
          name="replace-string"
          select="''" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable
      name="output">
      <xsl:call-template
        name="search-and-replace">
        <xsl:with-param
          name="input"
          select="$output" />
        <xsl:with-param
          name="search-string"
          select="'&#13;'" />
        <xsl:with-param
          name="replace-string"
          select="''" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable
      name="output">
      <xsl:call-template
        name="chopSpacesFrontBack">
        <xsl:with-param
          name="chopString"
          select="$output" />
        <!-- <xsl:with-param name="punctuation" select="'&#32;'"/> -->
      </xsl:call-template>
    </xsl:variable>
    <!-- only output something, if there is text left -->
    <xsl:if
      test="string-length($output)!=0">
      <ead:p>
        <xsl:value-of
          select="$output" />
      </ead:p>
    </xsl:if>
  </xsl:template>


  <xsl:template
    name="outputTextAsText">
    <xsl:param
      name="text" />
    <xsl:variable
      name="output">
      <xsl:call-template
        name="search-and-replace">
        <xsl:with-param
          name="input"
          select="$text" />
        <xsl:with-param
          name="search-string"
          select="'&#10;'" />
        <xsl:with-param
          name="replace-string"
          select="''" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable
      name="output">
      <xsl:call-template
        name="search-and-replace">
        <xsl:with-param
          name="input"
          select="$output" />
        <xsl:with-param
          name="search-string"
          select="'&#13;'" />
        <xsl:with-param
          name="replace-string"
          select="''" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable
      name="output">
      <xsl:call-template
        name="chopSpacesFrontBack">
        <xsl:with-param
          name="chopString"
          select="$output" />
        <!-- <xsl:with-param name="punctuation" select="'&#32;'"/> -->
      </xsl:call-template>
    </xsl:variable>
    <!-- only output something, if there is text left -->
    <xsl:if
      test="string-length($output)!=0">
      <xsl:value-of
        select="$output" />
    </xsl:if>
  </xsl:template>

  <!-- 
    Parses the text and checks, if we have additional elements such as <emph>
  -->
  <xsl:template
    name="outputParsedTextAsParagraph">
    <xsl:param
      name="text" />

    <!-- only output something, if there is text left -->
    <!-- <xsl:if test="string-length($output)!=0"> -->
    <ead:p>
      <xsl:if
        test="$text/../child::node()[position()=1]/self::text()">
        <xsl:apply-templates
          select="$text/../text()[1]" />
      </xsl:if>

      <!-- the first one is a paragraph -->
      <xsl:if
        test="$text/../*[1] and (name() ='P' or name()='p')">
        <xsl:call-template
          name="outputParagraphWithoutPTags">
          <xsl:with-param
            name="p"
            select="$text/../node()" />
        </xsl:call-template>
      </xsl:if>

      <xsl:if
        test="$text/../child::node()[position()=1]/self::* and ($text/../child::*[1]/name() ='emph'
        or $text/../child::*[1]/name()='title')">
        <xsl:apply-templates
          select="$text/../child::*[1]" />
      </xsl:if>

      <!-- iterate over all siblings -->

      <xsl:for-each
        select="$text/following-sibling::node()">

        <xsl:if
          test="self::* and (name()='emph' or name()='title' or             name()='date')">
          <xsl:apply-templates
            select="self::node()" />
        </xsl:if>

        <!-- paragraphs are not allowed -->
        <xsl:if
          test="self::* and name() ='P' or name()='p'">
          <xsl:call-template
            name="outputParagraphWithoutPTags">
            <xsl:with-param
              name="p"
              select="self::node()" />
          </xsl:call-template>
        </xsl:if>

        <xsl:if
          test="self::text()">
          <xsl:apply-templates
            select="self::text()" />
        </xsl:if>
      </xsl:for-each>

    </ead:p>
    <!-- </xsl:if> -->
  </xsl:template>

  <!-- 
		General XSL templates for manipulating strings
	-->

  <xsl:template
    name="chopPunctuation">
    <xsl:param
      name="chopString" />
    <xsl:param
      name="punctuation">
      <xsl:text>.:,;/ &#x20;</xsl:text>
    </xsl:param>
    <xsl:variable
      name="length"
      select="string-length($chopString)" />
    <xsl:choose>
      <xsl:when
        test="$length=0" />
      <xsl:when
        test="contains($punctuation, substring($chopString,$length,1))">
        <xsl:call-template
          name="chopPunctuation">
          <xsl:with-param
            name="chopString"
            select="substring($chopString,1,$length - 1)" />
          <xsl:with-param
            name="punctuation"
            select="$punctuation" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when
        test="not($chopString)" />
      <xsl:otherwise>
        <xsl:value-of
          select="$chopString" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template
    name="chopSpacesFrontBack">
    <xsl:param
      name="chopString" />
    <xsl:param
      name="punctuation">
      <xsl:text>&#32;&#10;&#13; </xsl:text>
    </xsl:param>
    <xsl:variable
      name="length"
      select="string-length($chopString)" />
    <xsl:choose>
      <xsl:when
        test="$length=0" />
      <xsl:when
        test="contains($punctuation, substring($chopString,$length,1))">
        <xsl:call-template
          name="chopPunctuation">
          <xsl:with-param
            name="chopString"
            select="substring($chopString,1,$length - 1)" />
          <xsl:with-param
            name="punctuation"
            select="$punctuation" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when
        test="contains($punctuation, substring($chopString,$length,1))">
        <xsl:call-template
          name="chopPunctuation">
          <xsl:with-param
            name="chopString"
            select="substring($chopString,1,$length - 1)" />
          <xsl:with-param
            name="punctuation"
            select="$punctuation" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when
        test="not($chopString)" />
      <xsl:otherwise>
        <xsl:value-of
          select="$chopString" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template
    name="chopPunctuationFrontBack">
    <xsl:param
      name="chopString" />
    <xsl:param
      name="punctuation">
      <xsl:text>.:,;/[] </xsl:text>
    </xsl:param>
    <xsl:variable
      name="length"
      select="string-length($chopString)" />
    <xsl:choose>
      <xsl:when
        test="$length=0" />
      <xsl:when
        test="contains($punctuation, substring($chopString,$length,1))">
        <xsl:call-template
          name="chopPunctuation">
          <xsl:with-param
            name="chopString"
            select="substring($chopString,1,$length - 1)" />
          <xsl:with-param
            name="punctuation"
            select="$punctuation" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when
        test="contains($punctuation, substring($chopString,$length,1))">
        <xsl:call-template
          name="chopPunctuation">
          <xsl:with-param
            name="chopString"
            select="substring($chopString,1,$length - 1)" />
          <xsl:with-param
            name="punctuation"
            select="$punctuation" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when
        test="not($chopString)" />
      <xsl:otherwise>
        <xsl:value-of
          select="$chopString" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template
    name="chopPunctuationFront">
    <xsl:param
      name="chopString" />
    <xsl:param
      name="punctuation">
      <xsl:text>.:,;/[&#32; </xsl:text>
    </xsl:param>
    <xsl:variable
      name="length"
      select="string-length($chopString)" />
    <xsl:choose>
      <xsl:when
        test="$length=0" />
      <xsl:when
        test="contains($punctuation, substring($chopString,1,1))">
        <xsl:call-template
          name="chopPunctuationFront">
          <xsl:with-param
            name="chopString"
            select="substring($chopString,2,$length - 1)" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when
        test="not($chopString)" />
      <xsl:otherwise>
        <xsl:value-of
          select="$chopString" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template
    name="chopPunctuationBack">
    <xsl:param
      name="chopString" />
    <xsl:param
      name="punctuation">
      <xsl:text>.:,;/] </xsl:text>
    </xsl:param>
    <xsl:variable
      name="length"
      select="string-length($chopString)" />
    <xsl:choose>
      <xsl:when
        test="$length=0" />
      <xsl:when
        test="contains($punctuation, substring($chopString,$length,1))">
        <xsl:call-template
          name="chopPunctuation">
          <xsl:with-param
            name="chopString"
            select="substring($chopString,1,$length - 1)" />
          <xsl:with-param
            name="punctuation"
            select="$punctuation" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when
        test="not($chopString)" />
      <xsl:otherwise>
        <xsl:value-of
          select="$chopString" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template
    name="search-and-replace">
    <xsl:param
      name="input" />
    <xsl:param
      name="search-string" />
    <xsl:param
      name="replace-string" />
    <xsl:choose>
      <xsl:when
        test="$search-string and            contains($input,$search-string)">
        <xsl:value-of
          select="substring-before($input,$search-string)" />
        <xsl:value-of
          select="$replace-string" />
        <xsl:call-template
          name="search-and-replace">
          <xsl:with-param
            name="input"
            select="substring-after($input,$search-string)" />
          <xsl:with-param
            name="search-string"
            select="$search-string" />
          <xsl:with-param
            name="replace-string"
            select="$replace-string" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of
          select="$input" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!--    <xsl:template match="text">
      <xsl:call-template name="search-and-replace">
        <xsl:with-param name="input" select="text()" />
        <xsl:with-param name="search-string" select="'&#x9;'" />
        <xsl:with-param name="replace-string" select="''" />
      </xsl:call-template>    
    </xsl:template> -->


</xsl:stylesheet>
