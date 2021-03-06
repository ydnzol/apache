<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> ]>
<xsl:stylesheet version="1.0"
              xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                  xmlns="http://www.w3.org/1999/xhtml">

  <!--                                                    -->
  <!-- <directiveindex>                                   -->
  <!-- Builds the directive index page                    -->
  <!--                                                    -->
  <xsl:template match="directiveindex">
    <html xml:lang="{$messages/@lang}" lang="{$messages/@lang}">
      <xsl:call-template name="head"/>

      <body id="directive-index">
        <xsl:call-template name="top"/>

        <xsl:variable name="directives" select="document(sitemap/category[@id='modules']/modulefilelist/modulefile)/modulesynopsis/directivesynopsis[not(@location)]"/>

        <!-- collect the start letters -->
        <xsl:variable name="start-letters">
          <xsl:call-template name="directive-startletters">
            <xsl:with-param name="directives" select="$directives"/>
          </xsl:call-template>
        </xsl:variable>

        <div id="preamble">
          <h1>
            <xsl:value-of select="title"/>
          </h1>

          <xsl:apply-templates select="summary" />

          <!-- letter line -->
          <p class="letters">
            <xsl:call-template name="letter-bar">
              <xsl:with-param name="letters" select="$start-letters"/>
              <xsl:with-param name="first" select="true()"/>
            </xsl:call-template>
          </p>
          <!-- /letter line -->

<xsl:text>
</xsl:text> <!-- insert a line break -->

        </div> <!-- /preamble -->

        <div id="directive-list">
          <ul>
            <xsl:call-template name="dindex-of-letter">
              <xsl:with-param name="letters-todo" select="$start-letters"/>
              <xsl:with-param name="directives" select="$directives"/>
            </xsl:call-template>
          </ul>
        </div> <!-- /directive-list -->

        <xsl:call-template name="bottom"/>
      </body>
    </html>
  </xsl:template>


  <!--                                                     -->
  <!-- the working horse. builds list items of all         -->
  <!-- directives starting with one letter                 -->
  <!-- when done, it calls itself to catch the next letter -->
  <!--                                                     -->
  <xsl:template name="dindex-of-letter">
  <xsl:param name="letters-todo"/>
  <xsl:param name="directives"/>

    <xsl:variable name="letter" select="substring($letters-todo,1,1)"/>

    <xsl:for-each select="$directives[$letter=translate(substring(normalize-space(name),1,1),$lowercase,$uppercase)]">
    <xsl:sort select="name"/>

      <li><xsl:choose>
        <xsl:when test="position()=1">
          <a name="{$letter}" id="{$letter}" href="{../name}.html#{translate(name,$uppercase,$lowercase)}">
            <xsl:if test="@type = 'section'">&lt;</xsl:if>
            <xsl:value-of select="name"/>
            <xsl:if test="@type = 'section'">&gt;</xsl:if>
          </a>
        </xsl:when>

        <xsl:otherwise>
          <a href="{../name}.html#{translate(name,$uppercase,$lowercase)}">
            <xsl:if test="@type = 'section'">&lt;</xsl:if>
            <xsl:value-of select="name"/>
            <xsl:if test="@type = 'section'">&gt;</xsl:if>
          </a>
        </xsl:otherwise></xsl:choose>
      </li>

<xsl:text>
</xsl:text> <!-- insert a line break -->

    </xsl:for-each> <!-- /directives -->

    <!-- call next letter, if there is -->
    <xsl:if test="string-length($letters-todo) &gt; 1">
      <xsl:call-template name="dindex-of-letter">
        <xsl:with-param name="letters-todo" select="substring($letters-todo,2)"/>
        <xsl:with-param name="directives" select="$directives"/>
      </xsl:call-template>
    </xsl:if>

  </xsl:template>
  <!-- /dindex-of-letter -->

</xsl:stylesheet>
