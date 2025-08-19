------------------Script para bipar se Ether1 Cair-----------------------------
:global beepState

# Verifica status da ether1
:if ([/interface get [find name="ether1"] running] = false) do={
    :if ($beepState != true) do={
        :set beepState true
        :log warning "Ether1 caiu - iniciando beep recorrente"
    }
    /beep frequency=1000 length=500
} else={
    :if ($beepState = true) do={
        :set beepState false
        :log info "Ether1 voltou - beep parado"
    }
}

---------------------------------------------------------------------------------

Agendamento para verificar a cada 10 segundos.

/system scheduler add name="BeepEther1Check" \
    interval=10s \
    on-event=BeepEther1
	
---------------------------------------------------------------------------------	

Lembre-se de criar o script rsc com o nome BeepEther1.rsc 
para criar o agendamento igual está no modelo acima.	

Como funciona:
	- O script verifica se a interface ether1 está running.
	- Se cair, dispara o beep (500ms em 1000Hz) a cada 10 segundos.
	- Quando voltar, para o alerta e loga a recuperação.
	
Fique a vontade para modificar e ajustar.
