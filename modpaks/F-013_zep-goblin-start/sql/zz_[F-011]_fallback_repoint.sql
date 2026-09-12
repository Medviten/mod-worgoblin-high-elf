-- ============================================================
-- F-011 gap file -- NOT yet ported to `zep goblin gen`.
-- Hand-maintained until an emitter reproduces it. When a gen
-- domain covers this content, retire this file and rename the
-- emitted output to zz_[AUTO,F-011]_*.
-- ============================================================

-- F-011 fallback repoint: creatures whose real Cata display is already stock in client -> use it

UPDATE creature_template_model SET CreatureDisplayID = 2177 WHERE CreatureID = 7395;
UPDATE creature_template_model SET CreatureDisplayID = 11686 WHERE CreatureID = 31688;
UPDATE creature_template_model SET CreatureDisplayID = 599 WHERE CreatureID = 35904;
UPDATE creature_template_model SET CreatureDisplayID = 22719 WHERE CreatureID = 36127;
UPDATE creature_template_model SET CreatureDisplayID = 599 WHERE CreatureID = 36578;
UPDATE creature_template_model SET CreatureDisplayID = 1126 WHERE CreatureID = 37748;
UPDATE creature_template_model SET CreatureDisplayID = 19732 WHERE CreatureID = 38187;
UPDATE creature_template_model SET CreatureDisplayID = 27101 WHERE CreatureID = 38526;
UPDATE creature_template_model SET CreatureDisplayID = 599 WHERE CreatureID = 39147;
UPDATE creature_template_model SET CreatureDisplayID = 7288 WHERE CreatureID = 39376;
UPDATE creature_template_model SET CreatureDisplayID = 599 WHERE CreatureID = 40064;
UPDATE creature_template_model SET CreatureDisplayID = 3019 WHERE CreatureID = 48304;
UPDATE creature_template_model SET CreatureDisplayID = 11686 WHERE CreatureID = 48323;
UPDATE creature_template_model SET CreatureDisplayID = 29807 WHERE CreatureID = 49150;
