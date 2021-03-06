SELECT name, kind, admin_level, __geometry__, __id__

FROM
(
    --
    -- Place Border
    --
    SELECT
    name,
    boundary AS kind,
    admin_level,
    way AS __geometry__,
    mz_id AS __id__

    FROM planet_osm_polygon

    WHERE way && !bbox!

    AND boundary='administrative'

    AND admin_level = '4' -- state

    --
    -- Place Name
    --
    UNION

    SELECT
      name,
      place AS kind,
      '' AS admin_level,
      way AS __geometry__,
      mz_id AS __id__

    FROM planet_osm_point

    WHERE name IS NOT NULL

    AND place IN (
      'state',
      'city',
      'district',
      'county',
      'province'
    )

    AND way && !bbox!

) AS places

ORDER BY __id__ ASC
