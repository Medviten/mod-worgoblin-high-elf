-- creaturedisplayinfo: 0 inserts, 2 updates, 0 deletes

-- New entries
UPDATE `creaturedisplayinfo` SET `extended_display_info_id` = @OgreMaleDisplayExtra WHERE `id` = @OgreMaleDisplay; -- male unspecified entry (morph with gear)
UPDATE `creaturedisplayinfo` SET `extended_display_info_id` = @OgreFemaleDisplayExtra WHERE `id` = @OgreFemaleDisplay; -- female unspecified entry (morph with gear)
