# Introdução ao systemd

O **systemd** é um sistema de inicialização (init system) composto por um conjunto de programas executado em segundo plano (ou seja, um **daemon**). Atualmente a maioria das distribuições Linux utilizam o _systemd_ para execução do _boot_.

Na prática, o _systemd_ assume o controle assim que o kernel é ativado pelo gerenciador de _bootloader_ (Grub, tipicamente). A partir daí, são carregados todos os dispositivos (placa de rede, processador gráfico, etc) assim como os processos que se iniciam com o sistema - estes são identificados pelo PID (_process identifier_).

# Comandos básicos para controlar serviços no systemd

Gerenciar o sistema e os serviços é um dos atributos mais legais do _systemd_. Isso pode ser feito graças ao utilitário **systemctl**, que nos auxilia no controle do próprio _systemd_ e também, atua como gerenciador de serviços.

Por outras palavras, ele nos permite decidir o que fazer com os processos:

- monitorar
- encerrar
- iniciar
- analisar
- recarregar
- checar status
- etc

A seguir são apresentados sete comandos básicos para começar a praticar. Confira.

## Listar todos os serviços disponíveis

Primeiramente, convém descobrirmos quais são os serviços detectados pelo _systemd_ e que podem ser habilitados / desabilitados. Faça isso digitando o comando:

```bash
  systemctl list-unit-files --type=service
```

## Ativar um serviço e habilitá-lo (ou desabilitá-lo) no boot

Localizou algum serviço que você queira aplicar a função _auto start_ (inicialização automática junto ao sistema)? Abaixo, as argumentações do comando _systemctl_ para ativar serviços, bem como habilitar / desabilitar o próprio do _auto start_.

```bash
  systemctl is-active httpd.service

  systemctl enable httpd.service

  systemctl disable httpd.service
```

## Realizar ações básicas para determinado serviço

O gerenciamento básico de serviços envolve ações como iniciar, reiniciar, parar, recarregar e verificar status de um elemento. Felizmente, o _systemd_ é muito prático quanto a isso, bastando que digitemos o comando _systemctl_, seguido da opção e o nome do serviço. Exemplo:

```bash
  systemctl start httpd.service

  systemctl restart httpd.service

  systemctl stop httpd.service

  systemctl reload httpd.service

  systemctl status httpd.service
```

## Utilizar a função kill

O comando _kill_ é utilizado no Linux (e outros sistemas operacionais) para "matar" um processo. Geralmente, o acionamos quando um detemrinado serviço não se encerra, exigindo que a gente force o seu fechamento. No _systemd_, usamos o _kill_ da seguinte maneira:

```bash
  systemctl kill httpd
```

Feito isto, é possível confirmar se o procedimento teve sucesso usando o comando _systemctl status httpd.service_ (substitua o valor pelo serviço em questão).

## Controlar o uso de CPU (shared) de um serviço

Com o _systemd_ é possível alocar cargas de trabalho (_workload_) para cada serviço. Estrategicamente, administradores de sistemas criam classes de serviços para equilibrar os níveis de processamento, aproveitando melhor os recursos computacionais.

A métrica usada para definir a quantidade de recursos que pode ser utilizada se chama "shares" (que significa compartilhamento, numa tradução livre). Por padrão, os serviços recebem o valor de _1024 shares_, que pode tanto ser aumentado quanto reduzido.

Para fazê-lo, use o comando de acordo com o exemplo:

```bash
  .include /usr/lib/systemd/system/httpd.service

  [Service]

  CPUShares=2500
```

Nesse caso, aumentamos em 2500 o valor de _shares_ para o arquivo _http.service_, localizado no diretório declarado. Para que as alterações entrem em vigor, basta reiniciar o serviço.

```bash
  systemctl daemon-reload

  systemctl restart httpd.service
```

## Analisar consumo de recursos da CPU

Logicamente, o bom gerenciamento de recursos requer do _sysadmin_ prévio conhecimento de como eles estão distribuídos no momento. Essas informações podem ser apresentadas por meio da ferramenta _cgtop_, a qual acompanha o _systemd_.

Ela serve, entre outras coisas, para exibir informações específicas dos _cgroups_ existentes no sistema, como lista ordenada por nome, grupo, uso de memória ou CPU, por exemplo. Esta última é impressa a partir do seguinte comando:

```bash
  systemd-cgtop -c --order=cpu
```

Para verificar este comando mais aprofundadamente é possível consultar este [link com a documentação](https://www.freedesktop.org/software/systemd/man/systemd-cgtop.html).

## Gerenciar uso de memória RAM de um serviço

Tão interessante quanto alocar o processamento a ser consumido por um serviço é delimitar o uso de memória RAM. Por exemplo, se determinado processo tem baixa prioridade, mas o seu consumo de RAM é acima do aceitável, digite:

```bash
  .include /usr/lib/systemd/system/httpd.service

  [Service]

  MemoryLimit=1G
```

No exemplo acima, o _systemd_ foi usado para ajustar o limite de memória RAM em 1GB ao serviço declarado. O mesmo pode ser feito com o consumo de banda larga e _swapping_, por exemplo.

# Referências

Anotações baseadas em: [Link para o post](https://e-tinet.com/linux/systemd/).

Para aprofundar mais no conteúdo temos: [Link da wiki do ubuntu sobre o systemd](https://wiki.ubuntu.com/SystemdForUpstartUsers).

Vinícius Gajo Marques Oliveira, 2020.
