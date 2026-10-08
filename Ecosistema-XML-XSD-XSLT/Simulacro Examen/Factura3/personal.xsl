<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; }
                    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                    th, td { border: 1px solid black; padding: 6px; text-align: left; font-size: 14px; }
                    th { background-color: #d9d9d9; font-weight: bold; text-align: center; }
                    .header-box { border: 2px solid black; padding: 10px; text-align: center; font-weight: bold; }
                    .center { text-align: center; }
                </style>
            </head>
            <body>
                
                <div class="header-box">
                    INFORMACIÓN DEL PERSONAL DE LOS DEPARTAMENTOS A FECHA <xsl:value-of select="registro_personal/@fecha"/>
                    <br/><br/>
                    NOMBRE: <xsl:value-of select="registro_personal/datos_generales/empresa"/> &#160;&#160;
                    NÚMERO DE TRABAJADORES: <xsl:value-of select="registro_personal/datos_generales/trabajadores"/>
                    <br/>
                    MULTINACIONAL: <xsl:value-of select="registro_personal/datos_generales/multinacional"/> &#160;&#160;
                    MONEDA: <xsl:value-of select="registro_personal/datos_generales/moneda"/> &#160;&#160;
                    SECTOR: <xsl:value-of select="registro_personal/datos_generales/sector"/>
                </div>

                <table>
                    <tr>
                        <th>CÓDIGO</th>
                        <th>DEPARTAMENTO</th>
                        <th>NOMBRE Y APELLIDOS</th>
                        <th>BAJA</th>
                        <th>SALARIO</th>
                        <th>USUARIO</th>
                        <th>CLAVE</th>
                    </tr>

                    <xsl:for-each select="registro_personal/departamentos/departamento">
                        <xsl:for-each select="empleado">
                            <tr>
                                <xsl:if test="position() = 1">
                                    <td valign="top">
                                        <xsl:attribute name="rowspan">
                                            <xsl:value-of select="count(../empleado)"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="../@codigo"/>
                                    </td>
                                    <td valign="top">
                                        <xsl:attribute name="rowspan">
                                            <xsl:value-of select="count(../empleado)"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="../nombre_dept"/>
                                    </td>
                                </xsl:if>

                                <td>
                                    <xsl:value-of select="nombre"/> (<xsl:value-of select="rol"/>)
                                </td>
                                <td class="center"><xsl:value-of select="baja"/></td>
                                <td><xsl:value-of select="salario"/></td>
                                <td><xsl:value-of select="usuario"/></td>
                                <td><xsl:value-of select="clave"/></td>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>