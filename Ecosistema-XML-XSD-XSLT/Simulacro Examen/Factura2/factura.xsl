<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; font-size: 14px; }
                    table { width: 100%; border-collapse: collapse; margin-bottom: 10px; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    /* Clase para el fondo gris de los encabezados */
                    .gris { background-color: #cccccc; font-weight: bold; }
                    .titulo-central { text-align: center; font-weight: bold; border: 1px solid black; padding: 10px; margin-bottom: 10px; }
                    .derecha { text-align: right; }
                    .sin-borde-inferior { border-bottom: none; }
                </style>
            </head>
            <body>
                
                <div class="titulo-central">
                    FACTURA NÚMERO <xsl:value-of select="factura/@numero"/> – FECHA: <xsl:value-of select="factura/@fecha"/>
                </div>

                <table>
                    <tr>
                        <th class="gris" width="50%">DATOS EMISOR:</th>
                        <th class="gris" width="50%">DATOS CLIENTE:</th>
                    </tr>
                    <tr>
                        <td valign="top">
                            <xsl:value-of select="factura/datos_emisor/nombre"/><br/><br/>
                            CIF: <xsl:value-of select="factura/datos_emisor/cif"/><br/><br/>
                            Teléfono: <xsl:value-of select="factura/datos_emisor/telefono"/>
                        </td>
                        <td valign="top">
                            <xsl:value-of select="factura/datos_cliente/nombre"/><br/><br/>
                            CIF: <xsl:value-of select="factura/datos_cliente/cif"/><br/><br/>
                            Teléfono: <xsl:value-of select="factura/datos_cliente/telefono"/>
                        </td>
                    </tr>
                </table>

                <table>
                    <tr>
                        <th class="gris" colspan="6">DETALLE FACTURA:</th>
                    </tr>
                    <tr>
                        <td>CÓDIGO-ARTÍCULO</td>
                        <td>TIPO</td>
                        <td>DESCRIPCIÓN</td>
                        <td>CANTIDAD</td>
                        <td>OFERTA</td>
                        <td>PVP</td>
                    </tr>
                    
                    <xsl:for-each select="factura/detalle_factura/linea">
                        <tr>
                            <td><xsl:value-of select="codigo"/></td>
                            <td><xsl:value-of select="tipo"/></td>
                            <td><xsl:value-of select="descripcion"/></td>
                            <td><xsl:value-of select="cantidad"/></td>
                            <td><xsl:value-of select="oferta"/></td>
                            <td><xsl:value-of select="pvp"/>€</td>
                        </tr>
                    </xsl:for-each>
                </table>

                <table>
                    <tr>
                        <td class="gris" width="80%">IMPORTE:</td>
                        <td width="20%" class="derecha">
                            <b><xsl:value-of select="factura/importe_total"/>€</b>
                        </td>
                    </tr>
                </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>