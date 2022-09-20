x = (irandom_range(0, global.grid_width - 1) div 32) * 32 + global.grid_offset_x;
y = (irandom_range(0, global.grid_height - 1) div 32) * 32 + global.grid_offset_y;

//x = 26 * 32 + global.grid_offset_x;
//y = 17 * 32 + global.grid_offset_y;

sprites[0] = spr_food;
sprites[1] = spr_food_spider;
sprites[2] = spr_food_spider

sprite_index = random_sprite(sprites);
