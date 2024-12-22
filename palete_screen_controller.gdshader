shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture; // texture size in screen
uniform int color_count : hint_range(1, 3); // Number of colors to be replaced
uniform vec4 target_color[3] : source_color; // List of colors to be replaced
uniform vec4 replacement_color[3] : source_color; // List of new colors to replace the target colors
uniform float tolerance : hint_range(0.3, 1.0); // Tolerance for color matching


void fragment() {
    vec4 current_color = texture(screen_texture, SCREEN_UV); // Gets the current pixel color

    // Calculates the difference between colors
    for(int I = 0; I < color_count;I++)
	{
		float distance = distance(current_color.rgb, target_color[I].rgb);
		// Checks if the color is within the tolerance
    	if (distance <= tolerance) 
		{
			COLOR = vec4(replacement_color[I].rgb, current_color.a); // Replaces with the new color
			break;
		}else
		{
			COLOR = current_color; // Keeps the original color
		}
	}
}
