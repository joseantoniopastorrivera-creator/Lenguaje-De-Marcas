<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; }
                    table { width: 100%; border-collapse: collapse; margin-top: 10px; }
                    th, td { border: 1px solid black; padding: 5px; }
                    .header-box { border: 1px solid black; padding: 10px; margin-bottom: 5px; }
                    .bg-grey { background-color: #f0f0f0; font-weight: bold; }
                </style>
            </head>
            <body>
                <h2 align="center">FACTURA n° <xsl:value-of select="factura/detalles_factura/n_factura"/></h2>
                
                <table style="border: none;">
                    <tr>
                        <td style="border: 1px solid black; width: 50%;">
                            <strong><xsl:value-of select="factura/datos_empresa/nombre"/></strong><br/>
                            <xsl:value-of select="factura/datos_empresa/direccion/tipo_via"/> <xsl:value-of select="factura/datos_empresa/direccion/nombre"/><br/>
                            <xsl:value-of select="factura/datos_empresa/direccion/poblacion"/> <xsl:value-of select="factura/datos_empresa/direccion/codigo_postal"/><br/>
                            C.I.F.: <xsl:value-of select="factura/datos_empresa/cif"/><br/>
                            Tel: <xsl:value-of select="factura/datos_empresa/telefono"/>
                        </td>
                        <td style="border: 1px solid black;">
                            Fecha: <xsl:value-of select="factura/detalles_factura/fecha"/><br/>
                            Pedido n°: <xsl:value-of select="factura/detalles_factura/n_pedido"/><br/>
                            Forma de pago: <xsl:value-of select="factura/detalles_factura/forma_pago"/>
                        </td>
                    </tr>
                </table>

                <div class="bg-grey">Datos CLIENTE</div>
                <div class="header-box">
                    n° cliente: <xsl:value-of select="factura/datos_cliente/numero_cliente"/><br/>
                    Nombre: <xsl:value-of select="factura/datos_cliente/nombre"/> <xsl:value-of select="factura/datos_cliente/apellidos"/><br/>
                    Dirección: <xsl:value-of select="factura/datos_cliente/direccion/tipo_via"/> <xsl:value-of select="factura/datos_cliente/direccion/nombre_via"/> n° <xsl:value-of select="factura/datos_cliente/direccion/numero"/> <xsl:value-of select="factura/datos_cliente/direccion/piso"/> <xsl:value-of select="factura/datos_cliente/direccion/puerta"/><br/>
                    Población: <xsl:value-of select="factura/datos_cliente/direccion/poblacion"/> (<xsl:value-of select="factura/datos_cliente/direccion/codigo_postal"/>)
                </div>

                <div class="bg-grey">Datos FACTURA</div>
                <table>
                    <tr class="bg-grey">
                        <th>REF.</th>
                        <th>DESCRIPCIÓN</th>
                        <th>CANT.</th>
                        <th>PRECIO</th>
                        <th>I.G.V.</th>
                        <th>IMPORTE</th>
                    </tr>
                    <xsl:for-each select="factura/detalles_factura/items/item">
                        <tr>
                            <td><xsl:value-of select="ref"/></td>
                            <td><xsl:value-of select="descripcion"/></td>
                            <td align="center"><xsl:value-of select="cantidad"/></td>
                            <td align="right"><xsl:value-of select="precio"/> eur.</td>
                            <td align="center"><xsl:value-of select="igv"/></td>
                            <td align="right"><xsl:value-of select="importe"/> eur.</td>
                        </tr>
                    </xsl:for-each>
                </table>

                <table>
                    <tr class="bg-grey">
                        <td>Base imponible</td>
                        <td>Cuota I.G.V.</td>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="factura/detalles_factura/totales/base_imponible"/> eur.</td>
                        <td><xsl:value-of select="factura/detalles_factura/totales/cuota_igv"/> eur.</td>
                    </tr>
                    <tr class="bg-grey">
                        <td colspan="2" align="center">TOTAL FACTURA: <xsl:value-of select="factura/detalles_factura/totales/total_factura"/> eur.</td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>