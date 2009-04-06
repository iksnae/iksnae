package com.google
{
	 import mx.rpc.xml.Schema
	 public class BaseGoogleSearchServiceSchema
	{
		 public var schemas:Array = new Array();
		 public var targetNamespaces:Array = new Array();
		 public function BaseGoogleSearchServiceSchema():void
		{
			 var xsdXML0:XML = <xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ns0="urn:GoogleSearch" xmlns:ns2="urn:GoogleSearch" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:typens="urn:GoogleSearch" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" attributeFormDefault="unqualified" elementFormDefault="unqualified" targetNamespace="urn:GoogleSearch">
    <xsd:complexType name="GoogleSearchResult">
        <xsd:all>
            <xsd:element name="documentFiltering" type="boolean"/>
            <xsd:element name="searchComments" type="string"/>
            <xsd:element name="estimatedTotalResultsCount" type="int"/>
            <xsd:element name="estimateIsExact" type="boolean"/>
            <xsd:element name="resultElements" type="ns2:ResultElementArray"/>
            <xsd:element name="searchQuery" type="string"/>
            <xsd:element name="startIndex" type="int"/>
            <xsd:element name="endIndex" type="int"/>
            <xsd:element name="searchTips" type="string"/>
            <xsd:element name="directoryCategories" type="ns2:DirectoryCategoryArray"/>
            <xsd:element name="searchTime" type="double"/>
        </xsd:all>
    </xsd:complexType>
    <xsd:complexType name="ResultElement">
        <xsd:all>
            <xsd:element name="summary" type="string"/>
            <xsd:element name="URL" type="string"/>
            <xsd:element name="snippet" type="string"/>
            <xsd:element name="title" type="string"/>
            <xsd:element name="cachedSize" type="string"/>
            <xsd:element name="relatedInformationPresent" type="boolean"/>
            <xsd:element name="hostName" type="string"/>
            <xsd:element name="directoryCategory" type="ns2:DirectoryCategory"/>
            <xsd:element name="directoryTitle" type="string"/>
        </xsd:all>
    </xsd:complexType>
    <xsd:complexType name="ResultElementArray">
        <xsd:complexContent>
            <xsd:restriction base="soapenc:Array">
                <xsd:attribute ref="soapenc:arrayType" wsdl:arrayType="typens:ResultElement[]"/>
            </xsd:restriction>
        </xsd:complexContent>
    </xsd:complexType>
    <xsd:complexType name="DirectoryCategoryArray">
        <xsd:complexContent>
            <xsd:restriction base="soapenc:Array">
                <xsd:attribute ref="soapenc:arrayType" wsdl:arrayType="typens:DirectoryCategory[]"/>
            </xsd:restriction>
        </xsd:complexContent>
    </xsd:complexType>
    <xsd:complexType name="DirectoryCategory">
        <xsd:all>
            <xsd:element name="fullViewableName" type="string"/>
            <xsd:element name="specialEncoding" type="string"/>
        </xsd:all>
    </xsd:complexType>
    <xsd:element name="doGetCachedPage">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="key" type="string"/>
                <xsd:element form="unqualified" name="url" type="string"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doGoogleSearch">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="filter" type="boolean"/>
                <xsd:element form="unqualified" name="key" type="string"/>
                <xsd:element form="unqualified" name="restrict" type="string"/>
                <xsd:element form="unqualified" name="start" type="int"/>
                <xsd:element form="unqualified" name="ie" type="string"/>
                <xsd:element form="unqualified" name="safeSearch" type="boolean"/>
                <xsd:element form="unqualified" name="lr" type="string"/>
                <xsd:element form="unqualified" name="maxResults" type="int"/>
                <xsd:element form="unqualified" name="oe" type="string"/>
                <xsd:element form="unqualified" name="q" type="string"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doSpellingSuggestion">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="key" type="string"/>
                <xsd:element form="unqualified" name="phrase" type="string"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doGetCachedPageResponse">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="return" type="base64Binary"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doGoogleSearchResponse">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="return" type="ns2:GoogleSearchResult"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doSpellingSuggestionResponse">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="return" type="string"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doGetCachedPage">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="key" type="string"/>
                <xsd:element form="unqualified" name="url" type="string"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doGoogleSearch">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="filter" type="boolean"/>
                <xsd:element form="unqualified" name="key" type="string"/>
                <xsd:element form="unqualified" name="restrict" type="string"/>
                <xsd:element form="unqualified" name="start" type="int"/>
                <xsd:element form="unqualified" name="ie" type="string"/>
                <xsd:element form="unqualified" name="safeSearch" type="boolean"/>
                <xsd:element form="unqualified" name="lr" type="string"/>
                <xsd:element form="unqualified" name="maxResults" type="int"/>
                <xsd:element form="unqualified" name="oe" type="string"/>
                <xsd:element form="unqualified" name="q" type="string"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doSpellingSuggestion">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="key" type="string"/>
                <xsd:element form="unqualified" name="phrase" type="string"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doGetCachedPageResponse">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="return" type="base64Binary"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doGoogleSearchResponse">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="return" type="ns2:GoogleSearchResult"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
    <xsd:element name="doSpellingSuggestionResponse">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element form="unqualified" name="return" type="string"/>
            </xsd:sequence>
        </xsd:complexType>
    </xsd:element>
</xsd:schema>
;
			 var xsdSchema0:Schema = new Schema(xsdXML0);
			schemas.push(xsdSchema0);
			targetNamespaces.push(new Namespace('','urn:GoogleSearch'));
		}
	}
}