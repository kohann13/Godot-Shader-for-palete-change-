shader_type canvas_item;

uniform int color_count : hint_range(1, 4); //quantidade de cores para serem substituidas
uniform vec4 target_color[4] : source_color; // lisda de Cores a ser alterada
uniform vec4 replacement_color[4] : source_color; // lista de novas cores que vão substituir
uniform float tolerance : hint_range(0.3, 1.0); // Tolerância para correspondência de cores


void fragment() {
    vec4 current_color = texture(TEXTURE, SCREEN_UV); // Obtém a cor do pixel atual

    // Calcula a diferença entre as cores
    for(int I = 0; I < color_count;I++)
	{
		float distance = distance(current_color.rgb, target_color[I].rgb);
		// Verifica se a cor está dentro da tolerância
    	if (distance <= tolerance) 
		{
			COLOR = vec4(replacement_color[I].rgb, current_color.a); // Substitui pela nova cor
			break;
		}else
		{
			COLOR = current_color; // Mantém a cor original
		}
	}
}
