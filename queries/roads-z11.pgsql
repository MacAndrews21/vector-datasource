SELECT
    way AS __geometry__,
    highway,
    name,
    railway,

    (CASE WHEN highway IN ('motorway') THEN 'highway'
          WHEN highway IN ('trunk', 'primary') THEN 'major_road'
          ELSE 'minor_road' END) AS kind,

    'no'::VARCHAR AS is_link,
    (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
          ELSE 'no' END) AS is_tunnel,
    (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
          ELSE 'no' END) AS is_bridge,

    mz_id AS __id__,

    mz_road_sort_key AS sort_key

FROM planet_osm_line

WHERE
    mz_road_level <= 11
