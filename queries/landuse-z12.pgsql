SELECT name,
       way_area::bigint AS area,
       COALESCE("landuse", "leisure", "natural", "highway", "amenity") AS kind,
       'openstreetmap.org' AS source,
       way AS __geometry__,
       mz_id AS __id__

FROM planet_osm_polygon

WHERE
    mz_is_landuse = TRUE
    AND way_area::bigint > 6400 -- 4px
