<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; }
                    table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    .titulo { text-align: center; font-weight: bold; font-size: 1.2em; border: 2px solid black; padding: 10px; }
                    .derecha { text-align: right; }
                    .seccion { background-color: #e0e0e0; font-weight: bold; }
                    .sin-borde { border: none; }
                </style>
            </head>
            <body>
                
                <div class="titulo">FACTURA nº <xsl:value-of select="factura/@n_factura"/></div>
                <br/>

                <table>
                    <tr>
                        <td width="50%" valign="top">
                            <b><xsl:value-of select="factura/datos_empresa/nombre"/></b><br/>
                            <xsl:value-of select="factura/datos_empresa/direccion"/><br/>
                            C.I.F.: <xsl:value-of select="factura/datos_empresa/cif"/><br/>
                            Teléfono: <xsl:value-of select="factura/datos_empresa/telefono"/><br/>
                            Fax: <xsl:value-of select="factura/datos_empresa/fax"/>
                        </td>
                        <td width="50%" valign="top">
                            <br/>
                            Fecha: <xsl:value-of select="factura/datos_factura/fecha"/><br/>
                            Pedido nº: <xsl:value-of select="factura/datos_factura/pedido"/><br/>
                            Forma de pago: <xsl:value-of select="factura/datos_factura/forma_pago"/>
                        </td>
                    </tr>
                </table>

                <table>
                    <tr class="seccion"><td>Datos CLIENTE</td></tr>
                    <tr>
                        <td>
                            nº cliente: <xsl:value-of select="factura/datos_cliente/@n_cliente"/><br/>
                            Nombre: <xsl:value-of select="factura/datos_cliente/nombre"/><br/>
                            Dirección: <xsl:value-of select="factura/datos_cliente/direccion"/><br/>
                            Población: <xsl:value-of select="factura/datos_cliente/poblacion"/><br/>
                            C.P.: <xsl:value-of select="factura/datos_cliente/cod_postal"/> Provincia: <xsl:value-of select="factura/datos_cliente/provincia"/>
                        </td>
                    </tr>
                </table>

                <table>
                    <tr class="seccion">
                        <td colspan="6">Datos FACTURA</td>
                    </tr>
                    <tr>
                        <th>REF.</th>
                        <th>DESCRIPCIÓN</th>
                        <th>CANT.</th>
                        <th>PRECIO</th>
                        <th>I.G.V.</th>
                        <th>IMPORTE</th>
                    </tr>
                    
                    <xsl:for-each select="factura/detalle_factura/linea">
                        <tr>
                            <td><xsl:value-of select="ref"/></td>
                            <td><xsl:value-of select="descripcion"/></td>
                            <td class="derecha"><xsl:value-of select="cantidad"/></td>
                            <td class="derecha"><xsl:value-of select="precio"/> eur.</td>
                            <td class="derecha"><xsl:value-of select="igv"/></td>
                            <td class="derecha"><xsl:value-of select="importe"/> eur.</td>
                        </tr>
                    </xsl:for-each>
                </table>

                <table>
                    <tr>
                        <th>Base imponible</th>
                        <th>% I.G.V.</th>
                        <th>Cuota I.G.V.</th>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="factura/totales/base_imponible"/> eur.</td>
                        <td><xsl:value-of select="factura/totales/porcentaje_igv"/></td>
                        <td><xsl:value-of select="factura/totales/cuota_igv"/> eur.</td>
                    </tr>
                </table>
                
                <div style="text-align: right; border: 2px solid black; padding: 10px; font-weight: bold;">
                    TOTAL FACTURA: <xsl:value-of select="factura/totales/total_factura"/> eur.
                </div>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>