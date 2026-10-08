<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
  <style>
    /* Estilos copiados visualmente de la imagen */
    body { font-family: Arial, sans-serif; }
    
    h1 { text-align: center; margin-bottom: 20px; }
    
    table {
      border-collapse: collapse;
      width: 90%;
      margin: 0 auto; /* Centrar tabla */
    }
    
    th {
      background-color: #333333; /* Negro/Gris oscuro */
      color: white;
      padding: 10px;
      text-align: center;
      border: 1px solid black;
    }
    
    td {
      border: 1px solid black;
      padding: 8px;
      text-align: center;
    }

    /* Estilo para el resumen de abajo */
    .resumen {
      text-align: center;
      margin-top: 20px;
      font-weight: bold;
      font-size: 1.1em;
    }
  </style>
</head>
<body>

  <h1>Catálogo de Videojuegos</h1>

  <table>
    <tr>
      <th>Título</th>
      <th>Plataforma</th>
      <th>Año</th>
      <th>Género</th>
      <th>Precio (€)</th>
    </tr>

    <xsl:for-each select="catalogo/videojuego">
      <xsl:sort select="precio" data-type="number" order="descending"/>

      <tr>
        <td><xsl:value-of select="titulo"/></td>
        <td><xsl:value-of select="plataforma"/></td>
        <td><xsl:value-of select="anio"/></td>
        <td><xsl:value-of select="genero"/></td>

        <xsl:choose>
          <xsl:when test="precio &gt; 60">
            <td style="background-color: #ffcccc; font-weight: bold;">
              <xsl:value-of select="precio"/> €
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td><xsl:value-of select="precio"/> €</td>
          </xsl:otherwise>
        </xsl:choose>
      </tr>
    </xsl:for-each>
  </table>

  <div class="resumen">
    <p>Total de videojuegos: <xsl:value-of select="count(catalogo/videojuego)"/></p>
    
    <p>Precio medio: 
       <xsl:value-of select="format-number(sum(catalogo/videojuego/precio) div count(catalogo/videojuego), '#.00')"/> €
    </p>
  </div>

</body>
</html>
</xsl:template>
</xsl:stylesheet>