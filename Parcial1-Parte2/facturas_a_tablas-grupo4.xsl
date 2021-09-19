<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes" />
    
  <xsl:template match="/">
    <xsl:processing-instruction name="xml-stylesheet">href="registro_facturas_grupo4.css" type="text/css"</xsl:processing-instruction>
    <xsl:call-template name="nodo_raiz"/>
  </xsl:template>
  
  <xsl:template match="/registro/factura">
  <xsl:call-template name="tabla_factura"/>
  </xsl:template>
  
  <xsl:template name="nodo_raiz">
    <html>
      <head>
        <title>
           Registro de facturas
        </title>        	
        <link rel="stylesheet" href="registro_facturas_grupo4.css"></link>
      </head>
	  <body>
            <xsl:apply-templates select="/registro/factura" />
          </body>
	</html>  
  </xsl:template>
  
<xsl:template name="tabla_factura">
  <table>
            <tr>
                <th>Factura No.</th>
                <td><xsl:value-of select="./num/node()" /></td>
                <th>Tipo:</th>
                <td colspan="2"> <xsl:value-of select="./@tipo" /> </td>
            </tr>
            <tr>
                <th colspan="5">Cliente:</th>
            </tr>
            <tr>
                <th>Nombre:</th>
                <td colspan="2"><xsl:value-of select="./cliente/nombre/text()" /></td>
                <th>Documento:</th>
                <td><xsl:value-of select="./cliente/documento/dui/text()|./cliente/documento/pasaporte/text()" /></td>
            </tr>
            <tr>
                <th>Teléfono:</th>
                <td><xsl:value-of select="./cliente/telefono/node()" /></td>
                <th>Email:</th>
                <td colspan="2"><xsl:value-of select="./cliente/email/text()" /></td>
            </tr>
            <tr>
                <th>Código</th>
                <th>Detalle</th>
                <th>Cantidad</th>
                <th>Precio $</th>
                <th>Subtotal</th>
            </tr>
            <tr>
                <td><xsl:value-of select="./lineafactura/codigo/node()" /></td>
                <td><xsl:value-of select="./lineafactura/detalle/text()" /></td>
                <td><xsl:value-of select="./lineafactura/cantidad/node()" /></td>
                <td><xsl:value-of select="./lineafactura/precio/moneda/node()" /><xsl:value-of select="./lineafactura/precio/valor/node()" /></td>
                <td>$<xsl:value-of select="./lineafactura/subtotal/valor/node()" /></td>
            </tr>
            <tr>
                <th colspan="4" style="text-align: right;">TOTAL</th>
                <td><xsl:value-of select="./total/moneda/node()" /><xsl:value-of select="./total/valor/node()" /></td>
            </tr>
        </table>
        <br></br>
</xsl:template>  
  
</xsl:stylesheet>