#region HUD topo
draw_set_alpha(1);
draw_sprite(sprHUDTopo,0,display_get_gui_width()-136,8);
if (!surface_exists(surfaceHorario)) {
	surfaceHorario=surface_create(99,47);
}
surface_set_target(surfaceHorario);
draw_clear_alpha(c_black,0);
draw_set_font(fntMenu);
draw_set_color(c_maroon);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_alpha(0.75);
draw_text(11,-3+numerosFX[0],"2\n0\n1\n2\n0");
draw_text(11+24,-3+numerosFX[1],"9\n0\n1\n2\n3\n4\n5\n6\n7\n8\n9\n0");
draw_text(64,-3+numerosFX[2],"5\n0\n1\n2\n3\n4\n5\n0");
draw_text(64+24,-3+numerosFX[3],"9\n0\n1\n2\n3\n4\n5\n6\n7\n8\n9\n0");
surface_reset_target();
draw_surface(surfaceHorario,display_get_gui_width()-110,12);
#endregion

#region Resultado peixe
draw_set_alpha(1);
draw_sprite_ext(sprJanela,0,(display_get_gui_width()/2)-(resultadoPeixeFX*64),(display_get_gui_height()/2)-160,resultadoPeixeFX,2.5,0,c_white,1);
draw_sprite_ext(spritePeixePescado,0,(display_get_gui_width()/2)+posXPeixe,display_get_gui_height()/2,escalaPeixe,escalaPeixe,rotacaoPeixe,c_white,1);
draw_set_color(c_black);
draw_set_font(fntDescricao);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_alpha(escalaPeixe-1+posXPeixe);
draw_text(display_get_gui_width()/2,(display_get_gui_height()/2)-144,"Você pescou:");
draw_text_ext(display_get_gui_width()/2,(display_get_gui_height()/2)+64,global.peixes[idPeixePescado].descricao,-1,640);
draw_set_font(fntMenu);
draw_text(display_get_gui_width()/2,(display_get_gui_height()/2)-128,global.peixes[idPeixePescado].nome);
#endregion

#region Barra peixes pescados
draw_set_alpha(1);
var yInicialBarra = (display_get_gui_height()/2) - ((array_length(global.peixes)/2)*32) - 8;
draw_sprite_ext(sprBarraLateral,0,0,yInicialBarra,1,array_length(global.peixes)-((array_length(global.peixes)-1)/3),0,c_white,1);
draw_set_color(c_maroon);
draw_set_font(fntDescricao);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
for (var i=0; i<array_length(global.peixes); i++) {
	draw_sprite_ext(global.peixes[i].spriteIcone,0,16,yInicialBarra+24+(i*32),1,1,0,global.peixesPegos[i]==0?c_black:c_white,0.5);
	draw_text(40,yInicialBarra+24+(i*32),global.peixesPegos[i]);
}
#endregion