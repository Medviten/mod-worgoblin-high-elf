-- I-335 "Irresistible Pool Pony" (quest 24864) — SpellVisualKit 14052 attachments.
-- Effectname and the full three-attachment inventory: [I-335]_spellvisualeffectname.sql.
--
-- The two bubble attachments already ship as AUTO rows 90011/90012; this adds the
-- missing third, the pony itself.
--
-- Geometry is 4.3.4 row 3781 verbatim — attachment 10, offset (-0.20, 0.01, -0.45),
-- yaw -90 degrees — and unlike I-328's shark that is expected to land first time:
-- the donor authored it against the Cata goblin, and the model our client runs IS
-- that model retroported (`CHARACTER\GOBLIN\MALE\GOBLINMALE.M2`, shipped by
-- patch-hd-everything over mod-worgoblin). Attachment 10 is present on both at bone
-- 106, pos (0.197, -0.034, 0.658). The -90 yaw turns the pony's long axis — which
-- runs along model Y, its 2.53-wide span — to point along the character's facing.
--
-- If it lands off-centre in game, the offset is expressed in bone 106's LOCAL frame
-- and that bone's rest pose is not necessarily identity
-- (reference_m2_bone_rest_rotation_attachments): the fix is to pre-rotate the offset
-- by the bone's rest quaternion, not to nudge the numbers blind.
--
-- Id 91004, NOT the next free 90xxx: `[AUTO,F-011]_spellvisualkitmodelattach.sql`
-- opens with `DELETE ... WHERE id BETWEEN 90001 AND 90999`, so anything added inside
-- that band is wiped the next time the AUTO file applies. 91001-91003 are I-328's.
DELETE FROM spellvisualkitmodelattach WHERE id = 91004;
INSERT INTO spellvisualkitmodelattach SET
  `id` = 91004,
  `parent_spell_vis_kit_id` = 14052,
  `spell_vis_effect_name_id` = 90105,
  `attachment_id` = 10,
  `offset_x` = -0.2,
  `offset_y` = 0.01,
  `offset_z` = -0.45,
  `yaw` = -1.5708,
  `pitch` = 0,
  `roll` = 0;
