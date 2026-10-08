<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
  <style>
    /* Estilos CSS básicos para que la tabla se vea bien */
    table {
      border-collapse: collapse;
      width: 80%;
      font-family: Arial, sans-serif;
    }
    th, td {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }
    /* Cambio de color de la tabla (Cabecera) */
    th {
      background-color: #2E8B57; /* SeaGreen */
      color: white;
      font-size: 1.2em;
    }
    h1 {
      font-family: serif;
    }
  </style>
</head>
<body>
  
  <h1>Mi biblioteca personal</h1>
  
  <table>
    <tr>
      <th>ISBN</th>
      <th>Título</th>
      <th>Autor</th>
      <th>Precio</th>
    </tr>
    
    <xsl:for-each select="libreria/libro">
    <tr>
      <td><xsl:value-of select="isbn"/></td>
      <td><xsl:value-of select="titulo"/></td>
      <td><xsl:value-of select="autor"/></td>
      
      <xsl:choose>
        <xsl:when test="precio &lt; 12.50">
          <td style="background-color: #90EE90;"> <xsl:value-of select="precio"/> €
          </td>
        </xsl:when>
        <xsl:when test="precio &lt; 25.00">
          <td style="background-color: #FFFFE0;"> <xsl:value-of select="precio"/> €
          </td>
        </xsl:when>
        <xsl:otherwise>
          <td style="background-color: #ADD8E6;"> <xsl:value-of select="precio"/> €
          </td>
        </xsl:otherwise>
      </xsl:choose>
      
    </tr>
    </xsl:for-each>
  </table>
  
</body>
</html>
</xsl:template>
</xsl:stylesheet>