$path = "C:\test\3"
$xslt_settings = new-object System.XML.XSl.XsltSettings
$xslt_settings.EnableScript = $true
$xslt = new-object System.XML.Xsl.XslCompiledTransform

$XmlResolver = new-object System.XML.XmlUrlResolver
$xslt.Load("$Path\calc.xsl",$xslt_settings, $XmlResolver)
$doc =  new-object -Type System.Xml.XPath.XPathDocument -ArgumentList "$Path\example.xml"
$settings = new-object System.XML.XMLWriterSettings
$settings.OmitXmlDeclaration = $true
$settings.Indent = $true
$writer = [System.XML.XmlWriter]::Create("$Path\output.xml", $settings)
$xslt.Transform($doc,$writer)
$writer.Close()
