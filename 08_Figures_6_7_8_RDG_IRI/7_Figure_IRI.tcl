# ==========================================================
# Script IRI: Renderização com Margem e Projeção Ortográfica
# ==========================================================

# 1. Configurações de exibição (FullHD)
display resize 1920 1080
display projection orthographic
display rendermode GLSL
light 0 on; light 1 on; light 2 on; light 3 on

# 2. Ajuste de Enquadramento (Para não ficar "fechado")
# Centraliza a molécula e afasta um pouco
#display resetview
#scale by 0.85

# 3. Nome do arquivo de saída
set outfile "Figura_IRI_Final_1.png"

# Atualiza o display para garantir que os ajustes foram aplicados
display update

puts "Renderizando IRI: $outfile (Com margem de respiro)"

# 4. Renderização usando Tachyon (Fundo transparente se desejar)
# Se preferir fundo branco sólido, remova o '-trans_vmd'
render TachyonInternal $outfile -res 1920 1080 -aasamples 12 -trans_vmd

puts "Concluído: Imagem salva em [pwd]"