<div style="page-break-inside:avoid;">
    <img src="/home/robert/Immagini/uni.png" style="display:block;margin-left:auto;margin-right:auto;width:50%;height:250px;width:250px">
    <p style="text-align:center;font-size:25px;font-weight:bold">Università degli Studi di Verona</p>
    <div style="overflow:hidden;">
    	<p style="float:left;font-size:18px;font-weight:bold">Dipartimento di Informatica</p>
    	<p style="float:right;font-size:18px;font-weight:bold">Corso di laurea in Informatica</p>
    </div>
    <p style="text-align:center;font-size:25px;font-weight:bold">Anno accademico 2020/2021</p>
    <p style="text-align:center;font-size:30px;font-weight:bold">DOCUMENTAZIONE PROGETTO ESI<br>ANALISI DI DIFETTI DI TESSITURE</p>
    <hr>
    <br><br><br><br><br><br>
    <div>
    	<p style="text-align:center;font-size:20px;font-weight:bold">Feola Emanuele - VR437205</p>
    	<p style="text-align:center;font-size:20px;font-weight:bold">Mirandola Giacomo - VR429611</p>
    	<p style="text-align:center;font-size:20px;font-weight:bold">Timofte Robert Octavian - VR429581</p>
    </div>
</div>

<div style="page-break-after: always; break-after: page;"></div>

## Indice

[TOC]

<div style="page-break-after: always; break-after: page;"></div>

## Introduzione

Il progetto è costituito da una serie di script **Matlab** che insieme generano un'**interfaccia grafica** tramite la quale l'utente può scegliere un'immagine di un tessuto da analizzare per trovarne i difetti. Il metodo che abbiamo implementato permette di elaborare correttamente una buona parte delle tipologie di tessuto, tuttavia se queste ultime risultano essere troppo complesse, il programma tenderà a mostrare un'immagine in output non corretta.

![](/home/robert/Immagini/Schermata da 2021-03-22 15-26-40.png)



## Elenco file e funzionamento 

> cartella documentazione

Contiene la documentazione del progetto, scritta in **Markdown**.

> cartella img

Contiene le immagini che possono essere elaborate.

> natsort.m & natsortfiles.m

Sono delle librerie che vengono usate per ordinare alfanumericamente le immagini presenti nella cartella `img` in modo da avere un elenco ordinato nel selettore presente nella GUI.

> main.m

Questo è il file che viene utilizzato per processare le immagini in modo da trovarne i difetti. Ci è stata fornita una versione iniziale di questo script che abbiamo modificato in modo da poter analizzare diversi tessuti con una modalità automatica.
Quando viene selezionata un'immagine con il selettore presente nella GUI, l'immagine originale viene convertita in scala di grigi in modo da poterla analizzare più facilmente. Successivamente vengono definiti una serie di pattern che idealmente devono rappresentare aree senza difetto per un funzionamento corretto del programma. Questi pattern vengono utilizzati per calcolare dei valori di cross-correlazione 2D normalizzata. Viene poi fatta una media di questi ultimi che viene memorizzata in una matrice `c` alla quale poi applichiamo un comando per ottenere il valore assoluto di ogni singolo elemento in modo da avere solo valori positivi.
La **nostra idea** a questo punto è stata di calcolare la media dei valori contenuti nella matrice `c` in modo da avere un valore di cross-correlazione medio `m` in base al quale effettuare un confronto tra `c` e `m` per generare una maschera che poi viene utilizzata per trovare i difetti nei tessuti.
Una volta calcolata la maschera ed averla "pulita" da eventuali punti che non rappresentano un difetto, la applichiamo all'immagine originale per ottenere quella con i difetti evidenziati.

> layout.fig & layout.m

Il file `layout.fig` è semplicemente lo schema della GUI al quale poi viene collegato il file `layout.m` che contiene le varie funzioni per il funzionamento del programma. 
Il **file principale da eseguire** è `layout.m`, quest'ultimo genera la GUI tramite la quale è possibile selezionare un'immagine che viene automaticamente elaborata e fornita in output, accanto all'immagine originale, con i difetti evidenziati.
Quest'ultimo file inoltre, tramite l'utilizzo delle librerie citate prima, permette un aggiornamento automatico del selettore delle immagini che quindi, nel caso di aggiunta o eliminazione di un tessuto, mostra un elenco aggiornato.



## Modalità di sviluppo

> Git & Github

Per la condivisione, collaborazione e gestione del versionamento del progetto abbiamo scelto git, in particolare abbiamo creato una repository ospitata su Github (https://github.com/roberttimofte/elaborato_esi.git).
La repository è composta di 4 branch diversi: una per ogni componente del gruppo, più il master che contiene le versioni stabili dell'elaborato, ovvero il merge dei 3 branch di sviluppo.
Ogni volta che un membro apportava modifiche alla sua branch locale, faceva il push dei cambiamenti sulla repository online in modo che fossero disponibili anche agli altri.

> Zoom

Abbiamo utilizzato Zoom per confrontarci, fare il punto della situazione e decidere come procedere nello sviluppo del progetto.