SELECT name,
       way_area::bigint AS area,
       COALESCE("landuse", "leisure", "natural", "highway", "amenity") AS kind,
       'openstreetmap.org' AS source,
       mz_way11 AS __geometry__,
       mz_id AS __id__

FROM planet_osm_polygon

WHERE
    mz_is_landuse = TRUE
    AND way_area::bigint > 409600 -- 4px
