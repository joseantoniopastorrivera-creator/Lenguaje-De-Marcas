<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body { 
                        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; 
                        background-color: #141414; /* Fondo oscuro tipo Netflix */
                        color: #e5e5e5; 
                        display: flex;
                        justify-content: center;
                        padding-top: 50px;
                    }
                    table { 
                        width: 80%; 
                        border-collapse: collapse; 
                        box-shadow: 0 0 20px rgba(0,0,0,0.5);
                        background-color: #1f1f1f;
                    }
                    caption {
                        font-size: 2em;
                        font-weight: bold;
                        color: #E50914; /* Rojo Netflix */
                        margin-bottom: 15px;
                        text-transform: uppercase;
                        letter-spacing: 2px;
                    }
                    th { 
                        background-color: #E50914; 
                        color: white; 
                        padding: 15px; 
                        text-align: left; 
                        text-transform: uppercase;
                        font-size: 0.9em;
                    }
                    td { 
                        padding: 12px 15px; 
                        border-bottom: 1px solid #404040; 
                    }
                    tr:hover { 
                        background-color: #333; /* Efecto hover */
                    }
                    /* Estilo para cuando no hay dato (celda vacía) */
                    .vacio {
                        color: #666;
                        font-style: italic;
                        font-size: 0.8em;
                    }
                </style>
            </head>
            <body>
                
                <table>
                    <caption>Catálogo de Series</caption>
                    
                    <tr>
                        <th>Nombre</th>
                        <th>Género</th>
                        <th>Temporadas</th>
                        <th>Año Inicio</th>
                        <th>Estado</th>
                    </tr>

                    <xsl:for-each select="netflix/serie">
                        <tr>
                            <td style="font-weight: bold; color: white;">
                                <xsl:value-of select="@nombre"/>
                            </td>
                            
                            <td>
                                <xsl:value-of select="@genero"/>
                            </td>
                            
                            <td>
                                <xsl:value-of select="@temporadas"/>
                            </td>
                            
                            <td>
                                <xsl:choose>
                                    <xsl:when test="@anio_inicio">
                                        <xsl:value-of select="@anio_inicio"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <span class="vacio">N/D</span>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>

                            <td>
                                <xsl:choose>
                                    <xsl:when test="@estado">
                                        <xsl:value-of select="@estado"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <span class="vacio">Desconocido</span>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>