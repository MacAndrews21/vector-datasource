SELECT name, area, kind, waterway, "natural", source, __geometry__, __id__

FROM
(
    --
    -- Ocean
    --
    SELECT '' AS name,
           way_area::bigint AS area,
           'ocean' AS kind,
           'ocean' AS waterway,
           'water' AS natural,
           'naturalearthdata.com' AS source,
           the_geom AS __geometry__,
           gid::varchar AS __id__

    FROM ne_50m_ocean

    WHERE the_geom && !bbox!

    --
    -- Lakes
    --
    UNION

    SELECT name,
           way_area::bigint AS area,
           'lake' AS kind,
           'lake' AS waterway,
           'water' AS natural,
           'naturalearthdata.com' AS source,
           the_geom AS __geometry__,
           gid::varchar AS __id__

    FROM ne_50m_lakes

    WHERE the_geom && !bbox!

    --
    -- Playas
    --
    UNION

    SELECT name,
           way_area::bigint AS area,
           'playa' AS kind,
           'playa' AS waterway,
           'water' AS natural,
           'naturalearthdata.com' AS source,
           the_geom AS __geometry__,
           gid::varchar AS __id__

    FROM ne_50m_playas

    WHERE the_geom && !bbox!

) AS water_areas
