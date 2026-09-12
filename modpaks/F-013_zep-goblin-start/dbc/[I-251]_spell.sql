-- I-251 — port Cata 70027 "Sharkblade" (Steamwheedle Shark ranged attack).
--
-- THE authentic Necessary Roughness mechanic (whitemane 4.3.4 Spell.dbc):
-- sharks do NOT melee the shredder — they shoot sawblade missiles at it
-- ("Shoot a sawblade at the target causing $s1 damage", instant, 100yd,
-- speed-20 projectile, 9-11 physical). Every melee-based attempt (I-251 v8-v11)
-- fought a combat mode that never existed in the source design.
--
-- Port notes: effect SCHOOL_DAMAGE bp 8 / die_sides 3, implicit target 25
-- (UNIT_TARGET_ANY — the SAI cast supplies the vehicle). Cata visual 14792
-- does not exist in 3.3.5a -> stock 8306 (the classic goblin-tech "Saw Blade"
-- missile, spells 35318/37123/39192). damage_class 1 so the volley cannot be
-- parried/dodged/blocked by the vehicle. ID 70027 free in stock 3.3.5a spell
-- table. Ships in PATCH-Z; server side needs a worldserver restart only (no
-- core rebuild).
DELETE FROM spell WHERE id = 70027;
INSERT INTO spell SET
  id = 70027,
  spell_name_enus = 'Sharkblade',
  spell_desc_enus = 'Shoot a sawblade at the target causing $s1 damage.',
  school_mask = 1,
  damage_class = 1,
  cast_time_index = 1,
  duration_index = 0,
  range_index = 6,
  speed = 20,
  proc_chance = 101,
  equipped_item_class = -1,
  effect_1 = 2,
  effect_base_points_1 = 8,
  effect_die_sides_1 = 3,
  effect_implicit_target_a_1 = 25,
  spell_icon_id = 2949,
  spell_visual_1 = 8306;
