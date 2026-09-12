-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 gossip_menu_option (one file per table; rows carry final state)

DELETE FROM gossip_menu_option WHERE MenuID BETWEEN 510000 AND 519999;

INSERT INTO gossip_menu_option (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`) VALUES
  (510046, 0, 0, 'Make this inn your home.', 0, 8, 65537, 0, 0, 0, 0, '', 0),
  (510001, 0, 0, 'Trick or Treat!', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510014, 0, 6, 'I would like to check my deposit box.', 0, 9, 131072, 0, 0, 0, 0, '', 0),
  (510059, 0, 0, 'I would like to buy from you.', 0, 3, 643, 0, 0, 0, 0, '', 0),
  (510062, 0, 0, 'I am interested in mage training.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510056, 0, 0, 'Vinny, I just gotta get me a genuine Cataclysm souvenir!', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510023, 1, 0, 'Er, Dampwich, I need another miner....', 0, 1, 1, 510102, 0, 0, 0, '', 0),
  (510004, 0, 3, 'I am interested in warlock training.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510033, 0, 0, 'Let me fly back to Vengeance Wake!', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510046, 1, 0, 'What can I do at an inn?', 0, 1, 65537, 0, 0, 0, 0, '', 0),
  (510024, 0, 3, 'I am interested in warlock training.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510037, 0, 6, 'Gobber, I need to look in my pack.', 0, 9, 131073, 0, 0, 0, 0, '', 0),
  (510015, 0, 0, 'Set me up with the phattest, shiniest bling you got!', 0, 1, 1, 510098, 0, 0, 0, '', 0),
  (510016, 0, 0, 'Szabo, I need a hip, new outfit for the party I''m throwing!', 0, 1, 1, 510099, 0, 0, 0, '', 0),
  (510026, 0, 3, 'Teach me the ways of the spirits.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510007, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510001, 1, 5, 'Make this inn your home.', 0, 8, 65536, 0, 0, 0, 0, '', 0),
  (510001, 3, 0, 'What can I do at an inn?', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510001, 2, 1, 'Let me browse your goods.', 0, 3, 128, 0, 0, 0, 0, '', 0),
  (510000, 0, 4, 'Return me to life.', 0, 6, 16384, 0, 0, 0, 0, '', 0),
  (510053, 0, 3, 'I require warrior training.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510054, 0, 0, 'Train me.', 0, 5, 81, 0, 0, 0, 0, '', 0),
  (510049, 0, 0, 'I am interested in mage training.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510050, 0, 3, 'Teach me the ways of the spirits.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510006, 0, 3, 'Teach me the ways of the spirits.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510025, 0, 3, 'I am interested in mage training.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510063, 0, 5, 'Make this inn your home.', 0, 8, 65536, 0, 0, 0, 0, '', 0),
  (510063, 1, 0, 'What can I do at an inn?', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510096, 0, 0, 'Up, Up & Away!', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510073, 0, 1, 'I would like to buy from you.', 0, 3, 128, 0, 0, 0, 0, '', 0),
  (510074, 0, 0, 'Sassy, let''s set sail for Orgrimmar before the island blows for good!', 0, 1, 3, 0, 0, 0, 0, '', 0),
  (510082, 0, 0, 'Access profession vending machine', 0, 3, 4307, 0, 0, 0, 0, '', 0),
  (510082, 1, 0, 'I''d like to purchase primary profession training.', 0, 1, 4307, 0, 0, 0, 0, '', 0),
  (510082, 2, 0, 'I''d like to purchase secondary profession training.', 0, 1, 4307, 0, 0, 0, 0, '', 0),
  (510094, 0, 0, 'Get me up into the skies, Sassy!', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510093, 0, 3, 'Teach me the ways of the spirits.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510002, 0, 1, 'Can you repair my gear?', 0, 3, 128, 0, 0, 0, 0, '', 0),
  (510062, 2, 0, 'I wish to know about Dual Talent Specialization.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510004, 2, 0, 'I wish to know about Dual Talent Specialization.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510024, 2, 0, 'I wish to know about Dual Talent Specialization.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510026, 2, 0, 'I wish to know about Dual Talent Specialization.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510006, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510053, 2, 0, 'I wish to know about Dual Talent Specialization.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510049, 2, 0, 'I wish to know about Dual Talent Specialization.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510050, 2, 0, 'I wish to know about Dual Talent Specialization.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510005, 0, 0, 'I am interested in a mage training.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510025, 2, 0, 'I wish to know about Dual Talent Specialization.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510093, 2, 0, 'I wish to know about Dual Talent Specialization.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510062, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510004, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510024, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510026, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510007, 0, 3, 'I am interested in a priest training.', 0, 5, 16, 0, 0, 0, 0, '', 0),
  (510053, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510049, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510050, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510005, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510025, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510093, 1, 3, 'I wish to unlearn my talents.', 0, 16, 16, 0, 0, 0, 0, '', 0),
  (510090, 0, 0, 'Okay, Sassy, I''m ready to go.', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510017, 0, 0, 'I need some cool shades. What will two stacks of macaroons get me?', 0, 1, 1, 510100, 0, 0, 0, '', 0),
  (510097, 0, 0, 'KTC Headquarters Set Ablaze with Gasbot!', 0, 1, 1, 0, 0, 0, 0, '', 0),
  (510023, 0, 0, 'Refresh my memory on the whole Kaja''mite thing.', 0, 1, 3, 510103, 0, 0, 0, '', 0),
  (510030, 0, 0, 'Kilag, I... uh, somehow... er, lost my scout.', 0, 1, 1, 510101, 0, 0, 0, '', 0);

