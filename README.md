# elaborato_esi
## idee

prendere l'immagine, da rgb convertirla in scala di grigi.. quindi i difetti si vedranno maggiormente in teoria
O per lo meno avranno un colore diverso dal resto della stoffa
Poi fai una media del colore del tessuto.. e ti passi ogni punto della foto
Se il punto ha un colore simile alla media (con un range di errore dato dall'ombra magari) e simile ai suoi pixel vicini allora è ok
Altrimenti se tipo trovi un pixel blu e accanto un pixel nero, allora forse c'è un difetto
(non so se magari è la soluzione che ha proposto durante lab, non ho ancora guardato quella lezione)

a me era venuto in mente di rendere l immagine più "sharp" per evidenziarne i difetti
perchè rendendola piu sharp si evidenziano gli edge
ditemi se per voi ha senso, potrei sparare stronzate
