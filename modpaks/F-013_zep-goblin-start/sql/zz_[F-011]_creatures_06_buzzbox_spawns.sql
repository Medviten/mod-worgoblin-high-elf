-- ============================================================
-- F-011 gap file -- NOT yet ported to `zep goblin gen`.
-- Hand-maintained until an emitter reproduces it. When a gen
-- domain covers this content, retire this file and rename the
-- emitted output to zz_[AUTO,F-011]_*.
-- ============================================================

-- F-011 missed 'Capturing the Unknown' photograph targets (source zone 4720 map648 -> map1)

DELETE FROM creature WHERE id IN (37872,37895,37896,37897) AND map=1;
INSERT INTO creature (guid,id,map,zoneId,areaId,spawnMask,phaseMask,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,wander_distance,curhealth,MovementType) VALUES
  (6700001,37872,1,0,0,1,1,0,33.5240,-9852.5700,2.9672,5.6200,300,0,1,0),
  (6700002,37895,1,0,0,1,1,0,37.3160,-9891.9700,4.5176,1.1868,300,0,1,0),
  (6700003,37896,1,0,0,1,1,0,82.7500,-9950.1000,-4.6476,1.5882,300,0,1,0),
  (6700004,37897,1,0,0,1,1,0,117.2740,-9833.7800,3.3287,0.5585,300,0,1,0);
