# ==========================================================
# Script QTAIM: 4 Fotos, Zoom Fit, Transparência e Reset
# ==========================================================

# 1. Ajustes iniciais de visualização
display resize 1920 1080
display rendermode GLSL
light 0 on; light 1 on; light 2 on; light 3 on

# 2. Definição dos IDs das moléculas (0, 1, 2 e 3)
set mol_ids {0 1 2 3}

# Garante que tudo esteja ligado antes de começar
foreach id $mol_ids { mol on $id }

# 3. Loop de renderização (Gera as 4 fotos sequenciais)
for {set i 0} {$i < [llength $mol_ids]} {incr i} {
    
    set n_foto [expr $i + 1]
    set outfile "Figura_QTAIM_HD_${n_foto}.png"
    
    # --- NOTA SOBRE O ZOOM FIT ---
    # O comando 'display resetview' centraliza e ajusta o zoom 
    # automaticamente para que as moléculas visíveis ocupem a tela toda.
    display resetview
    
    # Atualiza a tela para garantir que o enquadramento seja aplicado
    display update
    
    puts "Gerando: $outfile (FullHD + ZoomFit + Transparência)"
    
    # --- NOTA SOBRE A TRANSPARÊNCIA ---
    # A flag '-trans_vmd' instrui o renderizador TachyonInternal a 
    # exportar a imagem com canal Alpha (fundo invisível).
    render TachyonInternal $outfile -res 1920 1080 -aasamples 12 -trans_vmd
    
    # Desativa a molécula atual (Coluna D) para a próxima foto da sequência
    set alvo [lindex $mol_ids $i]
    mol off $alvo
}

# ==========================================================
# BLOCO DE RESET (NOTA: Este bloco restaura sua área de trabalho)
# Reabilita todas as moléculas para que você possa continuar a análise.
# ==========================================================
foreach id $mol_ids { 
    mol on $id 
}

# Retorna o zoom original com todos os elementos visíveis
display resetview
display update

puts "----------------------------------------------------"
puts "Processo concluído com sucesso!"
puts "4 imagens salvas com fundo transparente e zoom ajustado."
puts "A visualização do VMD foi restaurada para o estado inicial."
puts "----------------------------------------------------"