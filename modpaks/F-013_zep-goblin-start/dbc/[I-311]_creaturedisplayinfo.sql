-- I-311 "Warchief's Revenge" (quest 14243) — Cyclone of the Elements vehicle (36178).
-- The Cata display 30296 is an InvisibleStalker-model display whose visible tornado
-- comes from obj_effect_package_id 442 (ObjectEffectPackage chain). WotLK has no
-- package 442, so the shipped display rendered as nothing: the rider sat in an
-- invisible vehicle. Repoint the AUTO-owned row at the stock Air Elemental tornado
-- model (591) — the same model every stock WotLK cyclone creature uses (Living
-- Cyclone 18404 scale 3.25, Howling Cyclone 14502 scale 2) — at vehicle scale.
-- texture_variation_1 is required: model 591 resolves its skin at runtime and
-- renders untextured without it (I-249). AUTO-owned row -> one consolidated UPDATE.
UPDATE creaturedisplayinfo SET
  `model_id` = 591,
  `sound_id` = 0,
  `creature_model_scale` = 3,
  `texture_variation_1` = 'AirElementalSkinWhite',
  `obj_effect_package_id` = 0
WHERE id = 30296;
