# 1. Define o nome do arquivo de saída
set outfile "figura_03.png"

# 2. Ajusta a proporção da janela (Full HD)
display resize 1920 1080

# 3. Configurações de iluminação e modo GLSL
display rendermode GLSL
light 0 on
light 1 on
light 2 on
light 3 on
display update

# 4. Renderiza usando o TachyonInternal com Anti-Aliasing
# O "-aasamples 12" é o que ativa o Anti-Aliasing (suavização de bordas)
render TachyonInternal $outfile -res 1920 1080 -aasamples 12